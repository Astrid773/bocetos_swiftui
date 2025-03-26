//
//  Publicacion.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/24/25.
//

import SwiftUI

/*
 Codable
 Encodable
 Decodable
 */

struct Publicacion: Identifiable, Codable {
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
}
