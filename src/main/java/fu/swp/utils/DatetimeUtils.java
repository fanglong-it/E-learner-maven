package fu.swp.utils;

import fu.swp.base.Base;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DatetimeUtils {
    public static Date toDate(String dateString, String format) {
        if (dateString == null) {
            return null;
        }
        try {
            DateFormat formatter = new SimpleDateFormat(format);
            return formatter.parse(dateString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static String toString(Date date, String format) {
        if (date == null) {
            return "";
        }
        try {
            DateFormat formatter = new SimpleDateFormat(format);
            return formatter.format(formatter);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static LocalDateTime toDateTime(String dateString, String format) {
        if (dateString == null) {
            return null;
        }
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
            return LocalDateTime.parse(dateString, formatter);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static String toString(LocalDateTime date, String format) {
        if (date == null) {
            return "";
        }
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
            return date.format(formatter);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static List<LocalDate> getWeeklyDays(boolean fromTomorrow) {
        List<LocalDate> days = new ArrayList<>();

        LocalDate start = LocalDate.now();

        DayOfWeek currentDayOfWeek = start.getDayOfWeek();

        if (fromTomorrow) {
            start = start.plusDays(1);
        } else {
            start = start.minusDays(currentDayOfWeek.getValue() - DayOfWeek.MONDAY.getValue());
        }

        for (int i = 0; i <= (DayOfWeek.SUNDAY.getValue() - start.getDayOfWeek().getValue()); i++) {
            days.add(start.plusDays(i));
        }

        return days;
    }

    public static List<LocalDate> getWeeklyDays() {
        return getWeeklyDays(false);
    }

}
