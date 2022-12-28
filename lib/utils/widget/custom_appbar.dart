import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Key? key;
  final Widget actions;
  final Widget navBar;
  final String title;
  final Function()? onBackPressed;

  const CustomAppBar({
    this.actions = const SizedBox(width: 15),
    required this.navBar,
    required this.title,
    required this.onBackPressed,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.12,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                onBackPressed != null
                    ? InkWell(
                        onTap: onBackPressed,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 15,
                        ),
                      )
                    : const SizedBox(width: 15),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'NexaBold',
                      fontSize: 26),
                ),
                const Spacer(),
                actions
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(padding: const EdgeInsets.all(30), child: navBar),
          ),
        ],
      ),
    );
  }
}
