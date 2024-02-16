import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ExperianceTile extends StatelessWidget {
  const ExperianceTile({
    required this.companyName,
    required this.role,
    required this.date,
    required this.description,
    super.key,
  });

  final String companyName;
  final String role;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    final breakPointHit = MediaQuery.sizeOf(context).width < 800;

    return FadeInUp(
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
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: SimpleShadow(
                opacity: 0.2,
                offset: const Offset(1, 2),
                sigma: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/images/whiterabbit.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
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
                ],
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
  }
}
