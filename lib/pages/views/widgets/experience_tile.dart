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
    final isCurrent = index == 1;

    return FadeInLeft(
      delay: Duration(milliseconds: index * 700),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 4,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF212738),
          borderRadius: BorderRadius.circular(12),
          border: isCurrent
              ? Border.all(
                  color: const Color(0xFFF97068).withOpacity(0.6),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF212738).withOpacity(isCurrent ? 0.9 : 0.6),
              blurRadius: 8,
              spreadRadius: isCurrent ? 3 : 1,
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }

                  return Text(
                    role,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
              trailing: !breakPointHit
                  ? Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : null,
            ),
            const Divider(),
            if (description.isNotEmpty)
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            BulletedList(
              listItems: learnedItems,
              bullet: const Icon(
                Icons.arrow_right,
                color: Color(0xFFF97068),
                size: 26,
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
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
