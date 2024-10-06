import 'package:bloc_list/screens/item_list_renderer.dart';
import 'package:bloc_list/search_input.dart';
import 'package:bloc_list/src/list_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contoller/products_controller_bloc.dart';
import 'contoller/products_controller_event.dart';
import 'contoller/products_controller_state.dart';
import 'entity/product_entity.dart';
import 'filter/filter_icon.dart';

void main() {
  runApp(
    BlocProvider<JournalEntryBloc>(
      create: (_) {
        return JournalEntryBloc()..add(LoadJournalEntry());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc List Manager',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Flutter Bloc List Manager',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: const ListManager<ProductEntity, Loaded, JournalEntryBloc>(
            filterProperties: ['category', 'priceRange', 'isAvailable'],
            searchProperties: ['name'],
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchInput(),
                    FilterConditionsLauncher(),
                  ],
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: ItemListRenderer(),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
