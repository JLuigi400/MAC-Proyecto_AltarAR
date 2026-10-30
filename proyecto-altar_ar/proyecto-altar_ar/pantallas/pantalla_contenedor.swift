//
//  pantalla_contenedor.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 23/10/26.
//

import SwiftUI

/// Esta vista reemplaza NavigationStack para esta etapa.
/// Solo aguarda cuál pantalla debe verse y cambia esa variable al pulsar botones.

struct PantallaContenedor: View {
    @State private var pantallaActual: PantallaActual = .inicio
    
    var body: some View {
        Group {
            switch pantallaActual {
            case .inicio:
                PantallaInicio {
                    pantallaActual = .menu
                }
            case .menu:
                PantallaMenu { siguientePantalla in
                    pantallaActual = siguientePantalla
                }
            case .informacion:
                PantallaInformacion {
                    pantallaActual = .menu
                }
            case .personajes:
                PantallaPersonajes {
                    pantallaActual = .menu
                }
            case .creditos:
                PantallaCreditosSimples {
                    pantallaActual = .menu
                }
            case .realidadAumentada:
                PantallaARBase {
                    pantallaActual = .menu
                }
            case .vistaPrevia :
                PantallaVistaPrevia {
                    pantallaActual = .menu
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
