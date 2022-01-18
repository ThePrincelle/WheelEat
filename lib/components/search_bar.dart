import 'package:flutter/material.dart';

import '../constants.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback? onSearch;

  const SearchBar({
    Key? key,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          // TODO: Update this onPressed
          onPressed: () {},
          splashRadius: 22.0,
          icon: const Icon(
            Icons.search,
            color: textColor,
          ),
        ),
        const SizedBox(width: defaultPadding / 2),
        Expanded(
          // TODO: Remove this column and change it with real searchbar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding / 2),
              const Text('Search restaurant'),
              Divider(color: textColor.withOpacity(0.8)),
            ],
          ),
        ),
        const SizedBox(width: defaultPadding / 2),
        Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: textColor,
          ),
          child: IconButton(
            onPressed: onSearch,
            splashRadius: 22.0,
            padding: const EdgeInsets.all(0.0),
            color: lightTextColor,
            icon: const Icon(Icons.place_rounded),
          ),
        ),
      ],
    );
  }
}
