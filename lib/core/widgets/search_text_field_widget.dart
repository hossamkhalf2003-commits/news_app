import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({super.key});

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  bool isSearchFieldVisible = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isSearchFieldVisible)
          SizedBox(
            width: 200,
            child: TextField(
              onSubmitted: (value) {
                GoRouter.of(
                  context,
                ).pushNamed(AppRoutes.searchResult, extra: value);
              },

              decoration: InputDecoration(
                hintText: "search_hint".tr(),
                hintStyle: const TextStyle(color: Color(0xff231F20)),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff231F20)),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff231F20)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff231F20)),
                ),
              ),
              style: const TextStyle(color: Color(0xff231F20)),
            ),
          )
        else
          const SizedBox.shrink(),

        IconButton(
          onPressed: () {
            setState(() {
              isSearchFieldVisible = !isSearchFieldVisible;
            });
          },
          icon: const Icon(
            Icons.search_outlined,
            color: Color(0xff231F20),
            size: 30,
          ),
        ),
      ],
    );
  }
}
