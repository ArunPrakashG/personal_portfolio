import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/widgets/project_stack_chip.dart';

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
    return FadeIn(
      child: ListTile(
        onTap: widget.sourceAvailable ? _onRepoOpenPressed : null,
        trailing: widget.sourceAvailable
            ? IconButton(
                icon: const Icon(Icons.open_in_browser),
                onPressed: _onRepoOpenPressed,
              )
            : null,
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (widget.unmaintained)
                  const ProjectStackChip(
                    label: 'Unmaintained',
                    textColor: Colors.red,
                  ),
                if (widget.sourceAvailable)
                  const ProjectStackChip(
                    label: 'OSS',
                    textColor: Colors.green,
                  ),
                for (final tech in widget.stack)
                  ProjectStackChip(
                    label: tech,
                  ),
              ],
            ),
          ],
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
}
