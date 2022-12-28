import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  bool enabled;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function() onPressed;
  SearchField(
      {required Key? key,
      required this.controller,
      required this.onChanged,
      required this.enabled,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      style: const TextStyle(
          color: Colors.grey, fontFamily: "NexaLight", fontSize: 14),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 0.3),
              borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onPressed,
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
              color: Colors.grey.shade400, fontSize:14, fontFamily: "NexaLight"),
          errorStyle: TextStyle(
              color: Colors.red.shade100, fontSize: 14, fontFamily: "NexaLight"),
          contentPadding: const EdgeInsets.only(top: 0, bottom: 10, left: 10)),
      onChanged: onChanged,
    );
  }
}
