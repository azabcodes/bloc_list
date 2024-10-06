import 'package:flutter/material.dart';

import '../constants.dart';

class FilterConditionGroup extends StatelessWidget {
  final MapEntry<String, List<String>> condition;
  final Function(String property, String value) isOptionActive;
  final Function updateCondition;

  const FilterConditionGroup({
    required this.condition,
    required this.isOptionActive,
    required this.updateCondition,
    super.key,
  });

  @override
  Widget build(context) {
    return Container(
      key: ValueKey(condition.key),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstantsServices.filterPropertyLabelMap[condition.key]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ...condition.value.map(
            (option) {
              return CheckboxListTile(
                key: ValueKey(option),
                title: Text(option),
                value: isOptionActive(condition.key, option),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (isChecked) {
                  updateCondition(condition.key, option, isChecked);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
