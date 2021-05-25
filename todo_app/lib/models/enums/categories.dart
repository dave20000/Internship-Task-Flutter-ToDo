enum Categories {
  Work,
  Fun,
  Sport,
  Study,
  Family,
  Birth,
}

extension CategoryExtension on Categories {
  String categoryValue() {
    String val;
    switch (this) {
      case Categories.Work:
        val = "Work";
        break;
      case Categories.Fun:
        val = "Fun";
        break;
      case Categories.Sport:
        val = "Sport";
        break;
      case Categories.Study:
        val = "Study";
        break;
      case Categories.Family:
        val = "Family";
        break;
      case Categories.Birth:
        val = "Birth";
        break;
    }
    return val;
  }
}
