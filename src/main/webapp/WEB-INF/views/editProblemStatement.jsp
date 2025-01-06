<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${problemStatement.problemStatementId == null ? "Add New Problem Statement" : "Edit Problem Statement"}</title>
    <style>
       /* styles.css */
body {
    font-family: Arial, sans-serif;
    margin: 20px;
    background-color: #f4f4f9;
}

h1 {
    font-size: 2rem; /* Adjust the size for prominence */
    font-weight: 700; /* Make the title bold */
    color: #333; /* A dark color for the text */
    text-align: center; /* Center the title */
    margin-bottom: 20px; /* Add spacing below the title */
    letter-spacing: 1px; /* Add subtle spacing between letters */
    text-transform: capitalize; /* Ensure the first letter is capitalized */
    font-family: 'Arial', sans-serif; /* Use a clean, modern font */
}

form {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: auto;
}

label {
    font-size: 1rem;
    font-weight: bold;
    margin-bottom: 8px;
    display: inline-block;
    color: #333;
}

input[type="text"], textarea, select {
    width: 100%;
    padding: 8px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
}

textarea {
    resize: vertical;
    min-height: 100px;
}

input[type="checkbox"] {
    margin-right: 8px;
}

button[type="submit"] {
    background-color: #007bff;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

.form-group {
    margin-bottom: 16px;
}
.back-link {
    display: block; /* Ensure it behaves like a block element */
    font-size: 1rem; /* Adjust the size for prominence */
    font-weight: 700; /* Make the title bold */
    color: #333; /* A dark color for the text */
    text-align: center; /* Center-align the text */
    margin: 20px auto; /* Center horizontally and add vertical spacing */
    letter-spacing: 1px; /* Add subtle spacing between letters */
    text-transform: capitalize; /* Ensure the first letter is capitalized */
    font-family: 'Arial', sans-serif; /* Use a clean, modern font */
    text-decoration: none; /* Remove underline */
    transition: color 0.3s ease; /* Smooth hover effect */
}

.back-link:hover {
    color: #007bff; /* Change color on hover */
}

    </style>
</head>
<body>
    <h1>Add New Problem Statement</h1>
    <form action="/problemStatements" method="post">
        <input type="hidden" name="problemStatementId" value="${problemStatement.problemStatementId}" />

        <div class="form-group">
            <label for="hackathon">Hackathon:</label>
            <select name="hackathon.hackathonId" required>
                <c:forEach var="hackathon" items="${hackathons}">
                    <option value="${hackathon.hackathonId}" >
                        ${hackathon.title}
                    </option>
                </c:forEach>
            </select>
        </div>

      <%--  
       <div class="form-group">
            <label for="Title">Title:</label>
            <select name="hackathon.Title" required>
                <c:forEach var="Title" items="${Title}">
                    <option value="${hackathon.Title}" >
                        ${hackathon.title}
                    </option>
                </c:forEach>
            </select>
        </div> --%>
       
       
        <div class="form-group">
            <label for="title-${problemStatement.problemStatementId}">Title:</label>
            <input type="text" name="title" value="${problemStatement.title}" required />
        </div> 
 

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea name="description" required>${problemStatement.description}</textarea>
        </div>

        <div class="form-group">
            <label for="refDocUrl">Reference Document URL:</label>
            <input type="text" name="refDocUrl" value="${problemStatement.refDocUrl}" />
        </div>

        <div class="form-group">
            <label for="techStack">Tech Stack:</label>
            <input type="text" name="techStack" value="${problemStatement.techStack}" />
        </div>

        <div class="form-group">
            <label for="visible">Visible:</label>
            <input type="checkbox" name="visible" <c:if test="${problemStatement.visible}">checked</c:if> />
        </div>

        <button type="submit">Save</button>
    </form>
    
        <a href="/problemStatements" class="back-link">Back to List</a>
</body>
</html>
