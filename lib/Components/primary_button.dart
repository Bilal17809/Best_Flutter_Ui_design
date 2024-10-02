import 'package:flutter/material.dart';

import '../Services-Class/daylist_class.dart';
import 'Button_List/button_list.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  String selectedDay = "Select a day";
  void _onItemSelected(String item) {
    setState(() {
      selectedDay = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              // Background for the icon
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400)
            ),
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.icon,
              size: 20.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title, // Main text
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          CustomDropDown(
            displayText: "View Work Order",
            onItemSelected: _onItemSelected,
            items: Constants.wordOrder, // List of days
          )
        ],
      ),
    );
  }
}
