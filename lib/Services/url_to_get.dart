import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class UrlToGet {
  final String apiKey = dotenv.env["API_KEY"]!;
  final String? section;
  final String? tag;
  final String? q;
  String? orderBy = "newest";
  DateTime? fromDate;
  DateTime? toDate;
  final int page;
  final int pageSize = 25;

  UrlToGet({
    this.section,
    this.q,
    this.tag,
    this.orderBy,
    this.fromDate,
    this.toDate,
    required this.page,
  });
  String buildSearchUrl() {
    String baseUrl =
        "https://content.guardianapis.com/search?api-key=$apiKey&show-blocks=body&show-elements=image&type=article&publication=The%20Guardian&show-fields=all&show-tags=keyword&page-size=$pageSize";
    List<String> queryParameters = [];

    if (section != null) {
      queryParameters.add("section=$section");
    }
    if (tag != null) {
      queryParameters.add("tag=$tag");
    }
    if (q != null) {
      queryParameters.add("q=$q&query-fields=headline,main");
    }
    if (fromDate != null) {
      queryParameters
          .add("from-date=${DateFormat("yyyy-MM-dd").format(fromDate!)}");
    }
    if (toDate != null) {
      queryParameters
          .add("to-date=${DateFormat("yyyy-MM-dd").format(toDate!)}");
    }
    if (orderBy != null) {
      queryParameters.add("order-by=$orderBy");
    }

    String finalUrl = baseUrl;
    if (queryParameters.isNotEmpty) {
      finalUrl += "&${queryParameters.join("&")}";
    }

    return finalUrl;
  }

  late String singleItemUrl =
      "https://content.guardianapis.com/international?api-key=$apiKey&order-by=newest&show-editors-picks=true&show-most-viewed=true&show-blocks=body&show-elements=image&type=article&publication=The%20Guardian&show-fields=all&show-tags=keyword";
}
