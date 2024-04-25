package com.stem.filmapi.controller; 

import java.sql.SQLException;
import com.stem.filmapi.model.*;

public class FilmController {
    
    private FilmModel MyFilmModel = new FilmModel();

    public boolean deletedFilm(Film deletedFilm) throws SQLException {
        return MyFilmModel.deleteFilm(deletedFilm);
    }
}
