import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_cut/components/input.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({
    super.key,
  });

  @override
  State<ProfileComponent> createState() => ProfileComponentState();
}

class ProfileComponentState extends State<ProfileComponent> {

  final bio = TextEditingController();
  final name = TextEditingController();
  final businessName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customFormField('Name', name),
                const SizedBox(height: 24),
                customFormField('Business name', businessName),
                const SizedBox(height: 24),
                textArea('Bio', bio, 'Lil spill about you/business')

              ],
            ),
          )
        ],
      ),
    );
  }

  bool isProfileValid() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}