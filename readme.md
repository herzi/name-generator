# Name Generator for Swift

[![Swift](https://github.com/herzi/name-generator/actions/workflows/swift.yml/badge.svg)](https://github.com/herzi/name-generator/actions/workflows/swift.yml)

🐳 Docker's random name generator, ported to Swift.

## Usage

In order to use the name generator, add the package to your project's dependencies:

```
    dependencies: [
        …,
        // 🐳 Docker's random name generator, ported to Swift
        .package(url: "https://github.com/herzi/name-generator.git", revision: "0dbb49f"),
    ]
```

Then add the module to your target's dependencies:

```
            dependencies: [
                …,
                .product(name: "NameGenerator", package: "name-generator"),
            ]
```

Finally, in the source file that should use the name generator, import the package:

```
import NameGenerator
```

And use the name generator to create a random name like this:

```
   func demo () {
      let generator = NameGenerator()
      let name = generator.generateName()
      print("random name:", name)
   }
```
