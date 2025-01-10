<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Team Member</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #2575fc;
            color: white;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-primary {
            background-color: #6a11cb;
            border-color: #6a11cb;
        }

        .btn-primary:hover {
            background-color: #2575fc;
            border-color: #2575fc;
        }

        .footer-text {
            font-size: 0.9rem;
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }

        .footer-text a {
            color: #2575fc;
            text-decoration: none;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">Add Member to Team</div>
            <div class="card-body">
                <form action="/teams/addMember" method="post">
                    <input type="hidden" name="teamId" value="${teamId}">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <input type="text" class="form-control" id="role" name="role" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Invite</button>
                </form>
            </div>
        </div>
        <div class="footer-text mt-4">
            <p>Need help? <a href="#">Contact Support</a></p>
        </div>
    </div>

    <!-- Bootstrap JS (optional, for future enhancements like tooltips or modal) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>