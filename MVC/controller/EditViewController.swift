//
//  EditViewController.swift
//  MVC
//
//  Created by Apple user on 23/09/21.
//

import UIKit

class EditViewController: BaseViewController {

    
    @IBOutlet weak var titleEdit: UITextField!
    @IBOutlet weak var bodyEdit: UITextField!
    @IBOutlet weak var IdEdit: UITextField!
    
    var home = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func apiPostUptade(post: Post) {
           showProgress()
           AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: {response in
               self.hideProgress()
               switch response.result {
               case .success:
                   print(response.result)
                   self.home.self.apiPostList()
               case let .failure(error):
                   print(error)
               }
           })
       }

    @IBAction func EditButton(_ sender: Any) {
        
        let nameTitle = titleEdit.text
               let nameBody = bodyEdit.text
               let nameId = IdEdit.text
               self.apiPostUptade(post: Post(title: nameTitle!, body: nameTitle!, id: nameId!))
               
               let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
               self.navigationController?.pushViewController(homeView, animated: true)
               
               if nameTitle != nil && nameBody != nil {
                   titleEdit.text = nil
                   bodyEdit.text = nil
               }
        
    }
    
}
