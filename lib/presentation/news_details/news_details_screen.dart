import 'package:coinz_app/constant/assets_manager.dart';
import 'package:coinz_app/constant/color_manger.dart';
import 'package:coinz_app/constant/fonts_manager.dart';
import 'package:coinz_app/constant/helper.dart';
import 'package:coinz_app/constant/icon_manager.dart';
import 'package:coinz_app/constant/string_manager.dart';
import 'package:coinz_app/constant/style_manager.dart';
import 'package:coinz_app/constant/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppString.shareString,
              style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            titelNewsDetails(),
            captionNewsDetails(),
            SizedBox(
              height: AppHeightSize.sh11,
            ),
            newsImage(),
            SizedBox(
              height: AppHeightSize.sh14,
            ),
            socialMediaButton(),
            SizedBox(
              height: AppHeightSize.sh4,
            ),
            newsBodyText()
          ],
        ),
      ),
    );
  }

  Widget titelNewsDetails() => Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m27),
        child: Text(
          AppString.titelNewsDetails,
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s20),
        ),
      );
  Widget captionNewsDetails() => Container(
        child: Text(
          dateFormat2(DateTime.now()),
          style: getSemiBoldStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s12),
        ),
      );
  Widget newsImage() => Container(
        width: double.infinity,
        height: AppHeightSize.sh200,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.rectangle), fit: BoxFit.cover),
        ),
      );

  Widget socialMediaButton() => Container(
        height: AppHeightSize.sh28,
        child: Row(
          children: [
            Container(
              width: AppWidthSize.sw123,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.facebookBlue),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppString.facebookShare,
                  style: getRegularStyle(color: ColorManager.white),
                ),
              ),
            ),
            SizedBox(
              width: AppWidthSize.sw10,
            ),
            Container(
              width: AppWidthSize.sw100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.twitterBlue),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppString.twitterShare,
                  style: getRegularStyle(color: ColorManager.white),
                ),
              ),
            ),
            SizedBox(
              width: AppWidthSize.sw10,
            ),
            Container(
              height: AppHeightSize.sh28,
              width: AppWidthSize.sw29,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.lightGreyBorder),
              child: Icon(
                IconManager.share,
                color: ColorManager.grey,
              ),
            )
          ],
        ),
      );
  Widget newsBodyText() => Container(
        child: Text(
          AppString.newsBodyText,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s14.sp),
        ),
      );
}
