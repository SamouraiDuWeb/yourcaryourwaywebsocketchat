package com.example.yourcaryourwaywebsocketchat.chat;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MessageChat {

    private TypeMessage type;
    private String content;
    private String sender;

}
