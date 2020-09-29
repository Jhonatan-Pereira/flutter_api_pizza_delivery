import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';
import 'package:pizza_delivery_api/application/database/i_db_connection.dart';
import 'package:pizza_delivery_api/application/exceptions/db_error_exception.dart';
import 'package:pizza_delivery_api/application/helpers/cripty-helpers.dart';
import 'package:pizza_delivery_api/modules/data/i_user_repository.dart';
import 'package:pizza_delivery_api/modules/view_models/register_user_input_model.dart';

import './i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDBConnection _connection;

  UserRepository(this._connection);

  @override
  Future<void> saveUser(RegisterUserInputModel inputModel) async {
    final conn = await _connection.openConnection();

    try {
      await conn.query('insert usuario(nome, email, senha) values (?, ?, ?)', [
        inputModel.name,
        inputModel.email,
        CriptyHelpers.generateSHA256Hash(inputModel.password),
      ]);
    } on MySqlConnection catch (e) {
      print(e);
      throw DBErrorException(message: 'Erro ao registrar usuário');
    } finally {
      await conn?.close();
    }
  }
}
