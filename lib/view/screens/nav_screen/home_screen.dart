import 'package:flutter/material.dart';
import 'package:multi_vendor_app/view/screens/nav_screen/widgets/banner_widget.dart';
import 'package:multi_vendor_app/view/screens/nav_screen/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        HeaderWidget(),
        Bannerwidget(),
      ],
    ));
  }
}
