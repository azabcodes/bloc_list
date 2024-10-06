import 'package:bloc_list/contoller/products_controller_event.dart';
import 'package:bloc_list/contoller/products_controller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/product_entity.dart';

class JournalEntryBloc extends Bloc<JournalEntryEvent, JournalEntryState> {
  JournalEntryBloc() : super(Loading()) {
    on<LoadJournalEntry>(_loadProducts());
  }

  EventHandler<LoadJournalEntry, JournalEntryState> _loadProducts() {
    return (event, emit) {
      emit(
        const Loaded(
          [
            ProductEntity(
              id: '1',
              name: 'Product 1',
              price: 10.0,
              imageUrl: 'https://via.placeholder.com/150',
              category: 'Electronics1',
              priceRange: '1',
              isAvailable: false,
            ),
            ProductEntity(
              id: '2',
              name: 'Product 2',
              price: 20.0,
              imageUrl: 'https://via.placeholder.com/150',
              category: 'Electronics2',
              priceRange: '2',
              isAvailable: false,
            ),
            ProductEntity(
              id: '3',
              name: 'Product 3',
              price: 30.0,
              imageUrl: 'https://via.placeholder.com/150',
              category: 'Electronics3',
              priceRange: '3',
              isAvailable: true,
            ),
          ],
        ),
      );
    };
  }
}
