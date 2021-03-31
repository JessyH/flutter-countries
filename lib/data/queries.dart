class Queries {
  static final String getCountries = """
    query {
      countries {
        code,
        name,
        capital,
        emoji
      }
    }
  """;

  static String getCountry(String code) => """
    query {
	    country(code: "$code") {
		    code,
        name,
        native,
        phone,
        capital,
        currency,
        emoji,
        languages {
			    code,
          name,
          native,
          rtl
        },
        continent {
			    code,
          name
		    }
	    }
    }
  """;
}
