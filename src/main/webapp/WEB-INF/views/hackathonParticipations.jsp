<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hackathon Participations</title>
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
    <h1>Hackathon Participations</h1>
    <a href="/hackathonParticipations/new" class="add-new">Add New Participation</a>
    <table>
        <thead>
            <tr>
                <th>Participation ID</th>
                <th>Hackathon</th>
                <th>User</th>
                <th>Registration Date</th>
                <th>Payment Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="participation" items="${participations}">
                <tr>
                    <td>${participation.hackathonParticipationId}</td>
                    <td>${participation.hackathon.title}</td>
                    <td>${participation.user.firstName} ${participation.user.lastName}</td>
                    <td>${participation.registrationDate}</td>
                    <td>${participation.paymentStatus}</td>
                    <td class="actions">
                        <!-- Edit Button -->
                        <a href="/hackathonParticipations/edit/${participation.hackathonParticipationId}" class="edit">Edit</a>
                        
                        <!-- View Button -->
                        <a href="/hackathonParticipations/view/${participation.hackathonParticipationId}" class="view">View</a>
                        
                        <!-- Delete Button -->
                        <a href="/hackathonParticipations/delete/${participation.hackathonParticipationId}" class="delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
