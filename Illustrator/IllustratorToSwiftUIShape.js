//
//  IllustratorToSwiftUIShape.js
//
//  Created by Jacob Brown on 10/21/20.
//

// -----------------------------------------------------------------------------
// --- Helpers for Writing to File ---------------------------------------------
// -----------------------------------------------------------------------------
var newLine = "\n";
var tab = "\t";
var tab2 = "\t\t";
var tab3 = "\t\t\t";
var tab4 = "\t\t\t\t";
var tab5 = "\t\t\t\t\t";

// -----------------------------------------------------------------------------
// --- Main --------------------------------------------------------------------
// -----------------------------------------------------------------------------
try {

    // Create a text file for writing out the SwiftUI path data
    var file = File.saveDialog('Convert Illustrator paths to SwiftUI shapes.', 'Path:*.swift');
    file.open('w');

    // Define some helpers
    var aiSelection = app.activeDocument.selection
    var aiSelectionLength = aiSelection.length

    // Make sure an object is selected
    if (aiSelectionLength == 0) {
      throw "At least one path must be selected before running the script."
    }

    // Make sure only paths are selected
    for(j=0; j<aiSelectionLength; j++) {
      if (aiSelection[j].typename !== "PathItem") {
        throw "Only paths may be selected. If any paths are grouped, ungroup them and try again."
      };
    };

    writeHeaderToFile()

    // Write out the SwiftUI view
    writeViewToFile(aiSelectionLength);

    // Get size of entire selection
    app.executeMenuCommand("group");
    var tempSelection = app.activeDocument.selection;
    var maxWidth = Math.round(tempSelection[0].width*100)/100;
    var maxHeight = Math.round(tempSelection[0].height*100)/100;
    app.executeMenuCommand("ungroup");

    // Write out the shape properties (e.g., size)
    writeShapePropertiesToFile(maxWidth, maxHeight);

    // Write out each of the paths
    for(j=0; j<aiSelectionLength; j++) {
      writeShapeElementsToFile(j, aiSelection[j]);
    };

    // Write out the preview block to the file
    writePreviewToFile();

    // Finish up
    alert("Finished! File has been saved to your selected directory.");

} catch(e) {
    // Alert user of the error
    alert(e);
} finally {
    // Finish up
    file.close();
}

// -----------------------------------------------------------------------------
// --- Write Header to File ----------------------------------------------------
// -----------------------------------------------------------------------------
function writeHeaderToFile() {

  file.write(
    "//" + newLine +
    "//  ShapeView.swift" + newLine +
    "//" + newLine +
    "//  Made Using SwiftyIllustrator" + newLine +
    "//  https://github.com/downtownjakebrown/SwiftyIllustrator.git" + newLine +
    "//" + newLine + newLine +
    "import SwiftUI" + newLine + newLine
  );

}

// -----------------------------------------------------------------------------
// --- Write View To File in SwiftUI Format ------------------------------------
// -----------------------------------------------------------------------------
function writeViewToFile(itemCount) {

  file.write(
    "// MARK: - ShapeView" + newLine +
    "struct ShapeView: View {" + newLine + newLine +
    tab + "var body: some View {" + newLine +
    tab2 + "ZStack {" + newLine
  );

  for (s=itemCount; s>0; s--) {
    file.write(
      tab3 + "ShapeElement" + s + "().stroke(lineWidth: 1.0)" + newLine
    );
  };

  file.write(
    tab2 + "}" + newLine +
    tab + "}" + newLine +
    "}" + newLine + newLine
  );

}

// -----------------------------------------------------------------------------
// --- Write Shape Properties To File in SwiftUI Format ------------------------
// -----------------------------------------------------------------------------
function writeShapePropertiesToFile(maxWidth, maxHeight) {

  file.write(
    "// MARK: - ShapeProperties" + newLine +
    "struct ShapeProperties {" + newLine +
    tab + "static let size = CGSize(width: " + maxWidth + ", height: " + maxHeight + ")" + newLine +
    "}" + newLine + newLine
  );

};

