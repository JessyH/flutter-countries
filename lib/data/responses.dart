import '../model/country.dart';

class Responses {
  static List<Country> mapToCountryList(List<dynamic> response) {
    return response
        .map(
          (item) => Country(
            code: item['code'],
            name: item['name'],
          ),
        )
        .toList(growable: false);
  }
}
