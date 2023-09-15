// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';


@override
Widget BuiledArticaItem(artical, BuildContext context) => Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(
              "${artical['urlToImage']}",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${artical['title']}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 4,
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                '${artical['publishedAt']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  ),
);
