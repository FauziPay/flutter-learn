import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_parse/bloc/bloc/product_bloc.dart';

class ProductOverviewBlocScreen extends StatelessWidget {
  const ProductOverviewBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(OnProductEventCalled()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Shop Bloc"),
        ),
        body: const ProductOverviewBlocBody(),
      ),
    );
  }
}

class ProductOverviewBlocBody extends StatelessWidget {
  const ProductOverviewBlocBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductLoaded) {
          final products = state.result;

          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(
                    product.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
