import 'package:get_it/get_it.dart';
import 'package:pizza_delivery_api/application/routers/i_router_configure.dart';
import 'package:pizza_delivery_api/modules/orders/controller/register_order_controller.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

class OrdersRoutes implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.route('/order').link(() => GetIt.I.get<RegisterOrderController>());
  }
}