abstract class AttendStates{}
class AttendInitState extends  AttendStates{}
class FetchStateSuccess extends  AttendStates{}
class AddUserStateSuccess extends  AttendStates{}
class AddAttendStateSuccess extends  AttendStates{}
class GetAttendStateSuccess extends  AttendStates{}
class GetPaySlipStateSuccess extends  AttendStates{}
class LoadingGetAttendStateSuccess extends  AttendStates{}
class DeleteAttendStateSuccess extends  AttendStates{}
class GetPermissionAttendState extends  AttendStates{}
class EmitAttend extends  AttendStates{}
class ChangeBottomNavState extends  AttendStates{}
class GetAttendUserSuccess extends  AttendStates{}
class GetAttendUserError extends  AttendStates{}
class LoginPasswordState extends AttendStates{}
class LoginLoadingState extends AttendStates{}
class LoginSuccessState extends AttendStates{
  String? uId;

  LoginSuccessState({this.uId});
}

class LoginErrorState extends AttendStates{
  String?error;
  LoginErrorState({this.error});
}
class ChangePasswordSuccessState extends AttendStates{}
class RegisterSQLSuccessState extends AttendStates{}
class GetDepartSQLSuccess extends  AttendStates{}


