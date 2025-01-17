<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Team Members</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Custom inline CSS -->
    <style>
        body {
            background-color: #f4f7fa;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        table {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
        }

        td {
            text-align: center;
            vertical-align: middle;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }

        .container {
            margin-top: 40px;
        }

        .btn-secondary {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2>Team Members</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${teamMembers}">
                <tr>
                    <td>${member.user.firstName} ${member.user.lastName}</td>
                    <td>${member.user.email}</td>
                    <td>${member.role}</td>
                    <td>${member.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/teams/list" class="btn btn-secondary">Back to Teams</a>
</div>
</body>
</html>
