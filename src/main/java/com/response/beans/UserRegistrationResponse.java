package com.response.beans;

public class UserRegistrationResponse {
    private String error;
    private String status;
    private String message;



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
    public void updateResponse(String error, String status, String message){
        setError(error);
        setStatus(status);
        setMessage(message);
    }
}
