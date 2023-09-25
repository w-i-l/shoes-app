//
//  MockedData.swift
//  Shoes
//
//  Created by mishu on 21.09.2023.
//

import Foundation

let zion2 = Product(
    name: "Zion 2",
    price: 199,
    category: .basketball,
    logo: "nike",
    subtitle: "Men Basketball Shoes",
    imageArray: ["adidas", "adidas2", "adidas3"],
    rating: 4.5,
    reviews: 21,
    description: "Channel new levels of speed and power in shoes designed for Zion and built for ballers at any level. An adjustable strap on the top helps lock in your",
    sizes: [40, 41, 42, 43, 44, 46]
)

let nikeAir1 = Product(
    name: "Air Max 1",
    price: 159,
    category: ProductCategories.lifestyle,
    logo: "nike",
    subtitle: "Men Lifestyle Shoes",
    imageArray: ["nike air 1", "nike air 1 - 2", "nike air 1 - 3"],
    rating: 4.7,
    reviews: 13,
    description: "Double the Swooshes, double the fun. We put a fresh spin on what you know best: durably stitched overlays, clean finishes and subtly bold details that make you shine. Two Swoosh logos on the side show your love for the brand that does it best.",
    sizes: [26, 42, 12]
)

let zoomx = Product(
    name: "ZoomX Vaporfly",
    price: 169,
    category: ProductCategories.running,
    logo: "nike",
    subtitle: "Men Running Shoes",
    imageArray: ["zoomx", "zoomx - 2", "zoomx - 3"],
    rating: 4.8,
    reviews: 19,
    description: "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper. From a 10K to a marathon, the 2 still has the responsive cushioning and secure support to help push you towards your personal best.",
    sizes: [44, 48, 49]
)

let metcon = Product(
    name: "Metcon 8",
    price: 99,
    category: ProductCategories.gym,
    logo: "nike",
    subtitle: "Men Gym Shoes",
    imageArray: ["metcon", "metcon - 2", "metcon - 3"],
    rating: 4.0,
    reviews: 15,
    description: "The Nike Metcon 8 NBY allows you to add a little bling to your everyday workout routines with chrome options on everything from the Swoosh to the heel plate to shoelaces. An updated sport-inspired colour palette complements a head-turning marble option along the outsole and sidewalls.",
    sizes: [38, 40, 43, 45, 47]
)

let sb = Product(
    name: "SB Shane",
    price: 79,
    category: ProductCategories.skateboarding,
    logo: "nike",
    subtitle: "Men Skateboarding Shoes",
    imageArray: ["sb", "sb - 2", "sb - 3"],
    rating: 4.9,
    reviews: 38,
    description: "Shane O'Neill put the same attention to detail into every aspect of his signature shoe as he does in his almost-otherworldly skating. From the low-key perforated ventilation, to the double lacing option, to the no-break-in remastered sole—the Nike SB Shane gets all the details right.",
    sizes: [38, 39, 40, 43, 45]
)


let shoesArray = [zion2, nikeAir1, zoomx, metcon, sb]

struct MockedData {
    
    static let zion2 = Product(
        name: "Zion 2",
        price: 199,
        category: .basketball,
        logo: "nike",
        subtitle: "Men Basketball Shoes",
        imageArray: ["adidas", "adidas2", "adidas3"],
        rating: 4.5,
        reviews: 21,
        description: "Channel new levels of speed and power in shoes designed for Zion and built for ballers at any level. An adjustable strap on the top helps lock in your",
        sizes: [40, 41, 42, 43, 44, 46]
    )

    static let nikeAir1 = Product(
        name: "Air Max 1",
        price: 159,
        category: ProductCategories.lifestyle,
        logo: "nike",
        subtitle: "Men Lifestyle Shoes",
        imageArray: ["nike air 1", "nike air 1 - 2", "nike air 1 - 3"],
        rating: 4.7,
        reviews: 13,
        description: "Double the Swooshes, double the fun. We put a fresh spin on what you know best: durably stitched overlays, clean finishes and subtly bold details that make you shine. Two Swoosh logos on the side show your love for the brand that does it best.",
        sizes: [26, 42, 12]
    )

    static let zoomx = Product(
        name: "ZoomX Vaporfly",
        price: 169,
        category: ProductCategories.running,
        logo: "nike",
        subtitle: "Men Running Shoes",
        imageArray: ["zoomx", "zoomx - 2", "zoomx - 3"],
        rating: 4.8,
        reviews: 19,
        description: "Continue the next evolution of speed with a racing shoe made to help you chase new goals and records. The Nike ZoomX Vaporfly NEXT% 2 builds on the model racers everywhere love. It helps improve comfort and breathability with a redesigned upper. From a 10K to a marathon, the 2 still has the responsive cushioning and secure support to help push you towards your personal best.",
        sizes: [44, 48, 49]
    )

    static let metcon = Product(
        name: "Metcon 8",
        price: 99,
        category: ProductCategories.gym,
        logo: "nike",
        subtitle: "Men Gym Shoes",
        imageArray: ["metcon", "metcon - 2", "metcon - 3"],
        rating: 4.0,
        reviews: 15,
        description: "The Nike Metcon 8 NBY allows you to add a little bling to your everyday workout routines with chrome options on everything from the Swoosh to the heel plate to shoelaces. An updated sport-inspired colour palette complements a head-turning marble option along the outsole and sidewalls.",
        sizes: [38, 40, 43, 45, 47]
    )

    static let sb = Product(
        name: "SB Shane",
        price: 79,
        category: ProductCategories.skateboarding,
        logo: "nike",
        subtitle: "Men Skateboarding Shoes",
        imageArray: ["sb", "sb - 2", "sb - 3"],
        rating: 4.9,
        reviews: 38,
        description: "Shane O'Neill put the same attention to detail into every aspect of his signature shoe as he does in his almost-otherworldly skating. From the low-key perforated ventilation, to the double lacing option, to the no-break-in remastered sole—the Nike SB Shane gets all the details right.",
        sizes: [38, 39, 40, 43, 45]
    )

    static let shoesArray = [zion2, nikeAir1, zoomx, metcon, sb]
}
