<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Invitation Response</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }
        h1 {
            color: #FF5252;
        }
        p {
            font-size: 16px;
            color: #555;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Invitation Response</h1>
        
        <p><strong>Team ID:</strong> ${teamId}</p>
        <p><strong>User ID:</strong> ${userId}</p>
        <p><strong>Status:</strong> Rejected</p>
        
        <p>Subject: Team Invitation Rejected
Dear User,

You have declined the invitation to join Team ID: ${teamId}.

If this is a mistake or you change your mind, feel free to contact the team administrator.

Thank you!</p>

        <div class="footer">
            <p>&copy; 2025 Your Company</p>
        </div>
    </div>
</body>
</html>
