// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_expression_function_bodies

part of 'files_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$FilesControllerRouter(FilesController service) {
  final router = Router();
  router.add('POST', r'/', service.upload);
  router.add('GET', r'/<name>', service.getFile);
  return router;
}
