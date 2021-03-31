extension StringExt on String {
  String dashIfNull() => this == null ? '-' : this;
}
