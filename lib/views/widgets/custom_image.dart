import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
//
// class CustomImage extends StatelessWidget {
//   const CustomImage({super.key, required this.imageFile});
//
//   final File? imageFile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 250,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.grey,
//       ),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       child: imageFile == null
//           ? const Icon(Icons.add_a_photo)
//           : Image.file(
//               imageFile!,
//               fit: BoxFit.fill,
//             ),
//     );
//   }
// }

class CustomImage extends StatelessWidget{
  const CustomImage({super.key, required this.imageFile});

  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: const Radius.circular(10),
      dashPattern: const [4, 4],
      strokeWidth: 2,
      borderType: BorderType.RRect,
      color: Colors.grey,
      child: imageFile == null
          ? Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  Text(
                    'Upload up to image',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : ClipRRect(
        borderRadius: BorderRadius.circular(8),
            child: Image.file(
                imageFile!,
                fit: BoxFit.fill,
              ),
          ),
    );
  }
}
