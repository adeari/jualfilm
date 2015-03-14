/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jualfilm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 *
 * @author ade
 */
@Controller
public class mainController {
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String index() {              
        return "redirect:/supplier";
    }
}
