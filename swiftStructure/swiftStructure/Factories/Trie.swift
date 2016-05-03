//
//  Trie.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/14/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Trie {
    
    private var root: TrieNode!
    
    
    init(){
        root = TrieNode()
    }
    
    
    //finds all words based on the prefix
    func findWord(keyword: String) -> Array<String>! {
        
        
        if (keyword.length == 0){
            return nil
        }
        
        
        var current: TrieNode = root
        var wordList: Array<String> = Array<String>()
        
        while (keyword.length != current.level) {
            
            var childToUse: TrieNode!
            let searchKey: String = keyword.substringToIndex(current.level + 1)
            
            
            print("looking for prefix: \(searchKey)..")
            
            
            //iterate through any children
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    current = childToUse
                    break
                }
                
            }
            
 
            if childToUse == nil {
               return nil
            }
            
            
        } //end while
        
        
        
        //retrieve the keyword and any decendants
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }

        
        //include only children that are words
        for child in current.children {
            
            if (child.isFinal == true) {
                wordList.append(child.key)
            }
            
        }
        
        
        return wordList

        
        
    } //end function
    
    
    
    
    
    //builds a iterative tree of dictionary content
    func addWord(keyword: String) {
        
        
        if keyword.length == 0 {
           return
        }

        var current: TrieNode = root
        
        while(keyword.length != current.level) {
            
            var childToUse: TrieNode!
            let searchKey: String = keyword.substringToIndex(current.level + 1)
            
            
            //println("current has \(current.children.count) children..")
            
            
            //iterate through the node children
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    break
                }
                
            }
            
            
            //create a new node
            if  (childToUse == nil) {
                
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            
            current = childToUse
            
            
        } //end while
        
        
        
        //add final end of word check
        if (keyword.length == current.level) {
            current.isFinal = true
            print("end of word reached!")
            return
        }
        
        
        
    } //end function
    

}