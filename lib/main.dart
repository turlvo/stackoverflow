import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return TasksList(
      tasks: [
        {
          'id': '123',
          'title': 'title1',
          'desc': 'desc',
        },
        {
          'id': '333',
          'title': 'title2',
          'desc': 'descasdfkjsklfjklasdjfklajsldkfalskdfj',
        }
      ],
    );
  }
}

class TasksList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  const TasksList({
    Key key,
    @required this.tasks,
  }) : super(key: key);

  // void _cancelOrDeleteCallBack(BuildContext ctx, Task task) {
  //   task.isCancelled == false
  //       ? ctx.read<TodosBloc>().add(CancelTask(task: task))
  //       : ctx.read<TodosBloc>().add(DeleteTask(task: task));
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        // behavior: HitTestBehavior.translucent,
        child: ExpansionPanelList.radio(
          elevation: 3,
          children: tasks
              .map(
                (task) => ExpansionPanelRadio(
                  headerBuilder: (context, isOpen) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.favorite),
                        Expanded(
                          child: Text(
                            task['desc'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.add_box),
                        Icon(Icons.bug_report_rounded),
                      ],
                    ),
                  ),
                  body: ListTile(
                    title: SelectableText(
                      'Task:\n${task['title']}\n\nDescription:\n${task['desc']}',
                      toolbarOptions: const ToolbarOptions(
                        copy: true,
                        selectAll: true,
                        cut: true,
                      ),
                    ),
                  ),
                  value: Text(task['id']),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
