//
//  ViewController.swift
//  CustomTableCellExample
//
//  Created by Shani on 11/13/17.
//  Copyright © 2017 Shani Rivers. All rights reserved.
//

import UIKit
import os.log

class ViewController: UITableViewController
{
    // Properties
    
    let headerTitles = ["Featured Recipes", "Latest"]
    
    var data = [[Recipe]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        let nib = UINib(nibName: "viewTblCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
        
        sampleData()
    }
    
    // Table View Methods
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // Count # of data
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Count # of embedded arrays in section [] []
        return data[section].count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Dequeue the cell with identifier
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let cell: CustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell else
        {
            os_log("Dequeued cell isn't an instance of CustomTableViewCell", log: .default, type: .debug)
            fatalError()
        }
        
        // Set up text by calling -> section & row
        let recipe = data[indexPath.section][indexPath.row]
        
//        cell.textLabel?.text = recipe.recipeTitle
        cell.recipeNameLbl?.text = recipe.recipeTitle
        cell.recipeImg?.image = recipe.dishImage
        cell.categoryLbl?.text = recipe.category
        cell.prepTimeLbl?.text = String(describing: recipe.prepTime) + " minutes"
        cell.servingSizeLbl?.text = String(describing: recipe.serves ) + " people"
        
        if recipe.difficulty == 1
        {
            cell.difficultyLbl?.text = "Easy"
        } else {
            cell.difficultyLbl?.text = "Challenging"
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        // If the section < header count
        
        if section < headerTitles.count
        {
            return headerTitles[section]
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 230
    }
    
    // Actions
    func sampleData()
    {
        let recipe1 = Recipe(category: "Healthy", recipeTitle: "Pasta Salad", prepTime: 30, difficulty: 1, serves: 6, dishImage: UIImage(named: "PastaSalad"), featuredFlag: false)
        let recipe2 = Recipe(category: "Brunch", recipeTitle: "Gluten-Free Pancakes", prepTime: 30, difficulty: 1, serves: 1, dishImage: UIImage(named: "Pancakes"), featuredFlag: false)
        let recipe3 = Recipe(category: "Entree", recipeTitle: "Sour Cream Fish Tacos", prepTime: 30, difficulty: 2, serves: 4, dishImage: UIImage(named: "CrazyTacos"), featuredFlag: true)
        let recipe4 = Recipe(category: "Dessert", recipeTitle: "Chocolate Coconut Pudding", prepTime: 30, difficulty: 1, serves: 2, dishImage: UIImage(named: "pudding"), featuredFlag: false)
        
        
        let recipes = [recipe1, recipe2, recipe3, recipe4]
        
        sortRecipes(recipes: recipes)
    }
    
    func sortRecipes (recipes: [Recipe])
    {
        var recipeFeatured = [Recipe]()
        var recipeLatest = [Recipe]()
        
        for recipe in recipes
        {
            if recipe.featuredFlag
            {
                recipeFeatured.append(recipe)
            } else {
                recipeLatest.append(recipe)
            }
        }
        
        // Append sorted recipes to the data variable
        data.append(recipeFeatured)
        data.append(recipeLatest)
    }
}

