<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet">
    <title>Sign Up</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow p-4">
                    <h2 class="text-center">Sign Up</h2>
                    <form action="/auth/signup" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">First Name</label>
                                <input type="text" class="form-control" name="firstName" id="firstName" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName" class="form-label">Last Name</label>
                                <input type="text" class="form-control" name="lastName" id="lastName" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="email" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="contactNo" class="form-label">Contact Number</label>
                                <input type="text" class="form-control" name="contactNum" id="contactNo" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-select" name="gender" id="gender" required>
                                    <option value="" disabled selected>Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="collegeName" class="form-label">College Name</label>
                                <input type="text" class="form-control" name="collegeName" id="collegeName" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="courseId" class="form-label">Course</label>
                                <select class="form-select" id="courseId" name="courseId" required>
                                    <option value="">Select Course</option>
                                    <c:forEach var="course" items="${courses}">
                                        <option value="${course.courseid}">${course.courseName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="semester" class="form-label">Semester</label>
                                <input type="text" class="form-control" name="semester" id="semester" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="city" class="form-label">City</label>
                                <input type="text" class="form-control" name="city" id="city" required>
                            </div>
                        </div>
					<div class="row mb-3">
					    <div class="col">
					        <label for="languages" class="form-label">Languages Known</label>
					        <select class="form-select" id="languages" name="languages" multiple required>
					            <c:forEach var="language" items="${languages}">
					                <option value="${language.languageId}">${language.language}</option>
					            </c:forEach>
					        </select>
					    </div>
					</div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="referenceName" class="form-label">Reference Name</label>
                                <input type="text" class="form-control" name="reference" id="referenceName">
                            </div>
                        </div>
                       
                        <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                        <p class="text-center mt-3">Already have an account? <a href="/auth/login">Login</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>
    <script>
        // Initialize Select2 for multiple select
        $(document).ready(function() {
            $('#languages').select2({
                placeholder: "Select languages",
                allowClear: true
            });
        });
    </script>
</body>
</html>