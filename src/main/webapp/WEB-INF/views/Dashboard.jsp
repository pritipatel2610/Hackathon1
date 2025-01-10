
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Hackathon Dashboard</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }
        .section-title {
            font-size: 1.4rem;
            font-weight: bold;
            color: #495057;
            margin-bottom: 1rem;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: scale(1.01);
            transition: 0.3s;
        }
        .btn-primary, .btn-success {
            font-weight: bold;
        }
        .footer {
            background-color: #343a40;
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Hackathon</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <!-- Welcome Section -->
        <div class="row">
            <div class="col-12">
                <h1 class="text-center text-primary">Welcome to the Hackathon Dashboard</h1>
                <p class="text-center text-muted">Manage your teams and stay up-to-date with the hackathon!</p>
            </div>
        </div>

        <!-- Team Management Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h2 class="section-title">Team Management</h2>
                <div class="card p-3">
                    <p>Create or manage your team for the hackathon. A team must have 3-5 members with at least 1 female member.</p>
                    <a href="/teams/create" class="btn btn-primary">Create Team</a>
                    <a href="/teams/list" class="btn btn-success">List Teams</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer py-3 text-center">
        <p class="mb-0">&copy; 2025 Hackathon | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
