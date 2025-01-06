<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2, h3 {
            text-align: center;
            font-weight: bold;
            color: #333;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Manage Teams</h2>

        <!-- Form to Add a New Team -->
        <form action="saveTeam" method="post" class="mt-4">
            <div class="mb-3">
                <label for="name" class="form-label">Team Name</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select name="status" id="status" class="form-select">
                    <option value="IN_PROGRESS">In Progress</option>
                    <option value="ACCEPT">Accepted</option>
                    <option value="REJECT">Rejected</option>
                    <option value="DISQUALIFY">Disqualified</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="reason" class="form-label">Reason</label>
                <textarea name="reason" id="reason" class="form-control" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label for="teamLeaderId" class="form-label">Team Leader</label>
                <select name="teamLeaderId" id="teamLeaderId" class="form-select">
                    <c:forEach var="user" items="${users}">
                        <option value="${user.userId}">${user.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="hackathonId" class="form-label">Hackathon</label>
                <select name="hackathonId" id="hackathonId" class="form-select">
                    <c:forEach var="hackathon" items="${hackathons}">
                        <option value="${hackathon.hackathonId}">${hackathon.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Team</button>
        </form>

        <!-- List of Teams -->
        <h3 class="mt-5">Existing Teams</h3>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Team ID</th>
                    <th>Team Name</th>
                    <th>Status</th>
                    <th>Reason</th>
                    <th>Created At</th>
                    <th>Team Leader</th>
                    <th>Hackathon</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="team" items="${teams}">
                    <tr>
                        <td>${team.teamId}</td>
                        <td>${team.name}</td>
                        <td>${team.status}</td>
                        <td>${team.reason}</td>
                        <td>${team.createdAt}</td>
                        <td>${team.teamLeaderId.name}</td>
                        <td>${team.hackathon.title}</td>
                        <td>
                            <a href="editTeam?id=${team.teamId}" class="btn btn-sm btn-warning">Edit</a>
                            <a href="deleteTeam?id=${team.teamId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
