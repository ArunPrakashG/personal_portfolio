import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '<Arun Prakash/>',
            style: GoogleFonts.firaCode(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Builder(
            builder: (context) {
              final shouldDisplayMoreButton =
                  MediaQuery.sizeOf(context).width < 800;

              if (shouldDisplayMoreButton) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  iconSize: 26,
                  padding: EdgeInsets.zero,
                  onPressed: () => _onMoreTapped(context),
                );
              }

              return Row(
                children: [
                  TextButton(
                    onPressed: () => _onHomeTapped(context),
                    child: Text(
                      'Home'.toLowerCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return TextButton(
                        onPressed: () => _onCapabilitiesTapped(context),
                        child: Text(
                          'Capabilities'.toLowerCase(),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      return TextButton(
                        onPressed: () => _onExperienceTapped(context),
                        child: Text(
                          'Experience'.toLowerCase(),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () => _onProjectsTapped(context),
                    child: Text(
                      'Projects'.toLowerCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _onContactTapped(context),
                    child: Text(
                      'Contact'.toLowerCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _onCapabilitiesTapped(
    BuildContext context, [
    bool withAnimation = true,
  ]) {
    context.pushReplacement(CAPABILITIES_ROUTE);

    // if (!withAnimation) {
    //   Navigator.pushReplacement(
    //     context,
    //     nextRoute,
    //   );
    //   return;
    // }

    // if (!withAnimation) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const CapabilitiesPage(),
    //     ),
    //   );
    //   return;
    // }

    // Navigator.pushReplacement(
    //   context,
    //   CircularClipRoute(
    //     expandFrom: context,
    //     builder: (context) => const CapabilitiesPage(),
    //     transitionDuration: const Duration(milliseconds: 900),
    //   ),
    // );
  }

  void _onHomeTapped(BuildContext context, [bool withAnimation = true]) {
    context.pushReplacement(HOME_ROUTE);

    // const currentRoute = '/home';

    // final nextRoute = MaterialPageRoute(
    //   builder: (context) => const HomePage(),
    //   settings: const RouteSettings(name: currentRoute),
    // );

    // final currentRouteName = ModalRoute.of(context)?.settings.name;

    // if (currentRouteName == currentRoute) {
    //   return;
    // }

    // if (!withAnimation) {
    //   Navigator.pushReplacement(
    //     context,
    //     nextRoute,
    //   );
    //   return;
    // }

    // if (!withAnimation) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const HomePage(),
    //     ),
    //   );
    //   return;
    // }

    // Navigator.pushReplacement(
    //   context,
    //   CircularClipRoute(
    //     expandFrom: context,
    //     builder: (context) => const HomePage(),
    //     transitionDuration: const Duration(milliseconds: 900),
    //   ),
    // );
  }

  void _onExperienceTapped(BuildContext context, [bool withAnimation = true]) {
    context.pushReplacement(EXPERIENCE_ROUTE);

    // const currentRoute = '/experience';

    // final nextRoute = MaterialPageRoute(
    //   builder: (context) => const ExperiencePage(),
    //   settings: const RouteSettings(name: currentRoute),
    // );

    // final currentRouteName = ModalRoute.of(context)?.settings.name;

    // if (currentRouteName == currentRoute) {
    //   return;
    // }

    // if (!withAnimation) {
    //   Navigator.pushReplacement(
    //     context,
    //     nextRoute,
    //   );
    //   return;
    // }

    // Navigator.pushReplacement(
    //   context,
    //   CircularClipRoute(
    //     expandFrom: context,
    //     builder: (context) => const ExperiencePage(),
    //     transitionDuration: const Duration(milliseconds: 900),
    //   ),
    // );
  }

  Future<void> _onMoreTapped(BuildContext context) async {
    // show a dialog box with the navigation options over the app bar

    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          insetPadding: const EdgeInsets.all(16),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Home'),
                onTap: () => _onHomeTapped(context),
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ),
              ListTile(
                title: const Text('Capabilities'),
                onTap: () => _onCapabilitiesTapped(context),
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ),
              ListTile(
                title: const Text('Experience'),
                onTap: () => _onExperienceTapped(context),
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ),
              ListTile(
                title: const Text('Projects'),
                onTap: () {},
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {},
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onProjectsTapped(BuildContext context) {}

  void _onContactTapped(BuildContext context) {}
}
