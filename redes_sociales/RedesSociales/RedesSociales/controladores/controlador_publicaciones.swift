//
//  File.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/24/25.
//
import SwiftUI

class ControladorPublicaciones: ObservableObject {
    @Published var publicaciones: [Publicacion] = []
    
    let url_de_publicaciones = "https://jsonplaceholder.typicode.com/posts"
    
    func obtener_publicaciones() async {
        
    }
}
