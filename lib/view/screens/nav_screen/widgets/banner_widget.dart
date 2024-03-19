import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bannerwidget extends StatefulWidget {
  const Bannerwidget({super.key});

  @override
  State<Bannerwidget> createState() => _BannerwidgetState();
}

class _BannerwidgetState extends State<Bannerwidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ignore: prefer_final_fields
  List _bannerImage = [];

  getBanner() {
    return _firestore
        .collection("banners")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          _bannerImage.add(doc["image"]);
        });
      }
    });
  }

  @override
  void initState() {
    getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: _bannerImage.length,
        itemBuilder: (BuildContext context, int index) {
       return   Image.network(_bannerImage[index]);
        },
      ),
    );
  }
}
