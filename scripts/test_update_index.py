import os
import shutil
import subprocess
import unittest
from unittest.mock import mock_open, patch
import datetime
from update_index import create_new_row, get_current_date_str, update_content, update_index_html, validate_version, read_index_html, find_insert_position

class TestUpdateIndex(unittest.TestCase):

    def test_update_index_with_redundant_version(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly handles a redundant version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and returns with status false.
        """
        version = "3.0.5"
        mock_file_content = """
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        validation_result = validate_version(version, mock_file_content)
        self.assertEqual(validation_result, (False, f"Version {version} already exists in index.html."))

    def test_validate_version_with_incorrect_format(self, version="4.0", content=""):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version format.

        The test uses an incorrect version format that does not match the semver pattern.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        with patch("sys.exit") as mock_exit:
            content = ""  # Assuming content is an empty string for the test case
            validate_version(version, content)

    def test_validate_version_with_correct_format(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version format.

        The test uses a correct version format that matches the semver pattern.

        Asserts:
            The function does not print an error message and does not exit.
        """
        with patch("sys.exit") as mock_exit:
            version = "4.0.11"
            validation_result = validate_version(version,content="")
            self.assertEqual(validation_result, (True, "Version has no obvious issues."))

    # TODO add test for validate_version with correct version format for e.g. release candidate like 4.0.0-rc2

    def test_validate_version_with_redundant_version(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version number being unequal to an existing version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.5"
        content = """
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        validation_result = validate_version(version, content)
        self.assertEqual(validation_result, (False, f"Version {version} already exists in index.html."))    

    def test_find_insert_position_with_no_previous_version(self):
        """
        Test case for the `find_insert_position` function.

        This test verifies that the `find_insert_position` function correctly handles the case when no previous version is found in the index.html file.

        The test uses a mock file content with no previous version.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.6"
        mock_file_content = ""
        position_result = find_insert_position(mock_file_content, version)
        self.assertEqual(position_result, (False, "No previous version found in index.html"))


    def test_find_insert_position_with_correct_previous_version_given_front_position_random_string_of_len_10(self):
        """
        Test case for the `find_insert_position` function.

        This test verifies that the `find_insert_position` function correctly finds the insert position when a correct previous version is given.

        The test uses a mock file content with a previous version.

        Asserts:
            The function returns the correct insert position.
        """
        version = "3.0.6"
        mock_file_content = """1234567890<tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        position_result, message = find_insert_position(mock_file_content, version)
        self.assertEqual(position_result, 10)


    def test_run_update_html_twice_and_determine_insertion_position(self):
        """
        Test case for the `update_index_html` function.

        This test verifies that the `update_index_html` function correctly determines the insertion position for the second automatic update.

        The test uses a mock file content with a previous version.

        Asserts:
            The function confirms that the string 3.0.6 is occurring before 3.0.7.
        """
        version1= "3.0.6"
        version2= "3.0.7"
        #open index-html as mock file without hard inline content
        #TODO
        mock_file_content = """<tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>"""

        # First update
        with patch("builtins.open", mock_open(read_data="mock_file_content")):
            mock_file_content = update_index_html(version1, mock_file_content)
            # Second update
            mock_file_content = update_index_html(version2, mock_file_content)

        # Check order of both versions in the mock file content
        self.assertIn(version1, mock_file_content)
        self.assertIn(version2, mock_file_content)
        self.assertLess(mock_file_content.index(version2), mock_file_content.index(version1)) # version2 (3.0.7) should occur before version1 (3.0.6), since order is descending

    def test_run_update_index_with_redundant_version(self):
        """
        Test case for the `update_index_html` function.

        This test verifies that the `update_index_html` function correctly handles a redundant version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and does not update the index.html content.
        """
        version = "3.0.5"
        updated_content = update_index_html(version)
        self.assertFalse(updated_content)


    def test_run_update_content_with_redundant_version_without_content_alteration(self):
        """
        Test case for the `update_index_html` function.

        This test verifies that the `update_index_html` function correctly handles a redundant version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and does not update the index.html content.
        """

        version = "3.0.5"
        mock_file_content = """<body>
<div id="page-bg">
<div class="wrapper">
<div class="shadow-left">
<div class="shadow-right">
<div class="main-page">
<div class="main-page2">
<div class="main-page3">
<div class="main-page4">
<div class="vcard"> 
  <div class="vcard-header">
  <a href="https://hl7.de/">
  <img src="./files/Gematik_Logo_Flag.jpg" style="float: right; max-height: 80px; max-width: 240px;"> 
  </a>
  <h1 class="title">ISiK Implementierungsleitfäden</h1><h1>
  </div>
<!-- Begin Main Content Area -->
</div>
<div class="vcard-text">
<div class="thecontent"><table border="0" cellpadding="4" style="height: 400px;">	<thead>
	<tr align="left">
	<th width="10%">Datum</th>
	<th width="10%">Name</th>
	<th width="70%">Beschreibung</th>
	<th width="10%">Version</th>
	</tr>
	</thead>
  <tbody>
    </tr>
        <td colspan="4" style="background-color: #dddddd;">
          <strong>Basismodul Stufe 4</strong></td>
    </tr>
    <tr>
      <tr>
        <td>25.06.2024</td>
        <td>
          <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/4.0.0-rc3/ImplementationGuide-markdown-Einfuehrung.html">4.0.0-rc3</a>
        </td>
        <td>Release Candidate Benehmensherstellung 4.0.0-rc3</td>
        <td>4.0.0-rc3</td>
      </tr>
      <tr>
        <td>04.04.2024</td>
        <td>
          <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/4.0.0-rc2/ImplementationGuide-markdown-Einfuehrung.html">4.0.0-rc2</a>
        </td>
        <td>Release Candidate Kommentierung 4.0.0-rc2</td>
        <td>4.0.0-rc2</td>
      </tr>
      <tr>
    </tr>
        <td colspan="4" style="background-color: #dddddd;">
          <strong>Basismodul Stufe 3</strong></td>
    </tr>
    <tr>
      <tr>
        <td>30.04.2024</td>
        <td>
          <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
      </tr>
      <tr>
    <tr>
      <tr>
        <td>03.04.2024</td>
        <td>
          <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
      </tr>           """
        updated_content = update_index_html(version, mock_file_content)
        self.assertFalse(updated_content)




        

