//
//  mono_chino.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/2/25.
//


struct MonoChino: Identifiable, Codable {
    let id: Int
    
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let gender: String
    let description: String
    
    let image: String
    let affiliation: String
    
    let originPlanet: Planeta?
    
    let transformations: Array<Transformacion>?
}
