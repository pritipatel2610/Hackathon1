<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Problem Statements</title>
    <style>
        /* Basic body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Link styling */
        a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Button styling for "Add New Problem Statement" link */
        .add-new-btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .add-new-btn:hover {
            background-color: #0056b3;
        }

        /* Add padding around the content */
        h1 {
            color: #333;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {
            table {
                width: 100%;
                font-size: 14px;
            }

            .add-new-btn {
                padding: 10px 18px;
                font-size: 14px;
            }

            th, td {
                padding: 8px;
                font-size: 12px; /* Smaller font for better fit on small screens */
            }

            /* Adjust table headers for smaller screens */
            th {
                text-align: center;
            }

            /* Ensure actions fit well on small screens */
            td a {
                display: block;
                margin-bottom: 5px;  /* Stack action links vertically */
            }
        }
    </style>
</head>
<body>
    <h1>Problem Statements</h1>
    <a href="/problemStatements/new" class="add-new-btn">Add New Problem Statement</a>
    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Hackathon</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="problemStatement" items="${problemStatements}">
                <tr>
                    <td>${problemStatement.title}</td>
                    <td>${problemStatement.description}</td>
                    <td>${problemStatement.hackathon.title}</td>
                    <td>
                        <a href="/problemStatements/view/${problemStatement.problemStatementId}">View</a>
                        <a href="/problemStatements/edit/${problemStatement.problemStatementId}">Edit</a>
                        <a href="/problemStatements/delete/${problemStatement.problemStatementId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
