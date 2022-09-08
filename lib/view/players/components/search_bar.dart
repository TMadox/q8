import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  final void Function(String?)? onChanged;
  const SearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "search",
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        labelText: "Search by player name",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
      ),
    );
  }
}
