import 'package:tmz_hub/models/role.dart';
import 'package:tmz_hub/models/team.dart';

class TeamMember {
  const TeamMember(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.email,
      required this.phone,
      required this.password,
      required this.teams});

  final String id;
  final String firstName;
  final String lastName;
  final Role role;
  final String email;
  final String phone;
  final String password;
  final List<Team> teams;
}
