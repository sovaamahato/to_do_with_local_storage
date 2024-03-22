import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textController = TextEditingController();
  var myValue = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text(
            "bcoz i've used shared preferences only the last value you've added will last here once you close the app",
            style: TextStyle(color: Color.fromARGB(255, 148, 142, 124)),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: textController,
            decoration: InputDecoration(
                label: const Text("name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  myValue.add(textController.text);
                });
                var prefs = await SharedPreferences.getInstance();
                prefs.setString("name", textController.text.toString());

                textController.clear();
              },
              child: const Text("Save")),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: myValue.length,
              // prototypeItem: ListTile(
              //   title: Text(myValue.first),
              // ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(myValue[index]),
                );
              },
            ),
          )
          //(myValue),
        ]),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getValue = prefs.getString("name");
    myValue.add(getValue ?? "no value");
    setState(() {});
  }
}
