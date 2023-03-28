import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({super.key, required this.snap});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Row(
          children: [
            // avatar
            CircleAvatar(
              backgroundImage: NetworkImage(
                  widget.snap['profilePic']),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.snap['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.snap['text'],
                    ),
                    // DATE
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.favorite_border_outlined,
                size: 16,
              ),
            )
          ],
        ));
  }
}
