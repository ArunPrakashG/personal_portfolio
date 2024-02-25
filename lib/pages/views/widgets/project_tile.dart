import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatefulWidget {
  const ProjectTile({
    required this.name,
    required this.stack,
    required this.description,
    required this.index,
    this.sourceAvailable = false,
    this.unmaintained = false,
    super.key,
    this.demoUrl,
    this.repo,
  });

  final String name;
  final String description;
  final List<String> stack;
  final bool sourceAvailable;
  final String? repo;
  final String? demoUrl;
  final int index;
  final bool unmaintained;

  @override
  State<ProjectTile> createState() => _ProjectTileState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(IterableProperty<String>('stack', stack));
    properties
        .add(DiagnosticsProperty<bool>('sourceAvailable', sourceAvailable));
    properties.add(StringProperty('repo', repo));
    properties.add(DiagnosticsProperty<bool>('unmaintained', unmaintained));
    properties.add(StringProperty('description', description));
    properties.add(StringProperty('demo', demoUrl));
    properties.add(IntProperty('index', index));
  }
}

class _ProjectTileState extends State<ProjectTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: widget.index * 300),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFF97068).withOpacity(isHovered ? 1 : 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF97068).withOpacity(isHovered ? 0.5 : 0.2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(24),
          child: InkWell(
            onTap: () {},
            onHover: _onHovered,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: widget.repo != null
                        ? Tooltip(
                            message: 'Open Repository',
                            child: IconButton(
                              icon: const Icon(Icons.open_in_new),
                              onPressed: _onRepoOpenPressed,
                            ),
                          )
                        : null,
                    subtitle: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        if (widget.unmaintained)
                          const Chip(
                            label: Text('Unmaintained'),
                            backgroundColor: Colors.red,
                          ),
                        if (widget.sourceAvailable)
                          const Chip(
                            label: Text('Source Available'),
                            backgroundColor: Colors.green,
                          ),
                        for (final tech in widget.stack)
                          Chip(
                            label: Text(tech),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (widget.demoUrl != null)
                    ElevatedButton(
                      onPressed: _onDemoPressed,
                      child: const Text('View Demo'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isHovered', isHovered));
  }

  void _onRepoOpenPressed() {
    if (widget.repo == null) {
      return;
    }

    final uri = Uri.tryParse(widget.repo ?? '');

    if (uri == null) {
      return;
    }

    launchUrl(uri);
  }

  void _onHovered(bool value) {
    setState(() {
      isHovered = value;
    });
  }

  void _onDemoPressed() {
    if (widget.demoUrl == null) {
      return;
    }

    final uri = Uri.tryParse(widget.demoUrl ?? '');

    if (uri == null) {
      return;
    }

    launchUrl(uri);
  }
}
