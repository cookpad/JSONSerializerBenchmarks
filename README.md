# Rails JSON Serializer Benchmarks

This repo contains a simplified Ruby on Rails app that implements various JSON serialization libraries. The application also contains a simple suite of tools to run benchmarks (via Apache Bench (ab)).

## Benchmark

The benchmark will test implementations of following serialization libraries:

- [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers) (Current solution)
- [Alba](https://github.com/okuramasafumi/alba)
- [Blueprinter](https://github.com/procore/blueprinter)
- [JBuilder](https://github.com/rails/jbuilder)
- [Panko](https://github.com/panko-serializer/panko_serializer)

Each controller endpoint has been [defined to be as similar as possible](spec/support/shared_examples.rb), in terms of the data that is loaded and rendered in the request body.

## Benchmark results

The results below were gathered from running the benchmark script (`bin/benchmark`) on my local development machine, while running the Rails application in production mode.

### Environment spec

``` txt
Rails version: 6.1.4.1
Ruby version: ruby 2.7.4p191
MySQL version: 5.7.36
```

### Machine spec

``` txt
MacBook Pro (16-inch, 2019)
2.4 GHz 8-Core Intel Core i9
64 GB 2667 MHz DDR4
```


### Abbreviated results

``` txt
Test:   alba                            11.189 seconds
Test:   panko                           11.677 seconds
Test:   blueprinter                     12.146 seconds
Test:   j_builder                       16.978 seconds
Test:   active_model_serializers        21.035 seconds
```

### Full results

Full results from each benchmark can be found in the [`benchmarks`](./benchmarks) directory.

- [./benchmarks/alba.txt](./benchmarks/alba.txt)
- [./benchmarks/panko.txt](./benchmarks/panko.txt)
- [./benchmarks/blueprinter.txt](./benchmarks/blueprinter.txt)
- [./benchmarks/j_builder.txt](./benchmarks/j_builder.txt)
- [./benchmarks/active_model_serializers.txt](./benchmarks/active_model_serializers.txt)

## Results with OJ

As an optional extra benchmark, I added the OJ gem and [set this as the default JSON library](https://github.com/ohler55/oj/blob/develop/pages/Rails.md). This is disabled by default, but can be activated by setting the ENV variable `OJ` when running the application server. Applying OJ is clearly beneficial, but also yields results in a different order.

```
Test:   panko                           9.579 seconds
Test:   alba                            11.034 seconds
Test:   blueprinter                     12.104 seconds
Test:   j_builder                       13.994 seconds
Test:   active_model_serializers        17.874 seconds
```

## Results with ActionController::API

As an optional extra benchmark, I added a feature flag to use `ActionController::API` as a base class, instead of `ActionController::Base`. This is disabled by default, but can be activated by setting the ENV variable `API_MODE` when running the application server. Changing the base class for `ApplicationController` provided a fairly unremarkable enhancement compared to `ActionController::Base`.

```
Test:   alba                            11.118 seconds
Test:   panko                           11.757 seconds
Test:   blueprinter                     11.946 seconds
Test:   j_builder                       17.020 seconds
Test:   active_model_serializers        20.867 seconds
```
