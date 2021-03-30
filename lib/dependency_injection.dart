import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'data/country_repository_impl.dart';
import 'providers/list_provider.dart';
import 'repositories/countries_repository.dart';

final getIt = GetIt.instance;

void setup() {
  // Providers
  getIt.registerFactory(
    () => ListProvider(countryRepository: getIt()),
  );

  // Data
  getIt.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(client: getIt()),
  );

  // External
  getIt.registerLazySingleton(
    () => GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://countries.trevorblades.com/'),
    ),
  );
}
