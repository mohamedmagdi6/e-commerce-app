class Failures {
  String errorMessage;
  Failures({required this.errorMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});
}

class NetworkFailure extends Failures {
  NetworkFailure({required super.errorMessage});
}
