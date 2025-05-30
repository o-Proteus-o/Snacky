import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            width: 45,
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.network(
              'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 25),
        GestureDetector(
          onTap: onFacebookSign,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
