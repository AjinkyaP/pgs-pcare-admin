package com.pgs.pcare.web;
import com.pgs.pcare.domain.PcareUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pcareusers")
@Controller
@RooWebScaffold(path = "pcareusers", formBackingObject = PcareUser.class)
public class PcareUserController {
}
