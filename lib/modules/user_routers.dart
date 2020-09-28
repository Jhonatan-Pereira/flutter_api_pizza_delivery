import 'package:pizza_delivery_api/application/routers/i_router_configure.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

class UserRouters implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "Jhonatan Frade"});
    });
  }
}
