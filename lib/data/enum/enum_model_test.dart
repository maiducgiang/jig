class ModelTest {
  static String SMT_FW_VOICE_4_TOUCH =
      "Công tắc hình vuông 4 nút có voice ver 1";
  static String SMT_FW_VOICE_1_TOUCH =
      "Công tắc hình vuông 1 nút có voice ver 1";
  static String SMT_FW_NO_VOICE_4_TOUCH =
      "Công tắc hình vuông 4 nút không voice ver 1";
  static String SMT_FW_NO_VOICE_1_TOUCH =
      "Công tắc hình vuông 1 nút không voice ver 1";
  static String SMT_FW_VOICE_4_TOUCH_SQUARE =
      "Công tắc hình vuông 4 nút có voice ver 2";
  static String SMT_FW_VOICE_1_TOUCH_SQUARE =
      "Công tắc hình vuông 1 nút có voice ver 2";
  static String SMT_FW_NO_VOICE_4_TOUCH_SQUARE =
      "Công tắc hình vuông 4 nút không voice ver 2";
  static String SMT_FW_NO_VOICE_1_TOUCH_SQUARE =
      "Công tắc hình vuông 1 nút không voice ver 2";
  static String SMT_FW_VOICE_4_TOUCH_RECTANGLE =
      "Công tắc hình CN 4 nút có voice ver 2";
  static String SMT_FW_VOICE_1_TOUCH_RECTANGLE =
      "Công tắc hình CN 1 nút có voice ver 2";
  static String SMT_FW_NO_VOICE_4_TOUCH_RECTANGLE =
      "Công tắc hình CN 4 nút không voice ver 2";
  static String SMT_FW_NO_VOICE_1_TOUCH_RECTANGLE =
      "Công tắc hình CN 1 nút không voice ver 2";
  static List<String> getListModelTest() {
    return [
      "Công tắc hình vuông 4 nút có voice ver 1",
      "Công tắc hình vuông 1 nút có voice ver 1",
      "Công tắc hình vuông 4 nút không voice ver 1",
      "Công tắc hình vuông 1 nút không voice ver 1",
      "Công tắc hình vuông 4 nút có voice ver 2",
      "Công tắc hình vuông 1 nút có voice ver 2",
      "Công tắc hình vuông 4 nút không voice ver 2",
      "Công tắc hình vuông 1 nút không voice ver 2",
      "Công tắc hình CN 4 nút có voice ver 2",
      "Công tắc hình CN 1 nút có voice ver 2",
      "Công tắc hình CN 4 nút không voice ver 2",
      "Công tắc hình CN 1 nút không voice ver 2",
    ];
  }

  static int getIndexModel(String a) {
    switch (a) {
      case "Công tắc hình vuông 4 nút có voice ver 1":
        return 0;
      case "Công tắc hình vuông 1 nút có voice ver 1":
        return 1;
      case "Công tắc hình vuông 4 nút không voice ver 1":
        return 2;
      case "Công tắc hình vuông 1 nút không voice ver 1":
        return 3;
      case "Công tắc hình vuông 4 nút có voice ver 2":
        return 4;
      case "Công tắc hình vuông 1 nút có voice ver 2":
        return 5;
      case "Công tắc hình vuông 4 nút không voice ver 2":
        return 6;
      case "Công tắc hình vuông 1 nút không voice ver 2":
        return 7;
      case "Công tắc hình CN 4 nút có voice ver 2":
        return 8;
      case "Công tắc hình CN 1 nút có voice ver 2":
        return 9;
      case "Công tắc hình CN 4 nút không voice ver 2":
        return 10;
      case "Công tắc hình CN 1 nút không voice ver 2":
        return 11;
      default:
        return -1;
    }
  }
}
