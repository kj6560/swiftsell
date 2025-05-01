import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

showLoading({double? size, Color? color}) {
  return Center(
    child: SizedBox(
      height: size ?? 50,
      width: size ?? 50,
      child: Center(
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
          color: AppConstants.primaryColor,
        ),
      ),
    ),
  );
}
