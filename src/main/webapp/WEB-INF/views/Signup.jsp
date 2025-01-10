<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
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

        .btn-primary {
            background-color: #6a11cb;
            border-color: #6a11cb;
        }

        .btn-primary:hover {
            background-color: #2575fc;
            border-color: #2575fc;
        }

        .select2-container--default .select2-selection--multiple {
            border-radius: 8px;
        }

        .footer-text a {
            color: #2575fc;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Sign Up</div>
                    <div class="card-body">
                        <form action="/auth/signup" method="post">
                            <!-- Personal Details -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <input type="text" class="form-control" name="firstName" id="firstName" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" name="lastName" id="lastName" required>
                                </div>
                            </div>

                            <!-- Contact Information -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" name="password" id="password" required>
                                </div>
                            </div>

                            <!-- Additional Information -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="contactNo" class="form-label">Contact Number</label>
                                    <input type="text" class="form-control" name="contactNum" id="contactNo" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="gender" class="form-label">Gender</label>
                                    <select class="form-select" name="gender" id="gender" required>
                                        <option value="" disabled selected>Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Education Details -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="collegeName" class="form-label">College Name</label>
                                    <input type="text" class="form-control" name="collegeName" id="collegeName" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="courseId" class="form-label">Course</label>
                                    <select class="form-select" id="courseId" name="courseId" required>
                                        <option value="">Select Course</option>
                                        <c:forEach var="course" items="${courses}">
                                            <option value="${course.courseid}">${course.courseName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                    <%--         <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="semester" class="form-label">Semester</label>
                                    <select class="form-control" name="semester" id="semester" required>
                                        <option value="" disabled selected>Select Semester</option>
                                        <option value="1">Semester 1</option>
                                        <option value="2">Semester 2</option>
                                        <option value="3">Semester 3</option>
                                        <option value="4">Semester 4</option>
                                        <option value="5">Semester 5</option>
                                        <option value="6">Semester 6</option>
                                        <option value="7">Semester 7</option>
                                        <option value="8">Semester 8</option>
                                    </select>
                                </div>
                                
					                               <div class="col-md-6">
					    <label for="city" class="form-label">City</label>
					    <select class="form-select" name="city" id="city" required>
					        <option value="" disabled selected>Select City</option>
					        <c:forEach var="city" items="${cities}">
					            <option value="${city.cityId}">${city.cityName}</option>
					        </c:forEach>
					    </select>
					</div>
 --%>
                            <!-- Languages Known -->
                            <div class="row mb-3">
                                <div class="col">
                                    <label for="languages" class="form-label">Languages Known</label>
                                    <select class="form-select" id="languages" name="languageIds" multiple>
                                        <c:forEach var="language" items="${languages}">
                                            <option value="${language.languageId}">${language.language}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Sign Up</button>
                            </div>
                        </form>

                        <!-- Footer -->
                        <p class="footer-text mt-4">
                            Already have an account? <a href="/auth/login">Login</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#languages').select2({
                placeholder: "Select languages",
                allowClear: true
            });
        });
    </script>
</body>

</html>
