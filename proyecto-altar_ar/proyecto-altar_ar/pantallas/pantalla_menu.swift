//
//  pantalla_navegacion.swift
//  proyecto-altar_ar
//
//  Created by alumno on 21/10/26.
//

import SwiftUI

struct PantallaMenu: View {
    let abrirPantalla: (PantallaActual) -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Text("¿Qué quieres explorar?")
                    .font(.custom("Bangers", size: 32, relativeTo: .largeTitle))
                    .multilineTextAlignment(.center)

                Text("Selecciona una opción para continuar.")
                    .multilineTextAlignment(.center)
                
                BotonMenu(titulo: "Información", icono: "book") {
                    abrirPantalla(.informacion)
                }
                
                BotonMenu(titulo: "Explorar sus Personajes", icono: "person.3") {
                    abrirPantalla(.personajes)
                }
                
                BotonMenu(titulo: "Ver el altar con la cámara", icono: "camera") {
                    abrirPantalla(.realidadAumentada)
                }
                
                BotonMenu(titulo: "Vista Previa del Altar", icono: "cube.transparent") {
                    abrirPantalla(.vistaPrevia)
                }
                
                BotonMenu(titulo: "Equipo de Desarrollo", icono: "person.3.fill") {
                    abrirPantalla(.creditos)
                }
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
    }
}

private struct BotonMenu: View {
    
    let titulo: String
    let icono: String
    let accion: () -> Void
        
    var body: some View {
        Button(action: accion) {
            Label(titulo, systemImage: icono)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .buttonStyle(.bordered)
        .tint(Color("acento_rojo"))
    }
}

#Preview {
    NavigationStack {
        PantallaMenu { _ in }
            .preferredColorScheme(.dark)
    }
}
