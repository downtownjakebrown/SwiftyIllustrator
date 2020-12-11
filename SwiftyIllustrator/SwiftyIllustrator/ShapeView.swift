//
//  ShapeView.swift
//
//  Made Using SwiftyIllustrator
//  https://github.com/downtownjakebrown/SwiftyIllustrator.git
//

import SwiftUI

// MARK: - ShapeView
struct ShapeView: View {

    @State private var showAnimation: Bool = false
    
	var body: some View {
        VStack {
    
            ZStack {
                ShapeElement7().fill(Color.orange).springItOn($showAnimation, 7)
                ShapeElement6().fill(Color.black ).springItOn($showAnimation, 6)
                ShapeElement5().fill(Color.black ).springItOn($showAnimation, 5)
                ShapeElement4().fill(Color.black ).springItOn($showAnimation, 4)
                ShapeElement3().fill(Color.orange).springItOn($showAnimation, 3)
                ShapeElement2().fill(Color.red   ).springItOn($showAnimation, 2)
                ShapeElement1().fill(Color.white ).springItOn($showAnimation, 1)
            }.frame(
                width: 300,
                height: 300,
                alignment: .center
            )

            Button(action: {
                self.showAnimation.toggle()
            }) {
                Text("Toggle Animation")
            }.padding(.top, 50)
    
        }.onAppear {
            self.showAnimation = true
        }
	}
    
}

// MARK: - AnimationExtension
extension View {
    func springItOn(_ showAnimation: Binding<Bool>, _ animationIndex: Int) -> some View {
        self.modifier(AnimationViewModifier(showAnimation, animationIndex))
    }
}

// MARK: - AnimationViewModifier
struct AnimationViewModifier: ViewModifier {
    
    @Binding var showAnimation: Bool
    private let animationIndex: Int
    private let loadAnimation: Animation
    
    init(_ showAnimation: Binding<Bool>, _ animationIndex: Int) {
        self._showAnimation = showAnimation
        self.animationIndex = animationIndex
        self.loadAnimation = Animation.spring()
    }
    
    func body(content: Content) -> some View {
        content
        .opacity(showAnimation ? 1 : 0)
        .scaleEffect(showAnimation ? 1 : 0.1, anchor: .center)
        .animation(loadAnimation.delay(0.5 + Double(animationIndex)*0.05))
    }
    
}

// MARK: - ShapeProperties
struct ShapeProperties {
	static let size = CGSize(width: 266.7, height: 333.67)
}

