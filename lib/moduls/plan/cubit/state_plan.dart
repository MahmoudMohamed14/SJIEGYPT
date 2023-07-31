abstract class PlanStates{}
class PlanInitState extends  PlanStates{}
class PlanLoadingState extends  PlanStates{}

class PlanSuccessState extends  PlanStates{


}
class PlanchooseOperator extends  PlanStates{}
class PlanchooseLine extends  PlanStates{}
class PlanchooseID extends  PlanStates{}
class OredrTypeState extends  PlanStates{}
class Test extends  PlanStates{}
class GetCodeKittingPlan extends   PlanStates{}
class ShowDescription extends   PlanStates{}
class ShiftState extends   PlanStates{}
class EmitStatePlan extends   PlanStates{}
class GetSuccessPlan extends   PlanStates{}
class SetKittingComponantSuccess extends   PlanStates{}
class UpdateKittingComponantSuccess extends   PlanStates{}
class GetKittingComponantSuccess extends   PlanStates{}
class GetKittingComponantFailed extends   PlanStates{}
class GetKittingComponentListSuccess extends   PlanStates{}
