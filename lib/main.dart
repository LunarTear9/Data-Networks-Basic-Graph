import  'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp(const diktyaPacketGraph());

}



// ignore: camel_case_types
class diktyaPacketGraph extends StatefulWidget {
  const diktyaPacketGraph({super.key});

  @override
  State<diktyaPacketGraph> createState() => _diktyaPacketGraphState();
  
}

// ignore: camel_case_types
class _diktyaPacketGraphState extends State<diktyaPacketGraph> {
  
 
  @override
  Widget build(BuildContext context) {
    
    // ignore: sort_child_properties_last
    return MaterialApp(home:Scaffold(body:Center(child: Container(height:double.infinity,width: double.infinity,child:SfCartesianChart(
              primaryXAxis: const CategoryAxis(borderColor: Colors.white,title: AxisTitle(text: 'Packet Number',textStyle: TextStyle(color: Colors.white)),labelStyle: TextStyle(color: Colors.white),),
              primaryYAxis: const CategoryAxis(borderColor: Colors.white,title: AxisTitle(text: 'ms',textStyle: TextStyle(color: Colors.white)),labelStyle: TextStyle(color: Colors.white)),
             
              title: const ChartTitle(text: 'Jitter',textStyle: TextStyle(color: Colors.white)),
             
              legend: const Legend(isVisible: true,textStyle: TextStyle(color: Colors.white)),
             
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_PacketData, String>>[
                LineSeries<_PacketData, String>(
                  color: Colors.white,
                    dataSource: repeatData(),
                    xValueMapper: (_PacketData no, _) => no.number,
                    yValueMapper: (_PacketData ms, _) => ms.ms,
                    name: 'Jitter Graph (ms)',
                  
                    dataLabelSettings: const DataLabelSettings(isVisible: true,color: Colors.white))
              ]),decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/newsdit.png"),fit: BoxFit.fill),color: Colors.black)))),debugShowCheckedModeBanner: false,);
  }
dynamic repeatData() {


  List<_PacketData> data = [];

List<int> timeMs = [14, 12, 13, 14, 13, 13, 12, 13, 13, 14, 13, 14, 13, 13, 13, 12, 13, 13, 13, 14, 13, 12, 13, 13, 12, 12, 13, 13, 14, 14, 12, 14, 13, 13, 14, 13, 13, 13, 12, 13, 12, 13, 12, 13, 13, 13, 13, 15, 12, 14];
  for (int i = 1;i<=49;i++){
  data.add(_PacketData('$i', timeMs[i-1]));
  if (i == 49){
  return data;
  }
}
  }

  

  
}

class _PacketData {
  _PacketData(this.number, this.ms);

  final String number;
  final int ms;
}