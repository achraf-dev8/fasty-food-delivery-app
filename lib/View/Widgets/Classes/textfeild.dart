import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFeild extends StatelessWidget {

  final String label;
  final bool? obscureText;
  final TextEditingController textController;
  final String? Function(String?)? valid;
  final void Function()? onIconPressed;
  final int? maxLines;
  final bool? numiric;
  
  const TextFeild({
    super.key,
    required this.label,
    this.obscureText,
    required this.textController,
    required this.valid,
    this.onIconPressed,
    this.maxLines, this.numiric
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: TextFormField(
          maxLines: //maxLines,
          1,
          minLines: 1,
          keyboardType: numiric == true ? TextInputType.number : numiric == false ? TextInputType.phone : null,
          controller: textController,
          validator: valid ?? valid,
          obscureText: obscureText == true,
          cursorColor: AppColors.black,
          style: TextStyle(fontSize: 21),
          decoration: InputDecoration(
            errorMaxLines: 3,
            contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
            labelStyle: const TextStyle(color: AppColors.textFieldGrey, fontSize: 18),
            labelText: label,
            suffixIcon: obscureText != null ? IconButton(
              icon: Icon(
                size: 22,
                obscureText == true ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                color: AppColors.textFieldGrey,
              ),
              onPressed: onIconPressed,
            ) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.textFieldGrey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.organgeYellow),
            ),
          ),
        ),
      );
  }
}
