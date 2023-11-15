import 'package:flutter/material.dart';
import 'package:klabs/providers/sheetsProvider.dart';
import 'package:provider/provider.dart';

class Tc01 extends StatefulWidget {
  const Tc01({super.key,});
  @override
  State<Tc01> createState() => _Tc01State();
}

class _Tc01State extends State<Tc01> {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        body: Column(children: [
          Hero(
            tag: 'image $index',
            child: Image.asset('assets/images/tc-01.jpg', height: 400,)),
      Expanded(
        child: ChangeNotifierProvider(
            create: (_) => SheetData(), child: const ListRow()),
      )
    ]));
  }
}

class ListRow extends StatefulWidget {
  const ListRow({
    super.key,
  });
  @override
  State<ListRow> createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SheetData>(
        builder: (context, value, child) => Container(
          height: 100,
          child: FutureBuilder(
                future: value.allCleanRows,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.length.toString()),
                        );
                      },
                    );
                  } else if(snapshot.hasError){
                    return const Text("Error loading data");
                  }
                  else{return Text('We wacha');}
                },
              ),
        ));
  }
}
