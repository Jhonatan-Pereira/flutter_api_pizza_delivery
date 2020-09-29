import 'package:pizza_delivery_api/modules/view_models/register_user_input_model.dart';

abstract class IUserRepository {
  Future<void> saveUser(RegisterUserInputModel registerUserInputModel);
}
