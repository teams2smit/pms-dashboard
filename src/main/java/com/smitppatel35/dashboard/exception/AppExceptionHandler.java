package com.smitppatel35.dashboard.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@Slf4j
@ControllerAdvice
public class AppExceptionHandler {

    @ExceptionHandler(value = RuntimeException.class)
    public String handleAllExceptions(RuntimeException e, WebRequest request) {
        log.debug(e.getMessage());

        return "error";
    }
}
