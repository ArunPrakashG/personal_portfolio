import 'package:animate_do/animate_do.dart';
import 'package:bulleted_list/bulleted_list.dart';
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
    final breakPointHit = MediaQuery.sizeOf(context).width < 800;

    return FadeInLeft(
      delay: Duration(milliseconds: index * 700),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 4,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                companyName,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Builder(
                builder: (context) {
                  if (breakPointHit) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          role,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  }

                  return Text(
                    role,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
              trailing: !breakPointHit
                  ? Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : null,
            ),
            const Divider(),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            BulletedList(
              listItems: learnedItems,
            ),
          ],
        ),
      ),
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
