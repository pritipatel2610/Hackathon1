<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Team</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Centered Container */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading Style */
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-weight: bold;
        }

        /* Label Styling */
        .form-label {
            font-weight: bold;
            color: #555;
        }

        /* Input Styling */
        .form-control {
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Button Styling */
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2>Edit Team</h2>
    <form action="/updateTeam" method="post">
        <!-- Hidden field for teamId -->
        <input type="hidden" name="teamId" value="${team.teamId}">

        <div class="mb-3">
            <label for="name" class="form-label">Team Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${team.name}" required>
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select name="status" id="status" class="form-select" required>
                <option value="IN_PROGRESS" ${team.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                <option value="ACCEPT" ${team.status == 'ACCEPT' ? 'selected' : ''}>Accepted</option>
                <option value="REJECT" ${team.status == 'REJECT' ? 'selected' : ''}>Rejected</option>
                <option value="DISQUALIFY" ${team.status == 'DISQUALIFY' ? 'selected' : ''}>Disqualified</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="reason" class="form-label">Reason</label>
            <textarea class="form-control" id="reason" name="reason" rows="3">${team.reason}</textarea>
        </div>

        <div class="mb-3">
            <label for="teamLeaderId" class="form-label">Team Leader</label>
            <select name="teamLeaderId" id="teamLeaderId" class="form-select" required>
                <c:forEach var="user" items="${users}">
                    <option value="${user.userId}" ${team.teamLeaderId.userId == user.userId ? 'selected' : ''}>${user.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="hackathonId" class="form-label">Hackathon</label>
            <select name="hackathonId" id="hackathonId" class="form-select" required>
                <c:forEach var="hackathon" items="${hackathons}">
                    <option value="${hackathon.hackathonId}" ${team.hackathon.hackathonId == hackathon.hackathonId ? 'selected' : ''}>${hackathon.name}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <a href="/teams" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
