import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory(
      {super.key, required this.name, required this.onTap, required this.icon});

  final String name;
  final GestureTapCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
