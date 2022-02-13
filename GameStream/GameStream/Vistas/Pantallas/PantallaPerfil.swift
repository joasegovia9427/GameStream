//
//  PantallaPerfil.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct PantallaPerfil: View {
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
        }
    }
}

struct PantallaPerfil_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfil()
    }
}
