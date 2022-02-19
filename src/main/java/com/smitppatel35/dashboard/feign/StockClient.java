package com.smitppatel35.dashboard.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(url = "${api-gateway-endpoint}" , name = "medical-stock-service")
public interface StockClient {

    @GetMapping("/MedicineStockInformation")
    ResponseEntity<Object> getAllMedicines();
}
