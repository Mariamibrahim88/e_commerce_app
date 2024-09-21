import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Search for products',
        prefixIcon: const Icon(Icons.search),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
