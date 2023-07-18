package dto;

public class BadWord {
    private int id;
    private String badWord;

    public BadWord() {
    }

    public BadWord(int id, String badWord) {
        this.id = id;
        this.badWord = badWord;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBadWord() {
        return badWord;
    }

    public void setBadWord(String badWord) {
        this.badWord = badWord;
    }
}
