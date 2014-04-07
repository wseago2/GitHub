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

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_features;
}

#pragma storage methods

- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString*)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"LunarObserver.plist"];
}

- (void)saveFeatureItems
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_features forKey:@"FeatureItem"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadFeatureItems
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        _features = [unarchiver decodeObjectForKey:@"FeatureItem"];
        [unarchiver finishDecoding];
    } else {
        
        // array of features
        _features = [[NSMutableArray alloc] init];
        
        FeatureItem *item;
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Old Moon in New Moon's Arms";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Within 72 Hours of New Moon";
        item.featureDescription = @"The Moon's Ashen Glow";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"New Moon in Old Moon's Arms";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Within 72 Hours of New Moon";
        item.featureDescription = @"The Moon's Ashen Glow";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crescent Moon, Waxing";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Within 40 Hours of New Moon";
        item.featureDescription = @"Young Moon, Always Seen to the West";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crescent Moon, Waning";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Within 48 Hours of New Moon";
        item.featureDescription = @"Old Moon, Seen to the East Before Dawn";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Man in the Moon";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"Pareidolic Image of a Human Face";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Woman in the Moon";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"Pareidolic Image of a Female Figure";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rabbit in the Moon";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"Pareidolic Image of a Rabbit";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Cow Jumping Over the Moon";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"Pareidolic Image of a Cow Jumping the Moon";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Crisium";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"The Sea of Crises. Formed During the Pre-Imbrian Period. 555 Kilometers in Diameter.";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Fecunditatis";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"The Sea of Fertility. Formed in the Pre-Nectarian Epoch. 840 Kilometers in Diameter.";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Serenitatis";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Tranquillitatis";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Nectaris";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Imbrium";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Frigoris";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Nubium";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Humorum";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Oceanus Procellarum";
        item.observed = NO;
        item.featureType = @"NakedEye";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        // ******************************
        // Binocular Features
        // ******************************
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Lunar Rays";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Iridum";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Medii";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Roris";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Somnii";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Epidemiarum";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mare Vaorum";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"Full Moon";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Langrenus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Vendelinus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Petavius";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cleomedes";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Atlas";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hercules";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Endymion";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Macrobius";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Piccolomini";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Theophilus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cyrillus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Catharina";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Posidonius";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fracastorius";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristoteles";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Eudoxes";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cassini";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hipparchus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Albategnius";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristillus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Autolycus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Maurolycus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Plato";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Archimedes";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Ptolemaeus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Alphonsus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Arzachel";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Walter";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Maginus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Tycho";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Clavius";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Eratosthenes";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Longomontanus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Copernicus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Bullialdus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Aristarchus";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Gassendi";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Kepler";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Grimaldi";
        item.observed = NO;
        item.featureType = @"Binocular";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        // ******************************
        // Telescope Features
        // ******************************
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Sinus Aestuum";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Lacus Mortis";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Palus Putredinis";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Laplace";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Heraclides";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Promontorium Agarum";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Montes Alpes";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Montes Apenninus";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mons Hadley";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"MonsPiton";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Mons Pico";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rupes Altai";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rima Hyginus";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Valis Schroteri";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Vallis Alpes";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Rupes Recta";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Picard";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Furnerius";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Petavius Wall";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Messier/Messier A";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Proclus";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fabricius";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"4 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Plinius";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Mitchell";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Cassini A";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Manilius";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Gemma Frisius";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"7 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Davy";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Pitatus";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Billy";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Fra Mauro";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Clavius Craterlets";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hippalus";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Hershel, J.";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"10 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Schickard";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
        
        item = [[FeatureItem alloc] init];
        item.featureName = @"Crater Reiner Gamma";
        item.observed = NO;
        item.featureType = @"Telescope";
        item.featureBestTime = @"14 Days Old";
        item.featureDescription = @"";
        [_features addObject:item];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Documents folder is %@", [self documentsDirectory]);
    
    NSLog(@"Data file path is %@", [self dataFilePath]);
    
    [self loadFeatureItems];
 

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
    
 /*   if (section == 0)
        {
            return 18;
        } else
            if (section == 1)
            {
                return 46;
            } else {
                return 36;
        }
 */
}

- (void)configureBackgroundColorForCell:(UITableViewCell *)cell
                            withFeatureItem:(FeatureItem *)item
{
    if (item.observed){
        cell.backgroundColor = [UIColor greenColor];
    } else {
        cell.backgroundColor = [UIColor redColor];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeatureCell"];
    if (cell != nil)
    {
        if ([indexPath section] == 0)
        {
            
        }
        
        else if ([indexPath section] == 1)
        {
            
        }
        
        else if ([indexPath section] == 2)
        {
            
        }
    }
    
    FeatureItem *item = _features[indexPath.row];
    
    [self configureTextForCell:cell withFeatureItem:item];
    [self configureBackgroundColorForCell:cell withFeatureItem:item];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showFeatureDetails"])
    {
        // pass name
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.featureName = [[_features objectAtIndex:indexPath.row] featureName];
        
        // pass observed
//        detailViewController.beenObserved = [[_features objectAtIndex:indexPath.row] observed];
        
        
        // pass type
        detailViewController.featureType = [[_features objectAtIndex:indexPath.row] featureType];
        NSLog(@"Feature type is %@", [[_features objectAtIndex:indexPath.row] featureType]);
        
        // pass bestTime
        detailViewController.featureBestTime = [[_features objectAtIndex:indexPath.row] featureBestTime];
        
        // pass description
        detailViewController.featureDescription = [[_features objectAtIndex:indexPath.row] featureDescription];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    FeatureItem *item = _features[indexPath.row];
    
    [item toggleObserved];
    
    [self configureBackgroundColorForCell:cell withFeatureItem:item];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self saveFeatureItems];
    
}

@end
