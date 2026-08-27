import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/AppColors.dart';
import '../../../Core/Utils/AppImages.dart';

class ProductImages extends StatefulWidget {
  final List<String> images;

  const ProductImages({super.key, required this.images});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  bool isLiked = true;

  final PageController productImageController = PageController();

  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ================= Product Images =================
        Container(
          height: 300.h,
          width: 398.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Appcolors.lightBlue50, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: PageView(
              controller: productImageController,

              onPageChanged: (index) {
                setState(() {
                  currentImage = index;
                });
              },

              children:
                  widget.images.map((image) {
                    return Image.network(
                      image,
                      width: double.infinity,
                      height: 300.h,
                      fit: BoxFit.cover,

                      // لو الصورة لسه بتتحمل
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return const Center(child: CircularProgressIndicator());
                      },

                      // لو حصل Error في تحميل الصورة
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    );
                  }).toList(),
            ),
          ),
        ),

        // ================= Dots =================
        if (widget.images.isNotEmpty)
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentImage == index
                            ? Appcolors.DarkBlue
                            : Appcolors.GrayColor,
                  ),
                );
              }),
            ),
          ),

        // ================= Like / Unlike =================
        Positioned(
          top: 8.h,
          right: 8.w,
          child: InkWell(
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            child: Image(
              image: AssetImage(isLiked ? Appimages.Unlike : Appimages.like),
              fit: BoxFit.fill,
              width: 49.w,
              height: 49.h,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    productImageController.dispose();
    super.dispose();
  }
}
