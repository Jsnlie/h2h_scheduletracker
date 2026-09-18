class EventModel {
  final String id;
  final String title;
  final String dateText;
  final String month;
  final String day;
  final DateTime exactDate;
  final String location;
  final String category; // 'Music Show', 'Fansign', 'Broadcast', 'Festival'

  const EventModel({
    required this.id,
    required this.title,
    required this.dateText,
    required this.month,
    required this.day,
    required this.exactDate,
    required this.location,
    required this.category,
  });

  bool isSameDay(DateTime other) {
    return exactDate.year == other.year &&
        exactDate.month == other.month &&
        exactDate.day == other.day;
  }
}
