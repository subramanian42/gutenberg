class Success {
  Object response;
  Success({required this.response});
}

class Failure {
  int? code;
  Object errorResponse;
  Failure({required this.errorResponse, this.code});
}
