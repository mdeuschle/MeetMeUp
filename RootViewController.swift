//
//  RootViewController.swift
//  MeetMeUpSwift
//
//  Created by Matt Deuschle on 2/1/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    // event vars
    var eventsDictionary = NSDictionary()
    var eventsArray:NSArray?

    // var for search
    var search = String()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

            // set searchbar delegate
            searchBar.delegate = self

        let url = NSURL(string: "https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=606e6c4151326c43364d463f44b2b3e")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
            do{
                // set event dictionary
                self.eventsDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    as! NSDictionary

                // array of dictionary
                self.eventsArray = self.eventsDictionary.objectForKey("results") as! [NSDictionary]
            }
            catch let error as NSError{
                print("jsonError: \(error.localizedDescription)")
            }
            self.tableView.reloadData()
        }
        task.resume()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(eventsArray != nil)
        {
            return (eventsArray?.count)!
        }
        else
        {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID")! as UITableViewCell

        if (eventsArray != nil)
        {
            cell.textLabel?.text = eventsArray![indexPath.row].objectForKey("name") as? String

            let addressString = eventsArray![indexPath.row].objectForKey("venue")?.objectForKey("address_1") as? String

            cell.detailTextLabel?.text = addressString
            cell.imageView?.image = UIImage(named: "logo")
        }
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // remove back button title to make room for event title
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem

        let dvc = segue.destinationViewController as! DetailViewController
        let cell = sender as! UITableViewCell
        let path = tableView.indexPathForCell(cell)

        // pass along array to dvc
        dvc.event = eventsArray?.objectAtIndex(path!.row) as? NSDictionary
    }

    // searchBar delegate method
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        self.search = searchBar.text!
        self.loadTable()
        resignFirstResponder()
    }

// helper method for searchBar
    func loadTable()
    {
        // take out mobile add text from searchbar
        let url = NSURL(string: "https://api.meetup.com/2/open_events.json?zip=60604&text=" + search + "&time=,1w&key=606e6c4151326c43364d463f44b2b3e")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
            do{
                self.eventsDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    as! NSDictionary
                self.eventsArray = self.eventsDictionary.objectForKey("results") as! [NSDictionary]
            }
            catch let error as NSError{
                print("jsonError: \(error.localizedDescription)")
            }
            self.tableView.reloadData()
        }
        task.resume()
    }

}








