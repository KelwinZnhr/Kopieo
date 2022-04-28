import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
List<String> toCopy = [
  "2021Y90200035 Ndrianasolo Arlet Kelwin",
];

TextEditingController controller = TextEditingController();

saveStringListValue(List<String> addit) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setStringList("copyList", addit);
}

retrieveStringListValue() async {
  prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("copyList") != null) {
    List<String> copyList = prefs.getStringList("copyList")!;
    toCopy = copyList;
  }
}

class Kopieo extends StatefulWidget {
  const Kopieo({Key? key}) : super(key: key);

  @override
  State<Kopieo> createState() => _KopieoState();
}

class _KopieoState extends State<Kopieo> {
  @override
  void initState() {
    // saveStringListValue(toCopy);
    // retrieveStringListValue();
    super.initState();
  }

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
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: toCopy[index]));
                            },
                            title: Text(toCopy[index]),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  color: Colors.orange,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: controller,
                                      autocorrect: true,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (() {
                                  print(controller.text);
                                  toCopy.add(controller.text);
                                  print(toCopy);
                                  setState(() {});
                                }),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
