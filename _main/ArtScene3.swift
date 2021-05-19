import SpriteKit

open class ArtScene3: SKScene, SKPhysicsContactDelegate{
    var player = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "A4 - 1-2.png")))
    let bg = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "bg-final.png")))
    var diver1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver.png")))
    var diver2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver.png")))
    var diver3 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver.png")))
    var diver4 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver2.png")))
    var diver5 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver2.png")))
    var diver6 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver2.png")))
    var diver7 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver.png")))
    var diver8 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "diver.png")))
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
        bg.position = CGPoint(x: 400, y: 530)
        self.addChild(bg) 
        
        
        let rectangularBody = SKSpriteNode(texture: nil)
        rectangularBody.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 850, height: 100))
        rectangularBody.position = CGPoint(x: 430, y: 920)
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
        
        createDiver()
        
        
        
    } 
    
    func createDiver() {
        diver1.setScale(1)
        diver1.zPosition = -5
        diver1.position = CGPoint(x: 990, y: 330)
        diver1.physicsBody = SKPhysicsBody(texture: diver1.texture!, size: diver1.texture!.size())
        diver1.physicsBody?.affectedByGravity = false
        
        diver1.physicsBody?.allowsRotation = false
        diver1.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver1.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver1.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 330), duration: 3), SKAction.run{
            self.diver1.position = CGPoint(x: 990, y: 330)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.diver1)
        })
        
        diver2.setScale(1)
        diver2.zPosition = -5
        diver2.position = CGPoint(x: 990, y: 330)
        diver2.physicsBody = SKPhysicsBody(texture: diver2.texture!, size: diver2.texture!.size())
        diver2.physicsBody?.affectedByGravity = false
        
        diver2.physicsBody?.allowsRotation = false
        diver2.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver2.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver2.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 330), duration: 3), SKAction.run{
            self.diver2.position = CGPoint(x: 990, y: 330)
        }])))
        run(SKAction.wait(forDuration: 1), completion: {
            self.addChild(self.diver2)
        })
        
        diver3.setScale(1)
        diver3.zPosition = -5
        diver3.position = CGPoint(x: 990, y: 330)
        diver3.physicsBody = SKPhysicsBody(texture: diver3.texture!, size: diver3.texture!.size())
        diver3.physicsBody?.affectedByGravity = false
        
        diver3.physicsBody?.allowsRotation = false
        diver3.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver3.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver3.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 330), duration: 3), SKAction.run{
            self.diver3.position = CGPoint(x: 990, y: 330)
        }])))
        run(SKAction.wait(forDuration: 2), completion: {
            self.addChild(self.diver3)
        })
        
        diver4.setScale(1)
        diver4.zPosition = -5
        diver4.position = CGPoint(x: -200, y: 500)
        diver4.physicsBody = SKPhysicsBody(texture: diver4.texture!, size: diver4.texture!.size())
        diver4.physicsBody?.affectedByGravity = false
        
        diver4.physicsBody?.allowsRotation = false
        diver4.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver4.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver4.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 990, y: 500), duration: 4), SKAction.run{
            self.diver4.position = CGPoint(x: -200, y: 500)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.diver4)
        })
        
        diver5.setScale(1)
        diver5.zPosition = -5
        diver5.position = CGPoint(x: -200, y: 500)
        diver5.physicsBody = SKPhysicsBody(texture: diver5.texture!, size: diver5.texture!.size())
        diver5.physicsBody?.affectedByGravity = false
        
        diver5.physicsBody?.allowsRotation = false
        diver5.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver5.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver5.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 990, y: 500), duration: 4), SKAction.run{
            self.diver5.position = CGPoint(x: -200, y: 500)
        }])))
        run(SKAction.wait(forDuration: 1.2), completion: {
            self.addChild(self.diver5)
        })
        
        
        diver6.setScale(1)
        diver6.zPosition = -5
        diver6.position = CGPoint(x: -200, y: 500)
        diver6.physicsBody = SKPhysicsBody(texture: diver6.texture!, size: diver6.texture!.size())
        diver6.physicsBody?.affectedByGravity = false
        
        diver6.physicsBody?.allowsRotation = false
        diver6.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver6.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver6.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: 990, y: 500), duration: 4), SKAction.run{
            self.diver6.position = CGPoint(x: -200, y: 500)
        }])))
        run(SKAction.wait(forDuration: 2.2), completion: {
            self.addChild(self.diver6)
        })
        
        
        diver7.setScale(1)
        diver7.zPosition = -5
        diver7.position = CGPoint(x: 990, y: 670)
        diver7.physicsBody = SKPhysicsBody(texture: diver7.texture!, size: diver7.texture!.size())
        diver7.physicsBody?.affectedByGravity = false
        
        diver7.physicsBody?.allowsRotation = false
        diver7.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver7.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver7.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 670), duration: 2.5), SKAction.run{
            self.diver7.position = CGPoint(x: 990, y: 670)
        }])))
        run(SKAction.wait(forDuration: 0), completion: {
            self.addChild(self.diver7)
        })
        
        
        diver8.setScale(1)
        diver8.zPosition = -5
        diver8.position = CGPoint(x: 990, y: 670)
        diver8.physicsBody = SKPhysicsBody(texture: diver8.texture!, size: diver8.texture!.size())
        diver8.physicsBody?.affectedByGravity = false
        
        diver8.physicsBody?.allowsRotation = false
        diver8.physicsBody?.categoryBitMask = Bitmasks.enemy
        diver8.physicsBody?.contactTestBitMask = Bitmasks.player
        
        diver8.run(SKAction.repeatForever(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: 670), duration: 2.5), SKAction.run{
            self.diver8.position = CGPoint(x: 990, y: 670)
        }])))
        run(SKAction.wait(forDuration: 1.5), completion: {
            self.addChild(self.diver8)
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
        over.text = "WE MADE IT!"
        over.fontSize = 30
        over.fontColor = #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0)
        over.position = CGPoint(x: frame.midX, y: frame.midY+50)
        
        let msgA = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        msgA.text = "Larry is finally in his new home."
        msgA.fontSize = 30
        msgA.fontColor = #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0)
        msgA.position = CGPoint(x: frame.midX, y: frame.midY-50)
        
        let msgB = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        msgB.text = "Thanks for playing."
        msgB.fontSize = 30
        msgB.fontColor = #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0)
        msgB.position = CGPoint(x: frame.midX, y: frame.midY-90)
        
        addChild(over)
        addChild(msgA)
        addChild(msgB)
        
    }
}


