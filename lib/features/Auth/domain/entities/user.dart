import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int ?id;
  final String ?name;
  final String email;
  final String ?phone;
  final String password;
  final String ?confirmPassword;

  const User({
    this.id,
    this.name,
    required this.email,
    this.phone,
    required this.password,
    this.confirmPassword,
  });

  @override
  List<Object?> get props => [id, name, email, phone, password, confirmPassword];
}
