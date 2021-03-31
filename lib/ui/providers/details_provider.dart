import 'package:flutter/widgets.dart';

import 'base_provider.dart';
import '../../model/country.dart';
import '../../repositories/country_repository.dart';

class DetailsProvider extends BaseProvider {
  final CountryRepository countryRepository;
  Country _country;
  bool _isExpanded = false;

  DetailsProvider({
    @required this.countryRepository,
  });

  Country get country => _country;

  bool get isExpanded => _isExpanded;

  void init(Country country) => _country = country;

  void fetchDetails() async {
    try {
      setState(ProviderState.Loading);
      _country = await countryRepository.getCountry(_country.code);
      setState(ProviderState.Success);
    } catch (e) {
      print(e);
      setState(ProviderState.Failure);
    }
  }

  void expand() {
    _isExpanded = true;
    notifyListeners();
  }

  void contract() {
    _isExpanded = false;
    notifyListeners();
  }
}
