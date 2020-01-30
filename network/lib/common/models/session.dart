import 'package:equatable/equatable.dart';

class Session with EquatableMixin {
  static const TOKEN = 'token';
  final String token;

  Session(this.token);

  @override
  List<Object> get props => [token];

  Session.fromJson(Map<String, dynamic> json) : this.token = json[TOKEN];

  Map<String, dynamic> toJson() => {
        TOKEN: token,
      };
}
