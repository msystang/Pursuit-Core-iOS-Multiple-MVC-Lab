//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let animals = ZooAnimal.zooAnimals
    let mammals = ZooAnimal.mammals
    let amphibians = ZooAnimal.amphibians
    let reptiles = ZooAnimal.reptiles
    let insects = ZooAnimal.insects
    let birds = ZooAnimal.birds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITextViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Mammals"
        case 1:
            return "Amphibians"
        case 2:
            return "Reptiles"
        case 3:
            return "Insects"
        case 4:
            return "Birds"
        default:
            return "Some other critter"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mammals.count
        case 1:
            return amphibians.count
        case 2:
            return reptiles.count
        case 3:
            return insects.count
        case 4:
            return birds.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let mammal = mammals[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
                cell.animalImage.image = UIImage(named: String(mammal.imageNumber))
                cell.animalNameLabel?.text = mammal.name
                cell.animalOriginLabel?.text = mammal.origin
                return cell
            }
        case 1:
            let amphibian = amphibians[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
                cell.animalImage.image = UIImage(named: String(amphibian.imageNumber))
                cell.animalNameLabel?.text = amphibian.name
                cell.animalOriginLabel?.text = amphibian.origin
                return cell
            }
        case 2:
            let reptile = reptiles[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
                cell.animalImage.image = UIImage(named: String(reptile.imageNumber))
                cell.animalNameLabel?.text = reptile.name
                cell.animalOriginLabel?.text = reptile.origin
                return cell
            }
        case 3:
            let insect = insects[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
                cell.animalImage.image = UIImage(named: String(insect.imageNumber))
                cell.animalNameLabel?.text = insect.name
                cell.animalOriginLabel?.text = insect.origin
                return cell
            }
        case 4:
            let bird = birds[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
                cell.animalImage.image = UIImage(named: String(bird.imageNumber))
                cell.animalNameLabel?.text = bird.name
                cell.animalOriginLabel?.text = bird.origin
                return cell
            }
        default:
                return UITableViewCell()
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue")}
        
        switch segueIdentifier {
        case "segueToAnimalDetails":
            guard let animalDetailVC = segue.destination as? AnimalViewController
                else {
                    fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = self.tableView.indexPathForSelectedRow
                else {
                    fatalError("No row was selected")
            }
            
//            animalDetailVC.animal = animals[selectedIndexPath.row]
            
            switch selectedIndexPath.section {
            case 0:
                animalDetailVC.animal = mammals[selectedIndexPath.row]
            case 1:
                animalDetailVC.animal = amphibians[selectedIndexPath.row]
            case 2:
                animalDetailVC.animal = reptiles[selectedIndexPath.row]
            case 3:
                animalDetailVC.animal = insects[selectedIndexPath.row]
            case 4:
                animalDetailVC.animal = birds[selectedIndexPath.row]
            default:
                fatalError("No!")
            }
            
            
            
            
            
        default:
            fatalError("Unexpected segue identifier")
            
        }
    }
    
}
