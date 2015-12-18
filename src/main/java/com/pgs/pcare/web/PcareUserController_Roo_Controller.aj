// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pgs.pcare.web;

import com.pgs.pcare.domain.Buddy;
import com.pgs.pcare.domain.PcareUser;
import com.pgs.pcare.web.PcareUserController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PcareUserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PcareUserController.create(@Valid PcareUser pcareUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pcareUser);
            return "pcareusers/create";
        }
        uiModel.asMap().clear();
        pcareUser.persist();
        return "redirect:/pcareusers/" + encodeUrlPathSegment(pcareUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PcareUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PcareUser());
        return "pcareusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PcareUserController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pcareuser", PcareUser.findPcareUser(id));
        uiModel.addAttribute("itemId", id);
        return "pcareusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PcareUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pcareusers", PcareUser.findPcareUserEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) PcareUser.countPcareUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pcareusers", PcareUser.findAllPcareUsers(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "pcareusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PcareUserController.update(@Valid PcareUser pcareUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pcareUser);
            return "pcareusers/update";
        }
        uiModel.asMap().clear();
        pcareUser.merge();
        return "redirect:/pcareusers/" + encodeUrlPathSegment(pcareUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PcareUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, PcareUser.findPcareUser(id));
        return "pcareusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PcareUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PcareUser pcareUser = PcareUser.findPcareUser(id);
        pcareUser.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pcareusers";
    }
    
    void PcareUserController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("pcareUser_dateofbirth_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pcareUser_createdon_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pcareUser_registeredon_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pcareUser_termsacceptedon_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void PcareUserController.populateEditForm(Model uiModel, PcareUser pcareUser) {
        uiModel.addAttribute("pcareUser", pcareUser);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("buddys", Buddy.findAllBuddys());
    }
    
    String PcareUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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