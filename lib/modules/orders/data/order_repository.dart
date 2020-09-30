import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';
import 'package:pizza_delivery_api/application/database/i_db_connection.dart';
import 'package:pizza_delivery_api/application/exceptions/db_error_exception.dart';
import 'package:pizza_delivery_api/modules/orders/view_objects/save_order_input_model.dart';

import './i_order_repository.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepostory implements IOrderRepository {
  final IDBConnection _connection;

  OrderRepostory(this._connection);

  @override
  Future<void> saveOrder(SaveOrderInputModel orderInput) async {
    final conn = await _connection.openConnection();

    try {
      await conn.transaction((_) async {
        final result = await conn.query(''' 
        insert into pedido(
          id_usuario,
          forma_pagamento,
          endereco_entrega
        ) values (?,?,?)
      ''', [orderInput.userId, orderInput.paymentType, orderInput.address]);

        final orderId = result.insertId;

        await conn.queryMulti(
          '''
          insert into pedido_item(
            id_pedido,
            id_cardapio_grupo_item
          ) values(?,?)
        ''',
          orderInput.itemsId.map((item) => [orderId, item]),
        );
      });
    } on MySqlException catch (e) {
      print(e);
      throw DBErrorException();
    } finally {
      await conn?.close();
    }
  }
}
