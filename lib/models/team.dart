import 'package:tmz_hub/models/membert.dart';
import 'package:tmz_hub/models/sport_type.dart';

class Team {
  final String id;
  final String teamName;
  final String town;
  final SportType sportType;
  final List<TeamMember> teamMembers;

  const Team(
      {required this.id,
      required this.teamName,
      required this.town,
      required this.sportType,
      required this.teamMembers});
}
