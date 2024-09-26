import 'package:equatable/equatable.dart';

class UserEntitty extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String imgUrl;

  const UserEntitty(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.imgUrl});

  factory UserEntitty.fromJson(Map<String, dynamic> json) => UserEntitty(
        id: json['id'] ?? "",
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "",
        email: json['email'] ?? "",
        imgUrl: json['imageUrl'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'imageUrl': imgUrl,
      };
  factory UserEntitty.empty() => const UserEntitty(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        imgUrl: "",
      );
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        imgUrl,
      ];
}
