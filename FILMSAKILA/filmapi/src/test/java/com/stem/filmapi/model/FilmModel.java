package com.stem.filmapi.model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FilmModel {
    
    private MyConnection myConnection = new MyConnection();

    public boolean deleteFilm(Film deletedFilm) throws SQLException {
      
        String query = "DELETE FROM FILM WHERE TITLE = ?";
        PreparedStatement statement = myConnection.connect().prepareStatement(query);

        statement.setString(1, deletedFilm.getTitle());

        int affectedrRows = statement.executeUpdate();

        statement.close();
        myConnection.disconnect();

        return affectedrRows > 0;
    }

    



}
