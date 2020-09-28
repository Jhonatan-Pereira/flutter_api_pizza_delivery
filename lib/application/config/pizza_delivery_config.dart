import 'package:pizza_delivery_api/application/config/db_connection_config.dart';

import '../../pizza_delivery_api.dart';

class PizzaDeliveryConfiguration extends Configuration {
  PizzaDeliveryConfiguration(String fileName) : super.fromFile(File(fileName));
  DBConnectionConfiguration database;
}
