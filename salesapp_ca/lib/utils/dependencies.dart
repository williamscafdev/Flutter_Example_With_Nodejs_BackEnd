import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/data/services/local/local_auth_api.dart';
import 'package:salesapp_ca/data/services/remote/authentication_api.dart';
import 'package:salesapp_ca/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_ca/domain/repositories/remote/authentication_repository.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';

List<RepositoryProvider> buildRepositories() {
  return [
    RepositoryProvider<LocalAuthRepository>(
      create: (_) => LocalAuthApi(),
    ),
    RepositoryProvider<AuthenticationRepository>(
      create: (_) => AuthenticationApi(),
    ),
    RepositoryProvider<AuthUseCase>(
      create: (context) => AuthUseCase(context.read(), context.read()),
    ),
  ];
}
