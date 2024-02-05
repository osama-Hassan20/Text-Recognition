import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../controler/cubit/cubit.dart';
import '../../controler/cubit/state.dart';
import 'custom_category.dart';

void customShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<TextRecognitionCubit, TextRecognitionStates>(
          builder: (context, state) {
        var cubit = TextRecognitionCubit.get(context);
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCategory(
                  name: 'Camera',
                  onTap: () {
                    Navigator.of(context).pop();
                    cubit.pickImage(ImageSource.camera);
                  },
                  icon: Icons.camera_alt),
              CustomCategory(
                  name: 'Gallery',
                  onTap: () {
                    Navigator.of(context).pop();
                    cubit.pickImage(ImageSource.gallery);
                  },
                  icon: Icons.photo_camera_back_outlined)
            ],
          ),
        );
      });
    },
  );
}
