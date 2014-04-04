//
//  UIImage+Save.m
//  coastline
//
//  Created by WangYuanOu on 13-10-29.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import "UIImage+Save.h"

@implementation UIImage (Save)

-(void) save {
	UIImageWriteToSavedPhotosAlbum(self, nil, nil, nil);
}

-(NSData*) pngData {
	return UIImagePNGRepresentation(self);
}

-(NSData*) jpgDataOfQuality:(float)quality {
	return UIImageJPEGRepresentation(self, quality);
}

@end
