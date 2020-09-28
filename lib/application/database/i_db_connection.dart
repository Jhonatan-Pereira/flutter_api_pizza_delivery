import 'package:mysql1/mysql1.dart';

abstract class IDBConnection {
  Future<MySqlConnection> openConnection();
}
