import 'package:flutter/material.dart';
import 'package:next_cut/utils/theme.dart';

SizedBox customFormField(
  String label, 
  TextEditingController controller, 
  {String? errMessage, String? Function(String?)? validator, bool enabled = true, TextInputType inputType = TextInputType.text, bool required = true}) 
{
  return SizedBox(
    width: double.infinity,
    child: TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label
      ),
      validator: validator ?? (value) {
        if (required) {
          if (value == null || value.isEmpty) {
            return errMessage ?? '$label is required';
          }
        }
        return null;
      },
    ),
  );
}

SizedBox textArea(
  String label,
  TextEditingController controller,
  String placeholder,
  {String? errMessage, String? Function(String?)? validator, bool enabled = true, bool required = true}
) {
   return SizedBox(
    width: double.infinity,
    child: TextFormField(
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder
      ),
      maxLength: 150,
      maxLines: null,
      buildCounter: (BuildContext context,
          {required int currentLength,
          required bool isFocused,
          required int? maxLength}) {
        return Text(
          '$currentLength/$maxLength',
          style: TextStyle(
            fontSize: 12,
            color: isFocused ? Colors.white60 : lighterGrey,
          ),
        );
      },
      validator: validator ?? (value) {
        if (required) {
          if (value == null || value.isEmpty) {
            return errMessage ?? '$label is required';
          }
        }
        return null;
      },
    ),
  );
}