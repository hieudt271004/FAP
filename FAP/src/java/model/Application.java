/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author ai
 */
public class Application {
    private int id, typeId, sid, did;
    private String send, feedback;
    private LocalDateTime sendAt, feedbackTime;

    public Application() {
    }

    
    public Application(int sid, String send, LocalDateTime sendAt) {
        this.sid = sid;
        this.send = send;
        this.sendAt = sendAt;
    }

    
    public Application(int id, int typeId, int sid, String send, String feedback, LocalDateTime sendAt, LocalDateTime feedbackTime) {
        this.id = id;
        this.typeId = typeId;
        this.sid = sid;
        this.send = send;
        this.feedback = feedback;
        this.sendAt = sendAt;
        this.feedbackTime = feedbackTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSend() {
        return send;
    }

    public void setSend(String send) {
        this.send = send;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public LocalDateTime getSendAt() {
        return sendAt;
    }

    public void setSendAt(LocalDateTime sendAt) {
        this.sendAt = sendAt;
    }

    public LocalDateTime getFeedbackTime() {
        return feedbackTime;
    }

    public void setFeedbackTime(LocalDateTime feedbackTime) {
        this.feedbackTime = feedbackTime;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }
    
    
}
