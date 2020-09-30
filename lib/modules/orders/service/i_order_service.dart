import 'package:pizza_delivery_api/modules/orders/view_objects/save_order_input_model.dart';

abstract class IOrderService {
  Future<void> saveOrder(SaveOrderInputModel orderInput);
}
