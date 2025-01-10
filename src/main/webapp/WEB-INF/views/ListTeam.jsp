<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Team List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Teams</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Team Name</th>
                    <th>Hackathon Name</th>
                    <th>Team Leader Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="team" items="${teams}">
                    <tr>
                        <td>${team.teamName}</td>
                        <td>${team.hackathon.title}</td>
                        <td>${team.user.firstName}</td>
                        <td>
                            <a href="/teams/addMember/${team.teamId}" class="btn btn-primary">Add Member</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>