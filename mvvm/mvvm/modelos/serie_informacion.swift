//
//  aqui_guardan_sus_modelos.swift
//  mvvm
//
//  Created by Astrid C. Sanchez L. on 3/14/25.
//
import Foundation

struct Temporada: Identifiable{
    var id = UUID()
    
    var nombrE: String
    var cantidad_capitulos: Int
    var imagen: String = ""
}

struct Plataforma: Identifiable {
    var id = UUID()
    
    var nombre: String
    var imagen: String
}

struct InformacionSerie: Identifiable {
    var id = UUID()
    
    var nombre: String
    var tipo: String
    
    var platafomas: [Plataforma] = [] //Aqui tengo una deuda tecnica para indicar otrar plataformas de forma mas faci;
    
    var fecha_estreno: Int
    var Sinopsis: String
    
    var temporadas: [Temporada] = []
    
    var caratula: String
}
