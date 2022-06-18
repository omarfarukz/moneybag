
import 'package:clean_api/clean_api.dart';
import 'package:money_bag/domain/app/user-profile.dart';
import 'package:money_bag/domain/auth/login_body.dart';
import 'package:money_bag/domain/auth/signup_body.dart';


abstract class IAuthRepo{

 TaskEither<CleanFailure,UserProfile> login(LoginBody body);

  TaskEither<CleanFailure,UserProfile> registration(RegistrationBody body);
   TaskEither<CleanFailure,UserProfile> checkAuth( );


}