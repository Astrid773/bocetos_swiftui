//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
            NavigationStack {
                ScrollView {
                    VStack{
                        ForEach(controlador.publicaciones) { publicacion in
                        NavigationLink {
                            PublicacionVista()
                        } label : {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            }
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)
                        }))
                    }
                }
                .background(LinearGradient(
                    gradient: Gradient(colors: [.clear, .lila]),
                    startPoint: .top, endPoint: .bottom))
            }
            .onAppear {
                    print("Hola mundo")
            }
        }
    }
}

#Preview{
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
