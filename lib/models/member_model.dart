class MemberModel {
  final String id;
  final String stageName;
  final String koreanName;
  final String birthName;
  final String? englishName;
  final List<String> positions;
  final String birthday; // e.g. "September 7, 2006"
  final DateTime birthDate;
  final String zodiacSign;
  final String height;
  final String bloodType;
  final String mbti;
  final String nationality;
  final String representativeEmoji;
  final String hakyuhaCharacter;
  final String photoPath;
  final List<String> nicknames;
  final List<String> facts;

  const MemberModel({
    required this.id,
    required this.stageName,
    required this.koreanName,
    required this.birthName,
    this.englishName,
    required this.positions,
    required this.birthday,
    required this.birthDate,
    required this.zodiacSign,
    required this.height,
    required this.bloodType,
    required this.mbti,
    required this.nationality,
    required this.representativeEmoji,
    required this.hakyuhaCharacter,
    required this.photoPath,
    required this.nicknames,
    required this.facts,
  });

  /// Calculates days remaining until the next birthday from a given reference date
  int daysUntilNextBirthday([DateTime? fromDate]) {
    final now = fromDate ?? DateTime.now();
    DateTime nextBday = DateTime(now.year, birthDate.month, birthDate.day);
    if (nextBday.isBefore(DateTime(now.year, now.month, now.day))) {
      nextBday = DateTime(now.year + 1, birthDate.month, birthDate.day);
    }
    return nextBday.difference(DateTime(now.year, now.month, now.day)).inDays;
  }
}
