//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func bubbleSort(nums:inout [Int]){
	let n = nums.count;
	// 最外层 有 5个元素 要进行5次遍历
	for i in 0..<n {
		// 嵌套遍历  因为每一次的遍历都会产生一个最大的值在后面
		for j in 0..<(n - 1 - i){
			// 第一个元素比第二个元素大的话 进行交换
			if nums[j] > nums[j+1] {
				// 交换顺序
				nums.swapAt(j, j+1);
			}
		}
	}
	
}


var nums = [15,8,255,35,7,66,63,28,14,19];
bubbleSort(nums: &nums);

print(nums);

