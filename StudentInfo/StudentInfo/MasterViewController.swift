//
//  MasterViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/17/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

var students: [StudentModel] = []

class MasterViewController: UITableViewController, UISearchResultsUpdating, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var filteredstudents = [StudentModel]()//for search results
    var resultSearchController = UISearchController()//build a search controller

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initializa information for students
        students = [StudentModel(id: "1", image: "TC Dong", name: "TC Dong", info: "The infomation for TC Dong is as follows: (1) comes from South Africa and (2) the degree and program: Bachelors in ECE and (3) the programming languages are Java and C and (4) the interest : Violin and  Figure Skating"),StudentModel(id: "2", image: "Weidong Duan", name: "Weidong Duan", info: "The infomation for Weidong Duan is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C++ and (4) the interest : Swimming and movies"),StudentModel(id: "2", image: "Shuai Fu", name: "Shuai Fu", info: "The infomation for Shuai Fu is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Table tennis and Piano"),StudentModel(id: "2", image: "Shaoyi Han", name: "Shaoyi Han", info: "The infomation for Shaoyi Han is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are C and C++ and (4) the interest : Piano and Dancing"),StudentModel(id: "2", image: "Rahul Harikrishnan", name: "Rahul Harikrishnan", info: "The infomation for Rahul Harikrishnan is as follows: (1) comes from Washington and (2) the degree and program: Bachelors in ECE and CS and (3) the programming languages are Java and Python and (4) the interest : Walking and Hiking"),StudentModel(id: "2", image: "Wenting Hu", name: "Wenting Hu", info: "The infomation for Wenting Hu is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are C and C++ and (4) the interest : Piano and Computer Games"),StudentModel(id: "2", image: "Jingxiong Huang", name: "Jingxiong Huang", info: "The infomation for Jingxiong Huang is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are C++ and Python and (4) the interest : Swimming and Mobile Phone Games"),StudentModel(id: "2", image: "Zhuo Jia", name: "Zhuo Jia", info: "The infomation for Zhuo Jia is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C++ and (4) the interest : Cooking and Photoshooting"),StudentModel(id: "2", image: "Deyu Jiao", name: "Deyu Jiao", info: "The infomation for Deyu Jiao is as follows: (1) comes from China and (2) the degree and program: Information Engineering and (3) the programming languages are Java and C++ and (4) the interest : Choir and Piano"),StudentModel(id: "2", image: "Allan Kiplagat", name: "Allan Kiplagat", info: "The infomation for Allan Kiplagat is as follows: (1) comes from Kenya and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and Ruby and (4) the interest : Guitar and Jogging"),StudentModel(id: "2", image: "Ashwin Kommajesula", name: "Ashwin Kommajesula", info: "The infomation for Ashwin Kommajesula is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Cooking"),StudentModel(id: "2", image: "Austin Kyker", name: "Austin Kyker", info: "The infomation for Austin Kyker is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Basketball"),StudentModel(id: "2", image: "Hao Li", name: "Hao Li", info: "The infomation for Hao Li is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C++ and (4) the interest : Basketball and Movie"),StudentModel(id: "2", image: "Jiancheng Li", name: "Jiancheng Li", info: "The infomation for Jiancheng Li is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Swimming and Computer games"),StudentModel(id: "2", image: "Guoshan Liu", name: "Guoshan Liu", info: "The infomation for Guoshan Liu is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C++ and (4) the interest : Piano and Music"),StudentModel(id: "2", image: "Mingming Lu", name: "Mingming Lu", info: "The infomation for Mingming Lu is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C++ and (4) the interest : Basketball and Workout"),StudentModel(id: "2", image: "Xin Lu", name: "Xin Lu",info: "The infomation for Xin Lu is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are C++ and GO and (4) the interest : Running and Table Tennis"),StudentModel(id: "2", image: "Chase Malik", name: "Chase Malik", info: "The infomation for Chase Malik is as follows: (1) comes from Missouri and (2) the degree and program: Bachelors in ECE and CS and (3) the programming languages are Java and C and (4) the interest : Video games and Watch sports"),StudentModel(id: "2", image: "Julien Mansier", name: "Julien Mansier", info: "The infomation for Julien Mansier is as follows: (1) comes from Florida and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Football and Beer"),StudentModel(id: "2", image: "Greg McKeon", name: "Greg McKeon",info: "The infomation for Greg McKeon is as follows: (1) comes from New York and (2) the degree and program: Bachelors in ECE and (3) the programming languages are Java and JavaScript and (4) the interest : Netflix and Baseball"),StudentModel(id: "2", image: "Weichen Ning", name: "Weichen Ning",info: "The infomation for Weichen Ning is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are C and C++ and (4) the interest : Badminton and Movie"),StudentModel(id: "2", image: "Zachary Podbela", name: "Zachary Podbela",info: "The infomation for Zachary Podbela is as follows: (1) comes from New York and (2) the degree and program: Bachelors in ECE and (3) the programming languages are Java and Python and (4) the interest : Music and Flying"),StudentModel(id: "2", image: "Scotty Shaw", name: "Scotty Shaw", info: "The infomation for Scotty Shaw is as follows: (1) comes from Texas and (2) the degree and program: Bachelors in Comp Sci and (3) the programming languages are Java and Object C and (4) the interest : Basketball and Traveling"),StudentModel(id: "2", image: "Emmanuel Shiferaw", name: "Emmanuel Shiferaw",info: "The infomation for Emmanuel Shiferaw is as follows: (1) comes from North Carolina and (2) the degree and program: Bachelors in ECE and (3) the programming languages are Java and C# and (4) the interest : Reading and Football"),StudentModel(id: "2", image: "Weiqi Wei", name: "Weiqi Wei",info: "The infomation for Weiqi Wei is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C++ and (4) the interest : Soccer and table Tennis"),StudentModel(id: "2", image: "Hao Wu", name: "Hao Wu", info: "The infomation for Hao Wu is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Tennis and Movie"),StudentModel(id: "2", image: "Boyang Xu", name: "Boyang Xu", info: "The infomation for Boyang Xu is as follows: (1) comes from China and (2) the degree and program: Masters in CS and (3) the programming languages are Java and C and (4) the interest : Soccer and Basketball"),StudentModel(id: "2", image: "Shuai Yuan", name: "Shuai Yuan", info: "The infomation for Shuai Yuan is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are Java and C and (4) the interest : Basketball and Computer Games"),StudentModel(id: "2", image: "Ran Zhou", name: "Ran Zhou",info: "The infomation for Ran Zhou is as follows: (1) comes from China and (2) the degree and program: Master of Engineering and (3) the programming languages are C and C++ and (4) the interest : Violin and Swimming"),StudentModel(id: "2", image: "Hong Jin", name: "Hong Jin", info: "The infomation for Hong Jin is as follows: (1) comes from China and (2) the degree and program: Masters in ECE and (3) the programming languages are C and C++ and (4) the interest : Basketball and Computer games")]
        
        self.resultSearchController = ({
            let searchcontroller = UISearchController(searchResultsController: nil)
            searchcontroller.searchResultsUpdater = self
            searchcontroller.dimsBackgroundDuringPresentation = false
            searchcontroller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = searchcontroller.searchBar
            
            return searchcontroller
        })() // A closure is used which is assigned to the resultSearchController. The results of the search will be presented in the current Table View, so the searchResultsController parameter of the UISearchController init method is set to nil. Also, the searchResultsUpdater property is set to the current Table View Controller and the background dimming is set to false. The searchable is added to the Table View and the data is reloaded. Next, implement the Table View Data Source delegate methods

        self.tableView.reloadData()//// Reload the table
        
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)//implement the updateSearchResultsForSearchController delegate method of the UISearchResultsUpdating protocol
    {
        filteredstudents.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "self.name contains[c] %@", searchController.searchBar.text)
        let array = (students as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredstudents = array as! [StudentModel]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {//insertnew here
        var textField = UITextField()
        var newStudent: StudentModel = StudentModel(id:"",image:"",name: "",info:"")
        students.insert(newStudent, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                //let student = students[indexPath.row]
                var student: StudentModel
                //display search results
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                if (self.resultSearchController.active) {
                    student = filteredstudents[indexPath.row]
                }
                else {
                    student = students[indexPath.row]
                }
                controller.student = student
                //controller.detailItem = student
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    
    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // one section here
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return self.filteredstudents.count
        }
        else {
        return students.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        //let object = objects[indexPath.row] as! NSDate
        //cell.textLabel!.text = object.description
        var student :StudentModel
        if (self.resultSearchController.active) {
            student = filteredstudents[indexPath.row]
        }
        else {
            student = students[indexPath.row]
        }
        cell.textLabel!.text = student.name
        // for checkmark
        if (student.check == true) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        if (student.name == "Shuai Yuan" || student.name == "TC Dong" || student.name == "Ran Zhou") {    //highlight here
            cell.textLabel!.text = student.name
            cell.textLabel?.textColor = UIColor.redColor()
        }
        else {
            cell.textLabel!.text = student.name
            cell.textLabel?.textColor = UIColor.blackColor()
        }

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var student : StudentModel
        if self.resultSearchController.active {
        student = filteredstudents[indexPath.row] as StudentModel
        }
        else {
        student = students[indexPath.row] as StudentModel
        }
        student.check = true
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
        
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            students.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

