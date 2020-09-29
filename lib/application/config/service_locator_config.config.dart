// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../database/db_connection.dart';
import '../database/i_db_connection.dart';
import '../../modules/users/data/i_user_repository.dart';
import '../../modules/users/service/i_user_service.dart';
import '../../modules/users/controller/login_user_controller.dart';
import 'pizza_delivery_config.dart';
import '../../modules/users/controller/register_user_controller.dart';
import '../../modules/users/data/user_repository.dart';
import '../../modules/users/service/user_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<IDBConnection>(
      () => DBConnection(get<PizzaDeliveryConfiguration>()));
  gh.lazySingleton<IUserRepository>(() => UserRepository(get<IDBConnection>()));
  gh.lazySingleton<IUserService>(() => UserService(get<IUserRepository>()));
  gh.factory<LoginUserController>(
      () => LoginUserController(get<IUserService>()));
  gh.factory<RegisterUserController>(
      () => RegisterUserController(get<IUserService>()));
  return get;
}
