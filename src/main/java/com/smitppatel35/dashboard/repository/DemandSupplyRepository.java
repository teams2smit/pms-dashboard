package com.smitppatel35.dashboard.repository;

import com.smitppatel35.dashboard.entity.PharmacyMedicineSupply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DemandSupplyRepository extends JpaRepository<PharmacyMedicineSupply, Integer> {

    List<PharmacyMedicineSupply> getAllByRepName(String repName);
}
