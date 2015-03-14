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
@Table(name = "barang")
public class barang {
    @Id
    @Column(name = "kode_barang", unique = true, nullable = false, length = 20)
    private String kode_barang;
    
    @Column(name = "nama_barang", length = 200)
    private String nama_barang;
            
    @Column(name = "harga")
    private Long harga;
    
    @Column(name = "jumlah_stock")
    private Long jumlah_stock;

    public Long getHarga() {
        return harga;
    }

    public void setHarga(Long harga) {
        this.harga = harga;
    }


    public String getKode_barang() {
        return kode_barang;
    }

    public void setKode_barang(String kode_barang) {
        this.kode_barang = kode_barang;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public Long getJumlah_stock() {
        return jumlah_stock;
    }

    public void setJumlah_stock(Long jumlah_stock) {
        this.jumlah_stock = jumlah_stock;
    }
    
   
}
