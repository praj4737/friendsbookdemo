package com.response.beans;

public class PeoperYouMayKnowResponse {
    private String error;
    private String status;
    private String message;
    private String data;

    public PeoperYouMayKnowResponse() {

    }

    public PeoperYouMayKnowResponse(String error, String status, String message, String data) {
        this.error = error;
        this.status = status;
        this.message = message;
        this.data = data;
    }

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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
