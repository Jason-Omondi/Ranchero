import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
    );
  }
}
