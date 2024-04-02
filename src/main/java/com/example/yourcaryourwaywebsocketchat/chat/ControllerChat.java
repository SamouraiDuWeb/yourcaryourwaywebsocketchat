package com.example.yourcaryourwaywebsocketchat.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

@Controller
public class ControllerChat {

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public MessageChat sendMessage(
            @Payload MessageChat messageChat
    ) {
        return messageChat;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public MessageChat addUser(
            @Payload MessageChat messageChat,
            SimpMessageHeaderAccessor headerAccessor
    ) {
        // Add username in web socket session
        headerAccessor.getSessionAttributes().put("username", messageChat.getSender());
        return messageChat;
    }
}
