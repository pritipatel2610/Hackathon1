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

        String htmlContent = "<!DOCTYPE html>" +
                "<html>" +
                "<head>" +
                "    <title>Hackathon Invitation</title>" +
                "    <style>" +
                "        body { font-family: Arial, sans-serif; color: #333; background-color: #f9f9f9; padding: 20px; }" +
                "        .button { padding: 10px 20px; text-decoration: none; border-radius: 5px; }" +
                "        .accept { background-color: #28a745; color: white; }" +
                "        .reject { background-color: #dc3545; color: white; }" +
                "    </style>" +
                "</head>" +
                "<body>" +
                "    <h2>Hello " + recipientName + "!</h2>" +
                "    <p>You are invited to join the <b>" + hackathonName + "</b> as a <b>" + role + "</b>.</p>" +
                "    <p>Please respond to the invitation:</p>" +
                "    <a href=\"http://localhost:9999/teams/updateInvitation/" + teamId + "/" + userId + "/1\" class=\"button accept\">Accept</a>" +
                "    <a href=\"http://localhost:9999/teams/updateInvitation/" + teamId + "/" + userId + "/0\" class=\"button reject\">Reject</a>" +
                "</body>" +
                "</html>";

        helper.setTo(to);
        helper.setSubject("Hackathon Invitation: " + hackathonName);
        helper.setText(htmlContent, true);

        mailSender.send(mimeMessage);
    }
}