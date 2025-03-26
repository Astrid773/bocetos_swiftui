//
//  agregar_serie.swift
//  mvvm
//
//  Created by Astrid C. Sanchez L. on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    
    @State var plataformas_de_la_serie: [Plataforma] = []
    
    @State var nombre_plataforma: String = ""
    @State var imagen_plataforma: String = ""
    
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Text("Hola mundo")
        TextField("El nombre de la serie", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un porblema con tu serie. No tiene nombre11")
        }
        
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        Text("Plataformas")
        
        ScrollView(.horizontal) {
            HStack{
                ForEach(plataformas_de_la_serie){ plataforma in
                    Text(plataforma.nombre)
                }
            }
        }.sheet(isPresented: $mostrar_agregar_plataformas) {
            Text("Por fabor agrega una plataforma")
            
            TextField("Nombre de la plataforma", text: $nombre_plataforma)
            TextField("Indica la imagen", text: $imagen_plataforma)
            
            ScrollView(){
                VStack{
                    ForEach(plataformas){plataforma in
                        Text(plataforma.nombre)
                    }
                }
            }
            
            Button("Agregar plataforma") {
                if !nombre_plataforma.isEmpty &&  !imagen_plataforma.isEmpty {
                    let plataforma_nueva = Plataforma(nombre: nombre_plataforma, imagen: imagen_plataforma)
                    
                    plataformas_de_la_serie.append(plataforma_nueva)
                    
                    nombre_plataforma = ""
                    imagen_plataforma = ""
                    
                    mostrar_agregar_plataformas.toggle()
                }
            }
        }.presentationDetents([.medium, .large])
        
        Spacer()
        
        Button("Agregar PLataforma"){
            mostrar_agregar_plataformas = true
        }
        
        Spacer()
        
        Button("Agregar serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, platafomas: plataformas_de_la_serie, fecha_estreno: 1, Sinopsis: "Pues una aleatoria", caratula: "Foto aqui")
           
            indicar_problemas = controlador.agregar_serie(serie: serie_nueva)
            
        }
        
        Spacer()
        Spacer()
    }
}

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
