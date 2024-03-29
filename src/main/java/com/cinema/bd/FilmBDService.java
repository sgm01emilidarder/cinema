package com.cinema.bd;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.cinema.bd.BDConnectionMySQL;
import com.cinema.dto.Film;
import com.cinema.enums.Genere;

public class FilmBDService {
	

	public FilmBDService() {}

	// LListat de pel·lícules
	public List<Film> getListFims() {
        
		BDConnectionMySQL bd = new BDConnectionMySQL();
        List<Film> list = new ArrayList<>();
        try {
        	String query = "select * from film";            
            Connection connexio = bd.getConnection();
            Statement sentencia = connexio.createStatement();
            ResultSet resultat  = sentencia.executeQuery(query);
                  
            if (resultat!=null) {
	            while (resultat.next()) {
	                int id = resultat.getInt("flm_id");
	                String title = resultat.getString("flm_title");
					String synopsis = resultat.getString("flm_synopsis");
					String cover = resultat.getString("flm_cover");
					String genere = resultat.getString("flm_genre");
					int edatRec = resultat.getInt("flm_age_rating");
					Date release = resultat.getDate("flm_date_release");
					list.add(new Film( Integer.valueOf(id), title, synopsis, cover, Genere.valueOf(genere), Integer.valueOf(edatRec), release));
	            }
            }
            sentencia.close();
            connexio.close();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
        
        
    }
	
	// Llista filtrada per genere
	public List<Film> getListFims(Genere gen) {
		
		BDConnectionMySQL bd = new BDConnectionMySQL();
		List<Film> list = new ArrayList<>();
		try {
			String query = "select * from film where flm_genre=?";            
			Connection connexio = bd.getConnection();
			PreparedStatement sentencia= connexio.prepareStatement(query);
			sentencia.setString(1, gen.toString());
			ResultSet resultat  = sentencia.executeQuery(query);
			
			if (resultat!=null) {
				while (resultat.next()) {
					int id = resultat.getInt("flm_id");
					String title = resultat.getString("flm_title");                
					list.add(new Film( Integer.valueOf(id), title, ""));
				}
			}
			sentencia.close();
			connexio.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	// Llista filtrada per genere
	public List<Film> getListFimsInsegura(Genere gen) {
		
		BDConnectionMySQL bd = new BDConnectionMySQL();
		List<Film> list = new ArrayList<>();
		try {
			String query = "select * from film where flm_genre='"+ gen.toString() +"'";            
			Connection connexio = bd.getConnection();
			Statement sentencia = connexio.createStatement();
			ResultSet resultat  = sentencia.executeQuery(query);
			
			if (resultat!=null) {
				while (resultat.next()) {
					int id = resultat.getInt("id");
					String title = resultat.getString("title");                
					list.add(new Film( Integer.valueOf(id), title, ""));
				}
			}
			sentencia.close();
			connexio.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
}
