import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class UserCard extends StatefulWidget {
  final Color? cardColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final VoidCallback? onTap;
  final String? userName;
  final Widget? userMoreInfo;
  final ImageProvider userProfilePic;

  UserCard({
    required this.cardColor,
    this.cardRadius = 30,
    required this.userName,
    this.backgroundMotifColor = Colors.white,
    this.userMoreInfo,
    required this.userProfilePic,
    required this.onTap,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  int numm = 1;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          numm++;
        });
      },
      child: Container(
        height: mediaQueryHeight / 6,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(
              double.parse(widget.cardRadius!.toString())),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: widget.backgroundMotifColor!.withOpacity(.1),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 400,
                backgroundColor: widget.backgroundMotifColor!.withOpacity(.05),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: RandomAvatar(
                          height: mediaQueryHeight / 7,
                          DateTime.now().toString() + numm.toString(),
                          trBackground: true,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              widget.userName!,
                              maxLines: 2,
                              maxFontSize: 20,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            ),
                            if (widget.userMoreInfo != null) ...[
                              widget.userMoreInfo!,
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
