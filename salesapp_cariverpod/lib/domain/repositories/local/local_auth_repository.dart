import '../../../data/models/responses/requestToken.dart';

abstract class LocalAuthRepository {
  Future<void> setSession(RequestToken requestToken);
  Future<void> clearSession();
  Future<int> getSession();
}
