import 'package:flutter/material.dart';

class StatisticColumn extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const StatisticColumn({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label: $value',
      child: Column(
        children: [
          ExcludeSemantics(
            child: Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ExcludeSemantics(
            child: Text(label, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
