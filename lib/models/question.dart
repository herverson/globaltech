import 'option.dart';

class Question {
  final String name;
  final int type;
  final String? value;
  final List<Option>? optionsList;

  Question({
    required this.name,
    required this.type,
    this.value,
    this.optionsList,
  });

  Question copyWith({
    String? name,
    int? type,
    String? value,
    List<Option>? optionsList,
  }) {
    return Question(
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
      optionsList: optionsList ?? this.optionsList,
    );
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      name: json['name'],
      type: json['type'],
      value: json['value'],
      optionsList: json['optionsList'] != null
          ? (json['optionsList'] as List)
              .map((option) => Option.fromJson(option))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'value': value,
      'optionsList': optionsList?.map((option) => option.toJson()).toList(),
    };
  }
}
