import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchBoxController = TextEditingController();
  bool isCollapsed = true;

  @override
  void initState() {
    _searchBoxController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 40,
        width: constraints.maxWidth - 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: FocusScope(
          onFocusChange: (focus) {
            isCollapsed = !isCollapsed;
            setState(() {});
          },
          child: TextField(
            style: Theme.of(context).textTheme.bodyText1,
            controller: _searchBoxController,
            cursorHeight: 20,
            textAlign: TextAlign.justify,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isCollapsed: isCollapsed,
              labelText: 'Search',
              floatingLabelAlignment: FloatingLabelAlignment.center,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  width: 15,
                ),
              ),
              suffixIcon: _searchBoxController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchBoxController.clear();
                      },
                      icon: SvgPicture.asset('assets/icons/Cancel.svg'),
                    )
                  : null,
            ),
          ),
        ),
      );
    });
  }
}
