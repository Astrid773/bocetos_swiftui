//
//  Planeta_Unico.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 5/2/25.
//

import SwiftUI

struct PlanetaUnico: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        ZStack{
            backgroundGradient2
            VStack{
                Text("\(controlador.mundo?.name ?? "Valor por defecto")")
                    .fontWeight(.black)
                    .fontWidth(.expanded)
                    .padding(7)
                    .foregroundStyle(.black)
                Text("\(controlador.mundo?.image ?? "Valor por defecto")")
                    .fontWeight(.black)
                    .fontWidth(.expanded)
                    .padding(7)
                    .foregroundStyle(.black)
                Text("\(controlador.mundo?.description ?? "Valor por defecto")")
                    .fontWeight(.black)
                    .fontWidth(.expanded)
                    .padding(7)
                    .foregroundStyle(LinearGradient(
                        gradient: Gradient(colors: [.black, .mint]),
                        startPoint: .top, endPoint: .bottom))
                NavigationLink{
                    PersonajeFoto()
                } label: {
                    Text("Ver planeta")
                        .fontWeight(.black)
                        .fontWidth(.expanded)
                        .padding(7)
                        .foregroundStyle(LinearGradient(
                            gradient: Gradient(colors: [.black, .mint]),
                            startPoint: .top, endPoint: .bottom))
                }.simultaneousGesture(TapGesture().onEnded({
                    //controlador.ver_perfil(id: controlador.personaje!.id)
                }))
            }
        }.onAppear{
            print("LLEGAMOS")
        }
    }
}

#Preview {
    NavigationStack{
        PlanetaUnico()
            .environment(ControladorAplicacion())
    }
}

