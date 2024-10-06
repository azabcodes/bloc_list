import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/filter_conditions/filter_conditions_bloc.dart';
import 'filter_conditions_sheet.dart';

class FilterConditionsLauncher extends StatelessWidget {
  const FilterConditionsLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => FilterConditionsSheet(
            filterConditionsBloc: context.read<FilterConditionsBloc>(),
          ),
          elevation: 1,
        );
      },
    );
  }
}