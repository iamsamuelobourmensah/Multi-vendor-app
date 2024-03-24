import 'package:flutter/material.dart';
import 'package:multi_vendor_app/view/screens/nav_screen/widgets/banner_widget.dart';
import 'package:multi_vendor_app/view/screens/nav_screen/widgets/category_item.dart';
import 'package:multi_vendor_app/view/screens/nav_screen/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
      children: [
        const HeaderWidget(),
      const Bannerwidget(),
      CategoryItem(),
      ],
    ));
  }
}
