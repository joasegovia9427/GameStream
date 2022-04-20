//
//  OffsetPosition.swift
//  GameStream
//
//  Created by Joaquin Segovia on 9/4/22.
//

import SwiftUI

struct OffsetPosition: View {
    var body: some View {
        GeometryReader(content: {geometria in
            VStack{
                Image("platzi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometria.size.width-100, height: geometria.size.height-100)
                //            Offsets()
                //            Positions()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

struct Offsets:View {
    var body: some View{
        
        Image("platzi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .offset(x: -18, y: 20)
        
        Text("HolaMundo").foregroundColor(.blue).bold()
    }
}

struct Positions:View {
    var body: some View{
        VStack {
            Image("platzi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .position(x: 100, y: 32)
            
            //            Text("HolaMundo").foregroundColor(.blue).bold()
            //                .position(x: 0, y: 0)
        }
    }
}

struct OffsetPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPosition()
            .previewDevice("iPhone 13 Pro")
        
        OffsetPosition()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
