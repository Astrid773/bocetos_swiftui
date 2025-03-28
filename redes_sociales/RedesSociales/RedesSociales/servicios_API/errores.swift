//
//  errores.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/24/25.
//

enum ErroresDeRed: Error{
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
