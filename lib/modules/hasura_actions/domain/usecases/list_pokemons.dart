import 'dart:convert';

import 'package:backend/modules/hasura_actions/domain/models/list_pokemons_request_model.dart';
import 'package:backend/modules/hasura_actions/domain/models/list_pokemons_response_model.dart';
import 'package:backend/modules/hasura_actions/domain/models/pagination_model.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:shelf/shelf.dart';

import '../../../../core/interfaces/use_case.dart';
import '../../../../core/models/action_request.dart';

class ListPokemonsAction extends UseCase {
  final dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));

  @override
  Future<Response> call(ActionRequest action) async {
    try {
      final request = ListPokemonsRequestModel.fromMap(action.input['request']);
      final apiResponse = await dio.get(
        'pokemon',
        queryParameters: {
          if (request?.offset != null) 'offset': request.offset,
          if (request?.limit != null) 'limit': request.limit
        },
      );

      final nextUrl = apiResponse.data['next'];
      final nextPagination = getPaginationModelFromUrlQueryParams(nextUrl);

      final previousUrl = apiResponse.data['previous'];
      final previousPagination =
          getPaginationModelFromUrlQueryParams(previousUrl);

      final response = ListPokemonsResponseModel(
        count: apiResponse.data['count'],
        results: apiResponse.data['results'],
        nextPagination: nextPagination,
        previousPagination: previousPagination,
      );
      return Response.ok(response.toJson());
    } catch (ex) {
      return Response.internalServerError(
        body: json.encode({'message': ex?.toString()}),
      );
    }
  }

  PaginationModel getPaginationModelFromUrlQueryParams(String url) {
    if (url == null) return const PaginationModel(limit: 0, offset: 0);

    final uri = Uri.parse(url);
    return PaginationModel(
      limit: int.parse(uri.queryParameters['limit']) ?? 0,
      offset: int.parse(uri.queryParameters['offset']) ?? 0,
    );
  }
}
