abstract class TextRecognitionStates {}

class TextRecognitionInitialState extends TextRecognitionStates{}


class PickImageLoadingState extends TextRecognitionStates{}
class PickImageSuccessState extends TextRecognitionStates{}
class PickImageErrorState extends TextRecognitionStates{}

class GetTextRecognitionLoadingState extends TextRecognitionStates{}
class GetTextRecognitionSuccessState extends TextRecognitionStates{}

class ChoiceTextTypeSuccessState extends TextRecognitionStates{}
