import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_cut/utils/theme.dart';

class BaseInput extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final Function(String) onValueChanged;

  const BaseInput({
    Key? key,
    required this.label,
    required this.onValueChanged,
    this.inputType = TextInputType.text
  }) : super(key: key);

  @override
  State<BaseInput> createState() => _BaseInputState();
}


class _BaseInputState extends State<BaseInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomTextInput extends BaseInput {
  const CustomTextInput({
    Key? key,
    required String label,
    TextInputType? inputType,
    required Function(String) onValueChanged,
  }) : super(
    key: key,
    label: label,
    onValueChanged: onValueChanged,
    inputType: inputType ?? TextInputType.text
  );

 @override
  createState() => _CustomTextInputState();

}

class _CustomTextInputState extends _BaseInputState {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: TextFormField(
        keyboardType: widget.inputType,
        onChanged: widget.onValueChanged,
        cursorColor: Colors.white,
        cursorWidth: 1,
        style: TextStyle(
          color: Colors.white
        ),
        decoration:InputDecoration(
          labelText: widget.label
        ),
      )
    );
  }
}

class CustomNumberInput extends BaseInput {
  const CustomNumberInput({
    Key? key,
    required String label,
    TextInputType? inputType,
    required Function(String) onValueChanged,
  }) : super(
    key: key,
    label: label,
    onValueChanged: onValueChanged,
    inputType: inputType ?? TextInputType.number
  );

 @override
  createState() => _CustomNumberInput();

}

class _CustomNumberInput extends _BaseInputState {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: TextFormField(
        onSaved: (input) => {
          
        },
        keyboardType: widget.inputType,
        onChanged: widget.onValueChanged,
        decoration:  InputDecoration(
          labelText: widget.label
        ),
      )
    );
  }
}


SizedBox customTextInput(String label, TextEditingController controller, String? errMessage, {bool disabled = false, TextInputType inputType = TextInputType.text, bool required = true}) {
  return SizedBox(
    width: double.infinity,
    child: TextFormField(
      enabled: disabled,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label
      ),
      minLines: 1,
      validator: (value) {
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