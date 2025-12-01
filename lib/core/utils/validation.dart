class Validation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    final trimmed = value.trim();
    if (trimmed.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    if (trimmed.length > 50) {
      return 'Name must be less than 50 characters';
    }
    final nameRegex = RegExp(r"^[A-Za-zÀ-ÖØ-öø-ÿ' \-]+$");
    if (!nameRegex.hasMatch(trimmed)) {
      return 'Name can only contain letters, spaces, hyphens and apostrophes';
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return 'Password confirmation is required';
    }

    // Ensure the original password is present and valid
    final pwdError = validatePassword(password);
    if (pwdError != null) {
      return pwdError;
    }

    if (password != confirm) {
      return 'Passwords do not match';
    }

    return null;
  }
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }
}