package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.MedicineDto;
import com.smitppatel35.dashboard.feign.StockClient;
import com.smitppatel35.dashboard.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockClient stockClient;

    @Autowired
    private SimpleDateFormat simpleDateFormat;

    @Override
    public List<MedicineDto> getAllMedicinesList() {
        List<MedicineDto> medicines = (List<MedicineDto>) stockClient.getAllMedicines().getBody();

        return medicines;
    }
}
