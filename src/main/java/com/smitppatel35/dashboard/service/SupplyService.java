package com.smitppatel35.dashboard.service;

import com.smitppatel35.dashboard.dto.MedicineDemand;
import com.smitppatel35.dashboard.entity.PharmacyMedicineSupply;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface SupplyService {
    void sendDemandRequest(HttpSession session, List<MedicineDemand> demandList);

    List<PharmacyMedicineSupply> getDemandSupplyHistory(HttpSession session);
}
