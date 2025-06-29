import 'package:dars15/vievmodel/viewmodel.dart';
import 'package:dars15/views/screens/product_details.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Viewmodel();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: viewmodel.getProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final product = snapshot.data;

          if (product == null) {
            return Center(child: Text('products yoq'));
          }

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  product.nameUz,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: product.products.length,
                  itemBuilder: (context, index) {
                    final productItem = product.products[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (ctx) => ProductDetails(product: productItem),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.network(product.image),
                        title: Text(productItem.nameRu),
                        subtitle: Text('Price: ${productItem.price}'),
                        trailing: Text(productItem.qty.toString()),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
