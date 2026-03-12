

import 'package:async_handler/async_handler.dart';

abstract interface class AsyncEitherUsecase<SuccessType, Params>{
  AsyncRequest<SuccessType> call(Params params);
}

abstract interface class NormalUsecase<SuccessType, Params>{
  SuccessType call(Params params);
}

class NoParams{}