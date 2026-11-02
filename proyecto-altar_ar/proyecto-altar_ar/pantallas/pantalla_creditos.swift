import SwiftUI

struct PantallaCreditosSimples: View {
    let alRegresar: () -> Void

    private let integrantes = [
        Integrante(nombre: "Sarah Jessica Esparza Monroy", matricula: "213178"),
        Integrante(nombre: "Javier Enrique Villaseñor Vargas", matricula: "204581"),
        Integrante(nombre: "Jorge Anibal Espinosa Perales", matricula: "168768")
    ]

    var body: some View {
        ZStack {
            FondoAltar()
            VStack(alignment: .leading, spacing: 18) {
                Text("EQUIPO DE DESARROLLO")
                    .font(.custom("Bangers-Regular", size: 32, relativeTo: .title))
                Text("Altar en homenaje a Alexis Ortega")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(Color("acento_cempasuchil"))

                ForEach(integrantes) { integrante in
                    TarjetaAltar {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.title2)
                                .foregroundStyle(Color("acento_azul"))
                            VStack(alignment: .leading, spacing: 3) {
                                Text(integrante.nombre).font(.headline)
                                Text("Matrícula · \(integrante.matricula)")
                                    .font(.subheadline)
                                    .foregroundStyle(Color("texto_secundario"))
                            }
                        }
                    }
                }

                Spacer()
                BotonAltar(titulo: "Regresar al menú", icono: "arrow.left", accion: alRegresar)
            }
            .padding(24)
        }
        .foregroundStyle(Color("texto_principal"))
    }
}

private struct Integrante: Identifiable {
    let nombre: String
    let matricula: String
    var id: String { matricula }
}
