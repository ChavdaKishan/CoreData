import UIKit
import CoreData
class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var userArray:[User] = []
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.featchData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        let name = userArray[indexPath.row]
        cell.lbl1.text = name.userName!
        cell.lbl2.text = name.passWord!
        return cell
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
}
