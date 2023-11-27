abstract class AttendStates{}
class AttendInitState extends  AttendStates{}
class FetchStateSuccess extends  AttendStates{}
class AddUserStateSuccess extends  AttendStates{}
class AddAttendStateSuccess extends  AttendStates{}
class GetAttendStateSuccess extends  AttendStates{}
class GetPaySlipStateSuccess extends  AttendStates{}
class LoadPaySlipStateSuccess extends  AttendStates{}
class GetPaySlipStateError extends  AttendStates{}
class AddPaySlipStateSuccess extends  AttendStates{}
class AddPaySlipLoadState extends  AttendStates{}
class AddPaySlipStateError extends  AttendStates{}
class GetReviewStateSuccess extends  AttendStates{}
class GetReviewStateEroor extends  AttendStates{}
class LoadReviewStateSuccess extends  AttendStates{}
class LoadingGetAttendStateSuccess extends  AttendStates{}
class DeleteAttendStateSuccess extends  AttendStates{}
class GetPermissionAttendState extends  AttendStates{}
class EmitAttend extends  AttendStates{}
class ChangeBottomNavState extends  AttendStates{}
class GetAttendUserSuccess extends  AttendStates{}
class GetAttendUserError extends  AttendStates{}
class LoginPasswordState extends AttendStates{}
class LoginLoadingState extends AttendStates{}
class GetUserLoadingState extends AttendStates{}
class LoginSuccessState extends AttendStates{
  String? uId;

  LoginSuccessState({this.uId});
}
class GETUserSuccessState extends AttendStates{}
class ChangeHomeButton extends AttendStates{}

class LoginErrorState extends AttendStates{
  String?error;
  LoginErrorState({this.error});
}
class ChangePasswordSuccessState extends AttendStates{}
class RegisterSQLSuccessState extends AttendStates{}
class UpdateSuddenNormalSQLSuccessState extends AttendStates{}
class GetDepartSQLSuccess extends  AttendStates{}
class InsetSQLSuccess extends  AttendStates{}
class GetPayOrReviewState extends  AttendStates{}
class VotLoadingState extends  AttendStates{}
class HiringDropState  extends  AttendStates{}

