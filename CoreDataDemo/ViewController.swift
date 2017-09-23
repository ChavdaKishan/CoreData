import UIKit
import CoreData
class ViewController: UIViewController
{
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func saveData(_ sender: UIButton)
    {
        if username?.text != "" && passWord?.text != ""
        {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            newUser.setValue(self.username.text!, forKey: "userName")
            newUser.setValue(self.passWord.text!, forKey: "passWord")
            do
            {
                try context.save()
            }
            catch
            {
                print("Please Instert all Fields")
            }
        }
    }
    
    @IBAction func ShowDataClick(_ sender: Any)
    {
        if username.text != "" && passWord.text != ""
        {
            let data = storyboard?.instantiateViewController(withIdentifier: "TableView") as! TableViewController
            self.navigationController?.pushViewController(data, animated: true)
        }
    }
}
