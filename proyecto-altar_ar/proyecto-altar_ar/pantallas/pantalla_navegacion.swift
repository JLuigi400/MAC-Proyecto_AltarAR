//
//  pantalla_navegacion.swift
//  proyecto-altar_ar
//
//  Created by alumno on 21/10/26.
//

import SwiftUI

struct PantallaSelecciones: View {
    // Guarda si debemos mostrar el aviso.
    @State private var mostrarAviso = false

    // Guarda el texto que aparecerá en ese aviso.
    @State private var mensaje = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("¿Qué quieres explorar?")
                    .font(.custom("Bangers", size: 38, relativeTo: .largeTitle))
                    .multilineTextAlignment(.center)

                Text("Selecciona una opción para continuar.")
                    .multilineTextAlignment(.center)

                Button {
                    mensaje = "Aquí mostraremos la historia de Alexis Ortega."
                    mostrarAviso = true
                } label: {
                    Label("Conocer su historia", systemImage: "book")
                        .frame(maxWidth: .infinity)
                        .padding()
                }

                Button {
                    mensaje = "Aquí conoceremos a Peter Parker, Tadashi y Ryan."
                    mostrarAviso = true
                } label: {
                    Label("Explorar sus personajes", systemImage: "person.3")
                        .frame(maxWidth: .infinity)
                        .padding()
                }

                Button {
                    mensaje = "Aquí conectaremos la cámara para mostrar el altar."
                    mostrarAviso = true
                } label: {
                    Label("Ver el altar con la cámara", systemImage: "camera")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                
                Button {
                    mensaje = "Aquí presentaremos a la gente y lo que hizo en cada parte del equipo"
                    mostrarAviso = true
                } label: {
                    Label("Equipo de Desarrollo", systemImage: "person.3")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .buttonStyle(.bordered)
            .tint(Color("acento_rojo"))
            .padding(24)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
        .navigationTitle("Explorar") 
        .alert("Próximamente", isPresented: $mostrarAviso) {
            Button("Entendido", role: .cancel) { }
        } message: {
            Text(mensaje)
        }
    }
}

#Preview {
    NavigationStack {
        PantallaSelecciones()
    }
}
