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
{
    NSMutableArray *_features;
    
    
    NSMutableArray *nakedEye;
    NSMutableArray *binocular;
    NSMutableArray *telescope;
}



#pragma storage methods

// method to set documents directory to a variable
- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
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
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_features forKey:@"FeatureItem"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}


// load data method
- (void)loadFeatureItems
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        _features = [unarchiver decodeObjectForKey:@"FeatureItem"];
        [unarchiver finishDecoding];
        
        // load section arrays
        nakedEye = [[NSMutableArray alloc] init];
        binocular = [[NSMutableArray alloc] init];
        telescope = [[NSMutableArray alloc] init];
        
        [nakedEye addObjectsFromArray:[_features objectAtIndex:0]];
        [binocular addObjectsFromArray:[_features objectAtIndex:1]];
        [telescope addObjectsFromArray:[_features objectAtIndex:2]];
        
        
    } else {
        
        // array of features to hold all features
        _features = [[NSMutableArray alloc] init];
        
        // arrays for sections
        nakedEye = [[NSMutableArray alloc] init];
        binocular = [[NSMutableArray alloc] init];
        telescope = [[NSMutableArray alloc] init];
        
        FeatureItem *item;
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Old Moon in New Moon's Arms";
        item.featureIndex = @"0";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 72 Hours of New Moon.";
        item.featureDescription = @"The Moon's Ashen Glow Just Before New Moon.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"New Moon in Old Moon's Arms";
        item.featureIndex = @"1";
        item.observed = @"YES";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 72 Hours of New Moon.";
        item.featureDescription = @"The Moon's Ashen Glow Just After New Moon.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crescent Moon, Waxing";
        item.featureIndex = @"2";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 40 Hours of New Moon.";
        item.featureDescription = @"Young Moon. Always Seen to the West.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crescent Moon, Waning";
        item.featureIndex = @"3";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Within 48 Hours of New Moon.";
        item.featureDescription = @"Old Moon. Seen to the East Before Dawn.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Man in the Moon";
        item.featureIndex = @"4";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Human Face.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Woman in the Moon";
        item.featureIndex = @"5";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Female Figure.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rabbit in the Moon";
        item.featureIndex = @"6";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Rabbit.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Cow Jumping Over the Moon";
        item.featureIndex = @"7";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"Pareidolic Image of a Cow Jumping the Moon.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Crisium";
        item.featureIndex = @"8";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Crises. Formed During the Pre-Imbrian Period. 555 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Fecunditatis";
        item.featureIndex = @"9";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Fertility. Formed in the Pre-Nectarian Epoch. 840 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Serenitatis";
        item.featureIndex = @"10";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Serenity. Landing Site of Apollo 17. 674 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Tranquillitatis";
        item.featureIndex = @"11";
        item.observed = @"YES";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Tranquility. Landing Site of Apollo 11. 873 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Nectaris";
        item.featureIndex = @"12";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Nectar. 333 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Imbrium";
        item.featureIndex = @"13";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Rains. Landing Site of Luna 17, Apollo 15, and Chang'e 3. 1145 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Frigoris";
        item.featureIndex = @"14";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Cold. 1446 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Nubium";
        item.featureIndex = @"15";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Clouds. 715 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Humorum";
        item.featureIndex = @"16";
        item.observed = @"NO";
        item.featureType = @"Naked Eye Feature.";
        item.featureBestTime = @"Best Observed Near Full Moon.";
        item.featureDescription = @"The Sea of Moisture. 389 Kilometers in Diameter.";
        [nakedEye addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Oceanus Procellarum";
        item.featureIndex = @"17";
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
        item.featureIndex = @"18";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Iridum";
        item.featureIndex = @"19";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Medii";
        item.featureIndex = @"20";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Roris";
        item.featureIndex = @"21";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Somnii";
        item.featureIndex = @"22";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Epidemiarum";
        item.featureIndex = @"23";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Vaorum";
        item.featureIndex = @"24";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Langrenus";
        item.featureIndex = @"25";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Vendelinus";
        item.featureIndex = @"26";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Petavius";
        item.featureIndex = @"27";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cleomedes";
        item.featureIndex = @"28";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Atlas";
        item.featureIndex = @"29";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hercules";
        item.featureIndex = @"30";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Endymion";
        item.featureIndex = @"31";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Macrobius";
        item.featureIndex = @"32";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Piccolomini";
        item.featureIndex = @"33";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Theophilus";
        item.featureIndex = @"34";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cyrillus";
        item.featureIndex = @"35";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Catharina";
        item.featureIndex = @"36";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Posidonius";
        item.featureIndex = @"37";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fracastorius";
        item.featureIndex = @"38";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristoteles";
        item.featureIndex = @"39";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Eudoxes";
        item.featureIndex = @"40";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cassini";
        item.featureIndex = @"41";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hipparchus";
        item.featureIndex = @"42";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Albategnius";
        item.featureIndex = @"43";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristillus";
        item.featureIndex = @"44";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Autolycus";
        item.featureIndex = @"45";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Maurolycus";
        item.featureIndex = @"46";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Plato";
        item.featureIndex = @"47";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Archimedes";
        item.featureIndex = @"48";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Ptolemaeus";
        item.featureIndex = @"49";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Alphonsus";
        item.featureIndex = @"50";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Arzachel";
        item.featureIndex = @"51";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Walter";
        item.featureIndex = @"52";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Maginus";
        item.featureIndex = @"53";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Tycho";
        item.featureIndex = @"54";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Clavius";
        item.featureIndex = @"55";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Eratosthenes";
        item.featureIndex = @"56";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Longomontanus";
        item.featureIndex = @"57";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Copernicus";
        item.featureIndex = @"58";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Bullialdus";
        item.featureIndex = @"59";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristarchus";
        item.featureIndex = @"60";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Gassendi";
        item.featureIndex = @"61";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Kepler";
        item.featureIndex = @"62";
        item.observed = @"NO";
        item.featureType = @"Binocular Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [binocular addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Grimaldi";
        item.featureIndex = @"63";
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
        item.featureIndex = @"64";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Lacus Mortis";
        item.featureIndex = @"65";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Putredinis";
        item.featureIndex = @"66";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Laplace";
        item.featureIndex = @"67";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Heraclides";
        item.featureIndex = @"68";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Agarum";
        item.featureIndex = @"69";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Montes Alpes";
        item.featureIndex = @"70";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Montes Apenninus";
        item.featureIndex = @"71";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mons Hadley";
        item.featureIndex = @"72";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"MonsPiton";
        item.featureIndex = @"73";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mons Pico";
        item.featureIndex = @"74";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rupes Altai";
        item.featureIndex = @"75";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rima Hyginus";
        item.featureIndex = @"76";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Valis Schroteri";
        item.featureIndex = @"77";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Vallis Alpes";
        item.featureIndex = @"78";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rupes Recta";
        item.featureIndex = @"79";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Picard";
        item.featureIndex = @"80";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Furnerius";
        item.featureIndex = @"81";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Petavius Wall";
        item.featureIndex = @"82";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Messier/Messier A";
        item.featureIndex = @"83";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Proclus";
        item.featureIndex = @"84";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fabricius";
        item.featureIndex = @"85";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Plinius";
        item.featureIndex = @"86";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Mitchell";
        item.featureIndex = @"87";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cassini A";
        item.featureIndex = @"88";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Manilius";
        item.featureIndex = @"89";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Gemma Frisius";
        item.featureIndex = @"90";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Davy";
        item.featureIndex = @"91";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Pitatus";
        item.featureIndex = @"92";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Billy";
        item.featureIndex = @"93";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fra Mauro";
        item.featureIndex = @"94";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Clavius Craterlets";
        item.featureIndex = @"95";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hippalus";
        item.featureIndex = @"96";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hershel, J.";
        item.featureIndex = @"97";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Schickard";
        item.featureIndex = @"98";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Reiner Gamma";
        item.featureIndex = @"99";
        item.observed = @"NO";
        item.featureType = @"Telescope Feature.";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [telescope addObject:item];
        
        // add feature type arrays to _features array
        [_features addObject:nakedEye];
        [_features addObject:binocular];
        [_features addObject:telescope];
        
        // save to NSUserDefaults
//        [self saveFeatureItems];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"Documents folder is %@", [self documentsDirectory]);
    NSLog(@"Data file path is %@", [self dataFilePath]);
    
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

#pragma tableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_features count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Naked Eye Features";
    }
        else if (section == 1)
    {
        return @"Binocular Features";
    }
        else
    {
        return @"Telescope Features";
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0)
        {
            return [nakedEye count];
        }
            else if (section == 1)
        {
            return [binocular count];
        }
            else
        {
            return [telescope count];
        }
 
}


