class ReadifyValidator {

  static String ? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return '$fieldName is required. ';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // regular expression
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 6) {
      return 'Password must be at Least 6 characters long.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at Least one number.';
    }
    if (!value.contains(RegExp(r'[!@#$%&*()<>?":{}|<>]'))) {
      return 'Password must contain at Least one Special Character.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final RegExp phoneRegExp = RegExp(r'^[6789]\d{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (must be 10 digits and start with 6-9)';
    }
    return null;
  }
}
