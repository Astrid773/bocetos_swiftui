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
                Text("\(controlador.personaje?.race ?? "Valor por defecto")")
                Text("\(controlador.personaje?.description ?? "Valor por defecto")")
                
                NavigationLink{
                    PantallaPlanetas()
                } label: {
                    Text("Ver planeta")
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
