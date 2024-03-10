import 'package:equatable/equatable.dart';

class Currency extends Equatable{
  final String name;
  final String charCode;
  final String value;

  const Currency({
    required this.name, 
    required this.charCode, 
    required this.value
  });

  @override
  List<Object?> get props => [name, charCode, value];
}