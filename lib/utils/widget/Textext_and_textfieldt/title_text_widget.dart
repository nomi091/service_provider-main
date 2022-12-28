import 'package:flutter/material.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.title, this.textAlign, this.maxLine})
      : super(key: key);
  final String title;
  final TextAlign? textAlign;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLine,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontFamily: Constant.montserratSemiBold,
            color: CustomTheme.color232F34,
          ),
    );
  }
}
class TitleText1 extends StatelessWidget {
  const TitleText1({Key? key, required this.title, this.textAlign, this.maxLine})
      : super(key: key);
  final String title;
  final TextAlign? textAlign;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLine,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontFamily: Constant.montserratSemiBold,
            color: CustomTheme.color232F34,
          ),
    );
  }
}
