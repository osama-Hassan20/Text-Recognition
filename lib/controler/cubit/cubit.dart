import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/controler/cubit/state.dart';

class TextRecognitionCubit extends Cubit<TextRecognitionStates> {
  TextRecognitionCubit() : super(TextRecognitionInitialState());

  static TextRecognitionCubit get(context) => BlocProvider.of(context);

  String finalText = '';
  File? imageFile;
  String textType ='latin';
  TextRecognitionScript textRecognitionScript = TextRecognitionScript.latin;


  void pickImage(ImageSource ) async {
    emit(PickImageLoadingState());
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        textRecognition(imageFile! , textType == 'latin' ? TextRecognitionScript.latin : textType == 'japanese' ? TextRecognitionScript.japanese : textType == 'chinese' ? TextRecognitionScript.chinese : TextRecognitionScript.korean);

        emit(PickImageSuccessState());
      }
    } catch (e) {
      emit(PickImageErrorState());
      if (kDebugMode) {
        print(e);
      }
    }
  }



  Future textRecognition(File img , TextRecognitionScript textRecognitionScript) async{
    emit(GetTextRecognitionLoadingState());
   final textRecognition = TextRecognizer(script: TextRecognitionScript.korean);
   final  inputImage = InputImage.fromFilePath(img.path);
   final RecognizedText recognizedText = await textRecognition.processImage(inputImage);

   finalText = recognizedText.text;
   if (kDebugMode) {
     print(finalText);
   }
   emit(GetTextRecognitionSuccessState());
  }


}
