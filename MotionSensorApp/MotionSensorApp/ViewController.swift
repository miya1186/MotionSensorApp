//
//  ViewController.swift
//  MotionSensorApp
//
//  Created by miyazawaryohei on 2020/10/11.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //ジャイロスコープの測定値
    @IBOutlet var xGyroLabel: UILabel!
    @IBOutlet var yGyroLabel: UILabel!
    @IBOutlet var zGyroLabel: UILabel!
    
    //加速度の測定値
    @IBOutlet var xAccelLabel: UILabel!
    @IBOutlet var yAccelLabel: UILabel!
    @IBOutlet var zAccelLabel: UILabel!
    
    //重力（加速度）ベクトルの測定理
    @IBOutlet var xGravieyLabel: UILabel!
    @IBOutlet var yGravieyLabel: UILabel!
    @IBOutlet var zGravieyLabel: UILabel!
    
    //姿勢の測定値
    @IBOutlet var pitchLabel: UILabel!
    @IBOutlet var rollLabel: UILabel!
    @IBOutlet var yawLabel: UILabel!
    
    //モーションマネージャーを作る
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //キューを実行する間隔（秒数）
        motionManager.deviceMotionUpdateInterval = 0.1
        //キューで実行するクロージャ
        let handler:CMDeviceMotionHandler = {(motionData:CMDeviceMotion?, error:Error?) -> Void in
            self.motionAnimation(motionData: motionData, error: error as Error?)
        }
        //更新するキューを登録してモーションセンサーをスタートする
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: handler)
    }
    
    //デバイスモーションセンサーで定期的に実行するメソッド
    func motionAnimation(motionData:CMDeviceMotion?, error:Error?){
        if let motion = motionData {
            
            //ジャイロスコープ（回転速度）
            //X軸回り回転速度
            var gyroX = motion.rotationRate.x
            gyroX = round(gyroX*100)/100
            xGyroLabel.text = String(gyroX)
            //Y軸回り回転速度
            var gyroY = motion.rotationRate.y
            gyroY = round(gyroY*100)/100
            yGyroLabel.text = String(gyroY)
            //Z軸回り回転速度
            var gyroZ = motion.rotationRate.z
            gyroZ = round(gyroZ*100)/100
            zGyroLabel.text = String(gyroZ)
            
            
            //加速度センサー（移動速度）
            //X軸方向加速度
            var accelX = motion.userAcceleration.x
            accelX = round(accelX*1000)/1000
            xAccelLabel.text = String(accelX)
            //Y軸方向加速度
            var accelY = motion.userAcceleration.y
            accelY = round(accelY*1000)/1000
            yAccelLabel.text = String(accelY)
            //Z軸方向加速度
            var accelZ = motion.userAcceleration.z
            accelZ = round(accelZ*1000)/1000
            zAccelLabel.text = String(accelZ)
            
            //重力（加速度）ベクトル
            //加速度のX成分
            var gravityX = motion.gravity.x
            gravityX = round(gravityX*100)/100
            xGravieyLabel.text = String(gravityX)
            //加速度のY成分
            var gravityY = motion.gravity.y
            gravityY = round(gravityY*100)/100
            yGravieyLabel.text = String(gravityY)
            //加速度のZ成分
            var gravityZ = motion.gravity.z
            gravityZ = round(gravityZ*100)/100
            zGravieyLabel.text = String(gravityZ)
            
            //姿勢センサー（回転角度　ラジアン）
            //ピッチ（X軸回り回転角度）
            var pitch = motion.attitude.pitch
            pitch = round(pitch*100)/100
            pitchLabel.text = String(pitch)
            //ロール（Y軸回り回転角度）
            var roll = motion.attitude.roll
            roll = round(roll*100)/100
            rollLabel.text = String(roll)
            //ヨー（Z軸回り回転角度）
            var yaw = motion.attitude.yaw
            yaw = round(yaw*100)/100
            yawLabel.text = String(yaw)
        }
    }
    
    
}

