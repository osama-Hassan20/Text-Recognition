import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition/views/widgets/choice_text_type.dart';

import '../../controler/cubit/cubit.dart';
import '../../controler/cubit/state.dart';
import 'custom_image.dart';
import 'custom_text_result.dart';

class TextRecognitionViewBody extends StatelessWidget {
  const TextRecognitionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextRecognitionCubit , TextRecognitionStates>(
      builder: (context , state){
        var cubit = TextRecognitionCubit.get(context);
        return  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ChoiceTextType(),
                  const SizedBox(height: 10,),
                  CustomImage(imageFile: cubit.imageFile),
                  const SizedBox(height: 10,),
                  CustomTextResult(result:cubit.finalText),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
