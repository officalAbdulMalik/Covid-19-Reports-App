import 'package:covid19/model/country_state_model.dart';

class CountryControler {
  static final CountryStateModel countryStateModel = CountryStateModel(
      updated: 0,
      country: '',
      countryInfo:
          CountryInfo(id: 0, iso2: '', iso3: '', lat: 0, long: 0, flag: ''),
      cases: 0,
      todayCases: 0,
      deaths: 0,
      todayDeaths: 0,
      recovered: 0,
      todayRecovered: 0,
      active: 0,
      critical: 0,
      casesPerOneMillion: 0,
      deathsPerOneMillion: 0,
      tests: 0,
      testsPerOneMillion: 0,
      population: 0,
      continent: 0,
      oneCasePerPeople: 0,
      oneDeathPerPeople: 0,
      oneTestPerPeople: 0,
      activePerOneMillion: 0,
      recoveredPerOneMillion: 0,
      criticalPerOneMillion: 0);
}
