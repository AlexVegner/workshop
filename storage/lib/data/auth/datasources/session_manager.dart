import 'package:storage/common/models/session.dart';

abstract class SessionManager {
  Future<Session> getSession();
  Stream<Session> getSessionStream();
  Future<void> setSession(Session session);
}
