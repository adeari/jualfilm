/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jualfilm.controller;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import modelDatabase.hibernateUtil;
import javax.servlet.http.HttpServletRequest;
import modelDatabase.barang;
import modelDatabase.pegawai;
import modelDatabase.purchase_order;
import modelDatabase.retur_pembelian;
import modelDatabase.supplier;

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
public class returPenjualanController {
    @RequestMapping(value="retur-penjualan", method = RequestMethod.GET)
    public String dataList(ModelMap model) {      
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_pembelian.class);
        List<retur_pembelian> lreturPenjualan = criteria.list();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        List showData = new ArrayList();
        for (retur_pembelian rpp : lreturPenjualan) {
            Map mapData = new HashMap();
            mapData.put("no_retur_pembelian", rpp.getNo_retur_pembelian());
            mapData.put("tanggal", df.format(rpp.getTanggal()));
            mapData.put("no_po", rpp.getNo_po().getNo_po());
            try {
                mapData.put("pegawai", "("+ rpp.getId_pegawai().getId_pegawai()+") "+ rpp.getId_pegawai().getNama_pegawai());
            } catch (Exception ex) {
                
            }
            try {
                mapData.put("supplier", "("+ rpp.getKode_supplier().getKode_supplier()+") "+ rpp.getKode_supplier().getNama_supplier());
            } catch (Exception ex) {
                
            }
            try {
                mapData.put("barang", "("+ rpp.getKode_barang().getKode_barang()+") "+ rpp.getKode_barang().getNama_barang());
            } catch (Exception ex) {
                
            }
            showData.add(mapData);
        }
        
