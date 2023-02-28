import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final item = [];
  void addItem() {
    item.insert(0, "Item ${item.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            elevation: 0,
            color: Colors.grey[200],
            shape: const RoundedRectangleBorder(),
            child: ListTile(
              title: const Text("Removed"),
              trailing: IconButton(
                  onPressed: () {
                    removeItem(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.purple,
                  )),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedList(
          key: _key,
          initialItemCount: 0,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              key: UniqueKey(),
              child: Card(
                elevation: 0,
                color: Colors.grey.shade200,
                shape: const RoundedRectangleBorder(),
                child: ListTile(
                  title: Text(item[index]),
                  trailing: IconButton(
                      onPressed: () {
                        removeItem(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.purple,
                      )),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
