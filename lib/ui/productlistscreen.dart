
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskkk/ui/details.dart';

import '../Api/productprovider.dart';
import '../model/Products.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context).products;
    List<Products> filteredProducts = productsData
        .where((product) =>
    product.title!.toLowerCase().contains(_searchController.text.toLowerCase()) ||
        product.brand!.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search by Title or Brand',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: filteredProducts.length,
                itemBuilder: (ctx, index) => ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ProductDetailScreen(product: filteredProducts[index])),
                    );
                  },
                  leading: Image.network('${filteredProducts[index].thumbnail}'),
                  title: Text('${filteredProducts[index].title}'),
                  subtitle: Text('${filteredProducts[index].description}'),
                ), separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              ),
            ),
          ),
        ],
      ),
    );
  }
}