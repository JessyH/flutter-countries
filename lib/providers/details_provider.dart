import 'package:flutter/widgets.dart';

import 'base_provider.dart';
import '../model/country.dart';
import '../repositories/countries_repository.dart';

class DetailsProvider extends BaseProvider {
  Country _country;
  final CountryRepository countryRepository;

  DetailsProvider({
    @required this.countryRepository,
  });

  Country get country => _country;

  void init(Country country) => _country = country;

  void fetchDetails() async {}
}
