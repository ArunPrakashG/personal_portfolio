import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_page.dart';
import 'providers/splash_navigation_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashNavigationProvider, (prev, current) {
      current.whenData((value) {
        if (!value) {
          return;
        }

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      });
    });

    return Material(
      child: ref.watch(splashNavigationProvider).maybeWhen(
        orElse: () {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 12),
                Text(
                  '<Arun Prakash/>',
                  style: GoogleFonts.firaCode(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
