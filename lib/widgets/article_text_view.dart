import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';


class ArticleText extends StatelessWidget {
  final String text;

  const ArticleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 0.0, color: Theme.of(context).scaffoldBackgroundColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
      child: HtmlWidget(
        onTapUrl: (url) => launchUrl(Uri.parse(url)),
        text,
        customStylesBuilder: (element) {
          if (element.localName == 'h2') {
            return {
              'font-size':
                  '26px', // Set to a comfortable size that allows wrapping
              'line-height':
                  '1.2', // Adjust line-height to make the wrapped text look better
              'text-align': 'left', // Center the headline if it wraps
              'color': '#650054',
              'font-family': 'meta'
            };
          }
          if (element.localName == 'a') {
            return {
              'color': '#C70000', // Make the link text red
              'text-decoration': 'underline',
              'text-decoration-color':
                  'grey', // Optionally, remove the underline
              'text-decoration-thickness': '2px',
            };
          }
          return null;
        },
        // customWidgetBuilder: (element) {
        //   if (element.localName == 'figure' &&
        //       element.attributes.containsKey('data-canonical-url')) {
        //     final url = element.attributes['data-canonical-url'];
        //     return SizedBox(
        //       height: 450,
        //       width: double.infinity,
        //       child: WebViewWidget(
        //         controller: WebViewController()
        //           ..setJavaScriptMode(JavaScriptMode.unrestricted)
        //           ..loadRequest(Uri.parse(url!))
        //           ..setBackgroundColor(Colors.transparent),
        //       ),
        //     );
        //   }
        //   return null; // Default rendering for other elements
        // },
        textStyle: const TextStyle(
          height: 1.5,
          fontFamily: "sf",
          fontSize: 20,
        ),
      ),
    );
  }
}
