<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Role</title>
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
    <h2>Edit Role</h2>
    <form action="/updateRole" method="post">
        <div class="mb-3">
            <label for="roleId" class="form-label">Role ID</label>
            <input type="text" class="form-control" id="roleId" name="roleId" readonly value="${role.roleId}">
        </div>
        <div class="mb-3">
            <label for="roleName" class="form-label">Role Name</label>
            <input type="text" class="form-control" id="roleName" name="roleName" value="${role.roleName}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="/roles" class="btn btn-secondary">Cancel</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
