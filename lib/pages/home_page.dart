// import 'package:espaco_infantil/controllers/theme_controller.dart';
import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/theme_controller.dart';
import '../widgets/aluno_grid.dart';
import '../widgets/drawer_widget.dart';
import 'add_alunos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.to;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<AlunosRepository>(
      context,
      listen: false,
    ).loadAlunos().then((value) => {
          setState(() {
            _isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Espaço Infantil"),
        backgroundColor: Colors.pinkAccent,
        // actions: [
        //   const Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(Icons.login),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(Icons.find_replace_rounded),
        //   ),
        //   PopupMenuButton(
        //     child: const Icon(Icons.more_vert),
        //     itemBuilder: (_) => [
        //       PopupMenuItem(
        //           child: ListTile(
        //         leading: Obx(() => controller.isDark.value
        //             ? const Icon(Icons.brightness_7)
        //             : const Icon(Icons.brightness_2)),
        //         title: Obx(
        //           () => controller.isDark.value
        //               ? const Text('Light')
        //               : const Text('Dark'),
        //         ),
        //         onTap: () => controller.changeTheme(),
        //       ))
        //     ],
        //   )
        // ],
      ),
      drawer: const DrawerWidget(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/val.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  const SizedBox(height: 10),
                  const AlunoGrid(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddAlunosPage(),
            ),
          );
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add_reaction),
      ),
    );
  }
}
