<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Course</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Center the form vertically and horizontally */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f8f9fa;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Heading style */
        h1 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Input field and label spacing */
        .form-label {
            font-weight: bold;
            color: #555;
        }

        .form-control {
            border-radius: 5px;
        }

        /* Button styles */
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #6c757d;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1>Edit Course</h1>
        <form action="/updateCourse" method="post">
            <input type="hidden" name="courseid" value="${course.courseid}">
            <div class="mb-3">
                <label for="courseName" class="form-label">Course Name</label>
                <input type="text" class="form-control" id="courseName" name="courseName" value="${course.courseName}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="/courses" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
