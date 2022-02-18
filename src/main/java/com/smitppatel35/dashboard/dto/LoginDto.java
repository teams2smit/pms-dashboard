package com.smitppatel35.dashboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginDto {

    @NotNull
    @NotBlank(message = "Username should not be blank")
    private String username;

    @NotBlank(message = "Password should not be blank")
    private String password;
}
