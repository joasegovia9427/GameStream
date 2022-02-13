//
//  WelcomeScreen.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @State var isEntrarActive:Bool = false
    var body: some View {
        NavigationView{
            
            ZStack {
//                Spacer()
                //            Color(red: 21/255, green: 27/255, blue: 53/255, opacity: 1).ignoresSafeArea()
                Color("marine").ignoresSafeArea()
                
                VStack{
                    Text("Bienvenido").foregroundColor(Color("dark-cian"))
                    
                    Spacer().frame(height: 100)
                    
                    
                    Spacer()
                    
                    Button(action: {isEntrarActive.toggle()}, label: {
                        Text(String("Entrar").uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                    }).padding(.bottom, 100).padding(.top,100)
                    
                }.padding(.horizontal, 77)
                
                Image("appLogo").resizable().aspectRatio( contentMode: .fit).frame(width: 250).padding(.bottom, 20)
                
            }
            
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        NavigationLink(isActive: $isEntrarActive, destination: {MenuTabView()}, label: {EmptyView()})
    
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
