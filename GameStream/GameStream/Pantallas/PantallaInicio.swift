//
//  PantallaInicio.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct PantallaInicio: View {
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Text("Inicio").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(.white)
            }.padding(.horizontal, 18)
        }
    }
}

struct PantallaInicio_Previews: PreviewProvider {
    static var previews: some View {
        PantallaInicio()
    }
}
