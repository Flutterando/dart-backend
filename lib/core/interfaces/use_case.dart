import '../models/action_request.dart';
import 'package:shelf/shelf.dart';

abstract class UseCase {
  Future<Response> call(ActionRequest action);
}
