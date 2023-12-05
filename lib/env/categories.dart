import 'package:flutter/material.dart';
import 'package:projectstore/env/next_categories.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredCategories = List.from(categories);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCategories = categories
          .where((category) => category['name']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Buscar',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextCategories(
                          categoryName: filteredCategories[index]['name'] ?? '',
                        ),
                      ),
                    );
                  },
                  child: CategoryButton(
                    imageUrl: filteredCategories[index]['imageUrl'] ?? '',
                    categoryName: filteredCategories[index]['name'] ?? '',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const CategoryButton({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NextCategories(
              categoryName: categoryName,
            ),
          ),
        );
      },
      child: Card(
        color: const Color(0xFFFFFFFF),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 135,
              width: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(categoryName, style: const TextStyle(fontSize: 15.0)),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> categories = [
  {'name': 'Frutas y Verduras', 'imageUrl': 'assets/img/fyv.jpg'},
  {'name': 'Cremería', 'imageUrl': 'assets/img/cremeria.jpg'},
  {'name': 'Bebidas', 'imageUrl': 'assets/img/bebidas.jpg'},
  {'name': 'Carnes', 'imageUrl': 'assets/img/carnes.jpg'},
  {'name': 'Botanas', 'imageUrl': 'assets/img/botanas.jpg'},
  {'name': 'Mascotas', 'imageUrl': 'assets/img/mascotas.jpg'},
];
