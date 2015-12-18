// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pgs.pcare.web;

import com.pgs.pcare.domain.Buddy;
import com.pgs.pcare.web.BuddyController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BuddyController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BuddyController.create(@Valid Buddy buddy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, buddy);
            return "buddys/create";
        }
        uiModel.asMap().clear();
        buddy.persist();
        return "redirect:/buddys/" + encodeUrlPathSegment(buddy.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BuddyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Buddy());
        return "buddys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BuddyController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("buddy", Buddy.findBuddy(id));
        uiModel.addAttribute("itemId", id);
        return "buddys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BuddyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("buddys", Buddy.findBuddyEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Buddy.countBuddys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("buddys", Buddy.findAllBuddys(sortFieldName, sortOrder));
        }
        return "buddys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BuddyController.update(@Valid Buddy buddy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, buddy);
            return "buddys/update";
        }
        uiModel.asMap().clear();
        buddy.merge();
        return "redirect:/buddys/" + encodeUrlPathSegment(buddy.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BuddyController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Buddy.findBuddy(id));
        return "buddys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BuddyController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Buddy buddy = Buddy.findBuddy(id);
        buddy.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/buddys";
    }
    
    void BuddyController.populateEditForm(Model uiModel, Buddy buddy) {
        uiModel.addAttribute("buddy", buddy);
    }
    
    String BuddyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
