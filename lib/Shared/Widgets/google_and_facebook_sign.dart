import 'package:flutter/material.dart';

class GoogleAndFacebookSign extends StatelessWidget {
  final void Function()? onGoogleSign;
  final void Function()? onFacebookSign;
  const GoogleAndFacebookSign({
    super.key,
    this.onGoogleSign,
    this.onFacebookSign,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onGoogleSign,
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/googlelogo.png",
              // fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 25),
        GestureDetector(
          onTap: onFacebookSign,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/images/Facebooklogo.png',
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
