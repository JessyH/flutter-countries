import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../data/queries.dart';
import '../data/responses.dart';
import '../model/country.dart';
import '../repositories/countries_repository.dart';

class CountryRepositoryImpl extends CountryRepository {
  final GraphQLClient client;

  CountryRepositoryImpl({@required this.client});

  @override
  Future<List<Country>> getCountries() async {
    final queryResult = await _safeQuery(
      options: WatchQueryOptions(
        document: gql(Queries.getCountries),
        fetchResults: true,
      ),
    );
    return Responses.mapToCountryList(queryResult.data['countries']);
  }

  Future<QueryResult> _safeQuery({WatchQueryOptions options}) async {
    final queryResult = await client.query(options);
    if (queryResult.hasException) {
      throw Exception(queryResult.exception.graphqlErrors);
    }
    return queryResult;
  }
}