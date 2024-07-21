package com.response.beans;

public class ListFriendRequestResponse {
    private String message;
    private String status;
    private String error;
    private String data;

    public ListFriendRequestResponse() {
    }

    public ListFriendRequestResponse(String message, String status, String error, String data) {
        this.message = message;
        this.status = status;
        this.error = error;
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
