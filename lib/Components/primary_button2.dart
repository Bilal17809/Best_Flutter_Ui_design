import 'package:flutter/material.dart';

class PrimaryButton2 extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryButton2({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PrimaryButton2> createState() => _PrimaryButton2State();
}

class _PrimaryButton2State extends State<PrimaryButton2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                widget.icon,
                size: 20.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12),
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
            // Approve button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.lightGreen[200],
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text(
                "Approve",
                style: const TextStyle(
                  fontSize: 12,
                ),// White text
              ),
            ),
            const SizedBox(width: 8),
            // Request button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text(
                "Request",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
