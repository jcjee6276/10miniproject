package com.model2.mvc.web.product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.impl.KakaoPay;

import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class KakaoPayController {

	@Setter
	@Autowired
    private KakaoPay kakaopay;
	
	
	@GetMapping("/kakaoPay")
    public void kakaoPayGet() {
    }
	
	@PostMapping("/kakaoPay")
    public String kakaoPay() {
        
		
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
	
	 @GetMapping("/kakaoPaySuccess")
	    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	        System.out.println("pgtoken"+pg_token);
	        
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
	    }
}
