# cocoapods-swift-modular-headers

Cocoapods plugin to automatically enable modular headers for dependencies of Swift pods.

## Demo

https://github.com/user-attachments/assets/f2713109-bb6d-42e1-a18d-f8546ddbb8bd

## Motivation

When using Swift pods, sometimes theird party dependencies are not built with modular headers enabled. This can cause issues when importing the module in Swift code. This plugin automatically enables modular headers for all dependencies of Swift pods.

It solves this issue: 

```
The Swift pod `name` depends upon `Dependency`, which do not define modules. To opt into those targets generating module maps (which is necessary to import them from Swift when building as static libraries), you may set `use_modular_headers!` globally in your Podfile, or specify `:modular_headers => true` for particular dependencies.
```

One of the workarounds is to either use static frameworks or enable modular headers globally in the Podfile. This plugin allows you to selectively enable modular headers for dependencies of Swift pods without enabling it globally.

You could also enable modular headers for a specific dependency by adding `:modular_headers => true` to the pod declaration. This plugin automates this process.

## How it works

The plugin hooks into the pre-install phase of the pod install command. It analyzes the pod dependencies and enables modular headers for all dependencies of Swift pods.

## Installation

Inside of your project's Gemfile add:

```ruby
gem 'cocoapods-swift-modular-headers', :git => ':git => "git://github.com/okwasniewski/cocoapods-swift-modular-headers.git"'
```

Then run:

```
bundle install
```

## Usage

Inside of your Podfile add:

```ruby
plugin 'cocoapods-swift-modular-headers'

# Above target declarations
apply_modular_headers_for_swift_dependencies()
```

And re-run the pod install command. The plugin will automatically enable modular headers for all dependencies of Swift pods.

If you already have some pre-install hooks, you can add the plugin to the existing hooks:

```ruby
plugin 'cocoapods-swift-modular-headers'

# Above target declarations
pre_install do |installer|
  apply_modular_headers_for_swift_dependencies(installer)
end
```

For Expo projects, this can be automated by using Expo Config Plugins. (TODO)
