<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container mt-4">
        <h1>Manage Users</h1>

        <!-- Form to Add New User -->
        <form action="/addUser" method="post" class="mb-4">
            <h3>Add New User</h3>
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" name="firstName" placeholder="First Name" required>
                </div>
                <div class="col">
                    <input type="text" class="form-control" name="lastName" placeholder="Last Name" required>
                </div>
                <div class="col">
                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <select class="form-select" name="courseId" required>
                        <option value="">Select Course</option>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.courseid}">${course.courseName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" name="roleId" required>
                        <option value="">Select Role</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleId}">${role.roleName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <label for="languages" class="form-label">Languages Known</label>
                    <select class="form-select" id="languages" name="languageKnown" multiple required>
                        <c:forEach var="language" items="${languages}">
                            <option value="${language.language}">${language.language}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <input type="text" class="form-control" name="city" placeholder="City" required>
                </div>
                <div class="col">
                    <input type="text" class="form-control" name="collegeName" placeholder="College Name" required>
                </div>
                <div class="col">
                    <input type="text" class="form-control" name="contactNum" placeholder="Contact Number" required>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <select class="form-select" name="gender" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="col">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <div class="col">
                    <input type="text" class="form-control" name="reference" placeholder="Reference">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <input type="number" class="form-control" name="semester" placeholder="Semester" required>
                </div>
            </div>

            <button type="submit" class="btn btn-success mt-3">Add User</button>
        </form>

        <!-- Display All Users -->
        <h3>All Users</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>City</th>
                    <th>College</th>
                    <th>Contact</th>
                    <th>Gender</th>
                    <th>Course</th>
                    <th>Role</th>
                    <th>Languages Known</th>
                    <th>Semester</th>
                    <th>Reference</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.firstName} ${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.city}</td>
                        <td>${user.collegeName}</td>
                        <td>${user.contactNum}</td>
                        <td>${user.gender}</td>
                        <td>
                            <c:forEach var="course" items="${courses}">
                                <c:if test="${course.courseid == user.courseId}">${course.courseName}</c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="role" items="${roles}">
                                <c:if test="${role.roleId == user.roleId}">${role.roleName}</c:if>
                            </c:forEach>
                        </td>
                        <td>${user.languageKnown}</td>
                        <td>${user.semester}</td>
                        <td>${user.reference}</td>
                        <td>
                            <a href="/editUser?userId=${user.userId}" class="btn btn-primary btn-sm">Edit</a>
                            <a href="/deleteUser?userId=${user.userId}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#languages').select2({
                placeholder: "Select languages",
                allowClear: true
            });
        });
    </script>
</body>
</html>