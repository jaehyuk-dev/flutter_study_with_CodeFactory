import 'package:calendar_scheduler/const/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String lable;
  final bool expand;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final String? initalValue;
  const CustomTextField({
    super.key,
    required this.lable,
    this.expand = false,
    required this.onSaved,
    required this.validator,
    this.initalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        expand ? Expanded(child: renderTextFormField()) : renderTextFormField(),
      ],
    );
  }

  renderTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      cursorColor: Colors.grey,
      maxLines: expand ? null : 1,
      minLines: expand ? null : 1,
      expands: expand,
      onSaved: onSaved,
      validator: validator,
      initialValue: initalValue,
    );
  }
}
