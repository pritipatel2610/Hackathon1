<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Problem Statement</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
        color: #333;
    }

    h1 {
        text-align: center;
        color: #333; /* Neutral color for the heading */
        margin-bottom: 20px;
    }

    /* Table Styling */
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        border-radius: 8px;
        border: 2px solid #ccc; /* Neutral border for the table */
    }

    th, td {
        padding: 15px;
        text-align: left;
        border: 1px solid #ddd; /* Neutral border for cells */
    }

    th {
        background-color: #f2f2f2; /* Light gray background for the header */
        color: #333; /* Neutral text color for the header */
        text-align: center;
    }

    td {
        background-color: #ffffff; /* White background for table cells */
    }

    tr:nth-child(even) td {
        background-color: #f9f9f9; /* Slightly off-white for alternating rows */
    }

    tr:hover td {
        background-color: #f1f1f1; /* Light gray on hover */
    }

    /* Participation Details Styling */
    .participation-details {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .participation-details p {
        font-size: 16px;
        margin-bottom: 12px;
    }

    .participation-details strong {
        color: #333; /* Neutral text color for highlights */
    }

    /* Back Link/Button Styling */
    a {
        display: inline-block;
        text-decoration: none;
        background-color: #333; /* Neutral background color */
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        margin-top: 20px;
        text-align: center;
    }

    a:hover {
        background-color: #555; /* Slightly darker on hover */
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color:white; /* Neutral color */
        text-decoration: none;
        font-weight: bold;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>



</head>
<body>
    <h1>Problem Statement Details</h1>
    <table>
        <tr>
            <th>Title</th>
            <td>${problemStatement.title}</td>
        </tr>
        <tr>
            <th>Description</th>
            <td>${problemStatement.description}</td>
        </tr>
        <tr>
            <th>Reference Document URL</th>
            <td>
                <a href="${problemStatement.refDocUrl}" target="_blank">${problemStatement.refDocUrl}</a>
            </td>
        </tr>
        <tr>
            <th>Tech Stack</th>
            <td>${problemStatement.techStack}</td>
        </tr>
        <tr>
            <th>Visible</th>
            <td>${problemStatement.visible ? 'Yes' : 'No'}</td>
        </tr>
        <tr>
            <th>Hackathon</th>
            <td>${problemStatement.hackathon.title}</td>
        </tr>
    </table>

    <a href="/problemStatements" class="back-link">Back to Problem Statements List</a>
</body>
</html>
