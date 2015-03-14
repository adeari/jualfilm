/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jualfilm.controller;


import bengkelin.databaseModel.hibernateUtil;
import javax.servlet.http.HttpServletRequest;
import modelDatabase.pelanggan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import org.hibernate.Criteria;
/**
 *
 * @author ade
 */
@Controller
public class pelangganController {
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(pelanggan.class);
        model.addAttribute("dataList", criteria.list());        
        return "pelangganList";
    }
    
    @RequestMapping(value="pelanggan", method = RequestMethod.GET)
    public String dataList(ModelMap model) {      
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(pelanggan.class);
        model.addAttribute("dataList", criteria.list());
        //session.close();
        return "pelangganList";
    }
    
    @RequestMapping(value="pelanggan/add", method = RequestMethod.GET)
    public String dataAdd(ModelMap model) {
        model.addAttribute("menuKAtegori", "ggg");
        return "pelangganAdd";
    }
    
    @RequestMapping(value="pelanggan/add", method = RequestMethod.POST)
    public String DOdataAdd(ModelMap model, HttpServletRequest request ) {
        String kodepelanggan = request.getParameter("nomor_pelanggan");
        String nama = request.getParameter("nama");
        String alamat = request.getParameter("alamat");
        String telp = request.getParameter("telp");
        String email = request.getParameter("email");
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Transaction trx = session.beginTransaction();
        
        pelanggan pelanggan1 = new pelanggan();
        pelanggan1.setKode_pelanggan(kodepelanggan);
        pelanggan1.setNama_pelanggan(nama);
        pelanggan1.setAlamat_pelanggan(alamat);
        pelanggan1.setTelepon_pelanggan(telp);
        pelanggan1.setEmail_pelanggan(email);
        
        session.save(pelanggan1);
        trx.commit();
        session.close();
        
        return "redirect:/pelanggan";
    }
}
