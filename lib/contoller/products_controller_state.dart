import 'package:bloc_list/entity/product_entity.dart';
import 'package:equatable/equatable.dart';
import '../src/item_source.dart';

abstract class JournalEntryState extends Equatable {
  const JournalEntryState();
}

class Loaded extends JournalEntryState implements ItemSourceState<ProductEntity> {
  @override
  final List<ProductEntity> items;

  const Loaded(this.items);

  @override
  List<Object> get props => [items];
}

class Loading extends JournalEntryState {
  @override
  List<Object> get props => ['Loading'];
}