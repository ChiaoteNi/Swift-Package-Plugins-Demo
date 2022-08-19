//
//  DemoView.swift
//  
//
//  Created by Chiaote Ni on 2022/8/14.
//

import SwiftUI

public struct DemoView: View {

    public init() {}
    
    public var body: some View {
        HStack {
            GeneratedView()
            AAAView()
            BBBView()
            CCCView()
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
