import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void goToDonationPage() {
    emit(1);
  }

  void goToRequestPage() {
    emit(2);
  }
}
