import 'package:get_it/get_it.dart';
import 'package:pizza_delivery_api/application/routers/i_router_configure.dart';
import 'package:pizza_delivery_api/modules/users/controller/login_user_controller.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

import 'controller/register_user_controller.dart';

class UserRouters implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.route("/user").link(() => GetIt.I.get<RegisterUserController>());
    router.route("/login").link(() => GetIt.I.get<LoginUserController>());
  }
}
