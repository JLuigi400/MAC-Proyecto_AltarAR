//
//  pantalla_actual.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 23/10/26.
//

import Foundation

/// Esta lista contiene las únicas pantallas que puede mostrar la app por ahora
/// Cambiar este valor equivale a cambiar de pantalla

enum PantallaActual {
    case inicio
    case menu
    case informacion
    case personajes
    case creditos
    case realidadAumentada
}

struct PersonajeHomenaje: Identifiable {
    let id: String
    let nombre: String
    let descripcion: String
    let iconoTemporal: String
    let nombreImagen: String
}

let personajeHomenaje = [
    PersonajeHomenaje(
        id: "peter",
        nombre: "Peter Parker",
        descripcion: "Espacio dedicado a la interpretación de Peter Parket / Spider-Man, Aquí podrá ir una ficha, un audio autorizado o un recuerdo del personaje",
        iconoTemporal: "sparkles",
        nombreImagen: "personaje_peter"
    ),
    PersonajeHomenaje(
        id: "tadashi",
        nombre: "Tadashi Hamada",
        descripcion: "Espacio dedicado a Tadashi Hamada. Aquí podrá ir una ficha, un audio autorizado o un recuerdo del personaje",
        iconoTemporal: "heart",
        nombreImagen: "personaje_tadashi"
    ),
    PersonajeHomenaje(
        id: "ryan",
        nombre: "Ryan 'Inside' Lanney",
        descripcion: "Espacio dedicado a Ryan. Aquí podrá ir una ficha, un audio autorizado o un recuerdo del personaje",
        iconoTemporal: "flag.checkered",
        nombreImagen: "personaje_ryan"
    ),
]
