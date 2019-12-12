package com.cinema.dto;

import com.cinema.enums.Genere;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashMap;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author drakomi
 */
public class Film implements Serializable {
	private static final long serialVersionUID = 6116144376715379942L;
	
	private Integer id;
    private String nom;
    private String sinopsis;
    private String caratula; // Camí on es troba la foto
    private Genere genere; // F-ficció, A-Aventures, T-Terror, D-dibuixos
    private Integer edatRec = 0; // Edat recomanada.0 Per tots els publics
    
    private HashMap<Integer, Session> horari = new HashMap<>();
    private LocalDate dataEstreno;
    private Boolean estreno = false;
    
    public Film(Integer id, String nom, String sinopsis) {
        this.id = id;
        this.nom = nom;
        this.sinopsis = sinopsis;
    }

    public Film(Integer id, String nom, String sinopsis, String caratula, Genere genere, Integer edatRec, LocalDate dataEstreno) {
        this.id = id;
        this.nom = nom;
        this.sinopsis = sinopsis;
        this.caratula = caratula;
        this.genere = genere;
        this.edatRec = edatRec;
        this.dataEstreno = dataEstreno;
    }        

    public Boolean getEstreno() {
        return estreno;
    }

    public void setEstreno(Boolean estreno) {
        this.estreno = estreno;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSinopsis() {
        return sinopsis;
    }
    
    public Genere getGenere() {
        return genere;
    }

    public void setGenere(Genere genere) {
        this.genere = genere;
    }



    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public HashMap<Integer, Session> getHorari() {
        return horari;
    }

    public void setHorari(HashMap<Integer, Session> horari) {
        this.horari = horari;
    }

    public LocalDate getDataEstreno() {
        return dataEstreno;
    }

    public void setDataEstreno(LocalDate dataEstreno) {
        this.dataEstreno = dataEstreno;
    }
    
    public Integer getEdatRec() {
        return edatRec;
    }

    public void setEdatRec(Integer edatRec) {
        this.edatRec = edatRec;
    }
    
    public String getCaratula() {
        return caratula;
    }

    public void setCaratula(String caratula) {
        this.caratula = caratula;
    }    
}
