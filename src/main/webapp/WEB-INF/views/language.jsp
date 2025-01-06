<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Languages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Container Styling */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading Styling */
        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #333;
        }

        /* Table Styling */
        .table {
            border-radius: 5px;
            overflow: hidden;
        }

        .table th {
            background-color: #28a745;
            color: #fff;
            text-align: center;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
        }

        /* Button Styling */
        .btn-success {
            background-color: #28a745;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
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

        /* Form Styling */
        .form-control {
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1>Languages</h1>
        <form action="/addLanguage" method="post" class="mb-4">
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <input type="text" class="form-control" name="language" placeholder="Enter Language" required>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-success">Add Language</button>
                </div>
            </div>
        </form>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Language</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="language" items="${languages}">
                    <tr>
                        <td>${language.languageId}</td>
                        <td>${language.language}</td>
                        <td>
                            <a href="/editLanguage?languageId=${language.languageId}" class="btn btn-primary btn-sm">Edit</a>
                            <a href="/deleteLanguage?languageId=${language.languageId}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
