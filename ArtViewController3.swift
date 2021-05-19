import SpriteKit

open class ArtViewController3: UIViewController {
    let scene = ArtScene3()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let view = SKView()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        view.showsPhysics = true
        self.view = view
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: scene)
            let touchedNodes = scene.nodes(at: location)
            for node in touchedNodes.reversed(){
                if node != scene.bg{
                    scene.startDrag(node: node)
                }
            }
        }
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //          if let touch = touches.first{
        //              let location = touch.location(in: scene)
        //              scene.drag(pos: location)
        //          }
        if let touch = touches.first{
            let location = touch.location(in: scene)
            let touchedNodes = scene.nodes(at: location)
            for node in touchedNodes.reversed(){
                if node != scene.bg{
                    scene.drag(pos: location)
                }
            }
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        scene.drop()
    }
}



