//
//  DateExtensions.m
//  ProVoc
//
//  Created by Simon Bovet on 25.02.06.
//  Copyright 2006 Arizona Software. All rights reserved.
//

#import "DateExtensions.h"

#define kCMTimeInterval1Hour 60*60
#define kCMTimeInterval1Day kCMTimeInterval1Hour*24
#define kCMTimeInterval2Day kCMTimeInterval1Day*2
#define kCMTimeInterval1Week kCMTimeInterval1Day*7
#define kCMTimeInterval2Weeks kCMTimeInterval1Day*14

@implementation NSDate (Extensions_Private)

@end

@implementation NSDate (Extensions)

-(NSDate *)beginningOfDay
{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    return [calendar dateFromComponents:components];
    
    // old code using deprecated APIs:
    /*
	NSMutableString *description = [[self description] mutableCopy];
	[description replaceCharactersInRange:NSMakeRange(11, 8) withString:@"00:00:00"];
	NSDate *date = [NSDate dateWithString:description];
	[description release];
	return date;
    */
}

-(NSDate *)beginningOfNextDay
{
	return [[self beginningOfDay] nextDay];
}

-(NSDate *)previousDay
{
    return [NSDate dateWithTimeIntervalSinceNow:-(kCMTimeInterval1Day)];
}

-(NSDate *)nextDay
{
    return [NSDate dateWithTimeIntervalSinceNow:(kCMTimeInterval1Day)];
}

-(NSDate *)beginningOfWeek
{
	return [[self beginningOfNextWeek] previousWeek];
}

-(NSDate *)beginningOfNextWeek
{
	return [[self beginningOfDay] nextDay];
}

-(NSDate *)previousWeek
{
    return [NSDate dateWithTimeIntervalSinceNow:-(kCMTimeInterval1Week)];
}

-(NSDate *)nextWeek
{
    return [NSDate dateWithTimeIntervalSinceNow:(kCMTimeInterval1Week)];
}

-(NSDate *)beginningOfMonth
{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:self];
    [comp setDay:1];
    return [calendar dateFromComponents:comp];
    
    // old code using deprecated APIs:
    /*
	NSMutableString *description = [[self description] mutableCopy];
	[description replaceCharactersInRange:NSMakeRange(8, 11) withString:@"01 03:00:00"];
	NSDate *date = [NSDate dateWithString:description];
	[description release];
	return date;
    */
}

-(NSDate *)beginningOfNextMonth
{
	return [[self beginningOfMonth] nextMonth];
}

-(int)year
{
	return [[[self description] substringWithRange:NSMakeRange(0, 4)] intValue];
}

-(int)month
{
	return [[[self description] substringWithRange:NSMakeRange(5, 2)] intValue];
}

-(NSDate *)previousMonth
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:-1];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
    
    // old code using deprecated APIs:
    /*
	int year = [self year];
	int month = [self month];
	if (month > 1)
		month--;
	else {
		year--;
		month = 12;
	}
	NSMutableString *description = [[self description] mutableCopy];
	[description replaceCharactersInRange:NSMakeRange(0, 4) withString:[NSString stringWithFormat:@"%04i", year]];
	[description replaceCharactersInRange:NSMakeRange(5, 2) withString:[NSString stringWithFormat:@"%02i", month]];
	NSDate *date = [NSDate dateWithString:description];
	[description release];
	return date;
    */
}

-(NSDate *)nextMonth
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:+1];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
    
    // old code using deprecated APIs:
    /*
	int year = [self year];
	int month = [self month];
	if (month < 12)
		month++;
	else {
		year++;
		month = 1;
	}
	NSMutableString *description = [[self description] mutableCopy];
	[description replaceCharactersInRange:NSMakeRange(0, 4) withString:[NSString stringWithFormat:@"%04i", year]];
	[description replaceCharactersInRange:NSMakeRange(5, 2) withString:[NSString stringWithFormat:@"%02i", month]];
	NSDate *date = [NSDate dateWithString:description];
	[description release];
	return date;
    */
}

-(BOOL)isToday
{
	NSDate *date = [NSDate date];
	return [self isBetweenDate:[date beginningOfDay] andDate:[date beginningOfNextDay]];
}

-(BOOL)isYersterday
{
	NSDate *date = [[NSDate date] previousDay];
	return [self isBetweenDate:[date beginningOfDay] andDate:[date beginningOfNextDay]];
}

-(BOOL)isBetweenDate:(NSDate *)inFrom andDate:(NSDate *)inTo
{
	return [inFrom compare:self] != NSOrderedDescending && [self compare:inTo] == NSOrderedAscending;
}

@end
