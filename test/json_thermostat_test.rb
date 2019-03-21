require 'minitest/autorun'
require 'json_thermostat'

describe "JSONThermostat" do

  i_suck_and_my_tests_are_order_dependent!

  it "should turn everything off when temperature is ok" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 200.0})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should turn on the heating when temperature is to cold" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 19.49})
    expected_result = JSON.generate({cooling: false, heating: true})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should turn on the cooling when temperature is to hot" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 20.51})
    expected_result = JSON.generate({cooling: true, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should turn everything off when temperature is to hot, but within range" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 20.49})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should turn everything off when temperature is to cold, but within range" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 19.51})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end
end
