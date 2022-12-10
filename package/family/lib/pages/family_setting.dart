import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FamilySetting extends StatefulWidget {
  const FamilySetting({Key? key}) : super(key: key);
  static const routeName = '/family_setting';

  @override
  State<FamilySetting> createState() => _FamilySettingState();
}

class _FamilySettingState extends State<FamilySetting> {  

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
        backgroundColor: context.colors.surface,
        title:
            const Text("Keluarga Ahmad", style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.done,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Isi dengan nama keluarga baru",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
