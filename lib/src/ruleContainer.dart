import './validators/baseValidator.dart';

class RuleContainer<T> {
  List<BaseValidator> rules = new List<BaseValidator>();

  //Function getter;
  Function(T e) getter;

  RuleContainer(this.getter);
}
