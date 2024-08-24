import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopContentView extends StatelessWidget {
  const DesktopContentView({
    required this.title,
    required this.content,
    required this.imageUrl,
    this.bottom,
    super.key,
    this.subTitle,
  });

  final String title;
  final String? subTitle;
  final String content;
  final Widget? bottom;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(
                content,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            ),
          if (bottom != null) ...[
            const SizedBox(height: 16),
            bottom!,
          ],
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subTitle', subTitle));
    properties.add(StringProperty('content', content));
    properties.add(StringProperty('imageUrl', imageUrl));
  }
}
