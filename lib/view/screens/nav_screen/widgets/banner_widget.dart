import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bannerwidget extends StatefulWidget {
  const Bannerwidget({super.key});

  @override
  State<Bannerwidget> createState() => _BannerwidgetState();
}

class _BannerwidgetState extends State<Bannerwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of,
    );
  }
}
