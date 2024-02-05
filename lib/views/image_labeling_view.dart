import 'package:flutter/material.dart';
import 'package:text_recognition/views/widgets/image_labeling_view_body.dart';
import 'package:text_recognition/views/widgets/pick_image_button.dart';

class ImageLabelingView extends StatelessWidget {
  const ImageLabelingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: TextRecognitionViewBody(),
      floatingActionButton: CustomPickImageButton(),
    );
  }
}