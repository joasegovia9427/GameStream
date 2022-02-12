//
//  PantallaJuegos.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct PantallaJuegos: View {
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            Text("Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
        }
    }
}

struct PantallaJuegos_Previews: PreviewProvider {
    static var previews: some View {
        PantallaJuegos()
    }
}
