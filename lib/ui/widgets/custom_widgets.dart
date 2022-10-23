import 'package:flutter/material.dart';

import '../../theme.dart';

Widget customTextFormField({
  required TextEditingController controller,
  required String title,
  bool isPassword = false,
  bool obsecureText = false,
  VoidCallback? onpress,
  required TextInputType textInputType,
  required TextInputAction textInputAction,
}) {
  return Container(
    height: 56,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: styleColor(0.3),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: inputTextStyle.copyWith(color: const Color(0xff006778)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller,
                obscureText: obsecureText,
                keyboardType: textInputType,
                textInputAction: textInputAction,
                style: inputTextStyle,
                decoration: const InputDecoration.collapsed(
                  hintText: '',
                ),
              ),
            ],
          ),
        ),
        if (isPassword)
          IconButton(
            onPressed: onpress,
            color: const Color(0xff006778),
            icon: obsecureText
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off_rounded),
          ),
      ],
    ),
  );
}

InkWell customButton({required VoidCallback onpress, required String text}) {
  return InkWell(
    onTap: onpress,
    child: Ink(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: styleColor(1),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
