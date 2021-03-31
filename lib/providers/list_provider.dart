import 'package:flutter/material.dart';

import 'base_provider.dart';
import '../model/country.dart';
import '../repositories/countries_repository.dart';

class ListProvider extends BaseProvider {
  final List<Country> _countries = [];
  final CountryRepository countryRepository;

  ListProvider({@required this.countryRepository});

  List<Country> get countries => _countries;

  void fetchCountries() async {
    try {
      setState(ProviderState.Loading);
      _countries.clear();
      _countries.addAll(await countryRepository.getCountries());
      setState(ProviderState.Success);
    } catch (e) {
      print(e);
      setState(ProviderState.Failure);
    }
  }
}
