import 'package:covid19/controler/app_cubit/country_state_fetch_cubit.dart';
import 'package:covid19/model/AppModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import '../controler/app_cubit/world_state_fetch_cubit.dart';
import '../controler/controler.dart';
import 'country_trace_screen.dart';
import 'cutom_widget/app_custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

AppModel model = CountryControler.model;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<WorldStateFetchCubit>().getWorldStateData();
    super.initState();
  }

  @override
  final List<Color> list = [
    Colors.greenAccent,
    Colors.red,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Record'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: BlocConsumer<WorldStateFetchCubit, WorldStateFetchState>(
        listener: (context, state) {
          if (state is WorldLStateFetchLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Data Loading')));
          } else if (state is WorldStateFetchError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.Error)));
          } else if (state is WorldStateFetchLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data Loadaed SucsseFul')));
          } else {}
        },
        builder: (context, state) {
          if (state is WorldLStateFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WorldStateFetchLoaded) {
            return ListView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              children: [
                const SizedBox(
                  height: 80,
                ),
                PieChart(
                  chartRadius: 115.0,
                  dataMap: {
                    "Totals,": double.parse(model.cases.toString()),
                    "Record": double.parse(model.recovered.toString()),
                    "Deaths": double.parse(model.deaths.toString()),
                  },
                  centerTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  colorList: list,
                  chartType: ChartType.ring,
                  baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                  animationDuration: const Duration(seconds: 5),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesInPercentage: true,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                SizedBox(
                  height: 280,
                  child: Card(
                    color: Colors.blue.shade50,
                    elevation: 5.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        children: [
                          AppCustomWidgt.reusableRow(
                              title: 'Total', value: model.cases!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'Record', value: model.recovered!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'Deaths', value: model.deaths!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'Active', value: model.active!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'AffectedCountries',
                              value: model.affectedCountries!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'Critical',
                              value: model.critical!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'OneCasePerPeople',
                              value: model.oneCasePerPeople!.toInt()),
                          const Divider(),
                          AppCustomWidgt.reusableRow(
                              title: 'casesPerOneMillion',
                              value: model.casesPerOneMillion!.toInt()),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Country();
                      }));
                    },
                    child: const Text(
                      'Track Countries',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )),
                ),
              ],
            );
          } else if (state is WorldStateFetchError) {
            return RefreshIndicator(
              onRefresh: () =>
                  context.read<WorldStateFetchCubit>().getWorldStateData(),
              child: ListView(
                children: [],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
