import SpriteKit
import UIKit

open class ArtScene2: SKScene, SKPhysicsContactDelegate{
    var player = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "A4 - 1-2.png")))
    let bg = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "295a77ed-4a24-4490-a202-f1daef0c24ed.JPG")))
    var coralA = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralB = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralC = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralD = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralE = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralF = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralG = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var coralH = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "coral.png")))
    var diver1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver.png")))
    var diver2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver2.png")))
    var isDragging: Bool = false
    var draggingNode: SKNode = SKNode()
    var obstacle = [SKSpriteNode]()
    var gameOver = false
    
    
    open override func didMove(to view: SKView) {
        super.didMove(to: view)
        physicsBody?.friction = 0.0
        physicsWorld.contactDelegate = self
        
        // Background 
        bg.setScale(0.8)
        bg.zPosition = -10
        bg.position = CGPoint(x: 400, y: 600)
        self.addChild(bg) 
        
        //Enemy
        diver1.setScale(1.2)
        diver1.zPosition = -5
        diver1.position = CGPoint(x: 990, y: 510)
        diver1.physicsBody = SKPhysicsBody(texture: diver1.texture!, size: diver1.texture!.size())
        diver1.physicsBody?.affectedByGravity = false
        
        diver1.physicsBody?.allowsRotation = false
        diver1.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver1.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver1.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 510), duration: 5), SKAction.run{
            self.diver1.position = CGPoint(x: 990, y: 510)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.diver1)
        })
        
        diver2.setScale(1.2)
        diver2.zPosition = -5
        diver2.position = CGPoint(x: -200, y: 770)
        diver2.physicsBody = SKPhysicsBody(texture: diver2.texture!, size: diver2.texture!.size())
        diver2.physicsBody?.affectedByGravity = false
        
        diver2.physicsBody?.allowsRotation = false
        diver2.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver2.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver2.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 990, y: 770), duration: 6), SKAction.run{
            self.diver2.position = CGPoint(x: -200, y: 770)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.diver2)
        })
        
        
        let rectangularBody = SKSpriteNode(texture: nil)
        rectangularBody.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 850, height: 100))
        rectangularBody.position = CGPoint(x: 430, y: 1115)
        rectangularBody.physicsBody?.affectedByGravity = false
        rectangularBody.physicsBody?.allowsRotation = false
        rectangularBody.physicsBody?.isDynamic = false
        rectangularBody.physicsBody?.categoryBitMask = Bitmasks.rect
        rectangularBody.physicsBody?.contactTestBitMask = Bitmasks.player
        addChild(rectangularBody)

        
        
        //Player
        player.setScale(1)
        player.position = CGPoint(x: 430, y: 160)
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.affectedByGravity = false
        
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.categoryBitMask = Bitmasks.player
        player.physicsBody?.collisionBitMask = Bitmasks.coral 
        player.physicsBody?.contactTestBitMask = Bitmasks.enemy
        player.physicsBody?.contactTestBitMask = Bitmasks.rect
        
        self.addChild(player)
        
        createCoral()
        
        
    } 
    
    func createCoral(){
        
        coralA.setScale(1.0)
        coralA.position = CGPoint(x: -200, y: 360)
        coralA.zPosition = -5
        obstacle.append(coralA)
        
        coralA.physicsBody = SKPhysicsBody(texture: coralA.texture!, size: coralA.texture!.size())
        coralA.physicsBody?.isDynamic = false
        coralA.physicsBody?.affectedByGravity = false
        coralA.physicsBody?.categoryBitMask = Bitmasks.coral
        coralA.physicsBody?.collisionBitMask = Bitmasks.player
        coralA.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralA.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 990, y: 360), duration: 3), SKAction.run{
            self.coralA.position = CGPoint(x: -200, y: 360)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.coralA)
        })
        
        
        coralB.setScale(1.0)
        coralB.position = CGPoint(x: -200, y: 360)
        coralB.zPosition = -5
        obstacle.append(coralB)
        
        coralB.physicsBody = SKPhysicsBody(texture: coralB.texture!, size: coralB.texture!.size())
        coralB.physicsBody?.isDynamic = false
        coralB.physicsBody?.affectedByGravity = false
        coralB.physicsBody?.categoryBitMask = Bitmasks.coral
        coralB.physicsBody?.collisionBitMask = Bitmasks.player
        coralB.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralB.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 990, y: 360), duration: 3), SKAction.run{
            self.coralB.position = CGPoint(x: -200, y: 360)
        }])))
        run(SKAction.wait(forDuration: 1.5), completion: {
            self.addChild(self.coralB)
        })
        
        
        
        coralC.setScale(1.0)
        coralC.position = CGPoint(x: 1200, y: 630)
        coralC.zPosition = -5
        obstacle.append(coralC)
        
        coralC.physicsBody = SKPhysicsBody(texture: coralC.texture!, size: coralC.texture!.size())
        coralC.physicsBody?.isDynamic = false
        coralC.physicsBody?.affectedByGravity = false
        coralC.physicsBody?.categoryBitMask = Bitmasks.coral
        coralC.physicsBody?.collisionBitMask = Bitmasks.player
        coralC.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralC.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 630), duration: 5), SKAction.run{
            self.coralC.position = CGPoint(x: 1200, y: 630)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.coralC)
        })
        
        
        coralD.setScale(1.0)
        coralD.position = CGPoint(x: 1200, y: 630)
        coralD.zPosition = -5
        obstacle.append(coralD)
        
        coralD.physicsBody = SKPhysicsBody(texture: coralD.texture!, size: coralD.texture!.size())
        coralD.physicsBody?.isDynamic = false
        coralD.physicsBody?.affectedByGravity = false
        coralD.physicsBody?.categoryBitMask = Bitmasks.coral
        coralD.physicsBody?.collisionBitMask = Bitmasks.player
        coralD.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralD.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 630), duration: 5), SKAction.run{
            self.coralD.position = CGPoint(x: 1200, y: 630)
        }])))
        run(SKAction.wait(forDuration: 2), completion: {
            self.addChild(self.coralD)
        })
        
        
        coralE.setScale(1.0)
        coralE.position = CGPoint(x: 1200, y: 630)
        coralE.zPosition = -5
        obstacle.append(coralE)
        
        coralE.physicsBody = SKPhysicsBody(texture: coralE.texture!, size: coralE.texture!.size())
        coralE.physicsBody?.isDynamic = false
        coralE.physicsBody?.affectedByGravity = false
        coralE.physicsBody?.categoryBitMask = Bitmasks.coral
        coralE.physicsBody?.collisionBitMask = Bitmasks.player
        coralE.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralE.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 630), duration: 5), SKAction.run{
            self.coralE.position = CGPoint(x: 1200, y: 630)
        }])))
        run(SKAction.wait(forDuration: 3.4), completion: {
            self.addChild(self.coralE)
        })
        
        
        coralF.setScale(1.0)
        coralF.position = CGPoint(x: -200, y: 890)
        coralF.zPosition = -5
        obstacle.append(coralF)
        
        coralF.physicsBody = SKPhysicsBody(texture: coralF.texture!, size: coralF.texture!.size())
        coralF.physicsBody?.isDynamic = false
        coralF.physicsBody?.affectedByGravity = false
        coralF.physicsBody?.categoryBitMask = Bitmasks.coral
        coralF.physicsBody?.collisionBitMask = Bitmasks.player
        coralF.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralF.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 1100, y: 890), duration: 2), SKAction.run{
            self.coralF.position = CGPoint(x: -200, y: 890)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.coralF)
        })
        
        
        coralG.setScale(1.0)
        coralG.position = CGPoint(x: -200, y: 890)
        coralG.zPosition = -5
        obstacle.append(coralG)
        
        coralG.physicsBody = SKPhysicsBody(texture: coralG.texture!, size: coralG.texture!.size())
        coralG.physicsBody?.isDynamic = false
        coralG.physicsBody?.affectedByGravity = false
        coralG.physicsBody?.categoryBitMask = Bitmasks.coral
        coralG.physicsBody?.collisionBitMask = Bitmasks.player
        coralG.physicsBody?.collisionBitMask = Bitmasks.coral
        
        coralG.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 1100, y: 890), duration: 2), SKAction.run{
            self.coralG.position = CGPoint(x: -200, y: 890)
        }])))
        run(SKAction.wait(forDuration: 1), completion: {
            self.addChild(self.coralG)
        })
        
        
        
        
    }
    
    //Quando começar a carregar
    func startDrag(node: SKNode) {
        if !gameOver{
            isDragging = true
            draggingNode = node
        }
        
    }
    
    //Quando esta carregando
    func drag(pos: CGPoint) {
        if !gameOver{
            draggingNode.position = pos
        }
    }
    
    //Quando soltar
    func drop() {
        if !gameOver{
            isDragging = false
        }
    }
    
    open func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == Bitmasks.player && contact.bodyB.categoryBitMask == Bitmasks.enemy{
            triggerBadGameOver()
        }else if contact.bodyB.categoryBitMask == Bitmasks.player && contact.bodyA.categoryBitMask == Bitmasks.enemy{
            triggerBadGameOver()
        }else if contact.bodyA.categoryBitMask == Bitmasks.player && contact.bodyB.categoryBitMask == Bitmasks.rect{
            triggerGoodGameOver()
        }else if contact.bodyB.categoryBitMask == Bitmasks.player && contact.bodyA.categoryBitMask == Bitmasks.rect{
            triggerGoodGameOver()
        }
    }
    
    func triggerBadGameOver() {
        self.isPaused = true
        gameOver = true
        let over = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        over.text = "Game Over"
        over.fontSize = 30
        over.fontColor = SKColor.red
        over.position = CGPoint(x: frame.midX, y: frame.midY+50)
        
        let msg = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        msg.text = "Start over and try it again."
        msg.fontSize = 30
        msg.fontColor = SKColor.red
        msg.position = CGPoint(x: frame.midX, y: frame.midY-50)
        
        addChild(over)
        addChild(msg)
        
    }
    
    func triggerGoodGameOver() {
        self.isPaused = true
        gameOver = true
        let over = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        over.text = "AWESOME!"
        over.fontSize = 30
        over.fontColor = #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0)
        over.position = CGPoint(x: frame.midX, y: frame.midY+50)
        
        let msgA = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        msgA.text = "Keep helping Larry on his journey"
        msgA.fontSize = 30
        msgA.fontColor = #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0)
        msgA.position = CGPoint(x: frame.midX, y: frame.midY-50)
        
        let msgB = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        msgB.text = "Go to the next level"
        msgB.fontSize = 30
        msgB.fontColor = #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0)
        msgB.position = CGPoint(x: frame.midX, y: frame.midY-90)
        
        addChild(over)
        addChild(msgA)
        addChild(msgB)
        
    }
    
    
}


