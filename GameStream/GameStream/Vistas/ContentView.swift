//
//  ContentView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 10/2/22.
//

import SwiftUI

//struct NombreDeVista: View {
//    var body: some View {
//        Text(" ")
//    }
//}

var dispositivo = UIDevice.current.model

struct ContentView: View {
    init(){
        print("Init de la vista ContentView")
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                //                Spacer()
                //            Color(red: 21/255, green: 27/255, blue: 53/255, opacity: 1).ignoresSafeArea()
                Color("marine").ignoresSafeArea()
                
                VStack{
                    Spacer().frame(height: 10)
                    Image("appLogo").resizable().aspectRatio( contentMode: .fit).frame(width: 250).padding(.bottom, 20).offset(x: 0, y: 0)
                    InicioYResgistroView()
                }
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
}

struct InicioYResgistroView: View{
    @State var tipoInicioSesion = true
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Button(action: {tipoInicioSesion = true}) {
                    VStack {
                        Text("INICIA SESION").fontWeight(.black).foregroundColor(tipoInicioSesion ? .white : .gray)
                        Divider().frame(width: 100, height: 1).background(tipoInicioSesion ? Color("dark-cian") : Color("marine"))
                    }
                }
                
                Spacer()
                
                Button(action: {tipoInicioSesion = false}) {
                    VStack {
                        Text("REGISTRATE").fontWeight(.black).foregroundColor(tipoInicioSesion ? .gray : .white)
                        Divider().frame(width: 100, height: 1).background(tipoInicioSesion ? Color("marine") : Color("dark-cian"))
                    }
                }
                
                Spacer()
            }//.padding(.horizontal, 30)
            
            if tipoInicioSesion == true{
                Spacer(minLength: 42)
                InicioSesionView()
            }else{
                RegistroView(tipoInicioSesion: $tipoInicioSesion)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        Image("pantalla1").resizable()
        //        Image("pantalla2").resizable()
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
