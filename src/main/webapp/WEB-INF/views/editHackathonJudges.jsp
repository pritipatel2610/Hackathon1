<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${judge.hackathonJudgeId == null ? "Add New Judge" : "Edit Judge"}</title>
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

        input[type="text"], select {
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
    <h1>${judge.hackathonJudgeId == null ? "Add New Judge" : "Edit Judge"}</h1>
    <form action="/hackathonJudges" method="post">
        <!-- Hidden field for the hackathonJudgeId (useful when editing an existing judge) -->
        <input type="hidden" name="hackathonJudgeId" value="${judge.hackathonJudgeId}" />

        <!-- Hackathon Dropdown -->
        
       
		  
				 <label for="hackathon">Hackathon:</label>
				<select name="hackathon.hackathonId">
		    <c:forEach var="hackathon" items="${hackathons}">
		        <option value="${hackathon.hackathonId}">
		            ${hackathon.title} <!-- Use the correct field name -->
		        </option>
		    </c:forEach>
		</select>
		
		<!-- User Dropdown -->
		<label for="user">User:</label>
		<select name="user.userId" required>
		    <c:forEach var="user" items="${users}">
		        <option value="${user.userId}" >
		            ${user.firstName}
		        </option>
		    </c:forEach>
		</select>

        <!-- Role Input Field -->
        <label for="role">Role:</label>
    <input type="text" name="role" value="${judge.role}" required />
    
 <button type="submit">Save</button>
    
    </form>

    <!-- Back to the judge list page -->
    <a href="/hackathonJudges" class="back-link">Back to Judges List</a>
</body>
</html>
