/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jualfilm.controller;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelDatabase.hibernateUtil;
import javax.servlet.http.HttpServletRequest;
import modelDatabase.barang;
import modelDatabase.detail_purchase_order;
import modelDatabase.pegawai;
import modelDatabase.purchase_order;
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
public class purchaseOrderController {
    @RequestMapping(value="purchase-order", method = RequestMethod.GET)
    public String dataList(ModelMap model) {      
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(purchase_order.class);
        List<purchase_order> lData = criteria.list();
        List dataShow = new ArrayList();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        for (purchase_order po : lData) {
           Map<String, String> modelHere = new HashMap<String, String>();
           modelHere.put("no_po", po.getNo_po());
           modelHere.put("tanggal", df.format(po.getTanggal()));
           try {
            modelHere.put("supplier", "("+ po.getKode_supplier_inpo().getKode_supplier()+") "+po.getKode_supplier_inpo().getNama_supplier() );
           } catch (Exception ex) {
               
           }
           try {
            modelHere.put("pegawai", "("+ po.getId_pegawai_inpo().getId_pegawai()+ ") " +po.getId_pegawai_inpo().getNama_pegawai());
           } catch (Exception ex) {
               
           }
           dataShow.add(modelHere);
        }
        model.addAttribute("dataList", dataShow);
        session.close();
        return "purchaseOrderList";
    }
    
    @RequestMapping(value="purchase-order/delete", method = RequestMethod.GET)
    public String dataDelete(ModelMap model, HttpServletRequest request) {
        String kodebarang = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(purchase_order.class);
        criteria.add(Restrictions.eq("no_po",kodebarang));
        try {
            purchase_order po = (purchase_order) criteria.uniqueResult();
            Transaction trx = session.beginTransaction();
            try {
                List<detail_purchase_order> ldpo = po.getPo_detail();
                for (detail_purchase_order dpo : ldpo) {
                        if (dpo != null) {
                            session.delete(dpo);
                        }
                }
            } catch (Exception ex) {
                    System.out.println("error bagian ini "+ex.getMessage());
            }
            session.delete(po);
            trx.commit();
        } catch (Exception ex) {
            System.out.println(" error dataDelete "+ex.getMessage());
        }
        session.close();
        return "redirect:/purchase-order";
    }
    
    @RequestMapping(value="purchase-order/add", method = RequestMethod.GET)
    public String dataAdd(ModelMap model) {  
        model.addAttribute("headerapps", "Nota Beli Baru");        
        return "purchaseOrderAdd";
    }
    
