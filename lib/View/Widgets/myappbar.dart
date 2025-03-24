import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionWidget;
  final Color? bgColor;
  final bool isNeedLeading;
  final Widget? leadingWidget;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actionWidget,
    this.bgColor = const Color(0xffFFFFFF),
    this.isNeedLeading = true,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "Montserrat Medium",
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: bgColor,
      leading: isNeedLeading
          ? leadingWidget
          // Padding(
          //   padding: const EdgeInsets.only(left: 8,right: 10),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.white,
          //       shape: CircleBorder(
          //         side: BorderSide(color: Util().borderColor, width: 1.2),
          //       ),
          //       elevation: 0,
          //       padding: EdgeInsets.zero,
          //     ),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     child:
          //     //  localeModel.isEnglish?
          //     currentLocale.languageCode == 'ar'?
          //      SvgPicture.asset("assets/svg/arrowright.svg"):
          //      SvgPicture.asset("assets/svg/arrowback.svg")

          //     //  SvgPicture.asset("assets/svg/arrowright.svg")
          //   ),
          // )
          : Container(),
      actions: actionWidget!,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
