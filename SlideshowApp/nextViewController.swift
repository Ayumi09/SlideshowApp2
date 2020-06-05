import UIKit

class nextViewController: UIViewController {

    
    @IBOutlet weak var nextviewImage: UIImageView!
    
    var selectedImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    nextviewImage.image = selectedImage
        
        
    }
    //前の画面に戻る
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
