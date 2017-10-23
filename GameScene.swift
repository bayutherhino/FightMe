//
//  GameScene.swift
//  FightMe
//
//  Created by bayu dhanubroto on 27/9/17.
//  Copyright © 2017 Bayu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var isCountdown = true
    var countDown = 1
    
    var leftCounter = 1
    var rightCounter = 1
    
    var leftCounterLabel = SKLabelNode()
    var rightCounterLabel = SKLabelNode()
    
    var leftButton = SKSpriteNode()
    var rightButton = SKSpriteNode()
    
    var centerPoint : CGFloat!

    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        
        setup ()
        
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.beginCountDown), userInfo: nil, repeats: true)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let touchLoc = touch.location(in: self)
            
            
            if isCountdown {
                if atPoint(touchLoc).name == "ButtonLeft"{
                
                    leftCounter += 1
                    self.leftCounterLabel.text = String(leftCounter)
                    
                    var leftMobIdleArray = Array<SKTexture>()
                    leftMobIdleArray.append(SKTexture(imageNamed:"IdleWL1"))
                    leftMobIdleArray.append(SKTexture(imageNamed: "IdelWL2"))
                    leftMobIdleArray.append(SKTexture(imageNamed: "IdleWL3"))
                    
                    let leftMob = SKSpriteNode(texture: leftMobIdleArray[0])
                    
                    leftMob.position = Helper().getRandomCoor(width: Int32(self.frame.width), height: Int32(self.frame.height), isLeft: true)
                    leftMob.size = CGSize(width: 40, height: 86)
                    leftMob.zPosition = CGFloat(leftCounter)
                   
                    self.addChild(leftMob)
                    
                    let idleLeftMobAction = SKAction.animate(with: leftMobIdleArray, timePerFrame: 0.15)
                    let repeatAction = SKAction.repeatForever(idleLeftMobAction)
                    leftMob.run(repeatAction)
        
                
                } else if atPoint(touchLoc).name == "ButtonRight" {
                
                    rightCounter += 1
                    self.rightCounterLabel.text = String(rightCounter)
                    
                    var rightMobIdleArray = Array<SKTexture>()
                    rightMobIdleArray.append(SKTexture(imageNamed: "IdleWR1"))
                    rightMobIdleArray.append(SKTexture(imageNamed: "IdleWR2"))
                    rightMobIdleArray.append(SKTexture(imageNamed: "IdleWR3"))
                    
                    let rightMob = SKSpriteNode (texture: rightMobIdleArray[0])
                
                    rightMob.position = Helper().getRandomCoor(width: Int32(self.frame.width), height: Int32(self.frame.height), isLeft : false)
                    rightMob.size = CGSize(width: 40, height: 86)
                    rightMob.zPosition = CGFloat (rightCounter)
                    
                    self.addChild(rightMob)
                    
                    let idleRightMobAction = SKAction.animate(with: rightMobIdleArray, timePerFrame: 0.15)
                    let repeatAction = SKAction.repeatForever(idleRightMobAction)
                    rightMob.run(repeatAction)
                
                }
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func setup () {
        
        leftButton = self.childNode(withName: "ButtonLeft") as! SKSpriteNode
        rightButton = self.childNode(withName: "ButtonRight") as! SKSpriteNode
        
        leftCounterLabel = self.childNode(withName: "CounterLeft") as! SKLabelNode
        leftCounterLabel.zPosition = 150
        rightCounterLabel = self.childNode(withName: "CounterRight") as! SKLabelNode
        rightCounterLabel.zPosition = 150
        
        //var test = self.childNode(withName: "test") as! SKSpriteNode
        //self.addChild(test)
        
        centerPoint = self.frame.size.width / self.frame.size.height
        
    }
    
    func beginCountDown () {
        
        if countDown > 0 {
            
            if countDown < 6 {
                let countDownLabel = SKLabelNode ()
                countDownLabel.fontName = "AvenirNext-Bold"
                countDownLabel.fontColor = SKColor.white
                countDownLabel.fontSize = 100
                countDownLabel.text = String(countDown)
                countDownLabel.position = CGPoint(x: 0, y: 0)
                countDownLabel.zPosition = 300
                countDownLabel.name = "cLabel"
                countDownLabel.horizontalAlignmentMode = .center
                addChild(countDownLabel)
                
                let deadTime = DispatchTime.now() + 0.5
                DispatchQueue.main.asyncAfter(deadline: deadTime, execute: {
                    
                    countDownLabel.removeFromParent()
                    
                })
                
                countDown += 1
                
                if countDown == 6 {
                    self.isCountdown = false
                    DispatchQueue.main.asyncAfter(deadline: deadTime, execute: {
                        
                        self.leftButton.removeFromParent()
                        self.rightButton.removeFromParent()
                        self.leftCounterLabel.removeFromParent()
                        self.rightCounterLabel.removeFromParent()
                        
                    })
                    
                }
            }
            
        }
    }
    
    func spawnMove(with sprite: SKSpriteNode) {
        
        //sprite.run(SKAction)
        
    }
}
