import 'package:injectable/injectable.dart';
import 'package:mysql1/src/single_connection.dart';
import 'package:pizza_delivery_api/application/config/pizza_delivery_config.dart';
import 'package:pizza_delivery_api/application/database/i_db_connection.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

@Injectable(as: IDBConnection)
class DBConnection implements IDBConnection {
  final PizzaDeliveryConfiguration _configuration;

  DBConnection(
    this._configuration,
  );

  @override
  Future<MySqlConnection> openConnection() {
    final db = _configuration.database;
    return MySqlConnection.connect(
      ConnectionSettings(
        host: db.host,
        port: db.port,
        user: db.user,
        password: db.password,
        db: db.databaseName,
      ),
    );
  }
}
