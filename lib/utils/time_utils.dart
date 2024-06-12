extension IntExtension on int {
  String translationTime(String defaultTime) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this);
    Duration difference = now.difference(date);
    return switch (difference) {
      _ when (difference.inDays >= 2) => "${difference.inDays}天前",
      _ when (difference.inDays >= 1) => "一天前",
      _ => defaultTime,
    };
  }
}
