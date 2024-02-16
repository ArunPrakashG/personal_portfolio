bool isUrl(String value) {
  final url = Uri.tryParse(value);
  return url != null && url.hasScheme && url.hasAuthority;
}
