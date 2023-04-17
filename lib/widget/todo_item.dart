import 'package:counter_app/models/todo_model.dart';

import 'package:counter_app/views/detail_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onFavourite;
  const TodoItem({
    super.key,
    required this.todo,
    required this.onFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => DetailPage(
            todo: todo,
          )),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black12,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text(todo.id.toString()),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.id.toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    todo.todo.toString(),
                    maxLines: 3,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PopupMenuButton(
                  onSelected: (value) {
                    if (value == "edit") {
                      // Get.to(() => EditPage(index: index));
                    } else if (value == "delete") {
                      // dc.delete(index: index);
                    }
                  },
                  child: const Icon(Icons.more_vert),
                  itemBuilder: (context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      value: "edit",
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: "delete",
                      child: Text('Delete'),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: onFavourite,
                    icon: todo.isFavourite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
