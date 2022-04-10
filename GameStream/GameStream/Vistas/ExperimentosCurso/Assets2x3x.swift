//
//  Assets2x3x.swift
//  GameStream
//
//  Created by Joaquin Segovia on 9/4/22.
//

import SwiftUI

//screenWidth = UIScreen.main.bounds.width
//toRest:CGFloat = 0
//spaceToGrow:CGFloat = 300
struct Assets2x3x: View {
    @State var size:CGFloat = 300
    
    var body: some View {
        Image("platzi")
        
        Image("platzi3").resizable().aspectRatio(contentMode: .fill).frame(width: size, height: size, alignment: .center)
            .onAppear(perform: {
                print("screenWidth \(screenWidth)")
//                if(screenWidth>450){
                    print("if(screenWidth>450){")
                    toRest=100
                    size = screenWidth - toRest
//                }

                print("size \(size)")
        })
        
    }
}

struct Assets2x3x_Previews: PreviewProvider {
    static var previews: some View {
        
        Assets2x3x()
            .previewDevice("iPhone 8 Plus")
        
        Assets2x3x()
            .previewDevice("iPhone 13 Pro")
        
        Assets2x3x()
            .previewDevice("iPhone 13 Pro Max")
        
        Assets2x3x()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
