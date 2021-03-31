import '../model/country.dart';
import '../model/continent.dart';
import '../model/language.dart';

class Responses {
  static List<Country> mapToCountryList(List<dynamic> response) {
    return response
        .map(
          (country) => Country.light(
            code: country['code'],
            name: country['name'],
            capital: country['capital'],
            emoji: country['emoji'],
          ),
        )
        .toList(growable: false);
  }

  static Country mapToCountry(Map<String, dynamic> country) {
    return Country(
      code: country['code'],
      name: country['name'],
      native: country['native'],
      phone: country['phone'],
      capital: country['capital'],
      currency: country['currency'],
      emoji: country['emoji'],
      continent: _mapToContinent(country['continent']),
      languages: _mapToLanguageList(country['languages']),
    );
  }

  static Continent _mapToContinent(Map<String, dynamic> continent) {
    return Continent(
      code: continent['code'],
      name: continent['name'],
    );
  }

  static List<Language> _mapToLanguageList(List<dynamic> languages) {
    return languages
        .map(
          (language) => Language(
            code: language['code'],
            name: language['name'],
            native: language['native'],
            rightToLeft: language['rtl'],
          ),
        )
        .toList(growable: false);
  }
}
