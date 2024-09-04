import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryFlagNetworkIcon extends StatelessWidget {
  final String icon ;
  const CountryFlagNetworkIcon({required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.network("https://flagcdn.com/$icon",
      fit: BoxFit.contain,
      width: 50.r,
      height: 50.r,
      placeholderBuilder: (ctx)=> const CircularProgressIndicator() ,);
  }
}
