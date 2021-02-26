import '../core/interfaces/use_case.dart';
import '../core/models/action_request.dart';
import '../modules/hasura_actions/domain/usecases/bmi.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shelf/shelf.dart';

KiwiContainer _container = KiwiContainer()..registerFactory<UseCase>((i) => CalculateUseBmi(), name: 'imcAction');

Future<Response> process(ActionRequest action) {
  return _container.resolve<UseCase>(action.actionName)(action);
}
