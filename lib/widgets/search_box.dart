import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({required this.searchBoxController, this.onPressed, Key? key})
      : super(key: key);
  final void Function()? onPressed;
  final TextEditingController searchBoxController;
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool isCollapsed = true;

  @override
  void initState() {
    widget.searchBoxController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 40,
        width: constraints.maxWidth - 40,
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
            controller: widget.searchBoxController,
            cursorHeight: 20,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isCollapsed: isCollapsed,
              labelText: 'Search',
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
                onPressed: widget.onPressed,
                icon: SvgPicture.asset(
                  'assets/icons/Search.svg',
                ),
              ),
              suffixIcon: widget.searchBoxController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        widget.searchBoxController.clear();
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
