import 'package:family/pages/list_member.dart';
import 'package:flutter/material.dart';
import 'package:family/pages/family_setting.dart';
import 'package:theme/theme.dart';

class FamilyMember extends StatelessWidget {
  const FamilyMember({Key? key}) : super(key: key);
  static const routeName = '/family_member';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: context.colors.surface,
            title: const Text("Keluarga Ahmad",
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, FamilySetting.routeName);
                },
              )
            ],
            bottom: TabBar(
                indicatorColor: Colors.purple.shade500,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Member"),
                  Tab(
                    text: "Informasi",
                  )
                ]),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        tileColor: context.colors.onSurfaceVariant,
                        leading: Icon(Icons.person),
                        title: Text(
                          allMember[index].name,
                          style: context.titleMedium
                              ?.copyWith(color: context.colors.onBackground),
                        ),
                        subtitle: Text(
                          allMember[index].status,
                          style: context.bodyMedium?.copyWith(
                              color: context.colors.onSurfaceVariant),
                        ),
                        trailing: Icon(Icons.emoji_emotions),
                      ),
                    ),
                  );
                },
                itemCount: allMember.length,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: context.colors.onSurfaceVariant,
                    leading: Icon(Icons.abc),
                    title: Text("Dibuat oleh",
                        style: context.titleMedium
                            ?.copyWith(color: context.colors.onBackground)),
                    subtitle: Text("Ahmad Udin",
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onSurfaceVariant)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: context.colors.onSurfaceVariant,
                    leading: Icon(Icons.date_range),
                    title: Text("Tanggal dibuat",
                        style: context.titleMedium
                            ?.copyWith(color: context.colors.onBackground)),
                    subtitle: Text("21 November 2022",
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onSurfaceVariant)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: context.colors.onSurfaceVariant,
                    leading: Icon(Icons.abc),
                    title: Text("Kode keluarga",
                        style: context.titleMedium
                            ?.copyWith(color: context.colors.onBackground)),
                    subtitle: Text("ABC123",
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onSurfaceVariant)),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
