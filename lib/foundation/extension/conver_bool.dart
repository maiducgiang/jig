extension SelectResultBool on bool {
  String color() {
    switch (this) {
      case true:
        return "Pass";
      case false:
        return "Fail";
    }
    return "";
  }
}
