import "package:flutter/material.dart";

///
/// Test Label pour les differentes pages
class InfoLabel extends StatelessWidget {
  final String label;
  final String value;

  const InfoLabel(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: txt.labelMedium?.copyWith(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: txt.bodyLarge),
      ],
    );
  }
}
