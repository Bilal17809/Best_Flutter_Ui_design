import 'package:flutter/material.dart';

import 'Button_List/button_list.dart';

class SecondryButton extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const SecondryButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<SecondryButton> createState() => _SecondryButtonState();
}

class _SecondryButtonState extends State<SecondryButton> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400)
            ),
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.icon,
              size: 24.0,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400)
            ),
              child:  const Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(child: Text("View full summary")),
              ))
        ],
      ),
    );
  }
}
