import 'dart:math' as math;

import 'package:shelf/shelf.dart';

import '../../../../core/interfaces/use_case.dart';
import '../../../../core/models/action_request.dart';
import '../../../hasura_actions/domain/models/person.dart';

class CalculateUseBmi extends UseCase {
  @override
  Future<Response> call(ActionRequest action) async {
    final person = Person.fromMap(action.input['person']);
    final imc = person.weight / math.pow(person.height, 2);
    return Response.ok('{"result": ${imc.toStringAsFixed(2)}}');
  }
}
