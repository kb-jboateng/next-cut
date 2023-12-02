import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './verify-code.dart';
import 'package:next_cut/utils/theme.dart';
import 'package:next_cut/components/input.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumber = TextEditingController();
  bool busy = false;

  get phoneNumber {
    return _phoneNumber.text;
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() {
      busy = true;
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+1 $phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        setState(() {
          busy = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        print('in code sent');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp(
              phoneNumber: '+1 $phoneNumber',
              resendToken: resendToken,
              verificationId: verificationId,
            )
          ),
        );
        setState(() {
          busy = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (value.isNotEmpty && value.length != 10) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'nextCut',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: green,
                  fontFamily: 'RockSalt',
                  fontSize: 32
                ),
              ),
              const SizedBox(height: 54),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child:  customFormField('Phone number', _phoneNumber, validator: validatePhoneNumber),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: busy ? 48 : double.infinity,
                    height: 48,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: busy ? BorderRadius.circular(24) : BorderRadius.circular(8)
                        )
                      ),
                      onPressed: !busy ? () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      } : null,
                      child: busy
                          ? Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(.5),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                          : Text('Login')
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}