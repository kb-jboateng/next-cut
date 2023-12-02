import 'package:flutter/material.dart';
import 'package:next_cut/components/footer.dart';
import 'package:next_cut/components/page.dart';
import 'package:next_cut/components/profile.dart';
import 'package:next_cut/utils/theme.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({
    super.key
  });

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

final GlobalKey<ProfileComponentState> profileKey = GlobalKey<ProfileComponentState>();

class _ProfileSetupState extends State<ProfileSetup> {

  bool busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasePage(
        content: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "Lets create a profile. Fill out the info below",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 48),
              ProfileComponent(key: profileKey)
            ],
          ),
        )
      ),
      bottomNavigationBar: Footer(
        content: customButton('Next', onNext, busy),
      ),
    );
  }

  void onNext() {
    setState(() { busy = true; });
    if (profileKey.currentState?.isProfileValid() ?? false) {
      print('busy to false');
    } else {
      setState(() { busy = false; });
    }
  }
}

FilledButton customButton(String text, dynamic onPressed, bool? busy) {
  return FilledButton(
    onPressed: busy != null && busy ? null : onPressed, 
    child:  busy != null && busy
      ? Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(.5),
        child: const CircularProgressIndicator(
          color: lighterGrey,
          strokeWidth: 2,
        ),
      )
      : Text(text)
  );
}