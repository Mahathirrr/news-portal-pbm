import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String? judul;
  final String? content;
  final String? datetime;
  final String? image;

  const DetailPage({
    Key? key,
    this.judul,
    this.content,
    this.datetime,
    this.image,
  }) : super(key: key);

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
          child: ListView(
            children: [
              Text(
                widget.judul ?? 'No Title',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                widget.datetime ?? 'No Date Provided',
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 20),
              widget.image != null
                  ? Image.network(
                    widget.image!,
                    height: 200,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  )
                  : Container(),
              const SizedBox(height: 20),
              Text(
                widget.content ?? 'No Content Available',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
