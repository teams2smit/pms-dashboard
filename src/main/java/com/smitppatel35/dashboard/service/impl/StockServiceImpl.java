package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.MedicineDto;
import com.smitppatel35.dashboard.feign.StockClient;
import com.smitppatel35.dashboard.service.StockService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockClient stockClient;

    @Override
    public List<MedicineDto> getAllMedicinesList() {

        log.info("[StockServiceImpl] getAllMedicinesList() invoked");

        log.debug("Requesting to stock-service");
        List<MedicineDto> medicines = (List<MedicineDto>) stockClient.getAllMedicines().getBody();
        log.debug("Response received from stock-service");
        return medicines;
    }
}
