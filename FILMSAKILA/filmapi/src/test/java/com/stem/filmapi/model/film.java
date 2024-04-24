package com.stem.modelapi.model; 

public class Film {

    private int id;
    private String title;
    private String description;
    private int length;

    public Film() {

    }

    public Film(int id, String title, String description, int lenght) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.length = lenght;
    }

    public String getDescription() {
        return description;
    }

    public int getId() {
        return id;
    }

    public int getLength() {
        return length;
    }

    public String getTitle() {
        return title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "El id " + id + " titulo " + title + " la descripcion " + description + " y lenght " + length;
    }

}
