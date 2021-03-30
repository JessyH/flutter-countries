class Queries {
  static final String getCountries = """
    query {
      countries {
        code,
        name
      }
    }
  """;
}
