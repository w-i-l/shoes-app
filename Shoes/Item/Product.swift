//
//  Item.swift
//  Tesla
//
//  Created by mishu on 05.08.2022.
//

import SwiftUI



enum Category:String,Codable{
    case running = "running"
    case basketball = "basketball"
    case lifestyle = "lifestyle"
    case gym = "gym"
    case skateboarding = "skateboarding"
}


struct Product:Hashable,Codable{
    
    let name:String
    let price:Int
    let category:Category
    let logo:String
    let subtitle:String
    let imageArray:[String]
    let rating:Double
    let reviews:Int
    let description:String
    let sizes:[Int]
    
    init(_ name:String = "Zion 2", _ price:Int = 199, _ category:Category = Category.basketball, _ logo:String = "nike", _ subtitle:String = "Men Basketball Shoes", _ imageArray:[String] = ["adidas","adidas2","adidas3"], _ rating:Double = 4.5,_ reviews:Int = 21, _ description:String = "Channel new levels of speed and power in shoes designed for Zion and built for ballers at any level. An adjustable strap on the top helps lock in your",_ sizes:[Int] = [40,41,42,43,44,46]){

        self.name = name
        self.price = price
        self.category = category
        self.logo = logo
        self.subtitle = subtitle
        self.imageArray = imageArray
        self.rating = rating
        self.reviews = reviews
        self.description = description
        self.sizes = sizes
    }
    
}

let nikeAir1 = Product("Air Max 1", 159, Category.lifestyle, "nike", "Men Lifestyle Shoes", ["nike air 1","nike air 1 - 2","nike air 1 - 3"], 4.7, 13, "Double the Swooshes, double the fun. We put a fresh spin on what you know best: durably stitched overlays, clean finishes and subtly bold details that make you shine. Two Swoosh logos on the side show your love for the brand that does it best.")
let zoomx = Product("ZoomX Vaporfly", 169, Category.running, "nike", "Men Running Shoes", ["zoomx","zoomx - 2","zoomx - 3"], 4.8, 19, "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper. From a 10K to a marathon, the 2 still has the responsive cushioning and secure support to help push you towards your personal best.", [44,48,49])
let metcon = Product("Metcon 8", 99, Category.gym, "nike", "Men Gym Shoes", ["metcon","metcon - 2","metcon - 3"], 4.0, 15, "The Nike Metcon 8 NBY allows you to add a little bling to your everyday workout routines with chrome options on everything from the Swoosh to the heel plate to shoelaces. An updated sport-inspired colour palette complements a head-turning marble option along the outsole and sidewalls.", [38,40,43,45,47])
let sb = Product("SB Shane", 79, Category.skateboarding, "nike", "Men Skateboarding Shoes", ["sb","sb - 2","sb - 3"], 4.9, 38, "Shane O'Neill put the same attention to detail into every aspect of his signature shoe as he does in his almost-otherworldly skating. From the low-key perforated ventilation, to the double lacing option, to the no-break-in remastered sole—the Nike SB Shane gets all the details right.", [38,39,40,43,45])


let shoesArray = [Product(),nikeAir1,zoomx,metcon,sb]
