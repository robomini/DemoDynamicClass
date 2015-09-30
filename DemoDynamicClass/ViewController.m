//
//  ViewController.m
//  DemoDynamicClass
//
//  Created by TienVV on 9/30/15.
//  Copyright (c) 2015 TienVV. All rights reserved.
//

#import "ViewController.h"

// Base class Animal
@interface Animal : NSObject
- (NSString*) getImage;
@end
@implementation Animal

- (NSString*) getImage {
    return @"icon_empty";
}

@end

// Class Dog
@interface Dog : Animal
@end
@implementation Dog

- (NSString*) getImage {
    return @"icon_dog";
}

@end
// Class Cat
@interface Cat : Animal
@end
@implementation Cat

- (NSString*) getImage {
    return @"icon_cat";
}

@end
// Class Chicken
@interface Chicken : Animal
@end

@implementation Chicken

- (NSString*) getImage {
    return @"icon_chicken";
}

@end
// Class bird
@interface Bird : Animal
@end
@implementation Bird

- (NSString*) getImage {
    return @"icon_bird";
}

@end

// Class Fish
@interface Fish : Animal
@end
@implementation Fish

- (NSString*) getImage {
    return @"icon_fish";
}

@end
// Class Mouse
@interface Mouse : Animal
@end
@implementation Mouse

- (NSString*) getImage {
    return @"icon_mouse";
}

@end

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgIconAnimal;
@property (weak, nonatomic) IBOutlet UITextField *txtInputClass;
@property (weak, nonatomic) IBOutlet UIButton *btnShow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClickBtnShow:(id)sender {
    NSString* animalClassStr = self.txtInputClass.text;
    NSString* animalImage = [self getImageFromAnimalClass:animalClassStr];
    if (animalImage == nil) {
        NSLog(@"Image is Nill");
        self.imgIconAnimal.image = [UIImage imageNamed:@"icon_empty"];
    } else {
        NSLog(@"Image is %@", animalImage);
        self.imgIconAnimal.image = [UIImage imageNamed:animalImage];
    }
}

- (NSString*) getImageFromAnimalClass: (NSString*) animalClass {
    NSString* result = nil;
     NSLog(@"animalClass is %@", animalClass);
    // Initiate class from String
    Class classAnimal = NSClassFromString(animalClass);
    if (classAnimal == nil) {
        NSLog(@"classAnimal is Nill");
        // If class not existed then return Nil
        return nil;
    } else {
         NSLog(@"classAnimal NOT Nill");
        id animalObj = [classAnimal new];
        SEL methodGetImage = @selector(getImage);
        if ([animalObj respondsToSelector:methodGetImage]) {
            // If object respond to method getImage then perform selector and get result
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            result = [animalObj performSelector:methodGetImage];
            #pragma clang diagnostic pop
            
            return result;
        } else {
            // If object not respond to method getImage then return Nil
            return nil;
        }
    }
}

@end
