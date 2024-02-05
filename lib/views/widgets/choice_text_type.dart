import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognition/controler/color.dart';
import 'package:text_recognition/controler/cubit/cubit.dart';
import 'package:text_recognition/controler/cubit/state.dart';

class ChoiceTextType extends StatelessWidget {
  const ChoiceTextType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextRecognitionCubit, TextRecognitionStates>(
        builder: (context, state) {
      var cubit = TextRecognitionCubit.get(context);

      return Container(
        height: 68,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: Row(
            children: [
               Text(
                'Text Type "${cubit.textType}"',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'latin',
                    child: Text('latin'),
                  ),
                  const PopupMenuItem(
                    value: 'chinese',
                    child: Text('chinese'),
                  ),
                  const PopupMenuItem(
                    value: 'japanese',
                    child: Text('japanese'),
                  ),
                  const PopupMenuItem(
                    value: 'korean',
                    child: Text('korean'),
                  ),
                ],
                onSelected: (String newValue) {
                  cubit.textType = newValue;
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
