package com.smitppatel35.dashboard.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@Table(name = "TBL_SUPPLY_DEMAND")
public class PharmacyMedicineSupply {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String repName;
    private String pharmacyName;
    private String medicineName;
    private Integer supplyCount;
    private Integer demandCount;
    private Date orderDate;
}
