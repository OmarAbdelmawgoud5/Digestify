import 'package:flutter/material.dart';

class FetchNewsFailureMessage extends StatefulWidget {
  const FetchNewsFailureMessage({super.key, required this.retry});
  final VoidCallback retry;

  @override
  State<FetchNewsFailureMessage> createState() =>
      _FetchNewsFailureMessageState();
}

class _FetchNewsFailureMessageState extends State<FetchNewsFailureMessage> {
  bool _isRetrying = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isRetrying
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: Text(
                    'You are not connected to a network.\nCheck your settings and try again.',
                    style: TextStyle(
                        fontFamily: "sf",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    setState(() {
                      _isRetrying = true;
                    });

                    widget.retry();
                    Future.delayed(const Duration(seconds: 10), () {
                      if (mounted) {
                        setState(() {
                          _isRetrying = false;
                        });
                      }
                    });
                  },
                  child: const Text(
                    'Try agian',
                    style: TextStyle(fontFamily: "sf"),
                  ),
                ),
              ],
            ),
    );
  }
}
