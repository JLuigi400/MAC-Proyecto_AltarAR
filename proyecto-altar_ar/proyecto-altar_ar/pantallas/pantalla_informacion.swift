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
                Text("Alexis Ortega")
                    .font(.custom("Bangers", size: 32, relativeTo: .title))
                
                
                
                Text("Que encontrarás?")
                    .font(.title2.bold())
                
                Text("Alexis Ortega fue la voz de Spider-Man, interpretado por Tom Holland, en el doblaje al español latino entre 2016 y 2018. También interpretó al personaje en producciones animadas de Marvel.")
                
                Text("Participaciones destacadas")
                    .font(.title2.bold())
                
                FilaParticipacion(
                    anio: "2014",
                    titulo: "Big Hero 6",
                    detalle: "Prestación a la voz en México de Tadashi Hamada en la película de Pixar. Igualmente en Disney Infinity 2.0 en Videojuegos"
                )
                
                FilaParticipacion(
                    anio: "2016",
                    titulo: "Capitán América: Civil War",
                    detalle: "Primera aparición de Tom Holland como Spider-Man en el UCM y debut de Alexis Ortega como su voz latina."
                )
                
                FilaParticipacion(
                    anio: "2017",
                    titulo: "Cars 3",
                    detalle: "Prestación de voz para el personaje en latino de Ryan 'Inside' Laney."
                )
                
                FilaParticipacion(
                    anio: "2017",
                    titulo: "Spider-Man: De regreso a casa",
                    detalle: "Primera película individual de Tom Holland como Spider-Man."
                )
                
                FilaParticipacion(
                    anio: "2018",
                    titulo: "Avengers: Infinity War",
                    detalle: "Interpretó a Peter Parker, incluida la escena: «No me quiero ir, señor Stark»."
                )
                
                
                // Notas a tomar en cuenta
                Text("Este altar reúne recuerdos de su trabajo.")
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

private struct ImagenAlexisOrtega: View {
    var body: some View {
        ZStack {
            Color("superficie")
            Image("foto-altar")
                .resizable()
                .scaledToFill()
        }
        .clipped()
    }
}

private struct FilaParticipacion: View {
    let anio: String
    let titulo: String
    let detalle: String
    
    var body: some View {
        HStack (alignment: .top, spacing: 12) {
            Text(anio)
                .font(.headline)
                .foregroundStyle(Color("acento_cempasuchil"))
                .frame(width: 44, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(titulo)
                    .font(.headline)
                Text(detalle)
                    .font(.subheadline)
                    .foregroundStyle(Color("texto_secundario"))
            }
        }
    }
}
