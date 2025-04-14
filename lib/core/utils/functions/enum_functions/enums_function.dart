import 'package:flutter/material.dart';
import 'package:parking_controller/core/const/enums.dart';
import 'package:parking_controller/core/themes/colors/colors.dart';

OrderStatus getOrderStatus(num status) {
  switch (status) {
    case 0:
      return OrderStatus.pending;
    case 1:
      return OrderStatus.processing;
    case 2:
      return OrderStatus.shipped;
    case 3:
      return OrderStatus.delivered;
    case 4:
      return OrderStatus.canceled;
    default:
      return OrderStatus.pending;
  }
}

num getOrderStatusCode(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return 0;
    case OrderStatus.processing:
      return 1;
    case OrderStatus.shipped:
      return 2;
    case OrderStatus.delivered:
      return 3;
    case OrderStatus.canceled:
      return 4;
  }
}

String getOrderStatusName(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return "قيد المراجعة";
    case OrderStatus.processing:
      return "قيد التنفيذ";
    case OrderStatus.shipped:
      return " تم الشحن";
    case OrderStatus.delivered:
      return "تم التوصيل";
    case OrderStatus.canceled:
      return "تم الالغاء";
  }
}

Color getOrderStatusColor(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return LightColors.orangeColor;
    case OrderStatus.processing:
      return LightColors.primaryColor;
    case OrderStatus.shipped:
      return LightColors.primaryColor;
    case OrderStatus.delivered:
      return Colors.lightGreen;
    case OrderStatus.canceled:
      return LightColors.redColor;
  }
}
