import 'package:flutter/material.dart';
import 'package:service_provider/theme/Ktheme.dart';

// ignore: must_be_immutable
class RoundProfileImage extends StatelessWidget {
  RoundProfileImage(
      {Key? key, @required this.imageUrl, @required this.roundRadius})
      : super(key: key);
  String? imageUrl;
  double? roundRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(roundRadius!),
      child: Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            color: CustomTheme.greyColor.withOpacity(0.3),
            child: const Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, child, loadingProgress) {
          return Container(
              color: Colors.grey.shade300, child: const Icon(Icons.person));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class RoundProfileImageFromAsset extends StatelessWidget {
  RoundProfileImageFromAsset(
      {Key? key, @required this.image, required this.roundRadius})
      : super(key: key);
  String? image;
  double roundRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(roundRadius),
      child: Image.asset(
        image!,
      ),
    );
  }
}
