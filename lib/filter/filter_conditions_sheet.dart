import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/filter_conditions/filter_conditions_bloc.dart';
import 'filter_condition_group.dart';

class FilterConditionsSheet extends StatelessWidget {
  // You must pass the FilterConditionsBloc to this widget, as the build
  // context will now belong to the Scaffold rendering the bottom sheet.
  final FilterConditionsBloc _filterConditionsBloc;

  const FilterConditionsSheet({required filterConditionsBloc, super.key})
      : _filterConditionsBloc = filterConditionsBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BlocBuilder<FilterConditionsBloc, FilterConditionsState>(
        bloc: _filterConditionsBloc,
        builder: (_, state) {
          if (state is ConditionsInitialized) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.availableConditions.length,
              itemBuilder: (_, index) {
                final condition =
                    state.availableConditions.entries.elementAt(index);
                return FilterConditionGroup(
                  condition: condition,
                  isOptionActive: _isOptionActive,
                  updateCondition: _updateCondition,
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  bool _isOptionActive(String property, String value) {
    return _filterConditionsBloc.isConditionActive(property, value);
  }

  void _updateCondition(String property, String value, bool isChecked) {
    isChecked
        ? _filterConditionsBloc.add(AddCondition(
            property: property,
            value: value,
          ))
        : _filterConditionsBloc.add(
            RemoveCondition(
              property: property,
              value: value,
            ),
          );
  }
}
