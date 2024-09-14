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
                const Text('Failed to load news. Please try again.'),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 91, 160, 92),
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
                  child: const Text('Retry'),
                ),
              ],
            ),
    );
  }
}
