/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDatabase;

import java.sql.Timestamp;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
/**
 *
 * @author ade
 */
@Entity
@Table(name = "purchase_order")
public class purchase_order {
    @Id
    @Column(name = "no_po", unique = true, nullable = false, length = 20)
    private String no_po;
    
    @Column(name = "tanggal")
    private Timestamp tanggal;
    
    @OneToOne
    @JoinColumn(name="kode_supplier")
    private supplier kode_supplier_inpo;
        
    @OneToOne
    @JoinColumn(name="id_pegawai")
    private pegawai id_pegawai_inpo;
    
    @OneToMany(cascade={CascadeType.ALL})
    @JoinColumn(name="no_po")
    private List<detail_purchase_order> detail_po;

    public pegawai getId_pegawai_inpo() {
        return id_pegawai_inpo;
    }

    public void setId_pegawai_inpo(pegawai id_pegawai_inpo) {
        this.id_pegawai_inpo = id_pegawai_inpo;
    }

    public supplier getKode_supplier_inpo() {
        return kode_supplier_inpo;
    }

    public void setKode_supplier_inpo(supplier kode_supplier_inpo) {
        this.kode_supplier_inpo = kode_supplier_inpo;
    }


    public String getNo_po() {
        return no_po;
    }

    public void setNo_po(String no_po) {
        this.no_po = no_po;
    }

    public Timestamp getTanggal() {
        return tanggal;
    }

    public void setTanggal(Timestamp tanggal) {
        this.tanggal = tanggal;
    }

    public List<detail_purchase_order> getDetail_po() {
        return detail_po;
    }

    public void setDetail_po(List<detail_purchase_order> detail_po) {
        this.detail_po = detail_po;
    }
}
