import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'core/models/action_request.dart';
import 'main/injection.dart';
import 'modules/rest/controllers/files_controller.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final router = Router();

  router.mount('/files/', FilesController().router);

  return router(request);
}

@CloudFunction()
Future<Response> hasuraActions(Request request) async {
  final json = await request.readAsString();
  final action = ActionRequest.fromJson(json, request);
  return await process(action);
}
