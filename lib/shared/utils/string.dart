String displayString(String? str, {bool? isEnabled}) {
  return str ?? ((isEnabled ?? true) ? "Loading..." : "");
}