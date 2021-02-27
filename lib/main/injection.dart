import 'package:kiwi/kiwi.dart';
import 'package:shelf/shelf.dart';

import '../core/interfaces/use_case.dart';
import '../core/models/action_request.dart';
import '../modules/hasura_actions/domain/usecases/bmi.dart';
import '../modules/hasura_actions/domain/usecases/list_pokemons.dart';

KiwiContainer _container = KiwiContainer()
  ..registerFactory<UseCase>((i) => CalculateUseBmi(), name: 'imcAction')
  ..registerFactory<UseCase>((i) => ListPokemonsAction(), name: 'listPokemons');

Future<Response> process(ActionRequest action) {
  return _container.resolve<UseCase>(action.actionName)(action);
}
