import 'package:flutter/material.dart';

import '../constants.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final Function(String?)? onSearch;

  const SearchBar({
    Key? key,
    required this.hintText,
    this.onSearch,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: defaultPadding / 2),
        Expanded(
          child: TextFormField(
            controller: _controller,
            onFieldSubmitted: widget.onSearch,
            onSaved: widget.onSearch,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: const UnderlineInputBorder(),
              labelText: 'Search by location, city, ...',
              hintText: widget.hintText,
            ),
          ),
        ),
        const SizedBox(width: defaultPadding / 2),
        Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: textColor,
          ),
          child: IconButton(
            onPressed: () {
              if (widget.onSearch != null) widget.onSearch!(_controller.text);
            },
            tooltip: 'Search',
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
