//
//  pantalla_personajes.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 23/10/26.
//

import SwiftUI

struct PantallaPersonajes: View {
    let alRegresar: () -> Void
    @State private var personajeSeleccionado: PersonajeHomenaje?

    var body: some View {

        ScrollView {
            VStack(spacing: 18) {
                Text("Personajes:")
                    .font(.custom("Bangers", size: 32, relativeTo: .title))
                
                Text("Toca una tarjeta para leer su información")
                    .multilineTextAlignment(.center)
                
                ForEach(personajeHomenaje) { personaje in
                    Button {
                        personajeSeleccionado = personaje
                    } label: {
                        HStack(spacing: 18) {
                            // De manera de Proxy, solo se dejara un icono, una vez tengamos los iconos seran incluidos
                            // Una vez tengamos las imagenes, se cambiara asi - Image(personaje.nombreImagen).resizable()
                            Image(systemName: personaje.iconoTemporal)
                                .font(.system(size: 34))
                                .frame(width: 58, height: 58)
                                .background(Color("superficie"), in: RoundedRectangle(cornerRadius: 14))
                            
                            Text(personaje.nombre)
                                .font(.headline)
                            
                            Spacer()
                            
                            Image(systemName: "info.circle")
                        }
                        .padding()
                        .background(Color("superficie"), in: RoundedRectangle(cornerRadius: 18))
                    }
                    .buttonStyle(.plain)
                }
                
                Button("Regresar al menú") {
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
        .alert(item: $personajeSeleccionado) { personaje in
            Alert(
                title: Text(personaje.nombre),
                message: Text(personaje.descripcion),
                dismissButton: .default(Text("Entendido"))
            )
        }
    }
}
