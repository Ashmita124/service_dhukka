import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:service_dhukka/app/usecase/usecase.dart';
import 'package:service_dhukka/core/error/failure.dart';
import 'package:service_dhukka/features/auth/domain/entity/auth_entity.dart';
import 'package:service_dhukka/features/auth/domain/repository/auth_repository.dart';


class RegisterUserParams extends Equatable {
  final String fname;
  final String lname;
  final String phone;
  final String email;
  final String password;

  const RegisterUserParams({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.password,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [fname, lname, phone, email, password];
}

class RegisterUseCase implements UseCaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      fName: params.fname,
      lName: params.lname,
      email: params.email,
      password: params.password,
      phone: params.phone,
    );
    return repository.registerCustomer(authEntity);
  }
}
