import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    required this.controller,
    super.key,
  });

  final PageController controller;

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
        color: const Color(0xFF222E50),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onLogoTapped,
            child: Text(
              '<Arun Prakash/>',
              style: GoogleFonts.firaCode(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
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
                children: views.map((e) {
                  return TextButton(
                    onPressed: () => _onPageButtonTapped(e),
                    child: Text(
                      e.name.toLowerCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onPageButtonTapped(AppView view) {
    controller.animateToPage(
      view.index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
            children: views.map((e) {
              return ListTile(
                title: Text(e.name),
                onTap: () {
                  _onPageButtonTapped(e);
                  Navigator.of(context).pop();
                },
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<PageController>('controller', controller));
  }

  void _onLogoTapped() {
    controller.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
