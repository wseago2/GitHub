//
//  ViewController.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import "FeatureItem.h"
#import "DetailViewController.h"
#import "CustomHeader.h"
#import "FeatureCell.h"


@interface ViewController ()

@end

@implementation ViewController

//@synthesize observedIndexPath;
@synthesize observedObject;

    NSMutableArray *features;

    NSMutableArray *nakedEye;
    NSMutableArray *binocular;
    NSMutableArray *telescope;




#pragma storage methods
// method to set documents directory to a variable
- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSLog(@"Documents directory = %@", documentsDirectory);
    return documentsDirectory;
}


// method to set data file path
- (NSString*)dataFilePath
{
    // get documents directory file path and append file name
    return [[self documentsDirectory] stringByAppendingPathComponent:@"LunarObserver.plist"];
}


// save data method
- (void)saveFeatureItems
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]
                                 initForWritingWithMutableData:data];
    [archiver encodeObject:features forKey:@"FeatureItem"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
    NSLog(@"Data Saved");
}


// load data method
- (void)loadFeatureItems
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
       features = [[NSMutableArray alloc] init];
        
        nakedEye = [[NSMutableArray alloc] init];
        binocular = [[NSMutableArray alloc] init];
        telescope = [[NSMutableArray alloc] init];
        
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        features = [unarchiver decodeObjectForKey:@"FeatureItem"];
        [unarchiver finishDecoding];
        
        
        
        [nakedEye addObjectsFromArray:[features objectAtIndex:0]];
        [binocular addObjectsFromArray:[features objectAtIndex:1]];
        [telescope addObjectsFromArray:[features objectAtIndex:2]];
        
        
    } else {
        
        // array of features to hold all features
        features = [[NSMutableArray alloc] init];
        
        // arrays for sections
        nakedEye = [[NSMutableArray alloc] init];
        binocular = [[NSMutableArray alloc] init];
        telescope = [[NSMutableArray alloc] init];
        
        FeatureItem *item;
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Old Moon in New Moon's Arms";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 72 Hours of New Moon.";
        item.featureDescription = @"The Moon's Ashen Glow Just Before New Moon.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"New Moon in Old Moon's Arms";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 72 Hours of New Moon.";
        item.featureDescription = @"The Moon's Ashen Glow Just After New Moon.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crescent Moon, Waxing";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 40 Hours of New Moon.";
        item.featureDescription = @"Young Moon. Always Seen to the West.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crescent Moon, Waning";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 48 Hours of New Moon.";
        item.featureDescription = @"Old Moon. Seen to the East Before Dawn.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Man in the Moon";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Human Face.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Woman in the Moon";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Female Figure.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rabbit in the Moon";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Rabbit.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Cow Jumping Over the Moon";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Cow Jumping the Moon.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Crisium";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Crises. Formed During the Pre-Imbrian Period. 555 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Fecunditatis";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Fertility. Formed in the Pre-Nectarian Epoch. 840 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Serenitatis";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Serenity. Landing Site of Apollo 17. 674 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Tranquillitatis";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Tranquility. Landing Site of Apollo 11. 873 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Nectaris";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Nectar. 333 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Imbrium";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Rains. Landing Site of Luna 17, Apollo 15, and Chang'e 3. 1145 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Frigoris";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Cold. 1446 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Nubium";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Clouds. 715 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Humorum";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Moisture. 389 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Oceanus Procellarum";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Ocean of Storms. Landing Site of Apollo 12. 2592 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        // ******************************
        // Binocular Features
        // ******************************
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Lunar Rays";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Iridum";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Medii";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Roris";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Somnii";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Epidemiarum";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Vaorum";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Langrenus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Vendelinus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Petavius";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cleomedes";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Atlas";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hercules";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Endymion";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Macrobius";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Piccolomini";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Theophilus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cyrillus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Catharina";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Posidonius";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fracastorius";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristoteles";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Eudoxes";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cassini";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hipparchus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Albategnius";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristillus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Autolycus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Maurolycus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Plato";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Archimedes";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Ptolemaeus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Alphonsus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Arzachel";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Walter";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Maginus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Tycho";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Clavius";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Eratosthenes";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Longomontanus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Copernicus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Bullialdus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristarchus";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Gassendi";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Kepler";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Grimaldi";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        // ******************************
        // Telescope Features
        // ******************************
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Aestuum";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Lacus Mortis";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Putredinis";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Laplace";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Heraclides";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Agarum";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Montes Alpes";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Montes Apenninus";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mons Hadley";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"MonsPiton";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mons Pico";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rupes Altai";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rima Hyginus";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Valis Schroteri";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Vallis Alpes";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rupes Recta";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Picard";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Furnerius";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Petavius Wall";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Messier/Messier A";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Proclus";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fabricius";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Plinius";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Mitchell";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cassini A";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Manilius";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Gemma Frisius";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Davy";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Pitatus";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Billy";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fra Mauro";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Clavius Craterlets";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hippalus";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hershel, J.";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Schickard";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Reiner Gamma";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        // add feature type arrays to _features array
        [features addObject:nakedEye];
        [features addObject:binocular];
        [features addObject:telescope];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    // reload tableView
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"Documents folder is %@", [self documentsDirectory]);
//    NSLog(@"Data file path is %@", [self dataFilePath]);
    
    [self loadFeatureItems];
    
    
    // register for notification events to save data
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveFeatureItems)
                                                 name:@"UIApplicationDidEnterBackgroundNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveFeatureItems)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//******************************
