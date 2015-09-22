//
//  MasterViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/17/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

//var students: [StudentModel] = []

var groups = [
    grWJL, grSiMas, grHelloWorld, grAppleFarm, grHelloSiri, grBugFree, grShootingGuards, grPhysaologist, gr9, gr10, others]

var grWJL : [StudentModel] = []
var grSiMas : [StudentModel] = []
var grHelloWorld : [StudentModel] = []
var grAppleFarm : [StudentModel] = []
var grHelloSiri : [StudentModel] = []
var grBugFree : [StudentModel] = []
var grShootingGuards : [StudentModel] = []
var grPhysaologist : [StudentModel] = []
var gr9 : [StudentModel] = []
var gr10 : [StudentModel] = []
var others: [StudentModel] = []


class MasterViewController: UITableViewController, UISearchResultsUpdating, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func doAdd(sender: AnyObject) {
    }

    var detailViewController: DetailViewController? = nil
    //var objects = [AnyObject]()
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
        grWJL = [
            StudentModel(name:"Deyu Jiao", place: "China", degree: "ECE second year Masters", interests: "choir and piano", exp: true, pLang: "Java and C++", work: "Cloud based address book"),
            StudentModel(name:"Guoshan Liu", place: "China", degree: "ECE second year Masters", interests: "piano and listening to music", exp: false, pLang: "Java and C++", work:nil),
            StudentModel(name:"Hao Wu", place: "China", degree: "ECE second year Masters", interests: "tennis and watching movies", exp: true, pLang: "Java and C", work: "Logistic Corp")]
        
        grSiMas = [
            StudentModel(name:"Rahul Harikrishnan", place:"Seattle, Washington", degree:"ECE/CS Senior", interests:"cricket, walking and hiking", exp: true, pLang:"Java and Python", work:"AppDeal"),
            StudentModel(name:"Allan Kiplagat", place: "Kenya", degree: "ECE/CS", interests: "guitar and jogging", exp: true, pLang: "Java and Ruby", work:"Top secret internship"),
            StudentModel(name:"Julien Mansier", place: "Orlando, Florida", degree: "ECE professional", interests: "Football and brewing beer", exp: true, pLang: "Java and C++", work: "the Auto industry")]
        
        grHelloWorld = [
            StudentModel(name: "Jiancheng Li", place: "China", degree: "ECE second year Masters", interests: "swimming and playing computer games", exp: false, pLang: "Java and C", work:nil),
            StudentModel(name:"Zhuo Jia", place: "China", degree: "ECE second year Masters", interests: "cooking and photography", exp: true, pLang: "Java and C++", work: "Chinese startup"),
            StudentModel(name:"Weidong Duan", place:"China", degree:"ECE second year Masters", interests:"swimming and watching movies", exp:false, pLang:"Java and C++", work:nil)]
        
        grAppleFarm=[
            StudentModel(name:"Jingxiong Huang", place: "China", degree: "ECE second year Masters", interests: "swimming and mobile games", exp: false, pLang: "C++ and Python", work:nil),
            StudentModel(name:"Xin Lu", place: "China", degree: "ECE second year Masters", interests: "running and table tennis", exp: true, pLang: "C++ and Go", work: "Cloud computing"),
            StudentModel(name:"Greg McKeon", place: "New York", degree: "ECE/CS", interests: "Netflix and baseball", exp: true, pLang: "Java and Javascript", work: "American Express")]
        
        grHelloSiri = [
            StudentModel(name:"Shaoyi Han", place:"China", degree:"ECE second year Masters", interests:"piano and dancing", exp:false, pLang:"C and C++", work:nil),
            StudentModel(name:"Hong Jin", place: "China", degree: "ECE second year Masters", interests: "basketball and playing computer games", exp: false, pLang: "C and C++", work:nil),
            StudentModel(name:"Boyang Xu", place: "China", degree: "CS second year Masters", interests: "soccer and basketball", exp: false, pLang: "Java and C", work:nil)]
        
        grBugFree = [
            StudentModel(name:"Shuai Yuan", place: "China", degree: "ECE second year Masters", interests: "basketball and playing computer games", exp: false, pLang: "Java and C", work:nil),
            StudentModel(name:"Ran Zhou", place: "China", degree: "ECE second year Masters", interests: "violin and swimming", exp: true, pLang: "C and C++", work: "Snyder Electric, China"),
            StudentModel(name:"TC Dong", place:"South Africa", degree:"ECE/CS Senior", interests:"violin and figure skating", exp:true, pLang:"Java and C",work:"IBM")]
        
        grShootingGuards = [
            StudentModel(name:"Chase Malik", place: "Kansas City, Missouri", degree: "ECE/CS/Math Senior", interests: "video games and watching sports", exp: true, pLang: "Java and C", work: "Sporting Innovation"),
            StudentModel(name: "Austin Kyker", place: "Indiana, Indianapolis", degree: "ECE/CS Senior", interests: "basketball and golf", exp: true, pLang: "Java and Javascript", work: "Ebay"),
            StudentModel(name:"Scotty Shaw", place: "Texas", degree: "CS Senior", interests: "basketball", exp:    true, pLang: "Java and Objective C", work: "HackWare, LLC")]
        
        grPhysaologist = [
            StudentModel(name:"Weiqi Wei", place: "China", degree: "ECE second year Masters", interests: "soccer and table tennis", exp: false, pLang: "Java and C++", work:nil),
            StudentModel(name:"Hao Li", place: "China", degree: "ECE second year Masters", interests: "basketball and watching movies", exp: false, pLang: "Java and C++", work:nil),
            StudentModel(name:"Emmanuel Shiferaw", place: "Ethiopia then moved to Raleigh", degree: "ECE/CS Senior",interests: "reading and football", exp: true, pLang: "Java and C#", work: "Duke DiVE lab")]
        
        gr9 = [
            StudentModel(name:"Mingming Lu", place: "China", degree: "ECE second year Masters", interests: "basketball and working out", exp: false, pLang: "Java and C", work:nil),
            StudentModel(name:"Shuai Fu", place:"China", degree:"ECE second year Masters", interests:"table tennis and piano", exp:false, pLang:"Java and C", work:nil),
            StudentModel(name:"Weichen Ning", place: "China", degree: "ECE second year Masters", interests: "badminton and watching movies", exp: true, pLang: "C and C++", work: "Cisco")]
        
        gr10 = [
            StudentModel(name: "Wenting Hu", place: "China", degree:"ECE second year Masters", interests: "piano and video games", exp: true, pLang: "C and C++", work: "Intelligent water meters"),
            StudentModel(name:"Ashwin Kommajesula", place: "India then moved to New Jersey", degree: "ECE/CS Senior", interests: "violin and cooking", exp: true, pLang: "Java and C", work: "Quicken Loans"),
            StudentModel(name: "Zachary Podbela", place: "New York", degree: "ECE/CS Senior", interests: "listening to music and flying", exp: true, pLang: "Java and Python", work: "Capital One")]
        
        
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

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        // ----------- table view background image --Ocean_iOS7
        let backImageView = UIImageView(image: UIImage(named: "Ocean_iOS7"))
        backImageView.alpha = 0.6
        self.tableView.backgroundView = backImageView
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)//implement the updateSearchResultsForSearchController delegate method of the UISearchResultsUpdating protocol
    {
        filteredstudents.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "self.name contains[c] %@", searchController.searchBar.text!)
        var temp: [StudentModel] = []
        for array in groups{
            var res = (array as NSArray).filteredArrayUsingPredicate(searchPredicate)
            temp = res as! [StudentModel]
            filteredstudents += temp
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*func insertNewObject(sender: AnyObject) {//insertnew here
        _ = UITextField()
        let newStudent: StudentModel = StudentModel(name:"", place:"", degree:"", interests:"", exp:false, pLang:"", work:nil)
        students.insert(newStudent, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }*/

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            //let indexPath = self.tableView.indexPathForSelectedRow!
            if let indexPath = self.tableView.indexPathForSelectedRow() { //<- this was giving an; error
                //let student = students[indexPath.row]
                var student: StudentModel
                //display search results
                //let controller = segue.destinationViewController as! DetailViewController
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                if (self.resultSearchController.active) {
                    student = self.filteredstudents[indexPath.row]
                }
                else {
                    student = groups[indexPath.section][indexPath.row]
                }
                controller.student = student
                //controller.detailItem = student
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        if segue.identifier == "add" {
            let controller = segue.destinationViewController as! addViewController
            tableView.reloadData()
        }
    }

    
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (self.resultSearchController.active) {
            return 1
        }
        else {
            return groups.count
        }
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if (section == 0){
        if (self.resultSearchController.active) {
            return self.filteredstudents.count
        }
        else {
            return groups[section].count
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
            student = groups[indexPath.section][indexPath.row]
        }
        cell.textLabel!.text = student.name
        // for checkmark
        if (student.check == true) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        if (student.name == "Shuai Yuan" || student.name == "TC Dong" || student.name == "Ran Zhou") {    //highlight
            cell.textLabel!.text = student.name
            cell.textLabel?.textColor = UIColor.redColor()
        }
        else {
            cell.textLabel!.text = student.name
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        // cell image
        var image = cell.viewWithTag(12) as! UIImageView
        switch student.name{
        case "TC Dong", "Ran Zhou", "Guoshan Liu", "Wenting Hu", "Shaoyi Han" :
            image.image = UIImage(named:"girl2")
        default: image.image = UIImage(named: "boy")
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
        student = groups[indexPath.section][indexPath.row] as StudentModel
        }
        student.check = true
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
        //performSegueWithIdentifier("showDetail", sender: self)
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            groups[indexPath.section].removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    //unwind!!
    @IBAction func close(segue: UIStoryboardSegue) {
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        tableView.reloadData()
    }
    
    // Customized header cell
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColor.darkGrayColor()
        
        if (self.resultSearchController.active) {
            headerCell.headerLabel.text = "Whole Class"
        }
        else{
            var groupNames = ["WJL","Si!Mas!", "Hello World", "Apple Farm", "Hello Siri", "Bug Free","ShootingGuards", "Physaologist","Group 9", "Group 10", "others"]
            headerCell.headerLabel.text = groupNames[section]
        }
        
        headerCell.headerLabel.textColor = UIColor.whiteColor()
        return headerCell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        var groupNamesIndex = [
            "WJL", "S.M.", "H.W.", "A.F.", "H.S.", "B.F.", "S.G.", "Phy.", "gr.9", "gr.10", "..."]
        
        return groupNamesIndex
    }


}

