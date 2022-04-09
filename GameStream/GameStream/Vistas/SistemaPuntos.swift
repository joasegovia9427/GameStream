//
//  SistemaPuntos.swift
//  GameStream
//
//  Created by Joaquin Segovia on 8/4/22.
//

import SwiftUI

struct SistemaPuntos: View {
    var body: some View {
                
        Rectangle().frame(width: 100, height: 100, alignment: .center).foregroundColor(.blue)

        
        
    }
}

struct SistemaPuntos_Previews: PreviewProvider {
    static var previews: some View {
        SistemaPuntos()
        
        SistemaPuntos()
            .previewDevice("iPhone 13 Pro")
        
        SistemaPuntos()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
