//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


print(str);

/* 谷歌的面试题 翻转字符串

Given an input string, reverse the string word by word.
A word is defined as a sequence of non-space characters.
The input string does not contain leading or trailing spaces and the words are always separated by a single space.
For example,
Given s = "the sky is blue",
return "blue is sky the".
Could you do it in-place without allocating extra space?

*/

// 实现思路 第一次进行整体翻转 ["e", "u", "l", "b", " ", "s", "i", " ", "y", "k", "s", " ", "e", "h", "t"]

//  第二次进行单词的翻转 blue is sky the

// 声明函数时，在参数类型前面用 inout 修饰，函数内部实现改变外部参数
//传入参数时(调用函数时)，在变量名字前面用 & 符号修饰表示，表明这个变量在参数内部是可以被改变的（可将改变传递到原始数据）
func reverseStr(chars:inout[Character],startIdx:Int,endIdx:Int){
	var startIdx = startIdx;
	var endIdx = endIdx;
	if startIdx <= endIdx{
		// 先保存结束位置的字符
		let tempChar = chars[endIdx];
		// 结束位置的字符被起始的字符取代
		chars[endIdx] = chars[startIdx];
		// 起始位置的字符被结束位置的字符取代
		chars[startIdx] = tempChar;
		// 索引 ++
		startIdx += 1;
		endIdx -= 1;
		// 翻转字符串
		reverseStr(chars: &chars, startIdx: startIdx, endIdx: endIdx);
	}
	
}


// 逐字 翻转
func reverseWord(str:String) -> String{
	
	var emptyArr = [String]();
	// str.characters 的数组
	var chars = [Character](str.characters);
	
	// 首先翻转整体
	reverseStr(chars: &chars, startIdx: 0, endIdx: chars.count - 1);
	var startIdx = 0;
	// 逐个翻转
	for endIdx in 0 ..< chars.count {
		// 只有当最后一个位或者遇见空格的时候 才去进行翻转
		// Swift 中不能创建空的 Character（字符） 类型变量或常量
		if endIdx == chars.count - 1 || chars[endIdx + 1] == " " {
			reverseStr(chars: &chars, startIdx: startIdx, endIdx: endIdx);
			// 翻转之后  起始索引移动到下一个位置
			startIdx = endIdx + 2;
		}
	}
	return String(chars);
}

print(reverseWord(str: "the sky is blue"));








