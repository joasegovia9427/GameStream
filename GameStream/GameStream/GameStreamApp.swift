//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Joaquin Segovia on 10/2/22.
//

import SwiftUI

@main
struct GameStreamApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State private var estado = "hola"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {print("onAppear")})
                .onChange(of: estado){ nuevoValor in
                    print("Dentro del onChange de la vista, Estado cambio a \(estado)!")
                } ////https://www.hackingwithswift.com/quick-start/swiftui/how-to-run-some-code-when-state-changes-using-onchange
                .onDisappear(perform: {print("onDisappear")})
        }.onChange(of: scenePhase) { phase in
            print(phase)
            switch phase {
            case .active:
                estado="active"
                print("La app esta activa, recuperare los datos")
            case .inactive:
                estado="inactive"
                print("La app esta inactiva, guardare los datos para despues continuar fluidamente")
            case .background:
                estado="background"
                print("La app esta background, guardare los datos para cuando se reinice la app continuar")
            default:
                print("Ningun caso")
            }
        }
    }
}



//            SistemaPuntos()
//            Assets2x3x()
//            OffsetPosition()
