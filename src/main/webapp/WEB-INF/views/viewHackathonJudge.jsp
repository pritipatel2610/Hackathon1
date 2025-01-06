<!DOCTYPE html>
<html>
<head>
    <title>View Hackathon Judge</title>
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

        .judge-details {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .judge-details p {
            font-size: 16px;
            margin-bottom: 12px;
        }

        .judge-details strong {
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
    <h1>Hackathon Judge Details</h1>
    <div class="judge-details">
        <p><strong>Hackathon:</strong> ${judge.hackathon.title}</p>
        <p><strong>User:</strong> ${judge.user.firstName}</p>
        <p><strong>Role:</strong> ${judge.role}</p>
    </div>
    <a href="/hackathonJudges">Back to List</a>
</body>
</html>
