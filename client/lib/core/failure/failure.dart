
class AppFailure {
  final String message;
  AppFailure([this.message = 'Desculpe, um erro inesperado ocorreu!']);

  @override
  String toString() => 'AppFailure(message: $message)';
}
