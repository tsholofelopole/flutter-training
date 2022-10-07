import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:lists_and_then_some/nav_tester/screen_one.dart';
import 'package:lists_and_then_some/parent_screen.dart';
import 'package:lists_and_then_some/widgets/my_widget.dart';
import 'package:lists_and_then_some/widgets/clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'bar graph test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Sales {
  int sales;
  String year;
  Sales(this.sales, this.year);
}

class _MyHomePageState extends State<MyHomePage> {

  Widget chartToRun() {
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();

    chartOptions = const ChartOptions(
      dataContainerOptions: DataContainerOptions(
        startYAxisAtDataMinRequested: true,
      ),
    );

    chartData = ChartData(
      dataRows: const [
        [20.0, 25.0, 30.0, 35.0, 40.0, 20.0],
        [35.0, 40.0, 20.0, 25.0, 30.0, 20.0],
      ],
      xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      dataRowsLegends: const [
        'Off zero 1',
        'Off zero 2',
      ],
      chartOptions: chartOptions,
    );
    var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var verticalBarChart = VerticalBarChart(
     //size: const Size(100.0, 100.0),
      painter: VerticalBarChartPainter(
        verticalBarChartContainer: verticalBarChartContainer,
      ),
    );
    return verticalBarChart;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Display chart data'),
            MyWidget(),
            Clock(),
            TextButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenOne()));
            }, child: Text('Test Navigation and global state')),
            SizedBox(height: 20,),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ParentScreen()));
            }, child: Text('Go to parent')),
            SizedBox(height: 20,),
            Expanded(child: chartToRun())
          ],
        ),
      ),
    );
  }
}
