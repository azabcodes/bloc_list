import 'package:bloc_list/src/search_query/search_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(context) {
    return BlocBuilder<SearchQueryCubit, String>(
      builder: (context, state) {
        return Flexible(
          child: TextField(
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              labelText: 'Search',
            ),
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              context.read<SearchQueryCubit>().setQuery(value);
            },
          ),
        );
      },
    );
  }
}
