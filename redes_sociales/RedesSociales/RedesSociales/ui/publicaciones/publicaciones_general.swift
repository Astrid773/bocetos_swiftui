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
                            Text("Hola mundo")
                        } label : {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            }//.onTapGesture {
                                //controlador.mostrar_publicacion(publicacion.id)
                            }
                        }
                    }
                }
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
