import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_category.dart';
import 'package:store_app/widgets/custom_card_widget.dart';

class CategorizedScreen extends StatefulWidget {
  const CategorizedScreen({super.key});
  static String id = 'CategorizedScreen';

  @override
  _CategorizedScreenState createState() => _CategorizedScreenState();
}

class _CategorizedScreenState extends State<CategorizedScreen> {
  String selectedCategory =     "men's clothing";// Default category
  List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20),
        child: Column(
          children: [
            // Category selection dropdown or list
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              ),
            ),

            // Spacer to separate the dropdown from the grid
            const SizedBox(height: 20),

            // Grid displaying products for the selected category
            Expanded(
              child: FutureBuilder<List<ProductModel>>(
                future: GetCategory(Dio()).getCategory(categoryName: selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading products'));
                  }

                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: GridView.builder(
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return CustomCardWidget(productModel: products[index]);
                        },
                      ),
                    );
                  }

                  return const Center(child: Text('No products available.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
