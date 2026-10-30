import SwiftUI

#if os(iOS)
import ARKit
import RealityKit
import UIKit

// Requiere dos recursos dentro del target de la aplicación:
// 1. Assets.xcassets > AR Resource Group llamado "ImagenesAltarAR".
// 2. Mesa_Laboratorio.usdc.
//
// La imagen de referencia debe imprimirse y colocarse horizontalmente.
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
                    let modelo = try await Entity(
                        named: "Mesa_Laboratorio",
                        in: .main
                    )
                    modelo.scale = SIMD3<Float>(repeating: 0.7)
                    self?.altar = modelo
                    print("Altar cargado. Apunta la cámara a la imagen guía.")
                } catch {
                    print("No se pudo cargar mesa_altar.usdc: \(error)")
                }
            }
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for case let imagenAncla as ARImageAnchor in anchors {
                DispatchQueue.main.async { [weak self] in
                    self?.colocarAltar(sobre: imagenAncla)
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
            
            // El eje vertical de una imagen de referencia es su eje Z.
            // Esta rotación deja la mesa de pie sobre una imagen impresa
            // colocada horizontalmente.
            copia.orientation = simd_quatf(
                angle: .pi / 2,
                axis: SIMD3<Float>(1, 0, 0)
            )
            copia.position.z = 0.01
            
            ancla.addChild(copia)
            vistaAR.scene.addAnchor(ancla)
            anclasColocadas.insert(imagenAncla.identifier)
        }
        
        private var escalaSeleccionada: Float {
            let valor = UserDefaults.standard.double(forKey: "altar.escala")
            return valor == 0 ? 0.70 : Float(valor)
        }
        
        private var alturaSeleccionada: Float {
            Float(UserDefaults.standard.double(forKey: "altar.altura"))
        }
        
        
    }
}
#endif
