part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqInitialState extends FaqState {}
class FaqLoadingState extends FaqState {}
class FaqSuccessState extends FaqState {

}
class FaqErrorState extends FaqState {}
class changeVisibilityState extends FaqState {}

