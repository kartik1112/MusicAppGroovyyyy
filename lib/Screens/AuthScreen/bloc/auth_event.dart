part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class OnClickEmailContinueButton extends AuthEvent {
  final bool isEmailFilled;

  OnClickEmailContinueButton({required this.isEmailFilled});
}
