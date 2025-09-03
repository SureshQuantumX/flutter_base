extension StringExtension on String {
  //Convert 12-DEC-2024 to 12-Dec-2024, 12-dec-2024 to 12-Dec-2024 , 12/dec/2024 to 12/Dec/2024 and so on based on delimiter
  String dateMonthToTitleCase({String delimiter = '-'}) {
    final parts = split(delimiter);
    if (parts.length != 3) return this;
    return '${parts[0]}-${parts[1].toTitleCase()}-${parts[2]}';
  }

  String toTitleCase() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String toTitleCaseWithSeparator(String separator) {
    return split(separator).map((e) => e.toTitleCase()).join(separator);
  }
}
