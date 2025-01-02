import 'package:flutter/material.dart';
import 'package:masar_app/components/credit_card_componentt/card_string.dart';
import 'package:masar_app/components/credit_card_componentt/card_type.dart';

class PaymentCard {
  CardType? type;
  String? number;
  String? name;
  int? month;
  int? year;
  int? cvv;

  PaymentCard({this.type, this.number, this.name, this.month, this.year, this.cvv});

  @override
  String toString() {
    return '[Type: $type, Number: $number, Name: $name, Month: $month, Year: $year, CVV: $cvv]';
  }
}

class CardUtils {
  /// Validate Expiry Date Function
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    int day;
    int month;
    int year;

    if (value.contains('/')) {
      var split = value.split('/');
      if (split.length != 3) {
        return 'Expiry date is invalid. Use format DD/MM/YYYY';
      }

      // Parse day, month, and year
      day = int.parse(split[0].padLeft(2, '0'));
      month = int.parse(split[1].padLeft(2, '0'));
      year = int.parse(split[2]);
    } else {
      return 'Expiry date is invalid. Use format DD/MM/YYYY';
    }

    // Validate day
    if (day < 1 || day > 31) {
      return 'Expiry day is invalid';
    }

    // Validate month
    if (month < 1 || month > 12) {
      return 'Expiry month is invalid';
    }

    // Convert to four-digit year if necessary
    var fourDigitsYear = convertYearTo4Digits(year);
    if (fourDigitsYear < 1 || fourDigitsYear > 2099) {
      return 'Expiry year is invalid';
    }

    // Check if the date has expired
    if (!hasDateExpired(day, month, fourDigitsYear)) {
      return "Card has expired";
    }

    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  /// Check if the date has expired
  static bool hasDateExpired(int day, int month, int year) {
    final now = DateTime.now();
    final expiryDate = DateTime(year, month, day);
    return now.isAfter(expiryDate);
  }

  static bool isNotExpired(int year, int month) {
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    return hasYearPassed(year) ||
        (convertYearTo4Digits(year) == now.year && month < now.month);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    return fourDigitsYear < now.year;
  }

  /// Clean Card Number
  static String getCleanedNumber(String text) {
    return text.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Validate Card Number using Luhn Algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return Strings.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 16) {
      return Strings.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;

    for (int i = 0; i < length; i++) {
      int digit = int.parse(input[length - i - 1]);
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return Strings.numberIsInvalid;
  }

  /// Detect Card Type
  static CardType getCardTypeFrmNumber(String input) {
    if (input.startsWith(RegExp(r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      return CardType.Mastercard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      return CardType.Visa;
    } else if (input.length <= 8) {
      return CardType.Others;
    } else {
      return CardType.Invalid;
    }
  }

  /// Get Card Icon Widget
  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;

    switch (cardType) {
      case CardType.Mastercard:
        img = 'mastercard.png';
        break;
      case CardType.Visa:
        img = 'visa.png';
        break;
      case CardType.Others:
        icon = const Icon(Icons.credit_card, size: 24.0, color: Color(0xFFB8B5C3));
        break;
      default:
        icon = const Icon(Icons.warning, size: 24.0, color: Color(0xFFB8B5C3));
        break;
    }

    if (img.isNotEmpty) {
      return Image.asset('assets/images/$img', width: 24.0);
    } else {
      return icon;
    }
  }
}



/*class CardUtils {
  /// Validate CVV Function
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }
    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  /// Validate Expiry Date Function
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    int year;
    int month;
    if (value.contains('/')) {
      var split = value.split('/');
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      return 'Expiry date is invalid';
    }

    if (month < 1 || month > 12) {
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if (fourDigitsYear < 1 || fourDigitsYear > 2099) {
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }

    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  /// Check if date has expired
  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    return hasYearPassed(year) ||
        (convertYearTo4Digits(year) == now.year && month < now.month);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    return fourDigitsYear < now.year;
  }

  /// Clean Card Number
  static String getCleanedNumber(String text) {
    return text.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Validate Card Number using Luhn Algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return Strings.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 16) {
      return Strings.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;

    for (int i = 0; i < length; i++) {
      int digit = int.parse(input[length - i - 1]);
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return Strings.numberIsInvalid;
  }

  /// Detect Card Type
  static CardType getCardTypeFrmNumber(String input) {
    if (input.startsWith(RegExp(r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      return CardType.Mastercard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      return CardType.Visa;
    } else if (input.length <= 8) {
      return CardType.Others;
    } else {
      return CardType.Invalid;
    }
  }

  /// Get Card Icon Widget
  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;

    switch (cardType) {
      case CardType.Mastercard:
        img = 'mastercard.png';
        break;
      case CardType.Visa:
        img = 'visa.png';
        break;
      case CardType.Others:
        icon = const Icon(Icons.credit_card, size: 24.0, color: Color(0xFFB8B5C3));
        break;
      default:
        icon = const Icon(Icons.warning, size: 24.0, color: Color(0xFFB8B5C3));
        break;
    }

    if (img.isNotEmpty) {
      return Image.asset('assets/images/$img', width: 24.0);
    } else {
      return icon;
    }
  }
}
*/