#pragma tableView methods
//******************************

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [features count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0){
        return @"Naked Eye Features";
    }else if (section == 1){
        return @"Binocular Features";
    }else{
        return @"Telescope Features";
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0){
            return [nakedEye count];
        }else if (section == 1){
            return [binocular count];
        }else{
            return [telescope count];
        }
 
}


- (void)configureBackgroundColorForCell:(UITableViewCell *)cell
                            withFeatureItem:(FeatureItem *)item
{
    if ([item.observed  isEqual:@"NO"]){
//        cell.backgroundColor = [UIColor redColor];
        cell.backgroundColor = [UIColor colorWithRed:0.62 green:0.086 blue:0.09 alpha:1];
    }else{
//        cell.backgroundColor = [UIColor greenColor];
//        cell.backgroundColor = [UIColor colorWithRed:106.0f/255.0f green:168.0f/255.0f blue:79.0f/255.0f alpha:1.0f];
        cell.backgroundColor = [UIColor colorWithRed:0.094 green:0.369 blue:0.396 alpha:1];
    }
    
}


- (void)configureTextForCell:(UITableViewCell*)cell withFeatureItem:(FeatureItem*)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = item.featureName;
}


- (UITableViewCell*)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeatureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeatureCell"];
    if (cell != nil)
    {

        if ([indexPath section] == 0){
            FeatureItem *item = nakedEye[indexPath.row];
            [self configureTextForCell:cell withFeatureItem:item];
            [self configureBackgroundColorForCell:cell withFeatureItem:item];
        } else if ([indexPath section] == 1){
            FeatureItem *item = binocular[indexPath.row];
            [self configureTextForCell:cell withFeatureItem:item];
            [self configureBackgroundColorForCell:cell withFeatureItem:item];
        } else if ([indexPath section] == 2){
            FeatureItem *item = telescope[indexPath.row];
            [self configureTextForCell:cell withFeatureItem:item];
            [self configureBackgroundColorForCell:cell withFeatureItem:item];
        }
    }
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showFeatureDetails"])
    {
        // pass data
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *detailViewController = segue.destinationViewController;
    
        if ([indexPath section] == 0)
        {
            detailViewController.featureName = [[nakedEye objectAtIndex:indexPath.row] featureName];
            detailViewController.beenObserved = [[nakedEye objectAtIndex:indexPath.row] observed];
            detailViewController.featureType = [[nakedEye objectAtIndex:indexPath.row] featureType];
            detailViewController.featureBestTime = [[nakedEye objectAtIndex:indexPath.row] featureBestTime];
            detailViewController.featureDescription = [[nakedEye objectAtIndex:indexPath.row] featureDescription];
            
            detailViewController.selectedFeatureIndexPath = indexPath;
        }
        else if ([indexPath section] == 1)
        {
            detailViewController.featureName = [[binocular objectAtIndex:indexPath.row] featureName];
            detailViewController.beenObserved = [[binocular objectAtIndex:indexPath.row] observed];
            detailViewController.featureType = [[binocular objectAtIndex:indexPath.row] featureType];
            detailViewController.featureBestTime = [[binocular objectAtIndex:indexPath.row] featureBestTime];
            detailViewController.featureDescription = [[binocular objectAtIndex:indexPath.row] featureDescription];
            
            detailViewController.selectedFeatureIndexPath = indexPath;
        }
        else if ([indexPath section] == 2)
        {
            detailViewController.featureName = [[telescope objectAtIndex:indexPath.row] featureName];
            detailViewController.beenObserved = [[telescope objectAtIndex:indexPath.row] observed];
            detailViewController.featureType = [[telescope objectAtIndex:indexPath.row] featureType];
            detailViewController.featureBestTime = [[telescope objectAtIndex:indexPath.row] featureBestTime];
            detailViewController.featureDescription = [[telescope objectAtIndex:indexPath.row] featureDescription];
            
            detailViewController.selectedFeatureIndexPath = indexPath;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 72;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomHeader *headerCell = [tableView dequeueReusableCellWithIdentifier:@"SectionHeader"];
    if (headerCell != nil)
    {
        if (section == 0){
            headerCell.headerCellTitle.text = @"Naked Eye Features";
        }else if (section == 1){
            headerCell.headerCellTitle.text = @"Binocular Features";
        }else{
            headerCell.headerCellTitle.text = @"Telescope Features";
        }
            
    }
    return headerCell;
}

+ (void)toggleObserved:(NSUInteger)Section row:(NSUInteger)Row;
{
    if (Section == 0){
        FeatureItem *item = ([nakedEye objectAtIndex:Row]);
        item.observed = @"YES";
        [nakedEye removeObjectAtIndex:Row];
        [nakedEye insertObject:item atIndex:Row];
    } else if (Section == 1){
        FeatureItem *item = ([binocular objectAtIndex:Row]);
        item.observed = @"YES";
        [binocular removeObjectAtIndex:Row];
        [binocular insertObject:item atIndex:Row];
    } else {
        FeatureItem *item = ([telescope objectAtIndex:Row]);
        item.observed = @"YES";
        [telescope removeObjectAtIndex:Row];
        [telescope insertObject:item atIndex:Row];
    }
}

@end
