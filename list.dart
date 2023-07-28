class ListWidget extends StatefulWidget {
  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  var list = <Item>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i <= 100; i++) {
      list.add(Item(id: i, count: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => ListItemWidget(item: list[index]),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({
    required this.item,
    super.key,
  });

  final Item item;

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text('${widget.item.id} - ${widget.item.count}'),
          MaterialButton(
            onPressed: () {
              setState(
                () {
                  widget.item.count++;
                },
              );
            },
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}

class Item {
  int id;
  int count;

  Item({
    required this.id,
    required this.count,
  });
}
