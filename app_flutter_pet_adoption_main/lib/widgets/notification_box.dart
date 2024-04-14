import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/theme/color.dart';
import 'package:badges/badges.dart' as custom_badges; // Importing the badges package with a prefix

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    Key? key,
    this.onTap,
    this.notifiedNumber = 0,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0
            ? custom_badges.Badge( // Using the Badge widget from the badges package with the prefix
          badgeContent: Text(
            notifiedNumber.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: SvgPicture.asset(
            "assets/icons/bell.svg",
            width: 25,
            height: 25,
          ),
        )
            : SvgPicture.asset("assets/icons/bell.svg"),
      ),
    );
  }
}
