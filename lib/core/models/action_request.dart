import 'dart:convert';

import 'package:shelf/shelf.dart';

class ActionRequest {
  final String actionName;
  final Map<String, String> sessionVariables;
  final Map<String, dynamic> input;
  final Request request;

  ActionRequest({this.actionName, this.sessionVariables, this.input, this.request});

  factory ActionRequest.fromMap(Map<String, dynamic> map, Request request) {
    if (map == null) return null;

    return ActionRequest(
      request: request,
      actionName: map['action']['name'],
      sessionVariables: Map<String, String>.from(map['session_variables']),
      input: Map<String, dynamic>.from(map['input']),
    );
  }

  factory ActionRequest.fromJson(String source, Request request) => ActionRequest.fromMap(json.decode(source), request);
}
