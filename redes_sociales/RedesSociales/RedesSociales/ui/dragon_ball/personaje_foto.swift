//
//  personaje_foto.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/7/25.
//

import SwiftUI

let backgroundGradient0 = LinearGradient(
    colors: [Color.clear, Color.mint],
    startPoint: .top, endPoint: .bottom)

struct PersonajeFoto: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ZStack{
            backgroundGradient0
            if(controlador.pagina_resultados != nil) {
                ScrollView{
                    VStack{
                        ForEach(controlador.pagina_resultados!.items) { personaje in
                            NavigationLink {
                                PantallaPersonajes()
                            } label: {
                                VStack(alignment: .center){
                                    Text("El personaje es \(personaje.name)")
                                        .fontWeight(.black)
                                        .fontWidth(.expanded)
                                        .padding(7)
                                        .foregroundStyle(LinearGradient(
                                            gradient: Gradient(colors: [.indigo, .lila]),
                                            startPoint: .top, endPoint: .bottom))
                                    
                                    VStack{
                                        AsyncImage(url: URL(string: personaje.image)) { image in
                                            image
                                                .image?.resizable().frame(width: 300, height: 600)
                                                .aspectRatio(contentMode: .fill)
                                                .clipShape(Rectangle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius:16)
                                                        .stroke(.black, lineWidth: 3)
                                                )
                                        }
                                    }
                                }
                            }.simultaneousGesture(TapGesture().onEnded({
                                print("Personaje \(personaje.id)")
                                controlador.descargar_informacion_personaje(id: personaje.id)
                            }))
                        }
                    }
                }
            }
            }.onAppear{
                Task{
                    await controlador.descargar_monos_chinos()
                }
            }
        }
    }
}
    
#Preview {
    PersonajeFoto()
        .environment(ControladorAplicacion())
}

/*
 /*LazyVStack{
  ForEach(controlador.pagina_resultados!.items) { personaje in
  Text("El personaje es \(personaje.name)")
  AsyncImage(url: URL(string: personaje.image))
  .aspectRatio(contentMode: .fill)
  .clipped()
  .background(Color.blue)
  }
  }
  }
  }*/
 /*
  ZStack{
  backgroundGradient1
  VStack{
  Text("\(controlador.personaje_seleccionado?.name ?? "Valor por defecto")")
  Text("\(controlador.personaje_seleccionado?.race ?? "Valor por defecto")")
  
  NavigationLink{
  PerfilBasicoVista()
  } label: {
  Text("Ver perfil")
  }.simultaneousGesture(TapGesture().onEnded({
  controlador.ver_perfil(id: controlador.personaje_seleccionado!.id)
  }))
  
  ScrollView{
  VStack{
  ForEach(controlador.personajes){ MonoChino in
  Text("Usuario: \(MonoChino.name)")
  Text("\(MonoChino.body)")
  }
  }
  }
  }
  }*/
 */
