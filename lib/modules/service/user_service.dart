import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/modules/data/i_user_repository.dart';
import 'package:pizza_delivery_api/modules/service/i_user_service.dart';
import 'package:pizza_delivery_api/modules/view_models/register_user_input_model.dart';

import './i_user_service.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  final IUserRepository _repository;

  UserService(this._repository);

  @override
  Future<void> registerUser(RegisterUserInputModel registerInput) async {
    await _repository.saveUser(registerInput);
  }
}
