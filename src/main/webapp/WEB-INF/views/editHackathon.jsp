<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${hackathon.hackathonId == null ? 'Add Hackathon' : 'Edit Hackathon'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
     <style>
        body {
            background-color: #f9fafb;
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #343a40;
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
            color: #495057;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding: 10px;
        }
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
        textarea.form-control {
            resize: none;
            height: 100px;
        }
        .text-muted {
            font-size: 0.85rem;
            color: #6c757d;
        }
        .container {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .text-end {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">${hackathon.hackathonId == null ? 'Add Hackathon' : 'Edit Hackathon'}</h1>
        <form action="/hackathons" method="post">
            <input type="hidden" name="hackathonId" value="${hackathon.hackathonId}" />
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" id="title" name="title" class="form-control" value="${hackathon.title}" required />
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" required>${hackathon.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="minTeam" class="form-label">Minimum Team</label>
                <input type="number" id="minTeam" name="minTeam" class="form-control" value="${hackathon.minTeam}" required />
            </div>
            <div class="mb-3">
                <label for="minTeamSize" class="form-label">Minimum Team Size</label>
                <input type="number" id="minTeamSize" name="minTeamSize" class="form-control" value="${hackathon.minTeamSize}" required />
            </div>
            <div class="mb-3">
                <label for="maxTeamSize" class="form-label">Maximum Team Size</label>
                <input type="number" id="maxTeamSize" name="maxTeamSize" class="form-control" value="${hackathon.maxTeamSize}" required />
            </div>
            <div class="mb-3">
                <label for="startDate" class="form-label">Start Date</label>
                <input type="date" id="startDate" name="startDate" class="form-control" value="${hackathon.startDate}" required />
            </div>
            <div class="mb-3">
                <label for="endDate" class="form-label">End Date</label>
                <input type="date" id="endDate" name="endDate" class="form-control" value="${hackathon.endDate}" required />
            </div>
            <div class="mb-3">
                <label for="registrationDeadline" class="form-label">Registration Deadline</label>
                <input type="date" id="registrationDeadline" name="registrationDeadline" class="form-control" value="${hackathon.registrationDeadline}" required />
            </div>
            <div class="mb-3">
                <label for="maxRegistrations" class="form-label">Maximum Registrations</label>
                <input type="number" id="maxRegistrations" name="maxRegistrations" class="form-control" value="${hackathon.maxRegistrations}" required />
            </div>
           
            <div class="mb-3">
                <label for="location" class="form-label">Location</label>
                <input type="text" id="location" name="location" class="form-control" value="${hackathon.location}" required />
            </div>
            <div class="mb-3">
                <label for="rules" class="form-label">Rules</label>
                <textarea id="rules" name="rules" class="form-control">${hackathon.rules}</textarea>
            </div>
            <div class="mb-3">
                <label for="prizes" class="form-label">Prizes</label>
                <textarea id="prizes" name="prizes" class="form-control">${hackathon.prizes}</textarea>
            </div>
            <div class="mb-3">
                <label for="judgingCriteria" class="form-label">Judging Criteria</label>
                <textarea id="judgingCriteria" name="judgingCriteria" class="form-control">${hackathon.judgingCriteria}</textarea>
            </div>
            <div class="mb-3">
                <label for="sponsors" class="form-label">Sponsors</label>
                <textarea id="sponsors" name="sponsors" class="form-control">${hackathon.sponsors}</textarea>
            </div>
            <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <textarea id="contact" name="contact" class="form-control" required>${hackathon.contact}</textarea>
            </div>
            <div class="mb-3">
                <label for="registrationFee" class="form-label">Registration Fee</label>
                <input type="number" id="registrationFee" name="registrationFee" class="form-control" value="${hackathon.registrationFee}" required />
            </div>
            <div class="mb-3">
                <label for="eventType" class="form-label">Event Type</label>
                <select id="eventType" name="eventType" class="form-control">
                    <option value="ONLINE" ${hackathon.eventType == 'ONLINE' ? 'selected' : ''}>Online</option>
                    <option value="OFFLINE" ${hackathon.eventType == 'OFFLINE' ? 'selected' : ''}>Offline</option>
                    <option value="HYBRID" ${hackathon.eventType == 'HYBRID' ? 'selected' : ''}>Hybrid</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="externalLinks" class="form-label">External Links</label>
                <textarea id="externalLinks" name="externalLinks" class="form-control">${hackathon.externalLinks}</textarea>
                <small class="text-muted">Enter links separated by commas.</small>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select id="status" name="status" class="form-control">
                    <option value="UPCOMING" ${hackathon.status == 'UPCOMING' ? 'selected' : ''}>Upcoming</option>
                    <option value="ONGOING" ${hackathon.status == 'ONGOING' ? 'selected' : ''}>Ongoing</option>
                    <option value="COMPLETED" ${hackathon.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="submissionAllow" class="form-label">Submission Allowed</label>
                <select id="submissionAllow" name="submissionAllow" class="form-control">
                    <option value="true" ${hackathon.submissionAllow ? 'selected' : ''}>Yes</option>
                    <option value="false" ${!hackathon.submissionAllow ? 'selected' : ''}>No</option>
                </select>
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-success">${hackathon.hackathonId == null ? 'Add' : 'Update'}</button>
                <a href="/hackathons" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>