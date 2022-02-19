package com.smitppatel35.dashboard.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class MedicineDto {

    private Integer id;
    private String medicineName;
    private String chemicalComposition;
    private Date dateOfExpiry;
    private Long numbersOfTabletsInStock;
    private String targetAilments;
}
