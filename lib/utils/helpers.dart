int getIntColor(String colorCode) {
  String color = colorCode.replaceAll('#', '0xFF');
  return int.parse(color);
}
