<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${participation.hackathonParticipationId == null ? "Add New Participation" : "Edit Participation"}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #0056b3;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #0056b3;
        }

        input[type="text"], select, input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #218838;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #0056b3;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>${participation.hackathonParticipationId == null ? "Add New Participation" : "Edit Participation"}</h1>
    <form action="/hackathonParticipations" method="post">
        <!-- Hidden field for hackathonParticipationId (useful when editing an existing participation) -->
        <input type="hidden" name="hackathonParticipationId" value="${participation.hackathonParticipationId}" />

        <!-- Hackathon Dropdown -->
        <label for="hackathon">Hackathon:</label>
        <select name="hackathon.hackathonId">
            <c:forEach var="hackathon" items="${hackathons}">
                <option value="${hackathon.hackathonId}" 
                        <c:if test="${participation.hackathon != null && participation.hackathon.hackathonId == hackathon.hackathonId}">
                            selected
                        </c:if>
                >
                    ${hackathon.title}
                </option>
            </c:forEach>
        </select>

        <!-- User Dropdown -->
        <label for="user">User:</label>
        <select name="user.userId" required>
            <c:forEach var="user" items="${users}">
                <option value="${user.userId}" 
                        <c:if test="${participation.user != null && participation.user.userId == user.userId}">
                            selected
                        </c:if>
                >
                    ${user.firstName} ${user.lastName}
                </option>
            </c:forEach>
        </select>

        <!-- Payment Status Dropdown -->
        <label for="paymentStatus">Payment Status:</label>
        <select name="paymentStatus" required>
            <option value="NOT_PAID" 
                    <c:if test="${participation.paymentStatus == 'NOT_PAID'}">selected</c:if>
            >Not Paid</option>
            <option value="PAID" 
                    <c:if test="${participation.paymentStatus == 'PAID'}">selected</c:if>
            >Paid</option>
            <option value="PENDING" 
                    <c:if test="${participation.paymentStatus == 'PENDING'}">selected</c:if>
            >Pending</option>
        </select>

        <!-- Registration Date Field -->
        <label for="registrationDate">Registration Date:</label>
        <input type="date" name="registrationDate" value="${participation.registrationDate != null ? participation.registrationDate : ''}" required />

        <!-- Role Input -->
        <label for="role">Role:</label>
        <input type="text" name="role" value="${participation.role}" required />

        <!-- Submit Button -->
        <button type="submit">Save</button>
    </form>

    <!-- Back to the participation list page -->
    <a href="/hackathonParticipations" class="back-link">Back to Participations List</a>
</body>
</html>
