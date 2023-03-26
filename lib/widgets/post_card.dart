import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                // AVATAR
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      "https://static.wikia.nocookie.net/spongebob/images/1/17/Patrick_Star_Show_Patrick.png/revision/latest?cb=20220724110959"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // username
                        Text(
                          'username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: ["Delete"]
                              .map((e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(e))))
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            // IMAGE SECTION
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
                'https://lp-cms-production.imgix.net/2019-06/f15f7b57ab31c217f471c6712a2654e0-taipei-101.jpg',
                fit: BoxFit.cover),
          ),
          // LIKE COMMENT SECTION
          Row(
            children: [
              // LIKE
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              // COMMENT
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                ),
              ),
              // SEND
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () {},
                    )),
              )
            ],
          ),
          // DESCRIPTION AND NUMBER OF COMMENTS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                  child: const Text("1,231 likes"),
                ),
                Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: primaryColor),
                children: [
                  // username
                  TextSpan(
                    text: "username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // description
                  TextSpan(
                    text: " Hey this is some description to be replaced",
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 4),
                child: const Text("View all 200 comments",
                    style: TextStyle(fontSize: 16, color: secondaryColor),),),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 4),
                child: const Text("22/12/2021",
                    style: TextStyle(fontSize: 16, color: secondaryColor),),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
