var BaseTreeTable = /** @class */ (function () {
    function BaseTreeTable() {
        this.eventHandlerDictionary = [];
        this.parentContainerId = "";
        this.maxColumnWidth = 500;
    }
    BaseTreeTable.prototype.getContext = function () {
        return document.getElementById(this.parentContainerId);
    };
    BaseTreeTable.prototype.getElements = function (parentId) {
        var parentSelector = '[data-ParentId="' + parentId + '"]';
        var collapsibleElements = this.getContext().querySelectorAll(parentSelector);
        return collapsibleElements;
    };
    BaseTreeTable.prototype.getChildren = function (parentId) {
        if (parentId == null || parentId == "")
            return new Array();
        var nodes = this.getContext().querySelectorAll("tr");
        var matches = new Array();
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].getAttribute("data-parentid") == parentId)
                matches.push(nodes[i]);
        }
        return matches;
    };
    BaseTreeTable.prototype.hasClass = function (element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    };
    BaseTreeTable.prototype.showChildren = function (parentId, element, className, newClassName) {
        var treeNode = this.getContext().querySelector('[data-id="' + parentId + '"]');
        if (treeNode != undefined)
            treeNode.className = treeNode.className.replace(" collapsed", "");
        var collapsibleElements = this.getChildren(parentId);
        for (var i = 0; i < collapsibleElements.length; i++) {
            var currentElementId = collapsibleElements[i].dataset["id"];
            var selector = '[data-id="' + currentElementId + '"] td';
            var span = collapsibleElements[i].querySelector(selector + " .vjoinendcollapsible, " + selector + ' .vjoincollapsible');
            if (span !== null) {
                this.showChildren(currentElementId, null, null, null);
            }
            collapsibleElements[i].style.display = 'table-row';
        }
        if (element != undefined) {
            element.className = 'base ' + newClassName;
            this.registerEventSingle(element, 'click', this.eventHandlerDictionary[newClassName]);
        }
    };
    BaseTreeTable.prototype.hideChildren = function (parentId, element, className, newClassName) {
        var treeNode = this.getContext().querySelector('[data-id="' + parentId + '"]');
        if (treeNode != undefined)
            treeNode.className = treeNode.className + " collapsed";
        if (element != undefined) {
            this.hideUnderlyingElements(parentId);
            element.className = 'base ' + newClassName;
            this.registerEventSingle(element, 'click', this.eventHandlerDictionary[newClassName]);
        }
    };
    BaseTreeTable.prototype.hideUnderlyingElements = function (parentId) {
        var collapsibleElements = this.getChildren(parentId);
        for (var i = 0; i < collapsibleElements.length; i++) {
            var currentElementId = collapsibleElements[i].dataset["id"];
            this.hideUnderlyingElements(currentElementId);
            collapsibleElements[i].style.display = 'none';
        }
    };
    BaseTreeTable.prototype.createSpan = function (className) {
        var span = document.createElement('SPAN');
        span.className = className;
        return span;
    };
    BaseTreeTable.prototype.addIdentation = function (children, depth, identationDictionary) {
        depth += 1;
        for (var i = 0; i < children.length; i++) {
            var localDepth = depth;
            var currentElementId = children[i].dataset.id;
            var tdElement = children[i].getElementsByTagName('td')[0];
            var currentElementChildren = this.getChildren(currentElementId);
            var hasChildren = currentElementChildren.length > 0;
            var isLast = i === children.length - 1;
            if (isLast) {
                identationDictionary[depth - 1] = this.createSpan('base spacer');
            }
            else {
                identationDictionary[depth - 1] = this.createSpan('base vline');
                ;
            }
            var defaultState = null;
            var trElement = tdElement.parentElement;
            if (this.hasClass(trElement, 'collapsed')) {
                defaultState = 'collapsed';
            }
            while (localDepth - 1 >= 1) {
                localDepth = localDepth - 1;
                if (localDepth === depth - 1 && defaultState === 'collapsed' && hasChildren && !isLast) {
                    tdElement.insertBefore(this.createSpan('base vjoinexpandable'), tdElement.childNodes[0]);
                    this.hideUnderlyingElements(trElement.dataset.id);
                }
                else if (localDepth === depth - 1 && defaultState === 'collapsed' && hasChildren && isLast) {
                    tdElement.insertBefore(this.createSpan('base vjoinendexpandable'), tdElement.childNodes[0]);
                    this.hideUnderlyingElements(trElement.dataset.id);
                }
                else if (localDepth === depth - 1 && hasChildren && isLast) {
                    tdElement.insertBefore(this.createSpan('base vjoinendcollapsible'), tdElement.childNodes[0]);
                }
                else if (localDepth === depth - 1 && hasChildren && !isLast) {
                    tdElement.insertBefore(this.createSpan('base vjoincollapsible'), tdElement.childNodes[0]);
                }
                else if (localDepth === depth - 1 && !hasChildren && !isLast) {
                    tdElement.insertBefore(this.createSpan('base vjoin'), tdElement.childNodes[0]);
                }
                else if (localDepth === depth - 1 && !hasChildren && isLast) {
                    tdElement.insertBefore(this.createSpan('base vjoinend'), tdElement.childNodes[0]);
                }
                else if (identationDictionary[localDepth] !== undefined) {
                    tdElement.insertBefore(identationDictionary[localDepth].cloneNode(), tdElement.childNodes[0]);
                }
            }
            this.addIdentation(currentElementChildren, depth, identationDictionary);
        }
    };
    BaseTreeTable.prototype.insertIndentations = function () {
        var roots = this.getContext().querySelectorAll('tr:not([data-parentId])');
        for (var i = 0; i < roots.length; i++) {
            var depth = 1;
            var parentId = roots[i].dataset["id"];
            var children = this.getChildren(parentId);
            var isParentLast = i === roots.length - 1;
            var identationDictionary = [];
            if (isParentLast) {
                identationDictionary[depth] = this.createSpan('base spacer');
            }
            else {
                identationDictionary[depth] = this.createSpan('base vline');
            }
            this.addIdentation(children, depth, identationDictionary);
        }
    };
    BaseTreeTable.prototype.getParentElementId = function (element) {
        var parent = element.parentElement.parentElement;
        var parentId = parent.dataset.id;
        return parentId;
    };
    BaseTreeTable.prototype.initEventHandlerDictionary = function () {
        var self = this;
        this.eventHandlerDictionary['vjoinexpandable'] = function () {
            console.log('vjoinexpandable');
            var parentId = self.getParentElementId(this);
            self.showChildren(parentId, this, 'vjoinexpandable', 'vjoincollapsible');
        };
        this.eventHandlerDictionary['vjoincollapsible'] = function () {
            console.log('vjoincollapsible');
            var parentId = self.getParentElementId(this);
            self.hideChildren(parentId, this, 'vjoincollapsible', 'vjoinexpandable');
        };
        this.eventHandlerDictionary['vjoinendexpandable'] = function () {
            console.log('vjoinendexpandable');
            var parentId = self.getParentElementId(this);
            self.showChildren(parentId, this, 'vjoinendexpandable', 'vjoinendcollapsible');
        };
        this.eventHandlerDictionary['vjoinendcollapsible'] = function () {
            console.log('vjoinendcollapsible');
            var parentId = self.getParentElementId(this);
            self.hideChildren(parentId, this, 'vjoinendcollapsible', 'vjoinendexpandable');
        };
        this.eventHandlerDictionary['pushpinClick'] = function (event) {
            var me = this;
            var el = this;
            while ((el = el.parentElement) && !el.classList.contains('popout'))
                ;
            el.removeEventListener('mouseout', self.eventHandlerDictionary["popOutMouseOut"]);
            if (me.className.indexOf('pinned') > -1) {
                me.className = me.className.replace(' pinned', '');
            }
            else {
                me.className += ' pinned';
            }
        };
        this.eventHandlerDictionary["descriptionMouseIn"] = function (event) {
            if (this.className.indexOf('popouthover') === -1) {
                this.className += ' popouthover';
            }
            self.applyShowAllStyles(this);
            var span = this.querySelector(".pushpin");
            span.style.display = "initial";
        };
        this.eventHandlerDictionary["descriptionMouseOut"] = function (event) {
            var pin = this.querySelector('.pinned');
            if (pin === null) {
                var span = this.querySelector('.pushpin');
                span.style.display = 'none';
                self.applyHideLongTextStyles(this);
                this.className = this.className.replace(' popouthover', '');
            }
            else {
                self.applyShowAllStyles(this);
                this.style.display = 'inline-block';
            }
        };
    };
    BaseTreeTable.prototype.registerEventSingle = function (element, type, eventHandle) {
        //TODO: this is a temporary workaround, fix it.
        if (type === "click")
            element.onclick = eventHandle;
        else if (type === "dblclick")
            element.ondblclick = eventHandle;
        else
            element.addEventListener(type, eventHandle);
    };
    BaseTreeTable.prototype.registerEvent = function (className, type, eventHandle) {
        var elems = this.getContext().getElementsByClassName(className);
        for (var i = 0; i < elems.length; i++) {
            var elem = elems[i];
            this.registerEventSingle(elem, type, eventHandle);
        }
    };
    BaseTreeTable.prototype.registerForEvents = function () {
        this.registerEvent("vjoinexpandable", "click", this.eventHandlerDictionary["vjoinexpandable"]);
        this.registerEvent("vjoincollapsible", "click", this.eventHandlerDictionary["vjoincollapsible"]);
        this.registerEvent("vjoinendcollapsible", "click", this.eventHandlerDictionary["vjoinendcollapsible"]);
        this.registerEvent("vjoinendexpandable", "click", this.eventHandlerDictionary["vjoinendexpandable"]);
        this.registerEvent("pushpin", "click", this.eventHandlerDictionary["pushpinClick"]);
        this.registerEvent("popout", "mouseover", this.eventHandlerDictionary["descriptionMouseIn"]);
        this.registerEvent("popout", "mouseout", this.eventHandlerDictionary["descriptionMouseOut"]);
    };
    BaseTreeTable.prototype.resizeToMaxColumnWidth = function (containerId) {
        var container = document.getElementById(containerId);
        var tdElements = container.getElementsByTagName('td');
        for (var i = 0; i < tdElements.length; i++) {
            var td = tdElements[i];
            if (td.className === 'description') {
                var metrics = td.getBoundingClientRect();
                if (metrics.width > this.maxColumnWidth) {
                    td.className += ' popout';
                    this.applyHideLongTextStyles(td);
                    var div = document.createElement('div'), span = document.createElement('span'), firstNode = td.childNodes[0];
                    span.className = 'glyphicon glyphicon-pushpin pushpin';
                    div.className = 'spanContainer';
                    div.appendChild(span);
                    td.insertBefore(div, firstNode);
                }
            }
        }
    };
    BaseTreeTable.prototype.applyShowAllStyles = function (item) {
        item.style.overflow = "visible";
        item.style.whiteSpace = "normal";
    };
    BaseTreeTable.prototype.applyHideLongTextStyles = function (item) {
        item.style.overflow = "hidden";
        item.style.whiteSpace = "nowrap";
    };
    BaseTreeTable.prototype.init = function (containerId) {
        this.parentContainerId = containerId;
        this.initEventHandlerDictionary();
        this.insertIndentations();
        this.resizeToMaxColumnWidth(containerId);
        this.registerForEvents();
    };
    return BaseTreeTable;
}());
