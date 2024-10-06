abstract class ItemClassWithAccessor {
  dynamic operator [](String prop) {}
}

abstract class ItemSourceState<I extends ItemClassWithAccessor> {
  final List<I> items;

  const ItemSourceState(this.items);
}
