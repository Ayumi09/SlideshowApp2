import UIKit

class ViewController: UIViewController {

    //次へ
    @IBOutlet weak var nextButton: UIButton!
    //再生・停止
    @IBOutlet weak var playstopButton: UIButton!
    //戻る
    @IBOutlet weak var returnButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //Timerクラスを実体化(Timerが持っているものを使える)
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
         //画像ファイルの読み込み
        let image = UIImage(named: "kuma")
        //UIImageViewに画像入れる
        imageView.image = image

    }
        
    //5枚の画像を配列に格納
    //今映ってる画像
    var displayImageNo = 0
    //画像の配列設定
    let imageArray = ["kuma","panda","shika","kaba","saru"]
    
    //'displayImage'を定義する。表示している画像の番号を元に画像を表示する
    func displayImage(){
        
        //表示している画像から番号を取り出す
        let name = imageArray[displayImageNo]
        
        //画像を読み込む
        let image = UIImage(named: name)
        
        //UIImageviewに画像を入れる
        imageView.image = image
    
    }
    //startTimer関数を定義する。
    func startTimer(){
        
        //2秒毎にtimerUpdateメソッドを呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerUpdate(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(_ timer: Timer){
        //次に表示させる画像
        if displayImageNo < 4{
        
        displayImageNo = displayImageNo + 1
        
            displayImage()
        }else if displayImageNo == 4{
            displayImageNo = 0
            displayImage()
   
    }
       }
    
    
    
  @IBAction func nextButton(_ sender: Any) {
  
        if displayImageNo < imageArray.count - 1 {
  
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }
        //それ以外（最後の画像4の時）
        else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    //最初の画像の表示時に、戻るボタンをタップすると、最後の画像が表示されるようにする
    @IBAction func returnButton(_ sender: Any) {
        //1以上のとき
        if displayImageNo >= 1 {

            //表示している番号を1減らす
            displayImageNo -= 1
            
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }
            //それ以外（最初の画像０の時）
        else{
            displayImageNo = 4
            displayImage()
}
}

    @IBAction func playstopButton(_ sender: Any) {
        

        //もしタイマーが止まっていたらタイマーを発動。ボタンは”再生”。
        //タイマーが動いていたら停止。
        
            //timerが止まっているなら、
        if timer.isValid == false {
           
            //タイマー作動
            startTimer()
            
            //ボタンの名前を’再生’にする
            playstopButton.setTitle("停止", for: .normal)
            //ボタンの色を”赤”にする
            playstopButton.setTitleColor(UIColor.red, for: .normal )
            
            //進むボタンとぼ戻るボタンを押せなくする
            nextButton.isEnabled = false
            returnButton.isEnabled = false
             
                }

                else{
            timer.invalidate()
            
            //ボタンの名前を’停止’にする
            playstopButton.setTitle("再生", for: .normal)
            //timer.isValid == true
            //ボタンの色を”青”にする
            playstopButton.setTitleColor(UIColor.black, for: .normal )
            
            //進むボタンとぼ戻るボタンを押せるようにする
            nextButton.isEnabled = true
            returnButton.isEnabled = true
            
        }
    }
    
    @IBAction func imageTap(_ sender: Any) {
    
        self.performSegue(withIdentifier: "tonextViewController", sender: nil)
    }
    
        //遷移元から遷移先に画像を移動
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のResultViewControllerのインスタンスを取得する
        let nextViewController:nextViewController = segue.destination as! nextViewController
        
            //表示されている画像の名前をとる
            let name = imageArray[displayImageNo]
            
            // 画像を読み込み
            let image = UIImage(named: name)
            
            //遷移先のNextViewControllerで宣言しているselectedImgに値を代入して渡す
                    nextViewController.selectedImage = image
        }
}
