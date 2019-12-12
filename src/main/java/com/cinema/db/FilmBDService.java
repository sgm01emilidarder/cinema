package com.cinema.bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cinema.bd.BDConnectionMySQL;
import com.cinema.dto.Film;
import com.cinema.dto.Genere;

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