- (void)configureBackgroundColorForCell:(UITableViewCell *)cell
                            withFeatureItem:(FeatureItem *)item
{
    if ([item.observed  isEqual:@"NO"]){
        cell.backgroundColor = [UIColor colorWithRed:191/255.0f green:226/255.0f blue:255/255.0f alpha:1.0f];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:134/255.0f green:158/255.0f blue:179/255.0f alpha:1.0f];
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

        if ([indexPath section] == 0)
        {
//            NSLog(@"Feature type is %@", [[nakedEye objectAtIndex:indexPath.row] featureType]);
            FeatureItem *item = nakedEye[indexPath.row];
//            cell.featureCellTitle.text = item.featureName;
            [self configureTextForCell:cell withFeatureItem:item];
            [self configureBackgroundColorForCell:cell withFeatureItem:item];
        }
        
        else if ([indexPath section] == 1)
        {
//            NSLog(@"Feature type is %@", [[binocular objectAtIndex:indexPath.row] featureType]);
            FeatureItem *item = binocular[indexPath.row];
            [self configureTextForCell:cell withFeatureItem:item];
            [self configureBackgroundColorForCell:cell withFeatureItem:item];
        }

       else if ([indexPath section] == 2)
       {
//            NSLog(@"Feature type is %@", [[telescope objectAtIndex:indexPath.row] featureType]);
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
//        NSLog(@"indexPath = %@", indexPath);
        DetailViewController *detailViewController = segue.destinationViewController;
        
        if ([indexPath section] == 0)
        {
            detailViewController.featureName = [[nakedEye objectAtIndex:indexPath.row] featureName];
            detailViewController.beenObserved = [[nakedEye objectAtIndex:indexPath.row] observed];
            detailViewController.featureType = [[nakedEye objectAtIndex:indexPath.row] featureType];
            detailViewController.featureBestTime = [[nakedEye objectAtIndex:indexPath.row] featureBestTime];
            detailViewController.featureDescription = [[nakedEye objectAtIndex:indexPath.row] featureDescription];
        }
        else if ([indexPath section] == 1)
        {
            detailViewController.featureName = [[binocular objectAtIndex:indexPath.row] featureName];
            detailViewController.beenObserved = [[binocular objectAtIndex:indexPath.row] observed];
            detailViewController.featureType = [[binocular objectAtIndex:indexPath.row] featureType];
            detailViewController.featureBestTime = [[binocular objectAtIndex:indexPath.row] featureBestTime];
            detailViewController.featureDescription = [[binocular objectAtIndex:indexPath.row] featureDescription];
        }
        else if ([indexPath section] == 2)
        {
            detailViewController.featureName = [[telescope objectAtIndex:indexPath.row] featureName];
            detailViewController.beenObserved = [[telescope objectAtIndex:indexPath.row] observed];
            detailViewController.featureType = [[telescope objectAtIndex:indexPath.row] featureType];
            detailViewController.featureBestTime = [[telescope objectAtIndex:indexPath.row] featureBestTime];
            detailViewController.featureDescription = [[telescope objectAtIndex:indexPath.row] featureDescription];
        }
 
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
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
        if (section == 0)
        {
            headerCell.headerCellTitle.text = @"Naked Eye Features";
        }
        else if (section == 1)
        {
            headerCell.headerCellTitle.text = @"Binocular Features";
        }
        else
        {
            headerCell.headerCellTitle.text = @"Telescope Features";
        }
            
    }
    return headerCell;
}

@end
