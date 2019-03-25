require 'minitest/autorun'
require 'json'
require 'json_thermostat'

describe "unit support for thermostat" do

  i_suck_and_my_tests_are_order_dependent!

  it "should work without providing units" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 20.0})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should accept settings in Celsius" do
    settings = JSON.generate({temperature: 20.0, range: 1.0, unit: "celsius"})
    measurement = JSON.generate({temperature: 20.0})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should accept settings in Fahrenheit" do
    settings = JSON.generate({temperature: 68.0, range: 1.8, unit: "fahrenheit"})
    measurement = JSON.generate({temperature: 20.0})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should accept settings in Kelvin" do
    settings = JSON.generate({temperature: 293.15, range: 1.0, unit: "kelvin"})
    measurement = JSON.generate({temperature: 20.0})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should accept measurements in Celsius" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 20.0, unit: "celsius"})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should accept measurements in Fahrenheit" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 68.0, unit: "fahrenheit"})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

  it "should accept measurements in Kelvin" do
    settings = JSON.generate({temperature: 20.0, range: 1.0})
    measurement = JSON.generate({temperature: 293.15, unit: "kelvin"})
    expected_result = JSON.generate({cooling: false, heating: false})

    thermostat = JSONThermostat.new settings
    result = thermostat.update measurement

    result.must_equal expected_result
  end

end
