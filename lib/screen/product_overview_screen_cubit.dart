import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_parse/cubit/product_cubit.dart';

class ProductOverviewCubitScreen extends StatelessWidget {
  const ProductOverviewCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Shop Cubit"),
        ),
        body: const ProductOverviewCubitBody(),
      ),
    );
  }
}

class ProductOverviewCubitBody extends StatefulWidget {
  const ProductOverviewCubitBody({super.key});

  @override
  State<ProductOverviewCubitBody> createState() =>
      ProductOverviewCubitBodyState();
}

class ProductOverviewCubitBodyState extends State<ProductOverviewCubitBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<ProductCubit>().getProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
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
