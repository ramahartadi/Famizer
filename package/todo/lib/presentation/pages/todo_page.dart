import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme/theme.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> entries = <String>['Belanja', 'PR'];
  // final List<String> entries = <String>[];
  final List<String> entries2 = <String>[
    'Belanja untuk kebutuhan makan malam acara malam ini',
    'Tugas rumah yang harus dilakukan'
  ];
  final List<String> entries3 = <String>['5', '15'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Daftar Tugas"),
      ),
      body: entries.isEmpty
          ? Center(
              child: Container(
                  width: 265,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/image/Group 18.svg',
                        package: 'todo',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Tidak ada daftar tugas',
                          style: context.titleMedium
                              ?.copyWith(color: context.colors.onBackground)),
                      Text(
                        'Tambahkan tugas anda dengan menekan tombol tambahkan di bawah',
                        style: context.bodyMedium
                            ?.copyWith(color: context.colors.onBackground),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    color: context.colors.surfaceVariant,
                    child: ListTile(
                      // tileColor: context.colors.surfaceVariant,
                      title: Text('${entries[index]}',
                          style: context.titleMedium
                              ?.copyWith(color: context.colors.onBackground)),
                      subtitle: Text('${entries2[index]}',
                          style: context.bodyMedium?.copyWith(
                              color: context.colors.onSurfaceVariant)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${entries3[index]} tugas',
                              style: context.bodyMedium?.copyWith(
                                  color: context.colors.onSurfaceVariant)),
                        ],
                      ),
                      onTap: () {},
                      isThreeLine: true,
                    ),
                  ),
                );
              }),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 12, bottom: 52),
        child: FloatingActionButton(
          backgroundColor: context.colors.primaryContainer,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const addPage()),
            );
          },
          child: Icon(
            Icons.add,
            color: context.colors.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

class addPage extends StatelessWidget {
  const addPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TodoDetail()),
                );
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Nama Daftar Tugas'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Deskripsi'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: Text('Terlihat untuk:'),
              subtitle: Text('Here is a second line'),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Icon(Icons.drag_handle),
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('Siapa yang bisa melihat list ini?'),
                            ),
                            ListTile(
                              leading: Icon(Icons.lock_outline),
                              title: Text('Hanya saya'),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_outlined),
                              title: Text('Semua orang di keluarga ini'),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_add_outlined),
                              title: Text('Anggota spesifik'),
                              onTap: () => {
                                Navigator.pop(context),
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(28),
                                          topLeft: Radius.circular(28)),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: Icon(Icons.drag_handle),
                                              width: double.infinity,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text('Pilih Anggota'),
                                            ),
                                            ListTile(
                                              leading: FlutterLogo(),
                                              title: Text('Ahmad'),
                                              trailing: Icon(Icons.add),
                                            ),
                                            ListTile(
                                              leading: FlutterLogo(),
                                              title: Text('Fathur'),
                                              trailing: Icon(Icons.close),
                                            ),
                                            SizedBox(
                                              height: 52,
                                            )
                                          ],
                                        ),
                                      );
                                    })
                              },
                            ),
                            SizedBox(
                              height: 52,
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class TodoDetail extends StatefulWidget {
  const TodoDetail({super.key});

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  List<int> items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const editTodoPage()),
              );
            },
            icon: SvgPicture.asset(
              'assets/icon/mode_edit_24px.svg',
              package: 'todo',
            ),
          )
        ],
      ),
      body: Container(
        child: Column(children: [
          Container(
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 16, left: 16, top: 4),
              leading: Icon(Icons.add),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.cancel_outlined),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    color: context.colors.errorContainer,
                    child: Icon(
                      Icons.delete_outline,
                      color: context.colors.onErrorContainer,
                    ),
                  ),
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    leading: Icon(Icons.check_box_outline_blank),
                    title: Text(
                      'Item ${items[index]}',
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

class editTodoPage extends StatelessWidget {
  const editTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: Text("Apakah kamu ingin menghapus tugas?",
                                style: context.titleLarge?.copyWith(
                                    color: context.colors.onSurfaceVariant)),
                            content: Text(
                                "Tugas yang dihapus tidak bisa dikembalikan"),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text('Batal',
                                    style: context.bodyMedium?.copyWith(
                                        color: context.colors.primary)),
                              ),
                              TextButton(
                                onPressed: () => {
                                  Navigator.pop(context, 'OK'),
                                  Navigator.of(context).pop(),
                                },
                                child: Text(
                                  'OK',
                                  style: context.bodyMedium
                                      ?.copyWith(color: context.colors.primary),
                                ),
                              ),
                            ],
                          );
                        });
                      }),
                }),
        title: const Text('Pengaturan tugas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TodoDetail()),
                );
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Nama Daftar Tugas'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Deskripsi'),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: context.colors.onSurfaceVariant,
                ),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: Text('Terlihat untuk:'),
              subtitle: Text('Here is a second line'),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Icon(Icons.drag_handle),
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('Siapa yang bisa melihat list ini?'),
                            ),
                            ListTile(
                              leading: Icon(Icons.lock_outline),
                              title: Text('Hanya saya'),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_outlined),
                              title: Text('Semua orang di keluarga ini'),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_add_outlined),
                              title: Text('Anggota spesifik'),
                              onTap: () => {
                                Navigator.pop(context),
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(28),
                                          topLeft: Radius.circular(28)),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: Icon(Icons.drag_handle),
                                              width: double.infinity,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text('Pilih Anggota'),
                                            ),
                                            ListTile(
                                              leading: FlutterLogo(),
                                              title: Text('Ahmad'),
                                              trailing: Icon(Icons.add),
                                            ),
                                            ListTile(
                                              leading: FlutterLogo(),
                                              title: Text('Fathur'),
                                              trailing: Icon(Icons.close),
                                            ),
                                            SizedBox(
                                              height: 52,
                                            )
                                          ],
                                        ),
                                      );
                                    })
                              },
                            ),
                            SizedBox(
                              height: 52,
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: context.colors.primary,
              minimumSize: Size.fromHeight(40),
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text("Apakah kamu ingin menghapus tugas?",
                            style: context.titleLarge?.copyWith(
                                color: context.colors.onSurfaceVariant)),
                        content:
                            Text("Tugas yang dihapus tidak bisa dikembalikan"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text('Batal',
                                style: context.bodyMedium
                                    ?.copyWith(color: context.colors.primary)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: Text(
                              'OK',
                              style: context.bodyMedium
                                  ?.copyWith(color: context.colors.primary),
                            ),
                          ),
                        ],
                      );
                    });
                  });
            },
            child: const Text('Hapus Tugas'),
          ),
        ]),
      ),
    );
  }
}
