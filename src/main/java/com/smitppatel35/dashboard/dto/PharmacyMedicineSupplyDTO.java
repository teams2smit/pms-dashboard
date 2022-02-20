package com.smitppatel35.dashboard.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PharmacyMedicineSupplyDTO {

    private String pharmacyName;
    private String medicineName;
    private Integer supplyCount;

}
