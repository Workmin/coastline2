//
//  Define.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "Define.h"

@implementation Define

@end

CGRect _R(float x, float y, float w, float h) {
	return CGRectMake(x, y, w, h);
}

CGPoint _P(float x, float y) {
	return CGPointMake(x, y);
}

CGSize _S(float w, float h) {
	return CGSizeMake(w, h);
}

UIEdgeInsets _I(float left, float top, float right, float bottom) {
	return UIEdgeInsetsMake(top, left, bottom, right);
}

CGRect _(float x, float y, float w, float h) {
	return _R(x, y, w, h);
}

float randNumber(float max) {
	return floorf(((double)arc4random() / ARC4RANDOM_MAX) * max);
}

double angle(double v) {
    return v*M_PI/180;
}
