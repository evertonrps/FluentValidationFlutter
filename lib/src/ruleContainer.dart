import './validators/baseValidator.dart';

class RuleContainer<T> {
  List<BaseValidator> rules = [];

  //Function getter;
  Function(T e) getter;

  RuleContainer(this.getter);
}
