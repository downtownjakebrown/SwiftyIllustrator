<img src="./Images/swiftyIllustrator.png" height="200"/>

# SwiftyIllustrator

A tool for quickly converting Adobe Illustrator shapes into SwiftUI code.

## Description

This tool utilizes the built-in scripting of Adobe Illustrator ("AI") to convert shapes drawn with AI into swift code. The included [javascript](./Illustrator/IllustratorToSwiftUIShape.js) iterates over each point of an AI shape and converts the shape into a series of CGPaths that are wrapped in a SwiftUI view for easy implementation into your XCode project. 

## Installation

Just grab a copy of this repo.

## Usage Outline

1) Create a custom shape or shapes in the included [AI file](./Illustrator/ExampleIllustratorContent.ai)
2) Center the custom shape(s) on the artboard
3) Select the custom shape(s) to be converted to swift code
4) Run the included [javascript](./Illustrator/IllustratorToSwiftUIShape.js) using Illustrator's built in scripting (for more info, see [Adobe's guide](https://www.adobe.com/devnet/illustrator/scripting.html))
5) Save the script's output text as a .swift file
6) Import the .swift file into your XCode project
7) Implement the generated SwiftUI view as you please

## Detailed Usage Example

In this example, we'll be converting the SwiftyIllustrator icon (drawn using AI) into an animated SwiftUI view.

* To begin, open the included [AI file](./Illustrator/ExampleIllustratorContent.ai), which has the SwiftyIllustrator icon already drawn on the artboard.

## Caveats

* TBD

## Other Info

This project was tested using: 
* Illustrator 24.2
* XCode 12.2

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
