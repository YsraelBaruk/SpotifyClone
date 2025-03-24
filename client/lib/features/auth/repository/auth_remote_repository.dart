import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<Either<Failure, Map<String, dynamic>>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );
      if (response.statusCode != 201) {
        return Left(response.body);
      }
      final user = (response.body) as Map<String, dynamic>;
      user['email'];
      return Right(user);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/auth/login'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
