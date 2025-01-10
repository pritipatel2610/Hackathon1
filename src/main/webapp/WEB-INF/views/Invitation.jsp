<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Invitation Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Invitation Status</h2>
        <div class="alert ${status == 'success' ? 'alert-success' : 'alert-danger'}" role="alert">
            ${message}
        </div>
        <a href="/teams/list" class="btn btn-primary">Back to Team List</a>
    </div>
</body>
</html>