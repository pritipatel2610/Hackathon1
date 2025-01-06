<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hackathons</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Hackathons</h1>
        <a href="/hackathon/new" class="btn btn-success mb-3">Create New Hackathon</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hackathon" items="${hackathons}">
                    <tr>
                        <td>${hackathon.title}</td>
                        <td>${hackathon.description}</td>
                        <td>${hackathon.status}</td>
                        <td>
                            <a href="/hackathon/edit/${hackathon.hackathonId}" class="btn btn-primary btn-sm">Edit</a>
                            <a href="/hackathon/delete/${hackathon.hackathonId}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
