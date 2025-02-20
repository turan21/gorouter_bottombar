import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';

  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSectionTitle('Featured Products'),
            buildFeaturedProducts(),
            buildSectionTitle('Categories'),
            buildCategories(),
            buildSectionTitle('Stores'),
            buildStores(),
          ],
        ),
      ),
    );
  }

  // Function to create a section title
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Function to build Featured Products
  Widget buildFeaturedProducts() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildProductCard('Product 1', '\$10.99'),
          buildProductCard('Product 2', '\$20.99'),
          buildProductCard('Product 3', '\$15.49'),
        ],
      ),
    );
  }

  // Function to build Categories
  Widget buildCategories() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCategoryCard('Electronics'),
          buildCategoryCard('Clothing'),
          buildCategoryCard('Home & Kitchen'),
        ],
      ),
    );
  }

  // Function to build Stores
  Widget buildStores() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildStoreCard('Store 1'),
          buildStoreCard('Store 2'),
          buildStoreCard('Store 3'),
        ],
      ),
    );
  }

  // Function to build a product card widget
  Widget buildProductCard(String title, String price) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          // Image.asset('assets/product_placeholder.png',
          //     height: 100, width: 100, fit: BoxFit.cover),
          Text(title),
          Text(price),
        ],
      ),
    );
  }

  // Function to build a category card widget
  Widget buildCategoryCard(String category) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category, size: 50),
          Text(category),
        ],
      ),
    );
  }

  // Function to build a store card widget
  Widget buildStoreCard(String storeName) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.store, size: 50),
          Text(storeName),
        ],
      ),
    );
  }
}
