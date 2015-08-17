//
//  XMLParser.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/08.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "XMLParser.h"
#import "MenuItem.h"
#import "DAOOfMenu.h"
#import "DAOOfContents.h"

@implementation XMLParser
{
    BOOL titleTarget;
    BOOL categoryTarget;
    BOOL linkTarget;
    BOOL pubDateTarget;
    BOOL imageTarget;
    BOOL formatTarget;
    BOOL tabNoTarget;
    BOOL selectedImageTarget;
    BOOL desCriptionTarget;
    BOOL sortOrderTarget;
    BOOL LastPubDate;
    BOOL emptytable;
    BOOL havetoUpdate;
    
    NSString *titleString;
    NSString *categoryString;
    NSString *linkString;
    NSString *pubDateString;
    NSString *imageString;
    NSString *formatString;
    NSString *tabNoString;
    NSString *selectedImageString;
    NSString *desCriptionString;
    NSString *sortOrderString;
    
    NSMutableArray *temporaryData;//パースしてきたデータを一時的に貯めておく
    NSXMLParser *menuParser;
}

//MenuをパースしてDBに保存する
-(void)ParseMenu {
    
    menuParser=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://smartdt.sakura.ne.jp/SDTDEV/McKEY_RSS/metadata-rss2.xml"]];
    
    menuParser.delegate=self;
    
    [menuParser parse];
}

//ContentsをパースしてDBに保存する
-(void)ParseContents{
    
    NSXMLParser *parser=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://smartdt.sakura.ne.jp/SDTDEV/McKEY_RSS/rss.xml"]];
    
    parser.delegate=self;
    
    [parser parse];
    
    
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
    titleTarget=NO;
    categoryTarget=NO;
    linkTarget=NO;
    pubDateTarget=NO;
    imageTarget=NO;
    formatTarget=NO;
    tabNoTarget=NO;
    selectedImageTarget=NO;
    desCriptionTarget=NO;
    sortOrderTarget=NO;
    
    LastPubDate=NO;
    emptytable=NO;
    havetoUpdate=NO;
}

//要素の開始タグを読み込んだとき
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    temporaryData=[[NSMutableArray alloc]init];
    
    if ([elementName isEqualToString:@"title"]) {
        
        titleTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"category"]){
        
        categoryTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"link"]) {
        
        linkTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"pubDate"]){
        
        pubDateTarget=YES;
        return;
        
    }
    
    if ([elementName isEqualToString:@"image"]){
        
        imageTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"format"]) {
        
        formatTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"tabNo"]) {
        
        tabNoTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"selectedImage"]) {
        
        selectedImageTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"description"]) {
        
        desCriptionTarget=YES;
        return;
    }
    
    if ([elementName isEqualToString:@"sortOrder"]) {
        
        sortOrderTarget=YES;
        return;
    }
}

//タグ以外のテキストを読み込んだとき
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (titleTarget) {
        
        [temporaryData addObject:string];
        return;
    }
    if(categoryTarget){
        
        [temporaryData addObject:string];
        return;
    }
    if (linkTarget) {
        
        [temporaryData addObject:string];
        return;
    }
    if (pubDateTarget){
        
        [temporaryData addObject:string];
        return;
    }
    if (imageTarget){
        
        [temporaryData addObject:string];
        return;
    }
    if (formatTarget) {
        
        [temporaryData addObject:string];
        return;
    }
    if (tabNoTarget) {
        
        [temporaryData addObject:string];
        return;
    }
    if (selectedImageTarget) {
        
        [temporaryData addObject:string];
        return;
    }
    if (desCriptionTarget) {
        
        [temporaryData addObject:string];
        return;
    }
    if (sortOrderTarget) {
        
        [temporaryData addObject:string];
        return;
    }
}

