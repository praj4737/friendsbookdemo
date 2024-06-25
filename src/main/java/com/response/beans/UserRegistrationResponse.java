package com.response.beans;

public class UserRegistrationResponse {
    private String error;
    private String status;
    private String message;
    private int userId;



    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void updateResponse(String error, String status, String message){
        setError(error);
        setStatus(status);
        setMessage(message);
    }
}
