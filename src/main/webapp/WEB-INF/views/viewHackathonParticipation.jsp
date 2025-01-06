<!DOCTYPE html>
<html>
<head>
    <title>View Hackathon Participation</title>
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
            margin-bottom: 20px;
        }

        .participation-details {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .participation-details p {
            font-size: 16px;
            margin-bottom: 12px;
        }

        .participation-details strong {
            color: #0056b3;
        }

        a {
            display: inline-block;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Hackathon Participation Details</h1>
    <div class="participation-details">
        <p><strong>Hackathon:</strong> ${participation.hackathon.title}</p>
        <p><strong>User:</strong> ${participation.user.firstName} ${participation.user.lastName}</p>
        <p><strong>Role:</strong> ${participation.role}</p>
        <p><strong>Payment Status:</strong> ${participation.paymentStatus}</p>
    </div>
    <a href="/hackathonParticipations">Back to List</a>
</body>
</html>
