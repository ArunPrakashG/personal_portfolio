import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperianceTile extends StatelessWidget {
  const ExperianceTile({
    required this.companyName,
    required this.role,
    required this.date,
    required this.description,
    required this.index,
    required this.learnedItems,
    super.key,
  });

  final String companyName;
  final String role;
  final String date;
  final String description;
  final List<String> learnedItems;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      title: Text(
        companyName,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        role,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      shape: Border.all(color: Colors.transparent),
      collapsedShape: Border.all(color: Colors.transparent),
      trailing: Text(
        date,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      children: [
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('companyName', companyName));
    properties.add(StringProperty('role', role));
    properties.add(StringProperty('date', date));
    properties.add(StringProperty('description', description));
    properties.add(IntProperty('index', index));
    properties.add(IterableProperty<String>('learnedItems', learnedItems));
  }
}
