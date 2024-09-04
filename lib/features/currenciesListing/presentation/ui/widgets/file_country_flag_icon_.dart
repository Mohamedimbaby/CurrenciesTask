import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryFlagFileIcon extends StatelessWidget {
  final Uint8List icon ;
  const CountryFlagFileIcon({required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.memory(icon,
      fit: BoxFit.contain,
      width: 50.r,
      height: 50.r,
      placeholderBuilder: (ctx)=> const CircularProgressIndicator() ,);
  }
}
