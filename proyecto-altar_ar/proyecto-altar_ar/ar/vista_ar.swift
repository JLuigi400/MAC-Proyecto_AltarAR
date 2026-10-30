import SwiftUI

#if os(iOS)
import ARKit
import RealityKit
import UIKit
import altar_animaciones

// Aqui iniciaremos cargando la escena desde el paquete local 'altar_animaciones'
// 'Scene' contiene el modelo del altar.

struct VistaARPorImagen: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let vistaAR = ARView(frame: .zero)
        let configuracion = ARWorldTrackingConfiguration()

        guard let imagenes = ARReferenceImage.referenceImages(
            inGroupNamed: "AR_Images",
            bundle: .main
        ), !imagenes.isEmpty else {
            print("No se encontró el grupo AR 'AR_Images'.")
            return vistaAR
        }

        configuracion.detectionImages = imagenes
        configuracion.maximumNumberOfTrackedImages = 1
        vistaAR.session.delegate = context.coordinator
        context.coordinator.vistaAR = vistaAR
        context.coordinator.cargarAltar()
        vistaAR.session.run(configuracion)
        return vistaAR
    }

    func updateUIView(_ uiView: ARView, context: Context) { }

    func makeCoordinator() -> Coordinador {
        Coordinador()
    }

    final class Coordinador: NSObject, ARSessionDelegate {
        weak var vistaAR: ARView?
        private var altar: Entity?
        private var anclasColocadas = Set<UUID>()
        
        func cargarAltar() {
            Task { @MainActor [weak self] in
                do {
                    // Aqui le solicitamos a la tarea que busque la escena compilada del Reality Composer Pro
                    let escena = try await Entity (
                        named: "Scene",
                        in: altar_animacionesBundle
                    )
                    self?.altar = escena
                    print("Escena del altar cargada desde altar_animaciones")
                } catch {
                    print("No se pudo cargar la escena, motivos - \(error)")
                }
            }
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            procesarImagenes(anchors)
        }
        
        /// Este apartado indica que si funciona a detectar la escena.
        /// ARKit volvera a llamar aqui y entonces deberia mostrarse el modelo
        
        private func procesarImagenes(_ anchors: [ARAnchor]) {
            for case let ImagenAncla as ARImageAnchor in anchors {
                DispatchQueue.main.async { [weak self] in
                    self?.colocarAltar(sobre: ImagenAncla)
                }
            }
        }
        
        private func colocarAltar(sobre imagenAncla: ARImageAnchor) {
            guard let vistaAR, let altar,
                  !anclasColocadas.contains(imagenAncla.identifier) else {
                return
            }
            
            let ancla = AnchorEntity(anchor: imagenAncla)
            let copia = altar.clone(recursive: true)
            
            /// El marcador se coloca de forma 'horizontal'. Esta rotacion hace que la mesa quede de pie sobre la imagen.
            /// Evitando que este 'Acostada'. Asi que la imagen debe estar posicionado en la mesa, en vez de la pared.
            
            copia.orientation = simd_quatf(
                angle: .pi / 2,
                axis: SIMD3<Float>(0, 0, 0) // Cambiando la posicion en -1 o 0 en el primer digito, rota la posicion X del Modelo
            )
            copia.scale = SIMD3<Float>(repeating: 0.30)
            copia.position.z = 0.01
            
            ancla.addChild(copia)
            vistaAR.scene.addAnchor(ancla)
            anclasColocadas.insert(imagenAncla.identifier)
            print("Altar colocado sobre la imagen detectada.")
        }
    }
}
#endif
