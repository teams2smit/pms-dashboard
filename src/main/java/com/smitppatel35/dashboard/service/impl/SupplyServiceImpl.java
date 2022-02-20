package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.MedicineDemand;
import com.smitppatel35.dashboard.dto.PharmacyMedicineSupplyDTO;
import com.smitppatel35.dashboard.entity.PharmacyMedicineSupply;
import com.smitppatel35.dashboard.feign.SupplyClient;
import com.smitppatel35.dashboard.repository.DemandSupplyRepository;
import com.smitppatel35.dashboard.service.SupplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Service
public class SupplyServiceImpl implements SupplyService {

    @Autowired
    private SupplyClient supplyClient;

    @Autowired
    private DemandSupplyRepository demandSupplyRepository;

    @Override
    public void sendDemandRequest(HttpSession session, List<MedicineDemand> demandList) {
        String token = (String) session.getAttribute("token");

        List<PharmacyMedicineSupplyDTO> result = supplyClient.pharmacySupply("Bearer " + token, demandList);

        for (PharmacyMedicineSupplyDTO d : result) {

            MedicineDemand medicine = demandList.stream()
                    .filter(medicineDemand -> d.getMedicineName().equals(medicineDemand.getMedicineName()))
                    .findFirst()
                    .get();

            PharmacyMedicineSupply p = new PharmacyMedicineSupply();
            p.setDemandCount(medicine.getDemandCount());
            p.setMedicineName(d.getMedicineName());
            p.setSupplyCount(d.getSupplyCount());
            p.setPharmacyName(d.getPharmacyName());
            p.setOrderDate(new Date());
            p.setRepName((String) session.getAttribute("username"));

            demandSupplyRepository.save(p);
        }

//        HashMap<String, Object> resultMap = new HashMap<>();

//        resultMap.put("result", demandSupplyRepository.getAllByRepName((String) session.getAttribute("username")));
//        resultMap.put("outOfStock", demandList.size() - result.size());

//        return resultMap;

    }

    @Override
    public List<PharmacyMedicineSupply> getDemandSupplyHistory(HttpSession session) {
        String username = (String) session.getAttribute("username");
        List<PharmacyMedicineSupply> medicineSupplies = demandSupplyRepository.getAllByRepName((String) username);

        medicineSupplies.sort(new Comparator<PharmacyMedicineSupply>() {
            @Override
            public int compare(PharmacyMedicineSupply o1, PharmacyMedicineSupply o2) {
                if (o1.getOrderDate().before(o2.getOrderDate())) {
                    return 1;
                } else if (o1.getOrderDate().after(o2.getOrderDate())) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });

        return medicineSupplies;
    }


}
