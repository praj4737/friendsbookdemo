package com.beans;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

public class JsonConverter {
    public static String toJson(Object obj) {
        String json = null;

        ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
        try {
            json = mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
           e.printStackTrace();
        }

        return json;
    }

}
