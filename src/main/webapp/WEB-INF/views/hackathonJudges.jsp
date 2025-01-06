<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hackathon Judges</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #0056b3;
        }

        a {
            text-decoration: none;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            margin-right: 5px;
        }

        a.add-new {
            background-color: #28a745;
        }

        a.edit {
            background-color: #007bff;
        }

        a.delete {
            background-color: #dc3545;
        }

        a.view {
            background-color: #17a2b8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #0056b3;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions a {
            display: inline-block;
        }
    </style>
</head>
<body>
    <h1>Hackathon Judges</h1>
    <a href="/hackathonJudges/new" class="add-new">Add New Judge</a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Hackathon</th>
                <th>User</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="judge" items="${judges}">
                <tr>
                    <td>${judge.hackathonJudgeId}</td>
                    <td>${judge.hackathon.title}</td>
                    <td>${judge.user.firstName}</td>
                    <td>${judge.role}</td>
                    <td class="actions">
                        <a href="/hackathonJudges/edit/${judge.hackathonJudgeId}" class="edit">Edit</a>
                        <a href="/hackathonJudges/delete/${judge.hackathonJudgeId}" class="delete">Delete</a>
                        <a href="/hackathonJudges/view/${judge.hackathonJudgeId}" class="view">View</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
