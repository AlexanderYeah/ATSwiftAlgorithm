//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print (str);

// 归并排序
func mergeSort(array:Array<Int>) -> Array<Int> {
	
	// 创建一个临时的数组
	var tempArr: Array<Array<Int>> = [];
	// 每一个元素都是一个数组
	for item in array{
		var subArray: Array<Int> = [];
		subArray.append(item);
		tempArr.append(subArray);
	}
	// 对数组中的数组进行合并
	while tempArr.count != 1 {
		var i = 0;
		
			//
			while i < tempArr.count - 1 {
				// 进行合并
				tempArr[i] = mergeArray(firstArr:tempArr[i],secondArr:tempArr[i+1]);
				// 移除掉 i+1 位置的元素
				tempArr.remove(at: i + 1);
				// i 进行自加
				i = i + 1;
			}
		}
	
	
	
	return tempArr.first!;
	
}

// 以下才是核心的算法

// 将两个 有序的数组 进行合并 例如  [12,5]  [7,8] ---> [5,7,8,12]
func mergeArray(firstArr:Array<Int>,secondArr:Array<Int>) ->Array<Int>{
	
	// 放置排序结果的数组
	var resultArr:Array<Int> = [];
	var firstIndex = 0;
	var secondIndex = 0;
	
	// 进行交叉比较  比较完成之后 结果数组应该存放两个
	while firstIndex < firstArr.count && secondIndex < secondArr.count{
		// 如果第一个数组对应索引的元素小 就将小的元素放置进去
		if firstArr[firstIndex] < secondArr[secondIndex] {
			resultArr.append(firstArr[firstIndex]);
			// 对应的索引++
			firstIndex += 1;
		}else{
			resultArr.append(secondArr[secondIndex]);
			secondIndex += 1;
		}
	}
	
	// 到这个位置 结果数组还是有两个元素 还有将剩余的两个元素放置进去才对
	
	while firstIndex < firstArr.count {
		resultArr.append(firstArr[firstIndex]);
		firstIndex += 1 ;
	}
	
	
	while secondIndex < secondArr.count {
		resultArr.append(secondArr[secondIndex]);
		secondIndex += 1 ;
	}
	
	return resultArr;
	
}


print(mergeSort(array: [18,2,25,160,85]));


