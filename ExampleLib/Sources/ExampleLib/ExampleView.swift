//
//  SwiftUIView.swift
//  
//
//  Created by Chiaote Ni on 2022/6/27.
//

import SwiftUI
import PathViews

struct ExampleView: View {
    var body: some View {
        VStack {
            DemoView() // This View includes AAA - CCCView as a subView, which generated by the build plugin automatically.
            GeneratedView()
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}