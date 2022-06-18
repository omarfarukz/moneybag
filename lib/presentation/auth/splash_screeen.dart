import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_bag/application/auth/auth_provider.dart';
import 'package:money_bag/application/auth/auth_state.dart';
import 'package:money_bag/domain/app/user-profile.dart';
import 'package:money_bag/presentation/auth/login_page.dart';
import 'package:money_bag/presentation/home/home_page.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(authProvider.notifier).checkAuth();
      });
      return null;
    }, []); //by decalring the list we called use effect(init state) once and dosen't matter if the build function call multipple time.

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (previous != next && !next.loading) {
        if (next.failure != CleanFailure.none() ||
            next.profile == UserProfile.empty()) {
          if (next.failure != CleanFailure.none()) {
            Logger.e(next.failure);
          }

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        }
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'MoneyBag',
              style: TextStyle(color: Colors.deepPurple, fontSize: 40),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
