/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jualfilm.controller;


import java.util.HashMap;
import java.util.Map;
import modelDatabase.hibernateUtil;
import javax.servlet.http.HttpServletRequest;
import modelDatabase.barang;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.hibernate.Session;
import org.hibernate.Transaction;


import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.ResponseBody;

import org.json.JSONObject;

import org.hibernate.criterion.Order;
/**
 *
 * @author ade
 */
@Controller
public class barangController {
    @RequestMapping(value="barang", method = RequestMethod.GET)
    public String dataList(ModelMap model) {      
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class);
        model.addAttribute("dataList", criteria.list());
        session.close();
        return "barangList";
    }
    
    @RequestMapping(value="barang/delete", method = RequestMethod.GET)
    public String dataAdd(ModelMap model, HttpServletRequest request) {
        String kodebarang = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class);
        criteria.add(Restrictions.eq("kode_barang",kodebarang));
        barang barang1 = (barang) criteria.uniqueResult();
        Transaction trx = session.beginTransaction();
        session.delete(barang1);
        trx.commit();
        session.close();
        return "redirect:/barang";
    }
    
    @RequestMapping(value="barang/add", method = RequestMethod.GET)
    public String dataAdd(ModelMap model) {  
        Map mapDAta = new HashMap();
        model.addAttribute("headerapps", "Barang Baru");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class).setProjection(Projections.property("id"));
        criteria.addOrder(Order.desc("id"));
        criteria.setMaxResults(1);
        String kodedata = "Item-0001";
        if (criteria.uniqueResult() != null ) {
            kodedata = String.valueOf(Integer.valueOf(criteria.uniqueResult().toString())+1);
            while (kodedata.length() < 4) {
                kodedata = "0"+kodedata;
            }
            kodedata = "Item-"+kodedata;
        }
        mapDAta.put("kode_barang", kodedata);
        model.addAttribute("dataEdit", mapDAta);
        session.close();
        return "barangAdd";
    }
    
    @RequestMapping(value="barang/add", method = RequestMethod.POST)
    public String DOdataAdd(ModelMap model, HttpServletRequest request ) {
        String kodebarang = request.getParameter("kode_barang");
        String nama = request.getParameter("nama");
        String harga = request.getParameter("harga");
        String jumlah_stok = request.getParameter("jumlah_stok");
        if (jumlah_stok.length()<1) {
            jumlah_stok = "0";
        } else {
            jumlah_stok = jumlah_stok.replace(".", "");
        }
        if (harga.length()<1) {
            harga = "0";
        } else {
            harga = harga.replace(".", "");
        }
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Transaction trx = session.beginTransaction();
        
        barang barang1 = new barang();
        barang1.setKode_barang(kodebarang);
        barang1.setNama_barang(nama);
        barang1.setHarga(Long.valueOf(harga));
        barang1.setJumlah_stok(Long.valueOf(jumlah_stok));
        
        session.save(barang1);
        trx.commit();
        session.close();
        
        return "redirect:/barang";
    }
    
    
    @RequestMapping(value="barang/validation", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String ValidationdataAdd(ModelMap model, HttpServletRequest request ) {
        String msg = "";
        int cansaved = 1;
        JSONObject jobj = new JSONObject();
        String kodebarang = request.getParameter("kode_barang");
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class).setProjection(Projections.rowCount());
        if ( request.getParameter("kode_barang1") != null ) {
            criteria.add(Restrictions.ne("kode_barang", request.getParameter("kode_barang1").toString() ));
        }
        criteria.add(Restrictions.eq("kode_barang", kodebarang ));
        
        if (Integer.valueOf(criteria.uniqueResult().toString()) > 0 ){
            cansaved = 0;
            msg = "Kode "+kodebarang+" telah digunakan oleh barang lain";
        }
        try {
            jobj.put("msg", msg);
            jobj.put("cansaved", cansaved);
        } catch (Exception ex) {
            
        }
        session.close();
        return jobj.toString();
    }
    
    @RequestMapping(value="barang/edit", method = RequestMethod.GET)
    public String dataEdit(ModelMap model, HttpServletRequest request ) {
        String returndata = "redirect:/barang";
        String kodebarang = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class);
        criteria.add(Restrictions.eq("kode_barang",kodebarang));
        if (criteria.uniqueResult() != null) {
            barang barang1 = (barang) criteria.uniqueResult();
            model.addAttribute("dataEdit", barang1);
            returndata = "barangAdd";
        }
        session.close();
        model.addAttribute("headerapps", "Edit barang");
        return returndata;
    }
    
    @RequestMapping(value="barang/edit", method = RequestMethod.POST)
    public String DOdataEdit(ModelMap model, HttpServletRequest request ) {        
        String returndata = "redirect:/barang";
        String kodebarang = request.getParameter("kode_barang");
        String kodebarang1 = request.getParameter("kode_barang1");
        String nama = request.getParameter("nama");
        String harga = request.getParameter("harga");
        String jumlah_stok = request.getParameter("jumlah_stok");
        if (jumlah_stok.length()<1) {
            jumlah_stok = "0";
        } else {
            jumlah_stok = jumlah_stok.replace(".", "");
        }
        if (harga.length()<1) {
            harga = "0";
        } else {
            harga = harga.replace(".", "");
        }
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class);
        criteria.add(Restrictions.eq("kode_barang", kodebarang1 ));
        if (criteria.uniqueResult() != null) {        
            Transaction trx = session.beginTransaction();
            barang barang1 = (barang) criteria.uniqueResult();
                        
            barang1.setNama_barang(nama);
            barang1.setHarga(Long.valueOf(harga));
            barang1.setJumlah_stok(Long.valueOf(jumlah_stok));
            barang1.setKode_barang(kodebarang);
            
            session.update(barang1);
            trx.commit();
        }
        
        session.close();
        return returndata;
    }
    
    @RequestMapping(value="barang/laporan", method = RequestMethod.GET)
    public String laporanList(ModelMap model) {
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class);
        model.addAttribute("dataList", criteria.list());
        session.close();
        return "barangLaporan";
    }
}
