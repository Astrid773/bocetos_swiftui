//
//  perfil.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/28/25.
//

struct Perfil: Codable, Identifiable {
    let id: Int
    
    let name: String
    let username: String
    
    let email: String
    let phone: String
}
