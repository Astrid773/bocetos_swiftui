//
//  PantallaPersonajes.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/4/25.
//

import SwiftUI

let backgroundGradient2 = LinearGradient(
    colors: [Color.indigo, Color.clear],
    startPoint: .top, endPoint: .bottom)

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        ZStack{
            backgroundGradient2
            VStack{
                Text("\(controlador.personaje?.name ?? "Valor por defecto")")
                    .fontWeight(.black)
                    .fontWidth(.expanded)
                    .padding(7)
                    .foregroundStyle(.black)
                Text("\(controlador.personaje?.race ?? "Valor por defecto")")
                    .fontWeight(.black)
                    .fontWidth(.expanded)
                    .padding(7)
                    .foregroundStyle(.black)
                Text("\(controlador.personaje?.description ?? "Valor por defecto")")
                    .fontWeight(.black)
                    .fontWidth(.expanded)
                    .padding(7)
                    .foregroundStyle(LinearGradient(
                        gradient: Gradient(colors: [.black, .mint]),
                        startPoint: .top, endPoint: .bottom))
                NavigationLink{
                    PantallaPlanetas()
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
        PantallaPersonajes()
            .environment(ControladorAplicacion())
    }
}
