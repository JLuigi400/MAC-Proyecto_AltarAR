//
//  pantalla_informacion.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 23/10/26.
//

import SwiftUI

struct PantallaInformacion: View {
    let alRegresar: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Información")
                    .font(.custom("Bangers", size: 32, relativeTo: .title))
                
                Text("Este proyecto propone un altar digital como homenaje a Alexis Ortega y a las voces que acompañaron al público en distintas historias.")
                
                Text("Que encontrarás?")
                    .font(.title2.bold())
                
                TextoConIcono(icono: "person.3", texto: "Tres espacios para explorar personajes y recuerdos")
                TextoConIcono(icono: "cube.transparent", texto: "Una base de altar que más adelante aparecerá sobre una imagen con la cámara")
                TextoConIcono(icono: "speaker.wave.2", texto: "Un espacio futuro para audios que el equipo tenga permiso de utilizar")
                
                // Notas a tomar en cuenta
                Text("El contenido biográfico, las imágenes y los audios deben revisarse con el equipo antes de publicar la aplicación")
                    .font(.footnote)
                    .foregroundStyle(Color("texto_secundario"))
                
                Button("Regresar al Menú") {
                    alRegresar()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("acento_rojo"))
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
    }
}

private struct TextoConIcono: View {
    let icono: String
    let texto: String
    
    var body: some View {
        Label(texto, systemImage: icono)
    }
}
