import 'package:flutter/material.dart';
const kPrimaryColor = Color(0xFF843667);
const kSecondaryColor = Color(0xFF022238);
const kThirdColor = Color(0xFFFFDCBC);
const kLightBackground = Color(0xFFE8F6FB);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;

class AppTheme {
  static const kBigTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const kHeadingOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const kSeeAllText = TextStyle(color: kPrimaryColor);

  static final kBodyText = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12,
  );

  static const kCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}


class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffC67C4E),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
