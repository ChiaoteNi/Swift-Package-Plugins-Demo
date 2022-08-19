//
//  GeneratedView.swift
//
//
//  Created by Chiaote Ni on 2022/8/14.
//

import SwiftUI

public struct GeneratedView: View {
    public init() {}

    public var body: some View {
        VStack {
            Path { path in 
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 0, y: 200))
                path.closeSubpath()
            }
            .fill(Color.gray)
            Path { path in 
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 400))
                path.addLine(to: CGPoint(x: 100, y: 150))
                path.closeSubpath()
            }
            .fill(Color.gray)
            Path { path in 
                path.move(to: CGPoint(x: 50, y: 50))
                path.addLine(to: CGPoint(x: 150, y: 50))
                path.addLine(to: CGPoint(x: 150, y: 200))
                path.addLine(to: CGPoint(x: 0, y: 200))
                path.closeSubpath()
            }
            .fill(Color.gray)
        }
    }
}

struct GeneratedView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedView()
    }
}