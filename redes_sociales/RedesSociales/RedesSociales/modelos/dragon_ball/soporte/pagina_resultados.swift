//
//  pagina_resultados.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/2/25.
//
struct Meta: Codable{
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}
    
struct Enlaces: Codable {
    let first: String
    let previous: String
    let next: String
    let last: String
}
struct PaginaResultado: Codable {
    //var id: Int = self.meta.currentPage
    let items: [MonoChino]
    let meta: Meta
    let links: Enlaces
    //let cantidad_resultados: Int
}
struct PaginaResultadoPlaneta: Codable {
    //var id: Int = self.meta.currentPage
    let items: [Planeta]
    let meta: Meta
    let links: Enlaces
}