// -----------------------------------------------------------------------------
// --- Write Path To File in SwiftUI Format ------------------------------------
// -----------------------------------------------------------------------------
function writeShapeElementsToFile(itemNumber, item) {

  var points = item.pathPoints;
  var length = points.length;
  var shapeNumber = itemNumber + 1

  // Write header
  file.write(
    "// MARK: - ShapeElement" + shapeNumber + newLine +
    "fileprivate struct ShapeElement" + shapeNumber + ": Shape {" + newLine + newLine
  );

  // Write out max dimensions
  file.write(
    tab + "private let baseSize: CGSize = ShapeProperties.size" + newLine + newLine
  );

  // Write out openings
  file.write(
    tab + "func path(in rect: CGRect) -> Path {" + newLine + newLine +
    tab2 + "let basePath = Path { path in" + newLine + newLine
  );

  // Write out anchor points
  for(i=0; i<=length; i++) {

    if (i==0) {

      var anchorX = Math.round(item.pathPoints[0].anchor[0]*100)/100;
      var anchorY = -Math.round(item.pathPoints[0].anchor[1]*100)/100;
      file.write(
        tab3 + "let anchorPoints = [" + newLine +
        tab4 + "CGPoint(x: "+anchorX+", y: "+anchorY+")," + newLine
      );

    } else if (i < length) {

      var anchorX = Math.round(item.pathPoints[i].anchor[0]*100)/100;
      var anchorY = -Math.round(item.pathPoints[i].anchor[1]*100)/100;
      file.write(
        tab4 + "CGPoint(x: "+anchorX+", y: "+anchorY+")," + newLine
      );

    } else {

      var anchorX = Math.round(item.pathPoints[0].anchor[0]*100)/100;
      var anchorY = -Math.round(item.pathPoints[0].anchor[1]*100)/100;
      file.write(
        tab4 + "CGPoint(x: "+anchorX+", y: "+anchorY+")" + newLine +
        tab3 + "]" + newLine + newLine
      );

    };

  };

  // Write out control1 points
  for(i=0; i<length; i++) {

    if (i==0) {

      var control1X = Math.round(item.pathPoints[0].rightDirection[0]*100)/100;
      var control1Y = -Math.round(item.pathPoints[0].rightDirection[1]*100)/100;
      file.write(
        tab3 + "let control1 = [" + newLine +
        tab4 + "CGPoint(x: "+control1X+", y: "+control1Y+")," + newLine
      );

    } else if (i < (length-1)) {

      var control1X = Math.round(item.pathPoints[i].rightDirection[0]*100)/100;
      var control1Y = -Math.round(item.pathPoints[i].rightDirection[1]*100)/100;
      file.write(
        tab4 + "CGPoint(x: "+control1X+", y: "+control1Y+")," + newLine
      );

    } else {

      var control1X = Math.round(item.pathPoints[i].rightDirection[0]*100)/100;
      var control1Y = -Math.round(item.pathPoints[i].rightDirection[1]*100)/100;
      file.write(
        tab4 + "CGPoint(x: "+control1X+", y: "+control1Y+")" + newLine +
        tab3 + "]" + newLine + newLine
      );

    };

  };

  // Write out control2 points
  for(i=1; i<=length; i++) {

    if (i==1) {

      var control2X = Math.round(item.pathPoints[1].leftDirection[0]*100)/100;
      var control2Y = -Math.round(item.pathPoints[1].leftDirection[1]*100)/100;
      file.write(
        tab3 + "let control2 = [" + newLine +
        tab4 + "CGPoint(x: "+control2X+", y: "+control2Y+")," + newLine
      );

    } else if (i < (length)) {

      var control2X = Math.round(item.pathPoints[i].leftDirection[0]*100)/100;
      var control2Y = -Math.round(item.pathPoints[i].leftDirection[1]*100)/100;
      file.write(
        tab4 + "CGPoint(x: "+control2X+", y: "+control2Y+")," + newLine
      );

    } else {

      var control2X = Math.round(item.pathPoints[0].leftDirection[0]*100)/100;
      var control2Y = -Math.round(item.pathPoints[0].leftDirection[1]*100)/100;
      file.write(
        tab4 + "CGPoint(x: "+control2X+", y: "+control2Y+")" + newLine +
        tab3 + "]" + newLine + newLine
      );

    };

  };

  // Create the path using above-defined points
  file.write(
    tab3 + "path.move(to: anchorPoints[0])" + newLine
  );

  for(i=0; i<length; i++) {
    file.write(
      tab3 + "path.addCurve(to: anchorPoints["+(i+1)+"], control1: control1["+i+"], control2: control2["+i+"])" + newLine
    );
  };

  file.write(
    tab3 + "path.closeSubpath()" + newLine + newLine +
    tab2 + "}" + newLine + newLine +

    tab2 + "let rectWidth = rect.size.width" + newLine +
    tab2 + "let rectHeight = rect.size.height" + newLine + newLine +

    tab2 + "let scaleFactor: CGFloat" + newLine +
    tab2 + "let widthRatio = rectWidth/baseSize.width" + newLine +
    tab2 + "let heightRatio = rectHeight/baseSize.height" + newLine +
    tab2 + "if widthRatio < heightRatio {" + newLine +
    tab3 + "scaleFactor = widthRatio" + newLine +
    tab2 + "} else {" + newLine +
    tab3 + "scaleFactor = heightRatio" + newLine +
    tab2 + "}" + newLine + newLine +

    tab2 + "let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)" + newLine +
    tab2 + "let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)" + newLine +
    tab2 + "let combinedTransform = scaleTransform.concatenating(moveTransform)" + newLine + newLine +

    tab2 + "let modifiedPath = basePath.applying(combinedTransform)" + newLine +
    tab2 + "return modifiedPath" + newLine + newLine +

    tab + "}" + newLine +
    "}" + newLine + newLine
  );

};

// -----------------------------------------------------------------------------
// --- Write Preview Block File in SwiftUI Format ------------------------------
// -----------------------------------------------------------------------------
function writePreviewToFile() {

  file.write(

    "// MARK: - Preview" + newLine +
    "#if DEBUG" + newLine +
    "struct ShapeView_Previews: PreviewProvider {" + newLine +
    tab + "static var previews: some View {" + newLine +
    tab2 + "ShapeView()" + newLine +
    tab + "}" + newLine +
    "}" + newLine +
    "#endif" + newLine

  )

}
