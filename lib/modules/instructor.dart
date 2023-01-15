class Instructor{
  final String instructorName;
  final String urlImage;
  final String instructorInfo;
  final String tel;
  final String email;

  const Instructor({
    required this.instructorName,
    required this.urlImage,
    required this.instructorInfo,
    required this.email,
    required this.tel
  });
  String get instructorImg => urlImage;
  String get name => instructorName;
}