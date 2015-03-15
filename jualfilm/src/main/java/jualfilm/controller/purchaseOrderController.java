/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jualfilm.controller;


import modelDatabase.hibernateUtil;
import javax.servlet.http.HttpServletRequest;
import modelDatabase.barang;
import modelDatabase.purchase_order;

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
/**
 *
 * @author ade
 */
@Controller
public class purchaseOrderController {
    @RequestMapping(value="purchase-order", method = RequestMethod.GET)
    public String dataList(ModelMap model) {      
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(purchase_order.class);
        model.addAttribute("dataList", criteria.list());
        session.close();
        return "purchaseOrderList";
    }
    
    @RequestMapping(value="purchase-order/delete", method = RequestMethod.GET)
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
        return "redirect:/purchase-order";
    }
    
    @RequestMapping(value="purchase-order/add", method = RequestMethod.GET)
    public String dataAdd(ModelMap model) {  
        model.addAttribute("headerapps", "Nota Pesan Baru");        
        return "purchaseOrderAdd";
    }
    
    @RequestMapping(value="purchase-order/add", method = RequestMethod.POST)
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
        
        return "redirect:/purchase-order";
    }
    
    
    @RequestMapping(value="purchase-order/validation", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String ValidationdataAdd(ModelMap model, HttpServletRequest request ) {
        String msg = "";
        int cansaved = 1;
        JSONObject jobj = new JSONObject();
        String kodebarang = request.getParameter("nomor_barang");
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class).setProjection(Projections.rowCount());
        if ( request.getParameter("nomor_barang1") != null ) {
            criteria.add(Restrictions.ne("kode_barang", request.getParameter("nomor_barang1").toString() ));
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
    
    @RequestMapping(value="purchase-order/edit", method = RequestMethod.GET)
    public String dataEdit(ModelMap model, HttpServletRequest request ) {
        String returndata = "redirect:/purchase-order";
        String kodebarang = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(barang.class);
        criteria.add(Restrictions.eq("kode_barang",kodebarang));
        if (criteria.uniqueResult() != null) {
            barang barang1 = (barang) criteria.uniqueResult();
            model.addAttribute("dataEdit", barang1);
            returndata = "purchaseOrderAdd";
        }
        session.close();
        model.addAttribute("headerapps", "Edit Nota Pesan");
        return returndata;
    }
    
    @RequestMapping(value="purchase-order/edit", method = RequestMethod.POST)
    public String DOdataEdit(ModelMap model, HttpServletRequest request ) {        
        String returndata = "redirect:/purchase-order";
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
            
            session.update(barang1);
            
            if (!kodebarang1.equalsIgnoreCase(kodebarang)) {
                String sql = "update barang set kode_barang=:kode where kode_barang=:kode1";
                session.createQuery(sql).setParameter("kode", kodebarang)
                        .setParameter("kode1", kodebarang1).executeUpdate();
            }
            trx.commit();
        }
        
        session.close();
        return returndata;
    }
}
