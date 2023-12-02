import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_cut/components/footer.dart';
import 'package:next_cut/components/text-button.dart';
import 'package:next_cut/screens/setup/profile-setup.dart';
import 'package:next_cut/utils/theme.dart';


class Otp extends StatefulWidget {
  final int? resendToken;
  final String phoneNumber;
  final String verificationId;

  const Otp({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
    this.resendToken
  });


  @override
  State<Otp> createState() => _OtpState();
}


class _OtpState extends State<Otp> {

  final code1 = TextEditingController();
  final code2 = TextEditingController();
  final code3 = TextEditingController();
  final code4 = TextEditingController();
  final code5 = TextEditingController();
  final code6 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  late Iterable<TextEditingController> _controllers;

  
  late Timer timer;
  bool busy = false;
  final int maxSeconds = 16;
  late int countdown = maxSeconds;
  late String newVerificationId;

  @override
  void initState() {
    startTimer();
    super.initState();
    _controllers = [code1, code2, code3, code4, code5, code6];
  }

  @override
  void dispose() {
    timer.cancel();
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (countdown == 1) {
        setState(() {
          t.cancel();
          countdown = maxSeconds;
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification code',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'We have sent the code verification to',
              style: TextStyle(
                fontSize: 14,
                color: lighterGrey
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('${widget.phoneNumber.substring(0, 6)}***-**${widget.phoneNumber.substring(widget.phoneNumber.length - 2)}'),
                const SizedBox(width: 8),
                CustomTextButton(
                  text: 'Wrong phone number?', 
                  onPressed: () {
                    Navigator.pop(context);
                  }
                )
              ]             
            ),
            const SizedBox(height: 48),
            Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textFieldOTP(code1),
                  _textFieldOTP(code2),
                  _textFieldOTP(code3),
                  _textFieldOTP(code4),
                  _textFieldOTP(code5),
                  _textFieldOTP(code6, isLast: true)
                ],
              ),
            ),
            const SizedBox(height: 16),
            countdown == maxSeconds ?
              CustomTextButton(
                text: 'Resend code', 
                onPressed: () {
                  resend();
                }
              ) :
            RichText(
              text: TextSpan(
                text: 'Resend code after: ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '${countdown}s',
                    style: TextStyle(
                      color: orange
                    )
                  )
                ]
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: Footer(
        content: FilledButton(
          onPressed: busy ? null : () { 
            if (_formKey.currentState!.validate()) {
              verify();
            }
          }, 
          child:  busy
              ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(.5),
                child: const CircularProgressIndicator(
                  color: lightGrey,
                  strokeWidth: 2,
                ),
              )
              : Text('Verify')
        )
      ),
    );
  }


  Widget _textFieldOTP(TextEditingController controller, {bool isLast = false}) {
    return SizedBox(
      width: 52,
      child: TextFormField(
        onChanged: (val) {
          if (val.length == 1) {
            if (isLast) {
              FocusScope.of(context).unfocus();
              verify();
            } else {
              FocusScope.of(context).nextFocus();
            }
          }
        },
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: '0',
          hintStyle: TextStyle(
            color: lightGrey,
            fontWeight: FontWeight.w300 
          ),
          contentPadding: EdgeInsets.all(8),
          errorStyle: TextStyle(
            height: 0
          )
        ),
        style: TextStyle(
          fontSize: 24,
        ),
        cursorWidth: 2,
        cursorHeight: 24,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  void verify() async {
    setState(() { busy = true; });
    try {
      final code = _controllers.map((controller) => controller.text).join('');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: code);
      await auth.signInWithCredential(credential);
      toSetup();
      print('verified');
      setState(() { busy = false; });
    } catch (e) {
      for (final controller in _controllers) {
        controller.clear();
      }
      print(e);
      setState(() { busy = false; });
    }
  }

  void toSetup() {
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context) => ProfileSetup(),
      ), 
      (route) => false
    );
  }

  void resend() async {
    setState(() { busy = true; });
    startTimer();
    await auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {}, 
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        print(widget.phoneNumber);
        setState(() { busy = false; });
        _showErrorDialog(e.message ?? 'Failed to verify phone number');
      }, 
      codeSent: (String verificatonId, int? resendToken) {
        newVerificationId = verificatonId;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Code resent',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            backgroundColor: green,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16),
          ),
        );
        setState(() { busy = false; });
      }, 
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> _showErrorDialog(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error occurred'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'), 
              child: const Text('OK')
            )
          ],
        );
      }
    );
  }
}
