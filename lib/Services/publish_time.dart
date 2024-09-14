class PublishTime {
  final String date;
  PublishTime({required this.date});
  String timeAgo() {
    DateTime datetime = DateTime.parse(date);
    Duration difference = DateTime.now().difference(datetime);
     if (difference.inDays >= 365) {
      int years = difference.inDays ~/ 365;
      if(years>30) return "Long Time ago";
      return "$years year${years > 1 ? 's' : ''} ago";
    } else if (difference.inDays >= 30) {
      int months = difference.inDays ~/ 30;
      return "$months month${months > 1 ? 's' : ''} ago";
    } else if (difference.inDays >= 8) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
    } else {
      return "Just now";
    }
  }
}

