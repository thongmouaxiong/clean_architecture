import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension FormStateExtension on GlobalKey<FormBuilderState>? {
  bool get validated =>
      this?.currentState?.validate(focusOnInvalid: false) ?? false;

  Map<String, dynamic>? get formData => this?.currentState?.instantValue;
}
