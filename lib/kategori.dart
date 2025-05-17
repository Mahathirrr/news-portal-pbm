import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  KategoriPageState createState() => KategoriPageState();
}

class KategoriPageState extends State<KategoriPage> {
  String selectedCategory = 'general';
  final List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  Future<List<dynamic>> fetchNewsByCategory(String category) async {
    const apiKey = '95288040a1ed4027b2c021ddf23ad7cd';
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('News Categories')),
        body: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: selectedCategory == categories[index],
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedCategory = categories[index];
                          });
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: fetchNewsByCategory(selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var article = snapshot.data![index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading:
                              article['urlToImage'] != null
                                  ? Image.network(
                                    article['urlToImage'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  )
                                  : const Icon(Icons.image),
                          title: Text(article['title'] ?? 'No Title'),
                          subtitle: Text(article['publishedAt'] ?? 'No Date'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => DetailPage(
                                      judul: article['title'],
                                      content:
                                          article['description'] ??
                                          'No Content',
                                      datetime: article['publishedAt'],
                                      image: article['urlToImage'],
                                    ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
