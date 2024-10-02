import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String displayText;
  final ValueChanged<String> onItemSelected;
  final List<String> items;

  const CustomDropDown({
    Key? key,
    required this.displayText,
    required this.onItemSelected,
    required this.items,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedItem; // Store the selected item

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (item) {
        setState(() {
          selectedItem = item;
        });
        widget.onItemSelected(item);
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedItem ?? widget.displayText,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 19,
            ),
          ],
        ),
      ),
      itemBuilder: (BuildContext context) {
        return widget.items.map((String item) {
          return PopupMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList();
      },
    );
  }
}
