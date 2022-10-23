class CreatedModel {
  final String date;
  final int timezoneType;
  final String timezone;
  CreatedModel({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory CreatedModel.fromMap(Map<String, dynamic> map) {
    return CreatedModel(
      date: map['date'],
      timezoneType: map['timezone_type'],
      timezone: map['timezone'],
    );
  }
}
