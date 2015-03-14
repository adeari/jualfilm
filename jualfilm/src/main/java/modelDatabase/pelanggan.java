/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDatabase;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;
/**
 *
 * @author ade
 */
@Entity
@Table(name = "pelanggan")
public class pelanggan {
    @Id
    @Column(name = "kode_pelanggan", unique = true, nullable = false, length = 20)
    private String kode_pelanggan;
    
    @Column(name = "nama_pelanggan", length = 200)
    private String nama_pelanggan;
        
    @Column(name = "alamat_pelanggan", length = 200)
    private String alamat_pelanggan;
    
    @Column(name = "telepon_pelanggan", length = 200)
    private String telepon_pelanggan;
    
    @Column(name = "email_pelanggan", length = 200)
    private String email_pelanggan;

    public String getAlamat_pelanggan() {
        return alamat_pelanggan;
    }

    public void setAlamat_pelanggan(String alamat_pelanggan) {
        this.alamat_pelanggan = alamat_pelanggan;
    }

    public String getEmail_pelanggan() {
        return email_pelanggan;
    }

    public void setEmail_pelanggan(String email_pelanggan) {
        this.email_pelanggan = email_pelanggan;
    }

    public String getKode_pelanggan() {
        return kode_pelanggan;
    }

    public void setKode_pelanggan(String kode_pelanggan) {
        this.kode_pelanggan = kode_pelanggan;
    }

    public String getNama_pelanggan() {
        return nama_pelanggan;
    }

    public void setNama_pelanggan(String nama_pelanggan) {
        this.nama_pelanggan = nama_pelanggan;
    }

    public String getTelepon_pelanggan() {
        return telepon_pelanggan;
    }

    public void setTelepon_pelanggan(String telepon_pelanggan) {
        this.telepon_pelanggan = telepon_pelanggan;
    }
    
    
}
