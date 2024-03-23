import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_vendor_app/controller/banner_controller.dart';

class Bannerwidget extends StatefulWidget {
  const Bannerwidget({super.key});

  @override
  State<Bannerwidget> createState() => _BannerwidgetState();
}

final BannerController _bannerController = BannerController();

class _BannerwidgetState extends State<Bannerwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: const Color(0xFFF7F7F7), boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2))
        ]),
        child: StreamBuilder<List<String>>(
          stream: _bannerController.getBannerUrl(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Icon(Icons.error);
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text(
                "No Banner Available",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              );
            } else {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: snapshot.data![index],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      );
                    }),
                  ),
                  _buildPageIndicator(snapshot.data!.length)
                ],
              );
            }
          }),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(pageCount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pageCount, (index) {
            return Container(
              height: 8,
              width: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
            );
          })),
    );
  }
}
