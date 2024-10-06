
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/product_entity.dart';
import '../src/item_list/item_list_bloc.dart';

class ItemListRenderer extends StatelessWidget {
  const ItemListRenderer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      builder: (_, state) {
        if (state is NoSourceItems) {
          return const Text('No source items');
        }

        if (state is ItemEmptyState) {
          return const Text('No matching results');
        }

        if (state is ItemResults<ProductEntity>) {
          return ListView(
            children: state.items
                .map(
                  (product) => ListTile(
                key: ValueKey(product.id),
                leading: Image.network(
                  product.imageUrl,
                  width: 50,
                  height: 50,
                ),
                title: Text(product.name),
                subtitle: Text('\$${product.price.toString()}'),
              ),
            )
                .toList(),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}