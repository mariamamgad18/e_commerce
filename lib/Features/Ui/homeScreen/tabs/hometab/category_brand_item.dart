import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  final String? name;
  final String? image;

  const CategoryBrandItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: image ?? '',
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(backgroundImage: imageProvider, radius: 50.r);
            },

            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => Icon(Icons.error, color: Colors.red),
          ),
        ),

        SizedBox(height: 8.h),
        Expanded(
          flex: 4,
          child: Text(
            name ?? '',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Appcolors.primaryBlue,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
