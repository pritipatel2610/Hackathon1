<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hackathon Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Hackathon Details</h1>
        <div class="card">
            <div class="card-header">
                <h2>${hackathon.title}</h2>
            </div>
            <div class="card-body">
                <p><strong>Description:</strong> ${hackathon.description}</p>
                <p><strong>Contact:</strong> ${hackathon.contact}</p>
                <p><strong>Min Team Size:</strong> ${hackathon.minTeamSize}</p>
                <p><strong>Max Team Size:</strong> ${hackathon.maxTeamSize}</p>
                <p><strong>Start Date:</strong> ${hackathon.startDate}</p>
                <p><strong>End Date:</strong> ${hackathon.endDate}</p>
                <p><strong>Status:</strong> ${hackathon.status}</p>
                <p><strong>Location:</strong> ${hackathon.location}</p>
                <p><strong>Registration Deadline:</strong> ${hackathon.registrationDeadline}</p>
                <p><strong>Maximum Registrations:</strong> ${hackathon.maxRegistrations}</p>
                <p><strong>Rules:</strong> ${hackathon.rules}</p>
                <p><strong>Prizes:</strong> ${hackathon.prizes}</p>
                <p><strong>Judging Criteria:</strong> ${hackathon.judgingCriteria}</p>
                <p><strong>Sponsors:</strong> ${hackathon.sponsors}</p>
                <p><strong>Total Submissions:</strong> ${hackathon.totalSubmission}</p>
                <p><strong>Total Teams:</strong> ${hackathon.totalTeams}</p>
                <p><strong>External Links:</strong> ${hackathon.externalLinks}</p>
                <p><strong>Registration Fee:</strong> ${hackathon.registrationFee}</p>
                <p><strong>Submission Allowed:</strong> ${hackathon.submissionAllow ? 'Yes' : 'No'}</p>
            </div>
            <div class="card-footer text-end">
                <a href="/hackathons" class="btn btn-secondary">Back to List</a>
            </div>
        </div>
    </div>
</body>
</html>