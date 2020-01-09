import UIKit

internal class DetailViewController: UIViewController {
    
    //MARK: Properties
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        return imageView
    }()
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        makeConstraints()
        
    }
    
    //MARK: Constraints
    private func makeConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(view.bounds.width)
            make.center.equalToSuperview()
        }
    }
}
