<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container mt-4">
        <h1>Edit User</h1>
        <form action="/updateUser" method="post">
            <input type="hidden" name="userId" value="${user.userId}">
            <div class="row mb-3">
                <div class="col">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
                </div>
                <div class="col">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                </div>
                <div class="col">
                    <label for="contactNum" class="form-label">Contact Number</label>
                    <input type="text" class="form-control" id="contactNum" name="contactNum" value="${user.contactNum}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="courseId" class="form-label">Course</label>
                    <select class="form-select" id="courseId" name="courseId" required>
                        <option value="">Select Course</option>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.courseid}" ${course.courseid == user.courseId ? 'selected' : ''}>${course.courseName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <label for="roleId" class="form-label">Role</label>
                    <select class="form-select" id="roleId" name="roleId" required>
                        <option value="">Select Role</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleId}" ${role.roleId == user.roleId ? 'selected' : ''}>${role.roleName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="languages" class="form-label">Languages Known</label>
                    <select class="form-select" id="languages" name="languageKnown" multiple required>
                        <c:forEach var="language" items="${languages}">
                            <option value="${language.language}" ${fn:contains(user.languageKnown, language.language) ? 'selected' : ''}>
                                ${language.language}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city" value="${user.city}" required>
                </div>
                <div class="col">
                    <label for="collegeName" class="form-label">College Name</label>
                    <input type="text" class="form-control" id="collegeName" name="collegeName" value="${user.collegeName}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="semester" class="form-label">Semester</label>
                    <input type="number" class="form-control" id="semester" name="semester" value="${user.semester}" required>
                </div>
                <div class="col">
                    <label for="reference" class="form-label">Reference</label>
                    <input type="text" class="form-control" id="reference" name="reference" value="${user.reference}">
                </div>
            </div>

            <button type="submit" class="btn btn-success">Update User</button>
        </form>
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