class ValidatorRules {
  static String? email(String? text) {
    if (text == null || text.isEmpty) {
      return "Please write something";
    } else if (!text.contains("@")) {
      return "Please write a valid email";
    } else {
      return null;
    }
  }

  static String? password(String? text) {
    if (text == null || text.isEmpty) {
      return "Please write something";
    } else if (text.length < 8) {
      return "Password should be at least 8 digit";
    } else {
      return null;
    }
  }

  static String? name(String? text) {
    if (text == null || text.isEmpty) {
      return "Please write something";
    } else {
      return null;
    }
  }
}
