# Responsibility analysis v0.3

## UML class diagram

<!-- TODO: place UML class diagram image here -->
<!-- You can use Lucidchart or ASCII generators (https://ozh.github.io/ascii-tables/) -->

```text
+-------------------+
|       Gear        |
+-------------------+
| + initialize(...) |
| + ratio()         |
| + gear_inches()   |
+-------------------+
```

## Class and method descriptions

Describe all classes and methods (public and private) with a single sentence.

<!-- TODO: Remove examples and replace with actual descriptions -->

### `Gear` class

The `Gear` class is responsible for making calculations when using different gears

Method | Description
--- | ---
`initialize` | saves arguments as instance variables
`ratio` | calculate the ratio between two gears
`gear_inches` | calculate the effect of the wheel size on gears ratios

## Multiple responsibilities

Pick the methods and classes from the listing above that contains multiple responsibilities and describe why (and how you could solve this)

* `gear_ratios`: Wheels have nothing to do with gears. They are two separate things and should be split into multiple classes.