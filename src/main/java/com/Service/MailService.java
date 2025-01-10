package com.Service;


import org.springframework.stereotype.Service;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Service
public class MailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendHackathonInvitationEmail(UUID userId, String to, String recipientName, String hackathonName, String role, Long teamId) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

        // Create the HTML content manually
        String htmlContent = "<!DOCTYPE html>" +
                "<html>" +
                "<head>" +
                "    <title>Hackathon Invitation</title>" +
                "    <style>" +
                "        body { font-family: Arial, sans-serif; color: #333; background-color: #f9f9f9; padding: 20px; }" +
                "        h2 { color: #007bff; }" +
                "        p { line-height: 1.6; }" +
                "        .buttons { margin-top: 20px; }" +
                "        .button { display: inline-block; padding: 10px 20px; font-size: 14px; color: #fff; text-decoration: none; border-radius: 5px; }" +
                "        .accept { background-color: #28a745; }" +
                "        .reject { background-color: #dc3545; }" +
                "        .footer { margin-top: 30px; font-size: 0.9em; color: #888; }" +
                "    </style>" +
                "</head>" +
                "<body>" +
                "    <h2>Hey " + recipientName + "!</h2>" +
                "    <p>You are invited to participate in <strong>" + hackathonName + "</strong> as a <strong>" + role + "</strong>.</p>" +
                "    <p>We hope you accept this invitation and join the excitement of the hackathon!</p>" +
                "    <div class=\"buttons\">" +
                "        <a href=\"http://localhost:9999/teams/updateInvitation/" + teamId + "/" + userId + "/1\" class=\"button accept\">Accept</a>" +
                "       <a href=\"http://localhost:9999/teams/respondToInvitation/" + teamId + "/"+ userId + "/1\" class=\"button reject\">Reject</a>\n" +
                "    </div>" +
                "    <p>If you have any questions, feel free to reach out to us. Thank you!</p>" +
                "    <div class=\"footer\">" +
                "        <p>&copy; 2025 Hackathon Team. All rights reserved.</p>" +
                "    </div>" +
                "</body>" +
                "</html>";

        // Configure the email details
        helper.setTo(to);
        helper.setSubject("Hackathon Invitation: " + hackathonName);
        helper.setText(htmlContent, true); // true indicates that the content is HTML

        // Send the email
        mailSender.send(mimeMessage);
    }
}