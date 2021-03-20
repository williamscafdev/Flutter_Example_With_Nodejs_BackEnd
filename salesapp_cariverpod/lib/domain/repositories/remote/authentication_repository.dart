import '../../../data/models/responses/requestToken.dart';

abstract class AuthenticationRepository {
  Future<RequestToken> validateWithLogin(String userName, String password);
}
