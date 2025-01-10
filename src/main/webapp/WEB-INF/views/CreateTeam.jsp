<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Create Team</title>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            color: #007bff;
            font-weight: 600;
        }

        .form-container p {
            color: #6c757d;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-secondary {
            background-color: #f8f9fa;
            border-color: #ccc;
        }

        .btn-secondary:hover {
            background-color: #e2e6ea;
            border-color: #dae0e5;
        }

        .mt-3 a {
            text-decoration: none;
            color: #007bff;
        }

        .mt-3 a:hover {
            text-decoration: underline;
        }

        .alert {
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Create Team Form -->
    <div class="container">
        <div class="form-container">
            <h2 class="text-center">Create Team</h2>
            <p class="text-center">Enter a unique team name for your hackathon team.</p>
            
            <form action="/teams/create" method="post">
                <!-- Team Name Field -->
                <div class="mb-3">
                    <label for="teamName" class="form-label">Team Name</label>
                    <input type="text" class="form-control" name="teamName" id="teamName" value="${teamName}" placeholder="Enter your team name" required>
                </div>

                <!-- Hackathon Selection -->
                <div class="mb-3">
                    <label for="hackathon" class="form-label">Select Hackathon</label>
                    <select class="form-select" name="hackathonId" id="hackathonId" required>
                        <option value="" disabled selected>Select a hackathon</option>
                        <!-- Use JSTL to iterate through the hackathons list -->
                        <c:forEach var="hackathon" items="${hackathons}">
                            <option value="${hackathon.hackathonId}">${hackathon.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Create Team Button -->
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Create Team</button>
                </div>

                <!-- Cancel Link -->
                <div class="mt-3 text-center">
                    <a href="Dashboard" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
            
            <!-- Display Error Message -->
            <br>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>