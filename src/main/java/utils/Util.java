/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dto.BadWord;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author DW
 */
public class Util {

    private static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[a-z]{2,}$";

    public static boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    private static final String PHONE_PATTERN = "^[0-9]{10}$";

    public static boolean isValidPhoneNumber(String phoneNumber) {
        Pattern pattern = Pattern.compile(PHONE_PATTERN);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

    public static String censorBadWords(String message, List<String> badWords) {
        String[] words = message.split("\\s+");
        StringBuilder censoredMessage = new StringBuilder();

        for (String word : words) {
            if (badWords.contains(word.toLowerCase())) {
                censoredMessage.append("***");
            } else {
                censoredMessage.append(word);
            }
            censoredMessage.append(" ");
        }

        return censoredMessage.toString().trim();
    }

    public static BadWord mapLineToBadWord(String line) {
        String[] parts = line.split(",");
        if (parts.length != 2) {
            return null; // Skip the line if it doesn't have the expected format
        }

        int id;
        String name;

        try {
            id = Integer.parseInt(parts[0].substring(parts[0].indexOf('=') + 1).trim());
            name = parts[1].substring(parts[1].indexOf('=') + 1).trim();
        } catch (NumberFormatException e) {
            return null; // Skip the line if the ID is not a valid integer
        }

        return new BadWord(id, name);
    }

}