    @RequestMapping(value="purchase-order/add", method = RequestMethod.POST)
    public String DOdataAdd(ModelMap model, HttpServletRequest request ) {
        String no_po = request.getParameter("no_po");
        String tanggal = request.getParameter("tanggal");
        String supplier = request.getParameter("supplier");
        String pegawai = request.getParameter("pegawai");
        pegawai = pegawai.substring((pegawai.indexOf("(")+1),pegawai.indexOf(")"));
        supplier = supplier.substring((supplier.indexOf("(")+1),supplier.indexOf(")"));
        
        String[] kodeparameter =  request.getParameterValues("kodebarang");
        String[] namabarang =  request.getParameterValues("namabarang");
        String[] jumlah =  request.getParameterValues("jumlah");
        int lengthDAta = kodeparameter.length;
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Transaction trx = session.beginTransaction();
        
       purchase_order po = new purchase_order();
       po.setNo_po(no_po);
       DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            po.setTanggal(new Timestamp(df.parse(tanggal).getTime()));
        } catch (ParseException ex) {
            Logger.getLogger(purchaseOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        po.setKode_supplier_inpo(new supplier(supplier));
        po.setId_pegawai_inpo(new pegawai(pegawai));
        session.save(po);
                
        int i = 0;
        for (i = 0; i<lengthDAta; i++) {
            if (kodeparameter[i].length()>0
                    &&namabarang[i].length()>0
                    &&jumlah[i].length()>0
                    ) {
                String jmlBarang = jumlah[i].replace(".", "");
                try {
                    Long jmlBarangl = Long.valueOf(jmlBarang);
                    if (jmlBarangl>0) {
                        detail_purchase_order dpo = new detail_purchase_order();
                        dpo.setNo_po(po);
                        dpo.setKode_barang(new barang(kodeparameter[i]));
                        dpo.setNama_barang(namabarang[i]);
                        dpo.setJumlah(jmlBarangl);
                        session.save(dpo);
                    }
                } catch (Exception ex) {
                    System.out.println(" error add po "+ex.getMessage());
                }
            }
        }

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
         String kodebarang = request.getParameter("no_po");
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(purchase_order.class).setProjection(Projections.rowCount());
        if ( request.getParameter("no_po1") != null ) {
            criteria.add(Restrictions.ne("no_po", request.getParameter("no_po1").toString() ));
        }
        criteria.add(Restrictions.eq("no_po", kodebarang ));
        
        if (Integer.valueOf(criteria.uniqueResult().toString()) > 0 ){
            cansaved = 0;
            msg = "Nomor PO "+kodebarang+" telah digunakan oleh barang lain";
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
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String kodebarang = request.getParameter("kode");
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(purchase_order.class);
        criteria.add(Restrictions.eq("no_po",kodebarang));
        if (criteria.uniqueResult() != null) {
            purchase_order po = (purchase_order) criteria.uniqueResult();
            Map modelHere = new HashMap();
            modelHere.put("no_po", po.getNo_po());
            modelHere.put("tanggal", df.format( po.getTanggal()) );
            try {
            modelHere.put("supplier", "("+ po.getKode_supplier_inpo().getKode_supplier()+") "+po.getKode_supplier_inpo().getNama_supplier() );
           } catch (Exception ex) {
               
           }
           try {
            modelHere.put("pegawai", "("+ po.getId_pegawai_inpo().getId_pegawai()+ ") " +po.getId_pegawai_inpo().getNama_pegawai());
           } catch (Exception ex) {
               
           }
           
           List<detail_purchase_order> ldpo = po.getPo_detail();
           List detailData = new ArrayList();
           for (detail_purchase_order dpo : ldpo) {
               Map modelHere1 = new HashMap();
               modelHere1.put("kode_barang",dpo.getKode_barang().getKode_barang());
               modelHere1.put("nama_barang",dpo.getNama_barang());
               modelHere1.put("jumlah",dpo.getJumlah());
               detailData.add(modelHere1);
           }
           modelHere.put("detailData", detailData);
            model.addAttribute("dataEdit", modelHere);
            returndata = "purchaseOrderAdd";
        }
        session.close();
        model.addAttribute("headerapps", "Edit Nota Beli");
        return returndata;
    }
    
    @RequestMapping(value="purchase-order/edit", method = RequestMethod.POST)
    public String DOdataEdit(ModelMap model, HttpServletRequest request ) {  
        String returndata = "redirect:/purchase-order";
        String no_po = request.getParameter("no_po");
        String no_po1 = request.getParameter("no_po1");
        String tanggal = request.getParameter("tanggal");
        String supplier = request.getParameter("supplier");
        String pegawai = request.getParameter("pegawai");
        pegawai = pegawai.substring((pegawai.indexOf("(")+1),pegawai.indexOf(")"));
        supplier = supplier.substring((supplier.indexOf("(")+1),supplier.indexOf(")"));
        
        String[] kodeparameter =  request.getParameterValues("kodebarang");
        String[] namabarang =  request.getParameterValues("namabarang");
        String[] jumlah =  request.getParameterValues("jumlah");
        int lengthDAta = kodeparameter.length;
        
        
        Session session = hibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(purchase_order.class);
        criteria.add(Restrictions.eq("no_po", no_po ));
        if (criteria.uniqueResult() != null) {        
            Transaction trx = session.beginTransaction();
            purchase_order po = (purchase_order) criteria.uniqueResult();
                        
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            try {
                po.setTanggal(new Timestamp(df.parse(tanggal).getTime()));
            } catch (ParseException ex) {
                Logger.getLogger(purchaseOrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
            po.setKode_supplier_inpo(new supplier(supplier));
            po.setId_pegawai_inpo(new pegawai(pegawai));
            session.save(po);
            if (!no_po.equalsIgnoreCase(no_po1)) {
                String sql = "update purchase_order set no_po=:kode where no_po=:kode1";
                session.createQuery(sql).setParameter("kode", no_po)
                        .setParameter("kode1", no_po1).executeUpdate();
            }
                        
            List<detail_purchase_order> ldpo = po.getPo_detail();
            for (detail_purchase_order dpo : ldpo) {
                session.delete(dpo);
            }
            
            int i = 0;
            for (i = 0; i<lengthDAta; i++) {
                if (kodeparameter[i].length()>0
                        &&namabarang[i].length()>0
                        &&jumlah[i].length()>0
                        ) {
                    String jmlBarang = jumlah[i].replace(".", "");
                    try {
                        Long jmlBarangl = Long.valueOf(jmlBarang);
                        if (jmlBarangl>0) {
                            detail_purchase_order dpo = new detail_purchase_order();
                            dpo.setNo_po(po);
                            dpo.setKode_barang(new barang(kodeparameter[i]));
                            dpo.setNama_barang(namabarang[i]);
                            dpo.setJumlah(jmlBarangl);
                            session.save(dpo);
                        }
                    } catch (Exception ex) {
                        System.out.println(" error add po "+ex.getMessage());
                    }
                }
            }
            trx.commit();
        }
        
        session.close();
        return returndata;
    }
}
