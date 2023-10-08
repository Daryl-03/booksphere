import 'package:booksphere/modules/ui_modules/auth_module/register/register_screen.dart';
import 'package:booksphere/modules/ui_modules/auth_module/widgets/welcome_screen_button.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutStatusBar(context);
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: Padding(
            padding: EdgeInsets.only(
              left: displayWidth * 0.05,
              right: displayWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/welcome.svg",
                  fit: BoxFit.fitHeight,
                  width: displayWidth * 0.8,
                  height: displayHeight * 0.35,
                ),
                SizedBox(
                  height: displayHeight * 0.01,
                ),
                Text(
                  "Welcome to BookSphere!",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: displayHeight * 0.03,
                ),
                Text(
                  "Discover and explore the world of books. Find your next great read.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: displayHeight * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: theme.colorScheme.onBackground,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
