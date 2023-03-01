import '../model/cat_model.dart';

abstract class CatsState {
  CatsState();
}

class CatsInitial extends CatsState {
  CatsInitial();
}

class CatsLoading extends CatsState {
  CatsLoading();
}

class CatsLoaded extends CatsState {
  final List<Cat> response;
  CatsLoaded(this.response);
}

class CatsError extends CatsState {
  final String message;
  CatsError(this.message);
}
