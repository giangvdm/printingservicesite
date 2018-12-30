package Utilities;

/**
 *
 * @author vumin
 */
public class Utils {
    public static String ellipsize(String str, int maxLength) {
        if (str == null || str.length() <= maxLength) {
            return str;
        }
        return str.substring(0, maxLength-3) + "...";
    }
}
