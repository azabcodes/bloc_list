part of 'item_list_bloc.dart';

class ItemEmptyState extends ItemListState {
  const ItemEmptyState();

  @override
  List<Object> get props => ['No Results'];
}

abstract class ItemListState extends Equatable {
  const ItemListState();
}

class ItemResults<I extends ItemClassWithAccessor> extends ItemListState {
  final List<I> items;

  const ItemResults(this.items);

  @override
  List<Object> get props => [items];
}

class NoSourceItems extends ItemListState {
  const NoSourceItems();

  @override
  List<Object> get props => ['Empty Source'];
}
