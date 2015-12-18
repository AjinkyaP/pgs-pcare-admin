package com.pgs.pcare.web;
import com.pgs.pcare.domain.Buddy;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/buddys")
@Controller
@RooWebScaffold(path = "buddys", formBackingObject = Buddy.class)
public class BuddyController {
}
