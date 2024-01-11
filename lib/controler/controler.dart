import 'package:covid19/model/AppModel.dart';

class CountryControler {
  static AppModel model = AppModel(
    active: 0,
    activePerOneMillion: 0,
    affectedCountries: 0,
    cases: 0,
    casesPerOneMillion: 0,
    critical: 0,
    criticalPerOneMillion: 0,
    deaths: 0,
    deathsPerOneMillion: 0,
    oneCasePerPeople: 0,
    oneDeathPerPeople: 0,
    oneTestPerPeople: 0,
    population: 0,
    recovered: 0,
    recoveredPerOneMillion: 0,
    tests: 0,
    testsPerOneMillion: 0,
    todayCases: 0,
    todayDeaths: 0,
    todayRecovered: 0,
    updated: 0,
  );
}
