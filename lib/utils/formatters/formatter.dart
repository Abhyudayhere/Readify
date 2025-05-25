import 'package:intl/intl.dart';

class ReadifyFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_in', symbol: '₹').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return "+91 ${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}";
    } else if (phoneNumber.length == 13 && phoneNumber.startsWith("+91")) {
      return "${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 8)} ${phoneNumber.substring(8)}";
    }
    return phoneNumber;
  }
}
