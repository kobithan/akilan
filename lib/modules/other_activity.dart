class OtherActivity{
  final String activityName;
  final String urlImage;
  final String activityDescription;
  final int burntCalories;

  const OtherActivity({
    required this.activityName,
    required this.urlImage,
    required this.activityDescription,
    required this.burntCalories,
  });
  String get activityImg => urlImage;
  String get actName => activityName;
}