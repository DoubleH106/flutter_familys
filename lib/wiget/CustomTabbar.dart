import 'package:flutter/material.dart';

class CustomTabar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabar(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      required this.labels});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color:Color.fromRGBO(148, 26, 224, 1.0),
            width: 3,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
        i,
        Tab(
          height: 80,
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo trục chính
            children: [
              Icon(
                e,
                 color: i == selectedIndex ? const Color.fromRGBO(148, 26, 224, 1.0) : Colors.grey,
                size: 40,
              ),
              Text(
                labels[i],
                style: TextStyle(
                  fontSize: 11,
                  color: i == selectedIndex ? const Color.fromRGBO(148, 26, 224, 1.0) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ))
          .values
          .toList(),
      onTap: onTap,
    );
  }

}
