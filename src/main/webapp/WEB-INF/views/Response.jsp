<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Invitation Response</title>
     <style>
        /* Resetting some basic elements */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
            font-weight: 700;
        }

        p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .status {
            font-size: 18px;
            font-weight: 600;
            margin: 10px 0;
            color: ${status == '1' ? "#4CAF50" : "#FF5252"};
        }

        .message {
            background-color: ${status == '1' ? "#e8f5e9" : "#ffebee"};
            border: 1px solid ${status == '1' ? "#4CAF50" : "#FF5252"};
            padding: 15px;
            border-radius: 8px;
            color: ${status == '1' ? "#4CAF50" : "#FF5252"};
            margin-bottom: 20px;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #aaa;
        }

        /* Adding responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Invitation Response</h1>
        
        <p><strong>Team ID:</strong> ${teamId}</p>
        <p><strong>User ID:</strong> ${userId}</p>
        <p><strong>Status:</strong> ${status == '1' ? "Accepted" : "Rejected"}</p>
        
		        <p>Subject: Team Invitation Accepted
		Dear User,
		
		You have successfully accepted the invitation to join Team ID: 12345.
		
		Thank you!
		</p>

        <div class="footer">
            <p>&copy; 2025 Your Company</p>
        </div>
    </div>
</body>
</html>
