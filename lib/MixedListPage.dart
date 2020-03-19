import 'package:flutter/material.dart';

class MixedListPage extends StatelessWidget {
    List<ItemList> itemsList = List<ItemList>.generate(
        10,
        (i) => i % 6 == 0 ? HeadingItem("Heading $i") : MessageItem("Sender $i", "Message Body $i"),
    );

    @override
    Widget build(BuildContext context) {
        print("ItemList : " + itemsList.toString());

        return ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
                final item = itemsList[index];

                return ListTile(
                    title: item.buildTitle(context),
                    subtitle: item.buildSubtitle(context),
                );
            },
        );
    }
}

abstract class ItemList {
    Widget buildTitle(BuildContext context);

    Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ItemList {
    final String heading;

    HeadingItem(this.heading);

    Widget buildTitle(BuildContext context) {
        return Text(
            heading,
            style: Theme.of(context).textTheme.headline,
        );
    }

    Widget buildSubtitle(BuildContext context) => null;
}

class MessageItem implements ItemList {
    final String sender;
    final String body;

    MessageItem(
        this.sender,
        this.body
    );

    Widget buildTitle(BuildContext context) => Text(sender);
    Widget buildSubtitle(BuildContext context) => Text(body);
}