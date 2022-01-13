import 'package:portfolio/models/experience.dart';

class Company {
  final String logo;
  final String name;
  final String detail;
  final String duration;
  final String link;
  final List<Experience> experiences;

  Company({
    required this.logo,
    required this.name,
    required this.detail,
    required this.duration,
    required this.experiences,
    this.link = "",
  });
}
