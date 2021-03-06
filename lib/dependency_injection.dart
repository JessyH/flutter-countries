import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'data/country_repository_impl.dart';
import 'ui/providers/details_provider.dart';
import 'ui/providers/list_provider.dart';
import 'repositories/country_repository.dart';

final getIt = GetIt.instance;

void setup() {
  // Providers
  getIt.registerFactory(
    () => ListProvider(countryRepository: getIt()),
  );
  getIt.registerFactory(
    () => DetailsProvider(countryRepository: getIt()),
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
