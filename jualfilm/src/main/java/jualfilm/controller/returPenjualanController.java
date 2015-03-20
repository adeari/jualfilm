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
import modelDatabase.pelanggan;
import modelDatabase.penjualan;
import modelDatabase.purchase_order;
import modelDatabase.retur_pembelian;
import modelDatabase.retur_penjualan;
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
        Criteria criteria = session.createCriteria(retur_penjualan.class);
        List<retur_penjualan> lreturPenjualan = criteria.list();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        List showData = new ArrayList();
        for (retur_penjualan rpp : lreturPenjualan) {
            Map mapData = new HashMap();
            mapData.put("no_retur_penjualan", rpp.getNo_returpenjualan());
            mapData.put("tanggal", df.format(rpp.getTanggal()));
            mapData.put("no_faktur", rpp.getNo_faktur().getNo_faktur());
            try {
                mapData.put("pegawai", "("+ rpp.getId_pegawai().getId_pegawai()+") "+ rpp.getId_pegawai().getNama_pegawai());
            } catch (Exception ex) {
                
            }
            try {
                mapData.put("pelanggan", "("+ rpp.getKode_pelanggan().getKode_pelanggan()+") "+ rpp.getKode_pelanggan().getNama_pelanggan());
            } catch (Exception ex) {
                
            }
            try {
                mapData.put("barang", "("+ rpp.getKode_barang().getKode_barang()+") "+ rpp.getKode_barang().getNama_barang());
            } catch (Exception ex) {
                
            }
            mapData.put("jumlah", rpp.getJumlah());
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
        Criteria criteria = session.createCriteria(retur_penjualan.class);
        criteria.add(Restrictions.eq("no_returpenjualan",kodesupplier));
        retur_penjualan rpp = (retur_penjualan) criteria.uniqueResult();
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
        String no_returpenjualan = request.getParameter("no_returpenjualan");
        String tanggal = request.getParameter("tanggal");
        String no_faktur = request.getParameter("no_faktur");
        System.out.println(" no_faktur = "+no_faktur);
        String jumlah = request.getParameter("jumlah");
        if (jumlah.length()>0) {
            jumlah = jumlah.replace(".", "");
        }
        String nama_barang = request.getParameter("nama_barang");
        
        if (no_faktur != null ) {
            if (no_faktur.length() > 0 ) {
                char ch = (char)34;
                String komponen = String.valueOf(ch);
                
                if (no_faktur.substring(0,1).equals("\"")) {
                    no_faktur = no_faktur.substring(1);
                }
                
                if (no_faktur.substring(no_faktur.length()-1).equals("\"")) {
                    no_faktur = no_faktur.substring(0,no_faktur.length()-1);
                }
                
            }
        }
        
        String pegawai = request.getParameter("pegawai");
        if (pegawai != null ) {
            if (pegawai.length() > 0 ) {
                pegawai = pegawai.substring((pegawai.indexOf("(")+1),pegawai.indexOf(")"));
            }
        }
        
        String pelanggan = request.getParameter("pelanggan");
        if (pelanggan != null ) {
            if (pelanggan.length() > 0 ) {
                pelanggan = pelanggan.substring((pelanggan.indexOf("(")+1),pelanggan.indexOf(")"));
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
        
        retur_penjualan rpp = new retur_penjualan();
        rpp.setId_pegawai(new pegawai(pegawai));
        rpp.setKode_barang(new barang(kode_barang));
        rpp.setKode_pelanggan(new pelanggan(pelanggan));
        System.out.println(" no faktur "+no_faktur);
        rpp.setNo_faktur(new penjualan(no_faktur));
        rpp.setNo_returpenjualan(no_returpenjualan);
        rpp.setNama_barang(nama_barang);
        try {
            rpp.setJumlah(Long.valueOf(jumlah));
        } catch (Exception ex) {
            
        }
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
        String kodesupplier = request.getParameter("no_returpenjualan");
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_penjualan.class).setProjection(Projections.rowCount());
        if ( request.getParameter("no_returpenjualan1") != null ) {
            criteria.add(Restrictions.ne("no_returpenjualan", request.getParameter("no_returpenjualan1").toString() ));
        }
        criteria.add(Restrictions.eq("no_returpenjualan", kodesupplier ));
        
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
        Criteria criteria = session.createCriteria(retur_penjualan.class);
        criteria.add(Restrictions.eq("no_returpenjualan",kodesupplier));
        if (criteria.uniqueResult() != null) {
            retur_penjualan rpe = (retur_penjualan) criteria.uniqueResult();
            Map modelData = new HashMap();
            modelData.put("no_returpenjualan", rpe.getNo_returpenjualan());
            modelData.put("no_returpenjualan1", rpe.getNo_returpenjualan());
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            modelData.put("tanggal", df.format(rpe.getTanggal()));
            modelData.put("no_faktur", rpe.getNo_faktur().getNo_faktur());
            try {
                modelData.put("pegawai", "("+ rpe.getId_pegawai().getId_pegawai()+") "+ rpe.getId_pegawai().getNama_pegawai());
            } catch (Exception ex) {
                
            }
            try {
                modelData.put("pelanggan", "("+ rpe.getKode_pelanggan().getKode_pelanggan()+") "+ rpe.getKode_pelanggan().getNama_pelanggan());
            } catch (Exception ex) {
                
            }
            try {
                modelData.put("kode_barang", "("+ rpe.getKode_barang().getKode_barang()+") "+ rpe.getKode_barang().getNama_barang());
            } catch (Exception ex) {
                System.out.println(" error "+ex.getMessage());
            }
            modelData.put("nama_barang", rpe.getNama_barang());
            modelData.put("jumlah", rpe.getJumlah());
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
        String no_returpenjualan = request.getParameter("no_returpenjualan");
        String no_returpenjualan1 = request.getParameter("no_returpenjualan1");
        String tanggal = request.getParameter("tanggal");
        String no_faktur = request.getParameter("no_faktur");
        System.out.println(" no_faktur = "+no_faktur);
        String jumlah = request.getParameter("jumlah");
        if (jumlah.length()>0) {
            jumlah = jumlah.replace(".", "");
        }
        String nama_barang = request.getParameter("nama_barang");
        
        if (no_faktur != null ) {
            if (no_faktur.length() > 0 ) {
                char ch = (char)34;
                String komponen = String.valueOf(ch);
                
                if (no_faktur.substring(0,1).equals("\"")) {
                    no_faktur = no_faktur.substring(1);
                }
                
                if (no_faktur.substring(no_faktur.length()-1).equals("\"")) {
                    no_faktur = no_faktur.substring(0,no_faktur.length()-1);
                }
                
            }
        }
        
        String pegawai = request.getParameter("pegawai");
        if (pegawai != null ) {
            if (pegawai.length() > 0 ) {
                pegawai = pegawai.substring((pegawai.indexOf("(")+1),pegawai.indexOf(")"));
            }
        }
        
        String pelanggan = request.getParameter("pelanggan");
        if (pelanggan != null ) {
            if (pelanggan.length() > 0 ) {
                pelanggan = pelanggan.substring((pelanggan.indexOf("(")+1),pelanggan.indexOf(")"));
            }
        }
        String kode_barang = request.getParameter("kode_barang");
        if (kode_barang != null ) {
            if (kode_barang.length() > 0 ) {
                kode_barang = kode_barang.substring((kode_barang.indexOf("(")+1),kode_barang.indexOf(")"));
            }
        }
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(retur_penjualan.class);
        criteria.add(Restrictions.eq("no_returpenjualan", no_returpenjualan1 ));
        if (criteria.uniqueResult() != null) {        
            Transaction trx = session.beginTransaction();
            retur_penjualan rpp = (retur_penjualan) criteria.uniqueResult();
            
            rpp.setId_pegawai(new pegawai(pegawai));
            rpp.setKode_barang(new barang(kode_barang));
            rpp.setKode_pelanggan(new pelanggan(pelanggan));
            rpp.setNo_faktur(new penjualan(no_faktur));
            rpp.setNama_barang(nama_barang);
            try {
                rpp.setJumlah(Long.valueOf(jumlah));
            } catch (Exception ex) {

            }
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            try {
                rpp.setTanggal(new Timestamp(df.parse(tanggal).getTime()));
            } catch (Exception ex) {

            }
            
            session.update(rpp);
            
            if (!no_returpenjualan1.equalsIgnoreCase(no_returpenjualan)) {
                String sql = "update retur_penjualan set no_returpenjualan=:kode where no_returpenjualan=:kode1";
                session.createQuery(sql).setParameter("kode", no_returpenjualan)
                        .setParameter("kode1", no_returpenjualan1).executeUpdate();
            }
            trx.commit();
        }
        
        session.close();
        return returndata;
    }
}
