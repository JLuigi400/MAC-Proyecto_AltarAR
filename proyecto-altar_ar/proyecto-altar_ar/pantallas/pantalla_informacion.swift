import SwiftUI

struct PantallaInformacion: View {
    let alRegresar: () -> Void

    var body: some View {
        ZStack {
            FondoAltar()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("ALEXIS ORTEGA")
                        .font(.custom("Bangers-Regular", size: 36, relativeTo: .title))

                    TarjetaAltar {
                        VStack(alignment: .leading, spacing: 10) {
                            Label("Homenaje a su trabajo de doblaje", systemImage: "mic.fill")
                                .font(.headline)
                                .foregroundStyle(Color("acento_cempasuchil"))
                            Text("Alexis Ortega fue la voz de Spider-Man, interpretado por Tom Holland, en el doblaje al español latino entre 2016 y 2018. También interpretó al personaje en producciones animadas de Marvel.")
                                .foregroundStyle(Color("texto_principal"))
                        }
                    }

                    Text("TRES VOCES PARA RECORDAR")
                        .font(.custom("Bangers-Regular", size: 27, relativeTo: .title2))

                    VozDestacada(
                        icono: "heart.fill",
                        color: "acento_cempasuchil",
                        nombre: "Tadashi Hamada",
                        detalle: "Big Hero 6 y Disney Infinity 2.0."
                    )
                    VozDestacada(
                        icono: "figure.climbing",
                        color: "acento_rojo",
                        nombre: "Spider-Man",
                        detalle: "Peter Parker interpretado por Tom Holland."
                    )
                    VozDestacada(
                        icono: "flag.checkered",
                        color: "acento_azul",
                        nombre: "Ryan “Inside” Laney",
                        detalle: "Personaje de Cars 3 en doblaje latino."
                    )

                    Text("CRONOLOGÍA DESTACADA")
                        .font(.custom("Bangers-Regular", size: 27, relativeTo: .title2))

                    FilaParticipacion(anio: "2014", titulo: "Big Hero 6", detalle: "Voz de Tadashi Hamada en México; también en Disney Infinity 2.0.")
                    FilaParticipacion(anio: "2016", titulo: "Capitán América: Civil War", detalle: "Debut de Alexis Ortega como la voz latina de Spider-Man en el UCM.")
                    FilaParticipacion(anio: "2017", titulo: "Cars 3", detalle: "Voz de Ryan “Inside” Laney en doblaje latino.")
                    FilaParticipacion(anio: "2017", titulo: "Spider-Man: De regreso a casa", detalle: "Primera película individual de Tom Holland como Spider-Man.")
                    FilaParticipacion(anio: "2018", titulo: "Avengers: Infinity War", detalle: "Interpretó a Peter Parker, incluida la escena «No me quiero ir, señor Stark». ")

                    Text("Este altar reúne recuerdos de su trabajo.")
                        .font(.footnote)
                        .foregroundStyle(Color("texto_secundario"))
                    BotonAltar(titulo: "Regresar al menú", icono: "arrow.left", accion: alRegresar)
                }
                .padding(24)
            }
        }
        .foregroundStyle(Color("texto_principal"))
    }
}

private struct VozDestacada: View {
    let icono: String
    let color: String
    let nombre: String
    let detalle: String

    var body: some View {
        TarjetaAltar {
            HStack(spacing: 14) {
                Image(systemName: icono)
                    .font(.title2)
                    .foregroundStyle(Color(color))
                    .frame(width: 30)
                VStack(alignment: .leading, spacing: 4) {
                    Text(nombre).font(.headline)
                    Text(detalle)
                        .font(.subheadline)
                        .foregroundStyle(Color("texto_secundario"))
                }
            }
        }
    }
}

private struct FilaParticipacion: View {
    let anio: String
    let titulo: String
    let detalle: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(anio)
                .font(.headline)
                .foregroundStyle(Color("acento_cempasuchil"))
                .frame(width: 45, alignment: .leading)
            Rectangle()
                .fill(Color("acento_rojo"))
                .frame(width: 3)
            VStack(alignment: .leading, spacing: 4) {
                Text(titulo).font(.headline)
                Text(detalle)
                    .font(.subheadline)
                    .foregroundStyle(Color("texto_secundario"))
            }
        }
    }
}
