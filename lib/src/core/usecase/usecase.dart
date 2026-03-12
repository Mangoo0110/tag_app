

import 'package:async_handler/async_handler.dart';

abstract interface class AsyncUsecase<SuccessType, Params>{
  AsyncRequest<SuccessType> call(Params params);
}

abstract interface class Usecase<SuccessType, Params>{
  SuccessType call(Params params);
}

class NoParams{}