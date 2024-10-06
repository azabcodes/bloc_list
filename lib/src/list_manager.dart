import 'package:bloc_list/src/search_query/search_query.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_conditions/filter_conditions_bloc.dart';
import 'item_list/item_list_bloc.dart';
import 'item_source.dart';


class ListManager<I extends ItemClassWithAccessor, T extends ItemSourceState,
    B extends Bloc> extends StatelessWidget {
  final Widget child;

  final B? sourceBloc;


  final List<String> filterProperties;


  final List<String> searchProperties;


  const ListManager({
    required this.child,
    this.sourceBloc,
    this.filterProperties = const [],
    this.searchProperties = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _sourceBloc = sourceBloc ?? context.read<B>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<FilterConditionsBloc>(
          create: (context) => FilterConditionsBloc<T>(
            sourceBloc: _sourceBloc,
            filterProperties: filterProperties,
          ),
        ),
        BlocProvider<SearchQueryCubit>(
          create: (context) => SearchQueryCubit(),
        ),
        BlocProvider<ItemListBloc>(
          create: (context) => ItemListBloc<I, T>(
            sourceBloc: _sourceBloc,
            filterConditionsBloc: context.read<FilterConditionsBloc>(),
            searchQueryCubit: context.read<SearchQueryCubit>(),
            searchProperties: searchProperties,
          ),
        )
      ],
      child: child,
    );
  }
}
