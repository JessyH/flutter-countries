import '../model/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getCountries();
}
