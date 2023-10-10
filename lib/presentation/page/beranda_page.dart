import 'package:flutter/material.dart';
import 'package:flutter_bni_sdd/data/model/chart_model.dart';
import 'package:flutter_bni_sdd/data/model/promo_model.dart';
import 'package:flutter_bni_sdd/data/service/service.dart';
import 'package:flutter_bni_sdd/presentation/page/detail_promo.dart';
import 'package:flutter_bni_sdd/presentation/style/color_style.dart';
import 'package:flutter_bni_sdd/presentation/style/font_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<PromoModel> data = [];
  List<ChartData> chartData = [];
  TooltipBehavior _tooltip = TooltipBehavior();
  final List<SalesData> LineData = [
    SalesData("Jan", 3),
    SalesData("Feb", 7),
    SalesData("Mar", 8),
    SalesData("Apr", 10),
    SalesData("Mei", 5),
    SalesData("Jun", 10),
    SalesData("Jul", 1),
    SalesData("Agt", 3),
    SalesData("Sep", 5),
    SalesData("Okt", 10),
    SalesData("Nov", 7),
    SalesData("Des", 7),
  ];

  @override
  void initState() {
    chartData = [
      ChartData('Tarik Tunai', 55),
      ChartData('QRIS Payment', 31),
      ChartData('Topup Gopay', 7.7),
      ChartData('Lainya', 6.3)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
    PromoService().getDummyData().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
          child: Container(
              height: 100,
              child: Card(
                color: StyleColors.primaryColors40,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.wallet_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saldo anda",
                                style: FontsStyle.fontRegular400.copyWith(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                "Rp 150.000",
                                style: FontsStyle.fontBold600.copyWith(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Riwayat",
                            style: FontsStyle.fontRegular400
                                .copyWith(color: Colors.white, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 18,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Promo",
            style: FontsStyle.fontMedium500.copyWith(fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...data.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 180,
                      width: 400,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPromo(
                                          promo: e,
                                        )));
                          },
                          child: Image.network(e.img!.url!)),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Text(
            "Portofolio",
            style: FontsStyle.fontMedium500.copyWith(fontSize: 18),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              child: SfCircularChart(
                legend: Legend(
                    textStyle: FontsStyle.fontMedium500,
                    isVisible: true,
                    position: LegendPosition.left),
                tooltipBehavior: _tooltip,
                series: <CircularSeries<ChartData, String>>[
                  DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    dataLabelSettings: DataLabelSettings(
                      margin: EdgeInsets.fromLTRB(0, 1, 1, 1),
                      textStyle: FontsStyle.fontMedium500
                          .copyWith(color: Colors.white),
                      isVisible: true,
                    ),
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  )
                ],
              ),
            )),
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<SalesData, String>>[
                BarSeries<SalesData, String>(
                    dataSource: LineData,
                    xValueMapper: (SalesData data, _) => data.x,
                    yValueMapper: (SalesData data, _) => data.y,
                    name: 'Gold',
                    color: Color.fromRGBO(8, 142, 255, 1))
              ])),
        )
      ],
    );
  }
}
