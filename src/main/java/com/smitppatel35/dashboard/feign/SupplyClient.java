package com.smitppatel35.dashboard.feign;

import com.smitppatel35.dashboard.dto.MedicineDemand;
import com.smitppatel35.dashboard.dto.PharmacyMedicineSupplyDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.List;

@FeignClient(url = "${api-gateway-endpoint}", name = "supply-service")
public interface SupplyClient {

    @PostMapping(value = "/PharmacySupply")
    List<PharmacyMedicineSupplyDTO> pharmacySupply(@RequestHeader(value = "Authorization", required = true) String authorizationHeader,
                                                   @RequestBody List<MedicineDemand> demandList);
}
