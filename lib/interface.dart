import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> toCopy = [
  "2021Y90200035 Ndrianasolo Arlet Kelwin",
];

class Kopieo extends StatelessWidget {
  const Kopieo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a text to copy"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: toCopy[index]));
                },
                title: Text(toCopy[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
