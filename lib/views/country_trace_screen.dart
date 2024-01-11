import 'package:covid19/controler/app_cubit/country_state_fetch_cubit.dart';
import 'package:covid19/controler/country_controler.dart';
import 'package:covid19/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  TextEditingController controller = TextEditingController();

  var date = CountryControler.countryStateModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryStateFetchCubit(),
      child: Scaffold(
        body: BlocBuilder<CountryStateFetchCubit, CountryStateFetchState>(
            builder: (context, state) {
          if (state is CountryStateFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountryStateFetchLoaded) {
            return ListView(
              padding: const EdgeInsets.only(left: 10, right: 10),
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 30,
                  child: TextFormField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search Country',
                    ),
                  ),
                ),
                SizedBox(
                  height: 800,
                  width: 500,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: date.country.length,
                      itemBuilder: (context, int index) {
                        String name = date.country;
                        if (name.isEmpty) {
                          return Card(
                            child: ListTile(
                                title: Text(date.country[index]),
                                subtitle: Text(date.cases.toString()),
                                trailing: Text(date.deaths.toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                      date.countryInfo.flag[index]),
                                )),
                          );
                        } else if (name
                            .toLowerCase()
                            .startsWith(controller.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(
                                  data: date,
                                  index: index,
                                );
                              }));
                            },
                            child: Card(
                              child: ListTile(
                                  title: Text(date.country[index]),
                                  subtitle:
                                      Text(date.country[index].toString()),
                                  trailing: Text(date.deaths.toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        date.countryInfo.flag[index]),
                                  )),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                )
              ],
            );
          } else if (state is CountryStateFetchError) {
            return const Text('Have Some Error');
          } else {
            return Container(
              color: Colors.red,
            );
          }
        }),
      ),
    );
  }
}
