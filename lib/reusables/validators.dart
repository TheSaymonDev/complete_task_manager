import 'package:flutter/cupertino.dart';

String? passwordValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter a password.';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long.';
  }
  return null;
}

String? nameValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your name.';
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your email address.';
  }
  if (!RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
      .hasMatch(value)) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? phoneValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your phone number.';
  }
  // Define a regular expression for a valid phone number format
  RegExp phoneRegExp = RegExp(
    r'^\+?[0-9]{8,}$',
  );
  if (!phoneRegExp.hasMatch(value)) {
    return 'Please enter a valid phone number.';
  }
  return null;
}

String? pinValidator(value) {
  final RegExp pinRegex =
      RegExp(r'^[0-9]{6}$'); // 6-digit PIN (adjust regex if needed)
  if (value!.isEmpty) {
    return 'Please enter your PIN.';
  }
  if (!pinRegex.hasMatch(value)) {
    return 'Please enter a valid 6-digit PIN.'; // Adjust error message if needed
  }
  return null;
}

String? confirmPasswordValidator(
    String? value, TextEditingController newPasswordController) {
  if (value!.isEmpty) {
    return 'Please confirm your password.';
  }
  if (value != newPasswordController.text) {
    return 'Passwords do not match.';
  }
  return null;
}

String? desValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter description.';
  }
  if (value!.length == 10) {
    return 'Please at least write 10 char';
  }
  return null;
}
