# Samtrafiken API

[![Build Status](https://travis-ci.org/hannesl/samtrafiken_api.png)](https://travis-ci.org/hannesl/samtrafiken_api)

This gem is a thin wrapper around the 
[public transportation web APIs](http://www.trafiklab.se/) provided by 
Samtrafiken. Its classes and methods correspond to the different APIs and their
HTTP endpoints.

Please see the following pages to get an idea of what each API provides.

  * [ResRobot Sök Resa](http://www.trafiklab.se/api/resrobot-sok-resa) 
    (implemented by `SamtrafikenAPI::Resrobot`)
  * [ResRobot Stolptidtabeller](http://www.trafiklab.se/api/resrobot-stolptidtabeller)
    (implemented by `SamtrafikenAPI::ResrobotStops`)
  * [Samtrafiken Stationsinfo](http://www.trafiklab.se/api/samtrafiken-stationsinfo)
    (implemented by `SamtrafikenAPI::Stationinfo`)

The methods return the raw json data provided by the APIs, parsed into Ruby 
objects.

## Usage

You need to sign up with [Trafiklab](http://www.trafiklab.se/) and get API keys
for each of the APIs that you are going to use.

Please see the [class documentation](http://rubydoc.info/gems/samtrafiken_api/)
and the test suite for examples of how the gem is used.

## Testing

Samtrafiken API uses rspec for testing. These environment variables need to be 
defined in order to run the test suite.

* `RESROBOT_API_KEY` – a "Resrobot Sök Resa" API key. See 
  http://www.trafiklab.se/api/resrobot-sok-resa/dokumentation-resrobot-sok-resa-0
* `RESROBOT_STOPS_API_KEY` – a "Resrobot Stolptidtabeller" API key. See 
  http://www.trafiklab.se/api/resrobot-stolptidtabeller/dokumentation-stolptidtabeller
* `STATIONSINFO_API_KEY` – a "Samtrafiken Stationsinfo" API key. See 
  http://www.trafiklab.se/api/samtrafiken-stationsinfo/sammanfattande-dokumentation-stationsinfo

Example:

    RESROBOT_API_KEY=MY-KEY RESROBOT_STOPS_API_KEY=MY-OTHER-KEY STATIONSINFO_API_KEY=MY-THIRD-KEY bundle exec rake test
