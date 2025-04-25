package vn.son.laptopshop.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.son.laptopshop.service.VNPayService;

@RestController
public class TestController {

    @Autowired
    private VNPayService vnPayService;

    @GetMapping("/test-vnpay")
    public String testVNPay() throws UnsupportedEncodingException {
        String paymentUrl = vnPayService.generateVNPayURL(34000000, "2254", "127.0.0.1");
        return "Payment URL: " + paymentUrl;
    }
}
