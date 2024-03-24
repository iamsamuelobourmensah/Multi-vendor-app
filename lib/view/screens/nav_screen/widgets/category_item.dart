import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_vendor_app/controller/category_controller.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key});

  final CategoryController _categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _categoryController.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 4,
                      crossAxisSpacing: 8),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.network(
                            _categoryController.categories[index].categoryImage,
                            width: 47,
                            height: 47,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            _categoryController.categories[index].categoryName,
                            style: GoogleFonts.quicksand(
                                fontSize: 14,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  })),
            )
          ],
        ));
  }
}