//要素の終了タグを読み込んだとき
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    
    if ([elementName isEqualToString:@"title"]) {
        
        titleString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            
            titleString=[NSString stringWithFormat:@"%@%@",titleString,temporaryData[i]];
        }
        
        titleTarget=NO;
        return;
    }
    
    if ([elementName isEqualToString:@"category"]){
        
        categoryString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            
            categoryString=[NSString stringWithFormat:@"%@%@",categoryString,temporaryData[i]];
        }
        
        categoryTarget=NO;
        return;
    }
    
    if ([elementName isEqualToString:@"link"]) {
        
        linkString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            
            linkString=[NSString stringWithFormat:@"%@%@",linkString,temporaryData[i]];
        }
        
        linkTarget=NO;
        return;
    }
    
    if ([elementName isEqualToString:@"pubDate"]){
        
        //if (!LastPubDate) {
            
            //if (parser==menuParser) {
                //menu
                
                pubDateString=@"";
                
                for (int i=0; i < [temporaryData count]; i++) {
                    
                    pubDateString=[NSString stringWithFormat:@"%@%@",pubDateString,temporaryData[i]];
                }
                
                pubDateTarget=NO;
                
            //}else{
                //contents
                
                
                
            //}
                
                
                
       // }else{
                
       // }
            
        
        

        return;
    }
    
    if ([elementName isEqualToString:@"image"]){
        
        imageString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            
            imageString=[NSString stringWithFormat:@"%@%@",imageString,temporaryData[i]];
        }
        
        /*if((imageString=@"")){
            imageString=NULL;
        }*/
        
        imageTarget=NO;
        return;
    }
    
    if ([elementName isEqualToString:@"format"]) {
        
        formatString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            formatString=[NSString stringWithFormat:@"%@%@",formatString,temporaryData[i]];
        }
        
        formatTarget=NO;
        return;
    }
    
    if ([elementName isEqualToString:@"tabNo"]) {
        
        tabNoString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            tabNoString=[NSString stringWithFormat:@"%@%@",tabNoString,temporaryData[i]];
        }
        
        tabNoTarget=NO;
        return;
    
    }
    
    if ([elementName isEqualToString:@"selectedImage"]) {
        
        selectedImageString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            selectedImageString=[NSString stringWithFormat:@"%@%@",selectedImageString,temporaryData[i]];
        }
        
        selectedImageTarget=NO;
        return;
        
    }
    
    if ([elementName isEqualToString:@"desCription"]) {
        
        desCriptionString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            desCriptionString=[NSString stringWithFormat:@"%@%@",desCriptionString,temporaryData[i]];
        }
        
        desCriptionTarget=NO;
        return;
    }
    
    if ([elementName isEqualToString:@"sortOrder"]) {
        
        sortOrderString=@"";
        
        for (int i=0; i < [temporaryData count]; i++) {
            sortOrderString=[NSString stringWithFormat:@"%@%@",sortOrderString,temporaryData[i]];
        }
        sortOrderTarget=NO;
        return;
    }
    if ([elementName isEqualToString:@"item"]){
        
        //テーブル作成
        [DAOOfMenu createMenuTable];
        [DAOOfContents createContentsTable];
        
        //if (emptytable) {
            
            if (parser == menuParser) {
        
                if ((![imageString isEqual:@""]) || (![selectedImageString isEqual:@""])) {
            
        
                [DAOOfMenu insertMenuTable:titleString category:categoryString pubDate:pubDateString image:imageString format:formatString tabNo:tabNoString selectedImage:selectedImageString description:desCriptionString sortOrder:sortOrderString];
                }else{
                  [DAOOfMenu insertMenuTable:titleString category:categoryString pubDate:pubDateString image:NULL format:formatString tabNo:tabNoString selectedImage:NULL description:desCriptionString sortOrder:sortOrderString];
            
            
                }
    
        
        
           }else{
               if ((![imageString isEqual:@""])) {
                   
               
               
                   [DAOOfContents insertContentsTable:categoryString title:titleString link:linkString description:desCriptionString pubDate:pubDateString image:imageString];
               
               }else{
                   
                   [DAOOfContents insertContentsTable:categoryString title:titleString link:linkString description:desCriptionString pubDate:pubDateString image:NULL];
                   
                   
               }
            
           }
        //}else if(havetoUpdate){
            
            
        //}
    }
    
    
}

//解析終了時
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    
    
}





@end