        model.addAttribute("dataList", showData);
        session.close();
        return "returPenjualanList";
    }
    
    @RequestMapping(value="retur-penjualan/delete", method = RequestMethod.GET)
    public String dataAdd(ModelMap model, HttpServletRequest request) {
        String kodesupplier = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_pembelian.class);
        criteria.add(Restrictions.eq("no_retur_pembelian",kodesupplier));
        retur_pembelian rpp = (retur_pembelian) criteria.uniqueResult();
        Transaction trx = session.beginTransaction();
        session.delete(rpp);
        trx.commit();
        session.close();
        return "redirect:/retur-penjualan";
    }
    
    @RequestMapping(value="retur-penjualan/add", method = RequestMethod.GET)
    public String dataAdd(ModelMap model) {  
        model.addAttribute("headerapps", "Retur Penjualan Baru");        
        return "returPenjualanAdd";
    }
    
    @RequestMapping(value="retur-penjualan/add", method = RequestMethod.POST)
    public String DOdataAdd(ModelMap model, HttpServletRequest request ) {
        String no_retur_pembelian = request.getParameter("no_retur_pembelian");
        String tanggal = request.getParameter("tanggal");
        String no_po = request.getParameter("no_po");
        
        if (no_po != null ) {
            if (no_po.length() > 0 ) {
                char ch = (char)34;
                String komponen = String.valueOf(ch);
                
                if (no_po.substring(0,1).equals("\"")) {
                    no_po = no_po.substring(1);
                }
                
                if (no_po.substring(no_po.length()-1).equals("\"")) {
                    no_po = no_po.substring(0,no_po.length()-1);
                }
                
            }
        }
        
        String pegawai = request.getParameter("pegawai");
        if (pegawai != null ) {
            if (pegawai.length() > 0 ) {
                pegawai = pegawai.substring((pegawai.indexOf("(")+1),pegawai.indexOf(")"));
            }
        }
        
        String supplier = request.getParameter("supplier");
        if (supplier != null ) {
            if (supplier.length() > 0 ) {
                supplier = supplier.substring((supplier.indexOf("(")+1),supplier.indexOf(")"));
            }
        }
        String kode_barang = request.getParameter("kode_barang");
        if (kode_barang != null ) {
            if (kode_barang.length() > 0 ) {
                kode_barang = kode_barang.substring((kode_barang.indexOf("(")+1),kode_barang.indexOf(")"));
            }
        }
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Transaction trx = session.beginTransaction();
        
        retur_pembelian rpp = new retur_pembelian();
        rpp.setId_pegawai(new pegawai(pegawai));
        rpp.setKode_barang(new barang(kode_barang));
        rpp.setKode_supplier(new supplier(supplier));
        rpp.setNo_po(new purchase_order(no_po));
        rpp.setNo_retur_pembelian(no_retur_pembelian);
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            rpp.setTanggal(new Timestamp(df.parse(tanggal).getTime()));
        } catch (Exception ex) {
            
        }
        
        session.save(rpp);
        trx.commit();
        session.close();
        
        return "redirect:/retur-penjualan";
    }
    
    
    @RequestMapping(value="retur-penjualan/validation", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String ValidationdataAdd(ModelMap model, HttpServletRequest request ) {
        String msg = "";
        int cansaved = 1;
        JSONObject jobj = new JSONObject();
        String kodesupplier = request.getParameter("no_retur_pembelian");
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_pembelian.class).setProjection(Projections.rowCount());
        if ( request.getParameter("no_retur_pembelian1") != null ) {
            criteria.add(Restrictions.ne("no_retur_pembelian", request.getParameter("no_retur_pembelian1").toString() ));
        }
        criteria.add(Restrictions.eq("no_retur_pembelian", kodesupplier ));
        
        if (Integer.valueOf(criteria.uniqueResult().toString()) > 0 ){
            cansaved = 0;
            msg = "Kode "+kodesupplier+" telah digunakan oleh Retur Penjualan lain";
        }
        try {
            jobj.put("msg", msg);
            jobj.put("cansaved", cansaved);
        } catch (Exception ex) {
            
        }
        session.close();
        return jobj.toString();
    }
    
    @RequestMapping(value="retur-penjualan/edit", method = RequestMethod.GET)
    public String dataEdit(ModelMap model, HttpServletRequest request ) {
        String returndata = "redirect:/retur-penjualan";
        String kodesupplier = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_pembelian.class);
        criteria.add(Restrictions.eq("no_retur_pembelian",kodesupplier));
        if (criteria.uniqueResult() != null) {
            retur_pembelian rpp = (retur_pembelian) criteria.uniqueResult();
            Map modelData = new HashMap();
            modelData.put("no_retur_pembelian", rpp.getNo_retur_pembelian());
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            modelData.put("tanggal", df.format(rpp.getTanggal()));
            modelData.put("no_po", rpp.getNo_po().getNo_po());
            try {
                modelData.put("pegawai", "("+ rpp.getId_pegawai().getId_pegawai()+") "+ rpp.getId_pegawai().getNama_pegawai());
            } catch (Exception ex) {
                
            }
            try {
                modelData.put("supplier", "("+ rpp.getKode_supplier().getKode_supplier()+") "+ rpp.getKode_supplier().getNama_supplier());
            } catch (Exception ex) {
                
            }
            try {
                modelData.put("kode_barang", "("+ rpp.getKode_barang().getKode_barang()+") "+ rpp.getKode_barang().getNama_barang());
            } catch (Exception ex) {
                System.out.println(" error "+ex.getMessage());
            }
            model.addAttribute("dataEdit", modelData);
            returndata = "returPenjualanAdd";
        }
        session.close();
        model.addAttribute("headerapps", "Edit Retur Penjualan");
        return returndata;
    }
    
    @RequestMapping(value="retur-penjualan/edit", method = RequestMethod.POST)
    public String DOdataEdit(ModelMap model, HttpServletRequest request ) {        
        String returndata = "redirect:/retur-penjualan";
        String no_retur_pembelian = request.getParameter("no_retur_pembelian");
        String no_retur_pembelian1 = request.getParameter("no_retur_pembelian1");
        String tanggal = request.getParameter("tanggal");
        String no_po = request.getParameter("no_po");
        
        if (no_po != null ) {
            if (no_po.length() > 0 ) {
                char ch = (char)34;
                String komponen = String.valueOf(ch);
                
                if (no_po.substring(0,1).equals("\"")) {
                    no_po = no_po.substring(1);
                }
                
                if (no_po.substring(no_po.length()-1).equals("\"")) {
                    no_po = no_po.substring(0,no_po.length()-1);
                }
                
            }
        }
        System.out.println(" no_po "+no_po);
        String pegawai = request.getParameter("pegawai");
        if (pegawai != null ) {
            if (pegawai.length() > 0 ) {
                pegawai = pegawai.substring((pegawai.indexOf("(")+1),pegawai.indexOf(")"));
            }
        }
        System.out.println(" pegawai "+pegawai);
        String supplier = request.getParameter("supplier");
        if (supplier != null ) {
            if (supplier.length() > 0 ) {
                supplier = supplier.substring((supplier.indexOf("(")+1),supplier.indexOf(")"));
            }
        }
        
        System.out.println(" supplier "+supplier);
        
        String kode_barang = request.getParameter("kode_barang");
        if (kode_barang != null ) {
            if (kode_barang.length() > 0 ) {
                kode_barang = kode_barang.substring((kode_barang.indexOf("(")+1),kode_barang.indexOf(")"));
            }
        }
        
        System.out.println(" kode_barang "+kode_barang);
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_pembelian.class);
        criteria.add(Restrictions.eq("no_retur_pembelian", no_retur_pembelian1 ));
        if (criteria.uniqueResult() != null) {        
            Transaction trx = session.beginTransaction();
            retur_pembelian rpp = (retur_pembelian) criteria.uniqueResult();
            
            rpp.setId_pegawai(new pegawai(pegawai));
            rpp.setKode_barang(new barang(kode_barang));
            rpp.setKode_supplier(new supplier(supplier));
            rpp.setNo_po(new purchase_order(no_po));
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            try {
                rpp.setTanggal(new Timestamp(df.parse(tanggal).getTime()));
            } catch (Exception ex) {

            }
            
            session.update(rpp);
            
            if (!no_retur_pembelian1.equalsIgnoreCase(no_retur_pembelian)) {
                String sql = "update retur_pembelian set no_retur_pembelian=:kode where no_retur_pembelian=:kode1";
                session.createQuery(sql).setParameter("kode", no_retur_pembelian)
                        .setParameter("kode1", no_retur_pembelian1).executeUpdate();
            }
            trx.commit();
        }
        
        session.close();
        return returndata;
    }
}
