import 'package:ecommerce/Core/Utils/AppImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Utils/AppColors.dart';

class UserItem extends StatelessWidget {
  String Title;
  String Content;

  UserItem({super.key, required this.Title, required this.Content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            Title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: Appcolors.DarkBlue,
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 55.h,
            decoration: BoxDecoration(
              color: Appcolors.WhiteColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Appcolors.lightBlue50, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0.w.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Content,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Appcolors.DarkBlue,
                    ),
                  ),
                  Image(image: AssetImage(Appimages.Edit)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
