import UIKit
import CoreData

class ViewController: UIViewController
{
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var studentNM: UITextField!
    @IBOutlet weak var subject: UITextField!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // MARK : - Insert
    @IBAction func InsertClick(_ sender: Any)
    {
        // Insert First Entity
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
                print("Please Insert all Fields")
            }
        }
        // Insert Second Entity
        if studentNM.text != "" && subject.text != ""
        {
            let newStudent = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
            newStudent.setValue(self.studentNM.text!, forKey: "name")
            newStudent.setValue(self.subject.text, forKey: "fevouriteSubject")
            do
            {
                try context.save()
            }
            catch
            {
                print("Please Insert All Fields")
            }
        }
    }
    
    // MARK : - Delete
    @IBAction func DeleteClick(_ sender: Any)
    {
        delete1()
        delete2()
    }
    
    // MARK : - Display
    @IBAction func Display(_ sender: Any)
    {
        if username.text != "" && passWord.text != "" && studentNM.text != "" && subject.text != ""
        {
            let data = storyboard?.instantiateViewController(withIdentifier: "TableView") as! TableViewController
            self.navigationController?.pushViewController(data, animated: true)
        }
        username.text = ""
        passWord.text = ""
        studentNM.text = ""
        subject.text = ""
    }
    
    // Delete First Entity
    func delete1()
    {
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        do
        {
            let arr_user = try context.fetch(fetchRequest)
            for user in arr_user as [NSManagedObject]
            {
                context.delete(user)
            }
//            do
//            {
//                try context.save()
//                print("Deleted First Entity")
//            }
//            catch let error as NSError
//            {
//                print("Could not save \(error),\(error.userInfo)")
//            }
        }
        catch
        {
            print("Error with request: \(error)")
        }
    }
    
    // Delete Second Entity
    func delete2()
    {
        let fetchrequest : NSFetchRequest<Student> = Student.fetchRequest()
        do
        {
            let arr_student = try context.fetch(fetchrequest)
            for std in arr_student as [NSManagedObject]
            {
                context.delete(std)
            }
//            do
//            {
//                try context.save()
//                print("Deleted Second Entity")
//            }
//            catch let error as NSError
//            {
//                print("Could not save \(error),\(error.userInfo)")
//            }
        }
        catch
        {
            print("Error with request: \(error)")
        }
    }
}
