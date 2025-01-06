<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Container Styling */
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Heading Styling */
        h2, h3 {
            text-align: center;
            font-weight: bold;
            color: #333;
        }

        /* Form Styling */
        .form-label {
            font-weight: bold;
        }

        .form-select {
            border-radius: 5px;
            padding: 10px;
            border: 1px solid #ddd;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Button Styling */
        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            transform: scale(1.05);
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-danger:hover {
            background-color: #bd2130;
            transform: scale(1.05);
        }

        /* Table Styling */
        .table {
            border-radius: 5px;
            overflow: hidden;
            margin-top: 20px;
        }

        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
        }

        /* Add some padding for mobile responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .table td, .table th {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Role Management</h2>
        <form action="saveRole" method="post" class="mt-4">
            <div class="mb-3">
                <label for="roleName" class="form-label">Select Role</label>
                <input name="roleName" id="roleName" class="form-select" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Role</button>
        </form>
        
        <h3 class="mt-5">Existing Roles</h3>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Role Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="role" items="${roles}">
                    <tr>
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                        <td>
                            <a href="editRole?id=${role.roleId}" class="btn btn-sm btn-warning">Edit</a>
                            <a href="deleteRole?id=${role.roleId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
