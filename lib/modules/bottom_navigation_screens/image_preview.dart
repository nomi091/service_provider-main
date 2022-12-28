import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';

class ImagePreviewHome extends StatefulWidget {
  final String image;
  final String imageUrl;
  const ImagePreviewHome({super.key, required this.image, required this.imageUrl});

  @override
  State<ImagePreviewHome> createState() => _ImagePreviewHomeState();
}

class _ImagePreviewHomeState extends State<ImagePreviewHome> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomTheme.appBarbackGround,
      appBar: AppBar(
        backgroundColor: CustomTheme.blackColor,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: width,
          color: CustomTheme.blackColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.image,
                height: Get.height * 0.3,
                width: width,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
