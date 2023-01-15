class Dietician{
  final String dieticianName;
  final String urlImage;
  final String dieticianInfo;
  final String tel;
  final String email;

  const Dietician({
    required this.dieticianName,
    required this.urlImage,
    required this.dieticianInfo,
    required this.email,
    required this.tel
  });
  String get dieticianImg => urlImage;
  String get name => dieticianName;
}