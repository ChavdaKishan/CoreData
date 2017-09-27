import UIKit
import CoreData

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var TableView: UITableView!
    
    var userArray:[User] = []
    var studentArray:[Student] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.featchData()
        self.featchData2()
        self.TableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let data = Bundle.main.loadNibNamed("MyCell", owner: self, options: nil)?.first as! MyCell
        data.Lbl1.text = userArray[indexPath.row].userName
        data.Lbl2.text = userArray[indexPath.row].passWord
        data.Lbl3.text = studentArray[indexPath.row].name
        data.Lbl4.text = studentArray[indexPath.row].fevouriteSubject
        return data
    }
    
    func featchData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            userArray = try context.fetch(User.fetchRequest())
        }
        catch
        {
            print(error)
        }
    }
    func featchData2()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            studentArray = try context.fetch(Student.fetchRequest())
        }
        catch
        {
            print(error)
        }
    }
}