// MARK: - ShapeElement1
fileprivate struct ShapeElement1: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: 45.94, y: -3.8),
				CGPoint(x: 59.4, y: 67.59),
				CGPoint(x: -14.35, y: 8.35),
				CGPoint(x: 27.98, y: 61.94),
				CGPoint(x: -32.3, y: 16.6),
				CGPoint(x: 38.67, y: 94.92),
				CGPoint(x: -46.84, y: 84.29),
				CGPoint(x: 38.88, y: 133.98),
				CGPoint(x: 102.8, y: 133.98),
				CGPoint(x: 91.68, y: 91.02),
				CGPoint(x: 45.94, y: -3.8)
			]

			let control1 = [
				CGPoint(x: 64.43, y: 19.91),
				CGPoint(x: 43.03, y: 57.3),
				CGPoint(x: -2.16, y: 29.38),
				CGPoint(x: 16.76, y: 55.15),
				CGPoint(x: -17.59, y: 44.92),
				CGPoint(x: 11.73, y: 110.98),
				CGPoint(x: -27.51, y: 112.94),
				CGPoint(x: 63.68, y: 132.46),
				CGPoint(x: 108.37, y: 121.1),
				CGPoint(x: 101.9, y: 64.5)
			]

			let control2 = [
				CGPoint(x: 67.17, y: 49.85),
				CGPoint(x: 5.06, y: 28.12),
				CGPoint(x: 16.39, y: 46.94),
				CGPoint(x: -11.99, y: 35.15),
				CGPoint(x: 25.23, y: 84.97),
				CGPoint(x: -24.82, y: 101.65),
				CGPoint(x: 3.48, y: 136.14),
				CGPoint(x: 87.83, y: 103.82),
				CGPoint(x: 100.78, y: 98.99),
				CGPoint(x: 79.24, y: 8.66)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.addCurve(to: anchorPoints[5], control1: control1[4], control2: control2[4])
			path.addCurve(to: anchorPoints[6], control1: control1[5], control2: control2[5])
			path.addCurve(to: anchorPoints[7], control1: control1[6], control2: control2[6])
			path.addCurve(to: anchorPoints[8], control1: control1[7], control2: control2[7])
			path.addCurve(to: anchorPoints[9], control1: control1[8], control2: control2[8])
			path.addCurve(to: anchorPoints[10], control1: control1[9], control2: control2[9])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - ShapeElement2
fileprivate struct ShapeElement2: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: 99.85, y: 166.84),
				CGPoint(x: -33.15, y: 166.84),
				CGPoint(x: -66.65, y: 133.34),
				CGPoint(x: -66.65, y: 0.34),
				CGPoint(x: -33.15, y: -33.16),
				CGPoint(x: 99.85, y: -33.16),
				CGPoint(x: 133.35, y: 0.34),
				CGPoint(x: 133.35, y: 133.34),
				CGPoint(x: 99.85, y: 166.84)
			]

			let control1 = [
				CGPoint(x: 99.85, y: 166.84),
				CGPoint(x: -51.58, y: 166.84),
				CGPoint(x: -66.65, y: 133.34),
				CGPoint(x: -66.65, y: -18.09),
				CGPoint(x: -33.15, y: -33.16),
				CGPoint(x: 118.27, y: -33.16),
				CGPoint(x: 133.35, y: 0.34),
				CGPoint(x: 133.35, y: 151.76)
			]

			let control2 = [
				CGPoint(x: -33.15, y: 166.84),
				CGPoint(x: -66.65, y: 151.76),
				CGPoint(x: -66.65, y: 0.34),
				CGPoint(x: -51.58, y: -33.16),
				CGPoint(x: 99.85, y: -33.16),
				CGPoint(x: 133.35, y: -18.09),
				CGPoint(x: 133.35, y: 133.34),
				CGPoint(x: 118.27, y: 166.84)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.addCurve(to: anchorPoints[5], control1: control1[4], control2: control2[4])
			path.addCurve(to: anchorPoints[6], control1: control1[5], control2: control2[5])
			path.addCurve(to: anchorPoints[7], control1: control1[6], control2: control2[6])
			path.addCurve(to: anchorPoints[8], control1: control1[7], control2: control2[7])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - ShapeElement3
fileprivate struct ShapeElement3: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: -59.48, y: -64),
				CGPoint(x: -44.37, y: -64),
				CGPoint(x: -42.44, y: -66.53),
				CGPoint(x: -49.36, y: -91.77),
				CGPoint(x: -53.19, y: -91.86),
				CGPoint(x: -61.38, y: -66.62),
				CGPoint(x: -59.48, y: -64)
			]

			let control1 = [
				CGPoint(x: -59.48, y: -64),
				CGPoint(x: -43.05, y: -64),
				CGPoint(x: -42.44, y: -66.53),
				CGPoint(x: -49.88, y: -93.69),
				CGPoint(x: -53.19, y: -91.86),
				CGPoint(x: -61.8, y: -65.32)
			]

			let control2 = [
				CGPoint(x: -44.37, y: -64),
				CGPoint(x: -42.09, y: -65.25),
				CGPoint(x: -49.36, y: -91.77),
				CGPoint(x: -52.57, y: -93.75),
				CGPoint(x: -61.38, y: -66.62),
				CGPoint(x: -60.84, y: -64)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.addCurve(to: anchorPoints[5], control1: control1[4], control2: control2[4])
			path.addCurve(to: anchorPoints[6], control1: control1[5], control2: control2[5])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - ShapeElement4
fileprivate struct ShapeElement4: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: -90.78, y: -24.98),
				CGPoint(x: -76.1, y: -24.98),
				CGPoint(x: -73.24, y: -27.09),
				CGPoint(x: -67.93, y: -44.29),
				CGPoint(x: -65.06, y: -46.41),
				CGPoint(x: -38.78, y: -46.41),
				CGPoint(x: -35.97, y: -44.46),
				CGPoint(x: -29.4, y: -26.92),
				CGPoint(x: -26.59, y: -24.98),
				CGPoint(x: -11.47, y: -24.98),
				CGPoint(x: -9.59, y: -27.63),
				CGPoint(x: -39.31, y: -112.84),
				CGPoint(x: -42.14, y: -114.86),
				CGPoint(x: -60.25, y: -114.86),
				CGPoint(x: -63.09, y: -112.84),
				CGPoint(x: -92.66, y: -27.63),
				CGPoint(x: -90.78, y: -24.98)
			]

			let control1 = [
				CGPoint(x: -90.78, y: -24.98),
				CGPoint(x: -74.79, y: -24.98),
				CGPoint(x: -73.24, y: -27.09),
				CGPoint(x: -67.54, y: -45.55),
				CGPoint(x: -65.06, y: -46.41),
				CGPoint(x: -37.53, y: -46.41),
				CGPoint(x: -35.97, y: -44.46),
				CGPoint(x: -28.96, y: -25.75),
				CGPoint(x: -26.59, y: -24.98),
				CGPoint(x: -10.1, y: -24.98),
				CGPoint(x: -9.59, y: -27.63),
				CGPoint(x: -39.73, y: -114.05),
				CGPoint(x: -42.14, y: -114.86),
				CGPoint(x: -61.53, y: -114.86),
				CGPoint(x: -63.09, y: -112.84),
				CGPoint(x: -93.12, y: -26.33)
			]

			let control2 = [
				CGPoint(x: -76.1, y: -24.98),
				CGPoint(x: -73.63, y: -25.83),
				CGPoint(x: -67.93, y: -44.29),
				CGPoint(x: -66.38, y: -46.41),
				CGPoint(x: -38.78, y: -46.41),
				CGPoint(x: -36.41, y: -45.63),
				CGPoint(x: -29.4, y: -26.92),
				CGPoint(x: -27.84, y: -24.98),
				CGPoint(x: -11.47, y: -24.98),
				CGPoint(x: -9.13, y: -26.33),
				CGPoint(x: -39.31, y: -112.84),
				CGPoint(x: -40.87, y: -114.86),
				CGPoint(x: -60.25, y: -114.86),
				CGPoint(x: -62.67, y: -114.05),
				CGPoint(x: -92.66, y: -27.63),
				CGPoint(x: -92.15, y: -24.98)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.addCurve(to: anchorPoints[5], control1: control1[4], control2: control2[4])
			path.addCurve(to: anchorPoints[6], control1: control1[5], control2: control2[5])
			path.addCurve(to: anchorPoints[7], control1: control1[6], control2: control2[6])
			path.addCurve(to: anchorPoints[8], control1: control1[7], control2: control2[7])
			path.addCurve(to: anchorPoints[9], control1: control1[8], control2: control2[8])
			path.addCurve(to: anchorPoints[10], control1: control1[9], control2: control2[9])
			path.addCurve(to: anchorPoints[11], control1: control1[10], control2: control2[10])
			path.addCurve(to: anchorPoints[12], control1: control1[11], control2: control2[11])
			path.addCurve(to: anchorPoints[13], control1: control1[12], control2: control2[12])
			path.addCurve(to: anchorPoints[14], control1: control1[13], control2: control2[13])
			path.addCurve(to: anchorPoints[15], control1: control1[14], control2: control2[14])
			path.addCurve(to: anchorPoints[16], control1: control1[15], control2: control2[15])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - ShapeElement5
fileprivate struct ShapeElement5: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: 18.76, y: -110.94),
				CGPoint(x: 8.76, y: -100.94),
				CGPoint(x: -1.24, y: -110.94),
				CGPoint(x: 8.76, y: -120.94),
				CGPoint(x: 18.76, y: -110.94)
			]

			let control1 = [
				CGPoint(x: 18.76, y: -105.41),
				CGPoint(x: 3.24, y: -100.94),
				CGPoint(x: -1.24, y: -116.46),
				CGPoint(x: 14.29, y: -120.94)
			]

			let control2 = [
				CGPoint(x: 14.29, y: -100.94),
				CGPoint(x: -1.24, y: -105.41),
				CGPoint(x: 3.24, y: -120.94),
				CGPoint(x: 18.76, y: -116.46)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - ShapeElement6
fileprivate struct ShapeElement6: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: 16.33, y: -24.98),
				CGPoint(x: 1.2, y: -24.98),
				CGPoint(x: -0.8, y: -26.98),
				CGPoint(x: -0.8, y: -91.39),
				CGPoint(x: 1.2, y: -93.39),
				CGPoint(x: 16.33, y: -93.39),
				CGPoint(x: 18.33, y: -91.39),
				CGPoint(x: 18.33, y: -26.98),
				CGPoint(x: 16.33, y: -24.98)
			]

			let control1 = [
				CGPoint(x: 16.33, y: -24.98),
				CGPoint(x: 0.1, y: -24.98),
				CGPoint(x: -0.8, y: -26.98),
				CGPoint(x: -0.8, y: -92.49),
				CGPoint(x: 1.2, y: -93.39),
				CGPoint(x: 17.43, y: -93.39),
				CGPoint(x: 18.33, y: -91.39),
				CGPoint(x: 18.33, y: -25.87)
			]

			let control2 = [
				CGPoint(x: 1.2, y: -24.98),
				CGPoint(x: -0.8, y: -25.87),
				CGPoint(x: -0.8, y: -91.39),
				CGPoint(x: 0.1, y: -93.39),
				CGPoint(x: 16.33, y: -93.39),
				CGPoint(x: 18.33, y: -92.49),
				CGPoint(x: 18.33, y: -26.98),
				CGPoint(x: 17.43, y: -24.98)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.addCurve(to: anchorPoints[5], control1: control1[4], control2: control2[4])
			path.addCurve(to: anchorPoints[6], control1: control1[5], control2: control2[5])
			path.addCurve(to: anchorPoints[7], control1: control1[6], control2: control2[6])
			path.addCurve(to: anchorPoints[8], control1: control1[7], control2: control2[7])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - ShapeElement7
fileprivate struct ShapeElement7: Shape {

	private let baseSize: CGSize = ShapeProperties.size

	func path(in rect: CGRect) -> Path {

		let basePath = Path { path in

			let anchorPoints = [
				CGPoint(x: 33.15, y: 33.16),
				CGPoint(x: -99.85, y: 33.16),
				CGPoint(x: -133.35, y: -0.34),
				CGPoint(x: -133.35, y: -133.34),
				CGPoint(x: -99.85, y: -166.84),
				CGPoint(x: 33.15, y: -166.84),
				CGPoint(x: 66.65, y: -133.34),
				CGPoint(x: 66.65, y: -0.34),
				CGPoint(x: 33.15, y: 33.16)
			]

			let control1 = [
				CGPoint(x: 33.15, y: 33.16),
				CGPoint(x: -118.27, y: 33.16),
				CGPoint(x: -133.35, y: -0.34),
				CGPoint(x: -133.35, y: -151.76),
				CGPoint(x: -99.85, y: -166.84),
				CGPoint(x: 51.58, y: -166.84),
				CGPoint(x: 66.65, y: -133.34),
				CGPoint(x: 66.65, y: 18.09)
			]

			let control2 = [
				CGPoint(x: -99.85, y: 33.16),
				CGPoint(x: -133.35, y: 18.09),
				CGPoint(x: -133.35, y: -133.34),
				CGPoint(x: -118.27, y: -166.84),
				CGPoint(x: 33.15, y: -166.84),
				CGPoint(x: 66.65, y: -151.76),
				CGPoint(x: 66.65, y: -0.34),
				CGPoint(x: 51.58, y: 33.16)
			]

			path.move(to: anchorPoints[0])
			path.addCurve(to: anchorPoints[1], control1: control1[0], control2: control2[0])
			path.addCurve(to: anchorPoints[2], control1: control1[1], control2: control2[1])
			path.addCurve(to: anchorPoints[3], control1: control1[2], control2: control2[2])
			path.addCurve(to: anchorPoints[4], control1: control1[3], control2: control2[3])
			path.addCurve(to: anchorPoints[5], control1: control1[4], control2: control2[4])
			path.addCurve(to: anchorPoints[6], control1: control1[5], control2: control2[5])
			path.addCurve(to: anchorPoints[7], control1: control1[6], control2: control2[6])
			path.addCurve(to: anchorPoints[8], control1: control1[7], control2: control2[7])
			path.closeSubpath()

		}

		let rectWidth = rect.size.width
		let rectHeight = rect.size.height

		let scaleFactor: CGFloat
		let widthRatio = rectWidth/baseSize.width
		let heightRatio = rectHeight/baseSize.height
		if widthRatio < heightRatio {
			scaleFactor = widthRatio
		} else {
			scaleFactor = heightRatio
		}

		let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
		let moveTransform = CGAffineTransform(translationX: 0.5*rectWidth, y: 0.5*rectHeight)
		let combinedTransform = scaleTransform.concatenating(moveTransform)

		let modifiedPath = basePath.applying(combinedTransform)
		return modifiedPath

	}
}

// MARK: - Preview
#if DEBUG
struct ShapeView_Previews: PreviewProvider {
	static var previews: some View {
		ShapeView()
	}
}
#endif

