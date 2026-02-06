/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 测试1: 基本功能测试 - 验证数组元素是否被正确颠倒
export function Fn01_testReverseBasicFunctionality() {
  const original = [1, 2, 3, 4, 5];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([5, 4, 3, 2, 1]);
}

// 测试2: 原数组修改测试 - 验证reverse()会修改原数组
export function Fn02_testOriginalArrayIsModified() {
  const original = ['a', 'b', 'c'];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify(['c', 'b', 'a']);
}

// 测试3: 返回值测试 - 验证reverse()返回原数组的引用
export function Fn03_testReturnValueIsOriginalArray() {
  const original = [true, false, true];
  const reversed = original.reverse();
  return reversed === original;
}

// 测试4: 空数组反转测试
export function Fn04_testEmptyArray() {
  const original = [];
  const reversed = original.reverse();
  return original.length === 0 && reversed.length === 0 && reversed === original;
}

// 测试5: 单元素数组反转测试
export function Fn05_testSingleElement() {
  const original = [42];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([42]) && reversed === original;
}

// 测试6: 包含多种数据类型的数组反转
export function Fn06_testMixedDataTypes() {
  const original = [1, 'a', true, null];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([null, true, 'a', 1]);
}

// 测试7: 嵌套数组反转（仅外层反转）
export function Fn07_testNestedArrays() {
  const original = [[1, 2], [3, 4]];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([[3, 4], [1, 2]]);
}

// 测试8: 稀疏数组反转（保留空位）
export function Fn08_testSparseArray() {
  const original = [1, , 3];
  const reversed = original.reverse();
  return reversed.length === 3 && reversed[0] === 3 && reversed[2] === 1 && Object.keys(reversed).length === 2;
}

// 测试9: 包含undefined的数组反转
export function Fn09_testWithUndefined() {
  const original = [undefined, 2, 3];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([3, 2, undefined]);
}

// 测试10: 包含null的数组反转
export function Fn10_testWithNull() {
  const original = [null, 'b', 3];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([3, 'b', null]);
}

// 测试11: 包含NaN的数组反转
export function Fn11_testWithNaN() {
  const original = [NaN, 2, 3];
  const reversed = original.reverse();
  return reversed[0] === 3 && reversed[1] === 2 && isNaN(reversed[2]);
}

// 测试12: 包含对象的数组反转（引用保持）
export function Fn12_testWithObjects() {
  const obj = { name: 'test' };
  const original = [1, obj, 3];
  const reversed = original.reverse();
  return reversed[0] === 3 && reversed[1] === obj && reversed[2] === 1;
}

// 测试13: 反转后修改原数组影响返回值
export function Fn13_testModifyAfterReverse() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  original[0] = 4;
  return reversed[0] === 4;
}

// 测试14: 字符串数组反转
export function Fn14_testStringArray() {
  const original = ['apple', 'banana', 'cherry'];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify(['cherry', 'banana', 'apple']);
}

// 测试15: 数字数组反转
export function Fn15_testNumberArray() {
  const original = [10, 20, 30, 40];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([40, 30, 20, 10]);
}

// 测试16: 布尔值数组反转
export function Fn16_testBooleanArray() {
  const original = [true, false, true, false];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([false, true, false, true]);
}

// 测试17: 大型数组反转（1000元素）
export function Fn17_testLargeArray() {
  const original = Array.from({ length: 1000 }, (_, i) => i);
  const reversed = original.reverse();
  return reversed[0] === 999 && reversed[999] === 0 && reversed.length === 1000;
}

// 测试18: 二维数组反转
export function Fn18_test2DArray() {
  const original = [[1], [2], [3], [4]];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([[4], [3], [2], [1]]);
}

// 测试19: 包含负数值的数组反转
export function Fn19_testNegativeNumbers() {
  const original = [-1, -2, -3, -4];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([-4, -3, -2, -1]);
}

// 测试20: 包含零的数组反转
export function Fn20_testWithZeros() {
  const original = [0, 0, 0];
  const reversed = original.reverse();
  return JSON.stringify(reversed) === JSON.stringify([0, 0, 0]);
}

// 测试21: 包含Infinity的数组反转
export function Fn21_testWithInfinity() {
  const original = [Infinity, -Infinity, 1];
  const reversed = original.reverse();
  return reversed[0] === 1 && reversed[1] === -Infinity && reversed[2] === Infinity;
}

// 测试22: 函数数组反转
export function Fn22_testFunctionArray() {
  const fn1 = () => 1;
  const fn2 = () => 2;
  const original = [fn1, fn2];
  const reversed = original.reverse();
  return reversed[0] === fn2 && reversed[1] === fn1;
}

// 测试23: 日期对象数组反转
export function Fn23_testDateObjects() {
  const d1 = new Date(2020, 0, 1);
  const d2 = new Date(2021, 0, 1);
  const original = [d1, d2];
  const reversed = original.reverse();
  return reversed[0] === d2 && reversed[1] === d1;
}

// 测试24: 反转后数组的长度不变
export function Fn24_testLengthPreserved() {
  const original = [1, 2, 3, 4, 5];
  const originalLength = original.length;
  const reversed = original.reverse();
  return reversed.length === originalLength;
}

// 测试25: 对类数组对象使用reverse（通过call）
export function Fn25_testArrayLike() {
  const arrayLike = { 0: 'a', 1: 'b', 2: 'c', length: 3 };
  const reversed = Array.prototype.reverse.call(arrayLike);
  return reversed[0] === 'c' && reversed[1] === 'b' && reversed[2] === 'a' && reversed.length === 3;
}

// 测试26: 包含Symbol的数组反转
export function Fn26_testWithSymbols() {
  const sym1 = Symbol('a');
  const sym2 = Symbol('b');
  const original = [sym1, sym2, 'c'];
  const reversed = original.reverse();
  return reversed[0] === 'c' && reversed[1] === sym2 && reversed[2] === sym1;
}

// 测试27: 反转后数组的sort方法不改变已排序数组
export function Fn27_testSortAlreadySorted() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.sort((a, b) => b - a);
  return JSON.stringify(original) === JSON.stringify([4, 3, 2, 1]);
}

// 测试28: 数组反转后再次反转回到原状态
export function Fn28_testReverseTwice() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([1, 2, 3, 4]);
}

// 测试29: 空数组多次反转
export function Fn29_testEmptyArrayMultipleReverse() {
  const original = [];
  original.reverse();
  original.reverse();
  return original.length === 0;
}

// 测试30: 反转后数组的迭代器顺序
export function Fn30_testIteratorOrder() {
  const original = [1, 2, 3];
  original.reverse();
  const values = [...original.values()];
  return JSON.stringify(values) === JSON.stringify([3, 2, 1]);
}

// 测试31: 反转后数组的keys顺序
export function Fn31_testKeysOrder() {
  const original = [1, 2, 3];
  original.reverse();
  const keys = [...original.keys()];
  return JSON.stringify(keys) === JSON.stringify([0, 1, 2]);
}

// 测试32: 反转后数组的entries顺序
export function Fn32_testEntriesOrder() {
  const original = [1, 2, 3];
  original.reverse();
  const entries = [...original.entries()];
  return JSON.stringify(entries) === JSON.stringify([[0, 3], [1, 2], [2, 1]]);
}

// 测试33: 反转后使用indexOf
export function Fn33_testIndexOfAfterReverse() {
  const original = ['a', 'b', 'c'];
  original.reverse();
  return original.indexOf('a') === 2 && original.indexOf('c') === 0;
}

// 测试34: 反转后使用lastIndexOf
export function Fn34_testLastIndexOfAfterReverse() {
  const original = ['a', 'b', 'a'];
  original.reverse();
  return original.lastIndexOf('a') === 2;
}

// 测试35: 反转后数组的join结果
export function Fn35_testJoinAfterReverse() {
  const original = ['a', 'b', 'c'];
  original.reverse();
  return original.join(',') === 'c,b,a';
}

// 测试36: 反转后数组的toString结果
export function Fn36_testToStringAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  return original.toString() === '3,2,1';
}

// 测试37: 反转后数组的valueOf结果
export function Fn37_testValueOfAfterReverse() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return reversed.valueOf() === reversed;
}

// 测试38: 反转后使用slice
export function Fn38_testSliceAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  return JSON.stringify(original.slice(1, 3)) === JSON.stringify([4, 3]);
}

// 测试39: 反转后使用concat
export function Fn39_testConcatAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const combined = original.concat([4, 5]);
  return JSON.stringify(combined) === JSON.stringify([3, 2, 1, 4, 5]);
}

// 测试40: 反转后使用push
export function Fn40_testPushAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  original.push(4);
  return JSON.stringify(original) === JSON.stringify([3, 2, 1, 4]);
}

// 测试41: 反转后使用unshift
export function Fn41_testUnshiftAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  original.unshift(0);
  return JSON.stringify(original) === JSON.stringify([0, 3, 2, 1]);
}

// 测试42: 反转后使用pop
export function Fn42_testPopAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const last = original.pop();
  return last === 1 && JSON.stringify(original) === JSON.stringify([3, 2]);
}

// 测试43: 反转后使用shift
export function Fn43_testShiftAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const first = original.shift();
  return first === 3 && JSON.stringify(original) === JSON.stringify([2, 1]);
}

// 测试44: 反转后使用splice
export function Fn44_testSpliceAfterReverse() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.splice(1, 1);
  return JSON.stringify(original) === JSON.stringify([4, 2, 1]);
}

// 测试45: 反转后数组的every方法
export function Fn45_testEveryAfterReverse() {
  const original = [2, 4, 6, 8];
  original.reverse();
  return original.every(num => num % 2 === 0);
}

// 测试46: 反转后数组的some方法
export function Fn46_testSomeAfterReverse() {
  const original = [1, 3, 5, 8];
  original.reverse();
  return original.some(num => num % 2 === 0);
}

// 测试47: 反转后数组的filter方法
export function Fn47_testFilterAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  const filtered = original.filter(num => num > 3);
  return JSON.stringify(filtered) === JSON.stringify([5, 4]);
}

// 测试48: 反转后数组的map方法
export function Fn48_testMapAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const mapped = original.map(num => num * 2);
  return JSON.stringify(mapped) === JSON.stringify([6, 4, 2]);
}

// 测试49: 反转后数组的reduce方法
export function Fn49_testReduceAfterReverse() {
  const original = [1, 2, 3, 4];
  original.reverse();
  const sum = original.reduce((acc, curr) => acc + curr, 0);
  return sum === 10;
}

// 测试50: 反转后数组的reduceRight方法
export function Fn50_testReduceRightAfterReverse() {
  const original = [1, 2, 3, 4];
  original.reverse();
  const sum = original.reduceRight((acc, curr) => acc + curr, 0);
  return sum === 10;
}

// 测试51: 反转后数组的find方法
export function Fn51_testFindAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  const found = original.find(num => num === 3);
  return found === 3;
}

// 测试52: 反转后数组的findIndex方法
export function Fn52_testFindIndexAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  const index = original.findIndex(num => num === 3);
  return index === 2;
}

// 测试53: 反转后数组的includes方法
export function Fn53_testIncludesAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  return original.includes(2) && !original.includes(4);
}

// 测试54: 反转后数组的flat方法（一维）
export function Fn54_testFlatAfterReverse() {
  const original = [1, [2], 3];
  original.reverse();
  const flattened = original.flat();
  return JSON.stringify(flattened) === JSON.stringify([3, 2, 1]);
}

// 测试55: 反转后数组的flatMap方法
export function Fn55_testFlatMapAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const mapped = original.flatMap(num => [num, num * 2]);
  return JSON.stringify(mapped) === JSON.stringify([3, 6, 2, 4, 1, 2]);
}

// 测试56: 反转后数组的sort方法（验证反转不影响后续排序）
export function Fn56_testSortAfterReverse() {
  const original = [3, 1, 2];
  original.reverse();
  original.sort((a, b) => a - b);
  return JSON.stringify(original) === JSON.stringify([1, 2, 3]);
}

// 测试57: 反转后数组的fill方法
export function Fn57_testFillAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  original.fill(0, 1, 2);
  return JSON.stringify(original) === JSON.stringify([3, 0, 1]);
}

// 测试58: 反转后数组的copyWithin方法
export function Fn58_testCopyWithinAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  original.copyWithin(0, 3, 5);
  return JSON.stringify(original) === JSON.stringify([2,1,3,2,1]);
}

// 测试59: 对冻结数组使用reverse（应抛出错误）
export function Fn59_testFrozenArray() {
  const original = Object.freeze([1, 2, 3]);
  try {
    original.reverse();
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

// 测试60: 对密封数组使用reverse（允许修改内容）
export function Fn60_testSealedArray() {
  const original = Object.seal([1, 2, 3]);
  try {
    original.reverse();
    return JSON.stringify(original) === JSON.stringify([3, 2, 1]);
  } catch (e) {
    return false;
  }
}

// 测试61: 反转后数组的toLocaleString方法
export function Fn61_testToLocaleStringAfterReverse() {
  const original = [1000, 2000, 3000];
  original.reverse();
  return original.toLocaleString() === '3,000,2,000,1,000';
}

// 测试62: 反转后数组的flat(Infinity)方法
export function Fn62_testFlatInfinityAfterReverse() {
  const original = [1, [2, [3, [4]]]];
  original.reverse();
  const flattened = original.flat(Infinity);
  return JSON.stringify(flattened) === JSON.stringify([2,3,4,1]);
}

// 测试63: 反转后使用数组解构
export function Fn63_testDestructuringAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const [a, b, c] = original;
  return a === 3 && b === 2 && c === 1;
}

// 测试64: 反转后使用扩展运算符
export function Fn64_testSpreadAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const newArr = [...original];
  return JSON.stringify(newArr) === JSON.stringify([3, 2, 1]);
}

// 测试65: 反转后数组的isArray检查
export function Fn65_testIsArrayAfterReverse() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return Array.isArray(reversed);
}

// 测试66: 反转后数组的constructor检查
export function Fn66_testConstructorAfterReverse() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return reversed.constructor === Array;
}

// 测试67: 反转后数组的prototype检查
export function Fn67_testPrototypeAfterReverse() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return Object.getPrototypeOf(reversed) === Array.prototype;
}

// 测试68: 反转后数组的isPrototypeOf检查
export function Fn68_testIsPrototypeOfAfterReverse() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return Array.prototype.isPrototypeOf(reversed);
}

// 测试69: 反转后数组的hasOwnProperty检查
export function Fn69_testHasOwnPropertyAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  return original.hasOwnProperty('0') && original.hasOwnProperty('1') && original.hasOwnProperty('2');
}

// 测试70: 反转后数组的propertyIsEnumerable检查
export function Fn70_testPropertyIsEnumerableAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  return original.propertyIsEnumerable('0');
}

// 测试71: 反转后数组的toSource方法（非标准，但部分环境支持）
export function Fn71_testToSourceAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  if (typeof original.toSource !== 'function') return true;
  return original.toSource() === '[3, 2, 1]';
}

// 测试72: 反转后数组的toString与join比较
export function Fn72_testToStringVsJoinAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  return original.toString() === original.join(',');
}

// 测试73: 反转后数组的findLast方法
export function Fn73_testFindLastAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  const found = original.findLast(num => num % 2 === 0);
  return found === 2;
}

// 测试74: 反转后数组的findLastIndex方法
export function Fn74_testFindLastIndexAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  original.reverse();
  const index = original.findLastIndex(num => num % 2 === 0);
  return index === 3;
}

// 测试75: 反转后数组的with方法（替换元素）
export function Fn75_testWithAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const newArr = original.with(1, 4);
  return JSON.stringify(newArr) === JSON.stringify([3, 4, 1]);
}

// 测试76: 反转后数组的values迭代器
export function Fn76_testValuesIteratorAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const iterator = original.values();
  return iterator.next().value === 3 && iterator.next().value === 2 && iterator.next().value === 1;
}

// 测试77: 反转后数组的keys迭代器
export function Fn77_testKeysIteratorAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const iterator = original.keys();
  return iterator.next().value === 0 && iterator.next().value === 1 && iterator.next().value === 2;
}

// 测试78: 反转后数组的entries迭代器
export function Fn78_testEntriesIteratorAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  const iterator = original.entries();
  const first = iterator.next().value;
  const second = iterator.next().value;
  const third = iterator.next().value;
  return JSON.stringify(first) === '[0,3]' && JSON.stringify(second) === '[1,2]' && JSON.stringify(third) === '[2,1]';
}

// 测试79: 反转后数组的flatMap链式调用
export function Fn79_testFlatMapChainAfterReverse() {
  const original = [1, 2, 3];
  const result = original.reverse().flatMap(x => [x * 2]);
  return JSON.stringify(result) === JSON.stringify([6, 4, 2]);
}

// 测试80: 反转后数组的map链式调用
export function Fn80_testMapChainAfterReverse() {
  const original = [1, 2, 3];
  const result = original.reverse().map(x => x * 2);
  return JSON.stringify(result) === JSON.stringify([6, 4, 2]);
}

// 测试81: 反转后数组的filter链式调用
export function Fn81_testFilterChainAfterReverse() {
  const original = [1, 2, 3, 4, 5];
  const result = original.reverse().filter(x => x % 2 === 1);
  return JSON.stringify(result) === JSON.stringify([5,3,1]);
}

// 测试82: 反转后数组的reduce链式调用
export function Fn82_testReduceChainAfterReverse() {
  const original = [1, 2, 3, 4];
  const result = original.reverse().reduce((acc, x) => acc + x, 0);
  return result === 10;
}

// 测试83: 反转后数组的forEach方法
export function Fn83_testForEachAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  let sum = 0;
  original.forEach(x => sum += x);
  return sum === 6;
}

// 测试84: 包含正则表达式的数组反转
export function Fn84_testWithRegExp() {
  const re1 = /a/;
  const re2 = /b/;
  const original = [re1, re2];
  const reversed = original.reverse();
  return reversed[0] === re2 && reversed[1] === re1;
}

// 测试85: 长度为6的数组反转（偶数长度）
export function Fn85_testEvenLengthArray() {
  const original = [1, 2, 3, 4, 5, 6];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([6, 5, 4, 3, 2, 1]);
}

// 测试86: 长度为7的数组反转（奇数长度）
export function Fn86_testOddLengthArray() {
  const original = [1, 2, 3, 4, 5, 6, 7];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([7, 6, 5, 4, 3, 2, 1]);
}

// 测试87: 反转后使用for...of循环验证顺序
export function Fn87_testForOfAfterReverse() {
  const original = ['x', 'y', 'z'];
  original.reverse();
  const result = [];
  for (const item of original) result.push(item);
  return JSON.stringify(result) === JSON.stringify(['z', 'y', 'x']);
}

// 测试88: 反转后使用传统for循环验证顺序
export function Fn88_testForLoopAfterReverse() {
  const original = [10, 20, 30];
  original.reverse();
  const result = [];
  for (let i = 0; i < original.length; i++) result.push(original[i]);
  return JSON.stringify(result) === JSON.stringify([30, 20, 10]);
}

// 测试89: 包含循环引用对象的数组反转
export function Fn89_testCircularReference() {
  const obj = {};
  obj.self = obj;
  const original = [1, obj, 3];
  const reversed = original.reverse();
  return reversed[0] === 3 && reversed[1] === obj && reversed[2] === 1 && reversed[1].self === obj;
}

// 测试90: 反转后数组作为参数传递给函数
export function Fn90_testAsFunctionParameter() {
  const original = [1, 2, 3];
  original.reverse();
  function check(arr) { return JSON.stringify(arr) === JSON.stringify([3, 2, 1]); }
  return check(original);
}

// 测试91: 反转后数组的map方法链式调用
export function Fn91_testMapChaining() {
  const original = [1, 2, 3];
  const result = original.reverse().map(x => x * 10);
  return JSON.stringify(result) === JSON.stringify([30, 20, 10]);
}

// 测试92: 反转后数组的filter和map组合使用
export function Fn92_testFilterMapCombination() {
  const original = [1, 2, 3, 4, 5];
  const result = original.reverse().filter(x => x > 2).map(x => x * 2);
  return JSON.stringify(result) === JSON.stringify([10, 8, 6]);
}

// 测试93: 使用Array.of创建的数组反转
export function Fn93_testArrayOfReverse() {
  const original = Array.of(1, 2, 3);
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([3, 2, 1]);
}

// 测试94: 使用Array构造函数创建的数组反转
export function Fn94_testArrayConstructorReverse() {
  const original = new Array(1, 2, 3);
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([3, 2, 1]);
}

// 测试95: 使用Array.from创建的数组反转
export function Fn95_testArrayFromReverse() {
  const original = Array.from('abc');
  original.reverse();
  return JSON.stringify(original) === JSON.stringify(['c', 'b', 'a']);
}

// 测试96: 反转后数组的长度被修改后再次反转
export function Fn96_testLengthModifiedAfterReverse() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.length = 2;
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([3,4]);
}

// 测试97: 反转后数组的元素被删除后验证
export function Fn97_testElementDeletedAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  delete original[1];
  return original.length === 3 && original[0] === 3 && original[2] === 1 && !('1' in original);
}

// 测试98: 包含DOM无关的对象数组反转（如Math对象）
export function Fn98_testMathObjectArray() {
  const original = [Math.PI, Math.E, Math.LN2];
  original.reverse();
  return original[0] === Math.LN2 && original[1] === Math.E && original[2] === Math.PI;
}

// 测试99: 反转后数组的find方法查找不存在的元素
export function Fn99_testFindNonExistent() {
  const original = [1, 2, 3];
  original.reverse();
  const found = original.find(x => x === 4);
  return found === undefined;
}

// 测试100: 反转后数组的every方法验证所有元素
export function Fn100_testEveryCondition() {
  const original = [2, 4, 6];
  original.reverse();
  return original.every(x => x % 2 === 0);
}

// 测试101: 反转后数组的some方法验证存在元素
export function Fn101_testSomeCondition() {
  const original = [1, 3, 5, 7, 8];
  original.reverse();
  return original.some(x => x % 2 === 0);
}

// 测试102: 反转后数组的reduce方法计算乘积
export function Fn102_testReduceProduct() {
  const original = [2, 3, 4];
  original.reverse();
  const product = original.reduce((acc, x) => acc * x, 1);
  return product === 24;
}

// 测试103: 反转后数组的flatMap方法处理嵌套数组
export function Fn103_testFlatMapNested() {
  const original = [[1], [2], [3]];
  original.reverse();
  const result = original.flatMap(x => x);
  return JSON.stringify(result) === JSON.stringify([3, 2, 1]);
}

// 测试104: 对Uint8Array类型数组使用reverse
export function Fn104_testUint8ArrayReverse() {
  const original = new Uint8Array([1, 2, 3]);
  original.reverse();
  return JSON.stringify(Array.from(original)) === JSON.stringify([3, 2, 1]);
}

// 测试105: 对Float64Array类型数组使用reverse
export function Fn105_testFloat64ArrayReverse() {
  const original = new Float64Array([1.1, 2.2, 3.3]);
  original.reverse();
  return JSON.stringify(Array.from(original)) === JSON.stringify([3.3, 2.2, 1.1]);
}

// 测试106: 反转后数组的concat方法与空数组
export function Fn106_testConcatEmptyArray() {
  const original = [1, 2, 3];
  original.reverse();
  const result = original.concat([]);
  return JSON.stringify(result) === JSON.stringify([3, 2, 1]);
}

// 测试107: 反转后数组的slice方法获取最后一个元素
export function Fn107_testSliceLastElement() {
  const original = [1, 2, 3, 4];
  original.reverse();
  const last = original.slice(-1)[0];
  return last === 1;
}

// 测试108: 反转后数组的splice方法删除第一个元素
export function Fn108_testSpliceFirstElement() {
  const original = [1, 2, 3];
  original.reverse();
  original.splice(0, 1);
  return JSON.stringify(original) === JSON.stringify([2, 1]);
}

// 测试109: 反转后数组的unshift方法添加多个元素
export function Fn109_testUnshiftMultiple() {
  const original = [1, 2];
  original.reverse();
  original.unshift(3, 4);
  return JSON.stringify(original) === JSON.stringify([3, 4, 2, 1]);
}

// 测试110: 反转后数组的push方法添加多个元素
export function Fn110_testPushMultiple() {
  const original = [1, 2];
  original.reverse();
  original.push(3, 4);
  return JSON.stringify(original) === JSON.stringify([2, 1, 3, 4]);
}

// 测试111: 反转后数组的shift方法连续调用
export function Fn111_testShiftMultiple() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.shift();
  original.shift();
  return JSON.stringify(original) === JSON.stringify([2, 1]);
}

// 测试112: 反转后数组的pop方法连续调用
export function Fn112_testPopMultiple() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.pop();
  original.pop();
  return JSON.stringify(original) === JSON.stringify([4, 3]);
}

// 测试113: 反转后数组的fill方法填充全部元素
export function Fn113_testFillAllElements() {
  const original = [1, 2, 3];
  original.reverse();
  original.fill(0);
  return JSON.stringify(original) === JSON.stringify([0, 0, 0]);
}

// 测试114: 反转后数组的copyWithin方法复制全部元素
export function Fn114_testCopyWithinAll() {
  const original = [1, 2, 3, 4];
  original.reverse();
  original.copyWithin(0);
  return JSON.stringify(original) === JSON.stringify([4, 3, 2, 1]);
}

// 测试115: 包含相同元素的数组反转
export function Fn115_testDuplicateElements() {
  const original = [5, 5, 5, 5];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([5, 5, 5, 5]);
}

// 测试116: 包含递增序列的数组反转
export function Fn116_testIncreasingSequence() {
  const original = [10, 20, 30, 40, 50];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([50, 40, 30, 20, 10]);
}

// 测试117: 包含递减序列的数组反转
export function Fn117_testDecreasingSequence() {
  const original = [50, 40, 30, 20, 10];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([10, 20, 30, 40, 50]);
}

// 测试118: 反转后数组的indexOf查找第一个出现的元素
export function Fn118_testIndexOfFirstOccurrence() {
  const original = [2, 5, 2, 5];
  original.reverse();
  return original.indexOf(2) === 1;
}

// 测试119: 反转后数组的lastIndexOf查找最后出现的元素
export function Fn119_testLastIndexOfLastOccurrence() {
  const original = [2, 5, 2, 5];
  original.reverse();
  return original.lastIndexOf(5) === 2;
}

// 测试120: 反转后数组的join方法使用自定义分隔符
export function Fn120_testJoinWithSeparator() {
  const original = ['a', 'b', 'c'];
  original.reverse();
  return original.join(' - ') === 'c - b - a';
}

// 测试121: 反转后数组的toString方法与原数组比较
export function Fn121_testToStringComparison() {
  const original = [1, 2, 3];
  const originalStr = original.toString();
  original.reverse();
  return original.toString() !== originalStr;
}

// 测试122: 反转后数组的valueOf方法返回自身
export function Fn122_testValueOfReturnsSelf() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return reversed.valueOf() === reversed;
}

// 测试123: 反转后数组的flat方法指定深度
export function Fn123_testFlatWithDepth() {
  const original = [1, [2, [3]], 4];
  original.reverse();
  const result = original.flat(1);
  return JSON.stringify(result) === JSON.stringify([4, 2, [3], 1]);
}

// 测试124: 反转后数组的sort方法使用自定义比较器
export function Fn124_testSortWithComparator() {
  const original = [3, 1, 4, 2];
  original.reverse();
  original.sort((a, b) => b - a);
  return JSON.stringify(original) === JSON.stringify([4, 3, 2, 1]);
}

// 测试125: 对不可扩展数组使用reverse
export function Fn125_testNonExtensibleArray() {
  const original = [1, 2, 3];
  Object.preventExtensions(original);
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([3, 2, 1]);
}

// 测试126: 反转后数组的toLocaleString使用参数
export function Fn126_testToLocaleStringWithParams() {
  const original = [1000, 2000, 3000];
  original.reverse();
  return original.toLocaleString('en-US', { style: 'currency', currency: 'USD' }) === '$3,000.00,$2,000.00,$1,000.00';
}

// 测试127: 反转后数组的解构赋值给变量
export function Fn127_testDestructuringAssignment() {
  const original = [1, 2, 3, 4];
  original.reverse();
  const [w, x, y, z] = original;
  return w === 4 && x === 3 && y === 2 && z === 1;
}

// 测试128: 反转后数组的扩展运算符创建新数组
export function Fn128_testSpreadOperator() {
  const original = [1, 2, 3];
  original.reverse();
  const newArr = [...original, 4, 5];
  return JSON.stringify(newArr) === JSON.stringify([3, 2, 1, 4, 5]);
}

// 测试129: 反转后数组的isArray检查结果
export function Fn129_testIsArrayResult() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return Array.isArray(reversed) === true;
}

// 测试130: 反转后数组的constructor属性
export function Fn130_testConstructorProperty() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return reversed.constructor === Array;
}

// 测试131: 反转后数组的prototype链检查
export function Fn131_testPrototypeChain() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return Object.getPrototypeOf(reversed) === Array.prototype;
}

// 测试132: 反转后数组的isPrototypeOf检查
export function Fn132_testIsPrototypeOf() {
  const original = [1, 2, 3];
  const reversed = original.reverse();
  return Array.prototype.isPrototypeOf(reversed);
}

// 测试133: 反转后数组的hasOwnProperty检查不存在的属性
export function Fn133_testHasOwnPropertyNonExistent() {
  const original = [1, 2, 3];
  original.reverse();
  return original.hasOwnProperty('3') === false;
}

// 测试134: 反转后数组的propertyIsEnumerable检查
export function Fn134_testPropertyIsEnumerable() {
  const original = [1, 2, 3];
  original.reverse();
  return original.propertyIsEnumerable('length') === false;
}

// 测试135: 反转后数组的findLast方法查找最后一个符合条件的元素
export function Fn135_testFindLast() {
  const original = [1, 3, 5, 7, 9, 8];
  original.reverse();
  const found = original.findLast(x => x % 2 === 0);
  return found === 8;
}

// 测试136: 反转后数组的findLastIndex方法查找索引
export function Fn136_testFindLastIndex() {
  const original = [1, 3, 5, 7, 9, 8];
  original.reverse();
  const index = original.findLastIndex(x => x % 2 === 0);
  return index === 0;
}

// 测试137: 反转后数组的with方法替换第一个元素
export function Fn137_testWithReplaceFirst() {
  const original = [1, 2, 3];
  original.reverse();
  const newArr = original.with(0, 0);
  return JSON.stringify(newArr) === JSON.stringify([0, 2, 1]);
}

// 测试138: 反转后数组的values迭代器遍历全部元素
export function Fn138_testValuesIterator() {
  const original = [1, 2, 3];
  original.reverse();
  const iterator = original.values();
  let result = true;
  result = result && iterator.next().value === 3;
  result = result && iterator.next().value === 2;
  result = result && iterator.next().value === 1;
  result = result && iterator.next().done === true;
  return result;
}

// 测试139: 反转后数组的keys迭代器遍历全部索引
export function Fn139_testKeysIterator() {
  const original = [1, 2, 3];
  original.reverse();
  const iterator = original.keys();
  let result = true;
  result = result && iterator.next().value === 0;
  result = result && iterator.next().value === 1;
  result = result && iterator.next().value === 2;
  result = result && iterator.next().done === true;
  return result;
}

// 测试140: 反转后数组的entries迭代器遍历全部键值对
export function Fn140_testEntriesIterator() {
  const original = [1, 2, 3];
  original.reverse();
  const iterator = original.entries();
  let result = true;
  result = result && JSON.stringify(iterator.next().value) === '[0,3]';
  result = result && JSON.stringify(iterator.next().value) === '[1,2]';
  result = result && JSON.stringify(iterator.next().value) === '[2,1]';
  result = result && iterator.next().done === true;
  return result;
}

// 测试141: 反转后数组的flatMap链式调用处理嵌套数组
export function Fn141_testFlatMapNestedChain() {
  const original = [1, [2], 3];
  const result = original.reverse().flatMap(x => Array.isArray(x) ? x : [x]);
  return JSON.stringify(result) === JSON.stringify([3, 2, 1]);
}

// 测试142: 反转后数组的map和filter链式调用
export function Fn142_testMapFilterChain() {
  const original = [1, 2, 3, 4, 5];
  const result = original.reverse().map(x => x * 2).filter(x => x > 6);
  return JSON.stringify(result) === JSON.stringify([10, 8]);
}

// 测试143: 反转后数组的filter和reduce链式调用
export function Fn143_testFilterReduceChain() {
  const original = [1, 2, 3, 4, 5];
  const result = original.reverse().filter(x => x % 2 === 0).reduce((acc, x) => acc + x, 0);
  return result === 6;
}

// 测试144: 反转后数组的reduce方法计算最大值
export function Fn144_testReduceMax() {
  const original = [3, 1, 4, 2];
  original.reverse();
  const max = original.reduce((acc, x) => Math.max(acc, x), -Infinity);
  return max === 4;
}

// 测试145: 反转后数组的forEach方法修改外部变量
export function Fn145_testForEachModify() {
  const original = [1, 2, 3];
  original.reverse();
  let sum = 0;
  original.forEach(x => sum += x);
  return sum === 6;
}

// 测试146: 包含BigInt和Number混合的数组反转
export function Fn146_testMixedBigIntNumber() {
  const original = [1, 2n, 3, 4n];
  original.reverse();
  return original[0] === 4n && original[1] === 3 && original[2] === 2n && original[3] === 1;
}

// 测试147: 包含字符串和数字混合的数组反转
export function Fn147_testMixedStringNumber() {
  const original = [1, '2', 3, '4'];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify(['4', 3, '2', 1]);
}

// 测试148: 反转后数组的元素类型检查
export function Fn148_testElementTypeCheck() {
  const original = [1, 'a', true, null, undefined];
  original.reverse();
  return typeof original[0] === 'undefined' &&
    original[1] === null &&
    typeof original[2] === 'boolean' &&
    typeof original[3] === 'string' &&
    typeof original[4] === 'number';
}

// 测试149: 反转后数组的元素严格相等性检查
export function Fn149_testStrictEquality() {
  const a = {};
  const b = {};
  const original = [a, b];
  original.reverse();
  return original[0] === b && original[1] === a;
}

// 测试150: 反转后数组的元素松散相等性检查
export function Fn150_testLooseEquality() {
  const original = [1, '1', 2, '2'];
  original.reverse();
  return original[0] == 2 && original[1] == 2 && original[2] == 1 && original[3] == 1;
}

// 测试151: 使用call方法在类数组对象上调用reverse
export function Fn151_testCallOnArrayLike() {
  const arrayLike = { 0: 'x', 1: 'y', 2: 'z', length: 3 };
  Array.prototype.reverse.call(arrayLike);
  return arrayLike[0] === 'z' && arrayLike[1] === 'y' && arrayLike[2] === 'x';
}

// 测试152: 使用apply方法在类数组对象上调用reverse
export function Fn152_testApplyOnArrayLike() {
  const arrayLike = { 0: 10, 1: 20, 2: 30, length: 3 };
  Array.prototype.reverse.apply(arrayLike);
  return arrayLike[0] === 30 && arrayLike[1] === 20 && arrayLike[2] === 10;
}

// 测试153: 使用bind方法绑定reverse到类数组对象
export function Fn153_testBindOnArrayLike() {
  const arrayLike = { 0: 'a', 1: 'b', length: 2 };
  const boundReverse = Array.prototype.reverse.bind(arrayLike);
  boundReverse();
  return arrayLike[0] === 'b' && arrayLike[1] === 'a';
}

// 测试154: 反转后数组的元素为数组的情况
export function Fn154_testElementsAreArrays() {
  const original = [[1], [2], [3]];
  original.reverse();
  return JSON.stringify(original) === JSON.stringify([[3], [2], [1]]);
}

// 测试155: 反转后数组的元素为函数的情况
export function Fn155_testElementsAreFunctions() {
  function a() { return 1; }
  function b() { return 2; }
  function c() { return 3; }
  const original = [a, b, c];
  original.reverse();
  return original[0]() === 3 && original[1]() === 2 && original[2]() === 1;
}

// 测试156: 反转后数组的元素为日期对象的情况
export function Fn156_testElementsAreDates() {
  const d1 = new Date(2023, 0, 1);
  const d2 = new Date(2024, 0, 1);
  const original = [d1, d2];
  original.reverse();
  return original[0].getFullYear() === 2024 && original[1].getFullYear() === 2023;
}

// 测试157: 非常大的数组反转（10000元素）
export function Fn157_testVeryLargeArray() {
  const original = Array.from({ length: 10000 }, (_, i) => i);
  original.reverse();
  return original[0] === 9999 && original[9999] === 0 && original.length === 10000;
}

// 测试158: 反转后数组的length属性是否可写
export function Fn158_testLengthWritable() {
  const original = [1, 2, 3];
  original.reverse();
  original.length = 5;
  return original.length === 5 && original[3] === undefined && original[4] === undefined;
}

// 测试159: 反转后数组的元素被修改后验证
export function Fn159_testModifyElementsAfterReverse() {
  const original = [1, 2, 3];
  original.reverse();
  original[0] = 4;
  return JSON.stringify(original) === JSON.stringify([4, 2, 1]);
}

// 测试160: 反转后数组的toString与原数组toString比较
export function Fn160_testToStringComparisonOriginal() {
  const original = [1, 2, 3];
  const originalStr = original.toString();
  original.reverse();
  return original.toString() !== originalStr;
}

// 测试161: 反转后数组的join('')结果
export function Fn161_testJoinEmptyString() {
  const original = ['a', 'b', 'c'];
  original.reverse();
  return original.join('') === 'cba';
}

// 测试162: 反转后数组的flat方法不改变非嵌套数组
export function Fn162_testFlatNonNested() {
  const original = [1, 2, 3];
  original.reverse();
  const result = original.flat();
  return JSON.stringify(result) === JSON.stringify([3, 2, 1]);
}

// 执行所有测试并输出结果 162条 全部PASS
// console.log("测试1 - 基本功能测试: " + (Fn01_testReverseBasicFunctionality() ? "通过" : "失败"));
// console.log("测试2 - 原数组修改测试: " + (Fn02_testOriginalArrayIsModified() ? "通过" : "失败"));
// console.log("测试3 - 返回值测试: " + (Fn03_testReturnValueIsOriginalArray() ? "通过" : "失败"));
// console.log("测试4 - 空数组反转测试: " + (Fn04_testEmptyArray() ? "通过" : "失败"));
// console.log("测试5 - 单元素数组反转测试: " + (Fn05_testSingleElement() ? "通过" : "失败"));
// console.log("测试6 - 包含多种数据类型的数组反转: " + (Fn06_testMixedDataTypes() ? "通过" : "失败"));
// console.log("测试7 - 嵌套数组反转（仅外层反转）: " + (Fn07_testNestedArrays() ? "通过" : "失败"));
// console.log("测试8 - 稀疏数组反转（保留空位）: " + (Fn08_testSparseArray() ? "通过" : "失败"));
// console.log("测试9 - 包含undefined的数组反转: " + (Fn09_testWithUndefined() ? "通过" : "失败"));
// console.log("测试10 - 包含null的数组反转: " + (Fn10_testWithNull() ? "通过" : "失败"));
// console.log("测试11 - 包含NaN的数组反转: " + (Fn11_testWithNaN() ? "通过" : "失败"));
// console.log("测试12 - 包含对象的数组反转（引用保持）: " + (Fn12_testWithObjects() ? "通过" : "失败"));
// console.log("测试13 - 反转后修改原数组影响返回值: " + (Fn13_testModifyAfterReverse() ? "通过" : "失败"));
// console.log("测试14 - 字符串数组反转: " + (Fn14_testStringArray() ? "通过" : "失败"));
// console.log("测试15 - 数字数组反转: " + (Fn15_testNumberArray() ? "通过" : "失败"));
// console.log("测试16 - 布尔值数组反转: " + (Fn16_testBooleanArray() ? "通过" : "失败"));
// console.log("测试17 - 大型数组反转（1000元素）: " + (Fn17_testLargeArray() ? "通过" : "失败"));
// console.log("测试18 - 二维数组反转: " + (Fn18_test2DArray() ? "通过" : "失败"));
// console.log("测试19 - 包含负数值的数组反转: " + (Fn19_testNegativeNumbers() ? "通过" : "失败"));
// console.log("测试20 - 包含零的数组反转: " + (Fn20_testWithZeros() ? "通过" : "失败"));
// console.log("测试21 - 包含Infinity的数组反转: " + (Fn21_testWithInfinity() ? "通过" : "失败"));
// console.log("测试22 - 函数数组反转: " + (Fn22_testFunctionArray() ? "通过" : "失败"));
// console.log("测试23 - 日期对象数组反转: " + (Fn23_testDateObjects() ? "通过" : "失败"));
// console.log("测试24 - 反转后数组的长度不变: " + (Fn24_testLengthPreserved() ? "通过" : "失败"));
// console.log("测试25 - 对类数组对象使用reverse（通过call）: " + (Fn25_testArrayLike() ? "通过" : "失败"));
// console.log("测试26 - 包含Symbol的数组反转: " + (Fn26_testWithSymbols() ? "通过" : "失败"));
// console.log("测试27 - 反转后数组的sort方法不改变已排序数组: " + (Fn27_testSortAlreadySorted() ? "通过" : "失败"));
// console.log("测试28 - 数组反转后再次反转回到原状态: " + (Fn28_testReverseTwice() ? "通过" : "失败"));
// console.log("测试29 - 空数组多次反转: " + (Fn29_testEmptyArrayMultipleReverse() ? "通过" : "失败"));
// console.log("测试30 - 反转后数组的迭代器顺序: " + (Fn30_testIteratorOrder() ? "通过" : "失败"));
// console.log("测试31 - 反转后数组的keys顺序: " + (Fn31_testKeysOrder() ? "通过" : "失败"));
// console.log("测试32 - 反转后数组的entries顺序: " + (Fn32_testEntriesOrder() ? "通过" : "失败"));
// console.log("测试33 - 反转后使用indexOf: " + (Fn33_testIndexOfAfterReverse() ? "通过" : "失败"));
// console.log("测试34 - 反转后使用lastIndexOf: " + (Fn34_testLastIndexOfAfterReverse() ? "通过" : "失败"));
// console.log("测试35 - 反转后数组的join结果: " + (Fn35_testJoinAfterReverse() ? "通过" : "失败"));
// console.log("测试36 - 反转后数组的toString结果: " + (Fn36_testToStringAfterReverse() ? "通过" : "失败"));
// console.log("测试37 - 反转后数组的valueOf结果: " + (Fn37_testValueOfAfterReverse() ? "通过" : "失败"));
// console.log("测试38 - 反转后使用slice: " + (Fn38_testSliceAfterReverse() ? "通过" : "失败"));
// console.log("测试39 - 反转后使用concat: " + (Fn39_testConcatAfterReverse() ? "通过" : "失败"));
// console.log("测试40 - 反转后使用push: " + (Fn40_testPushAfterReverse() ? "通过" : "失败"));
// console.log("测试41 - 反转后使用unshift: " + (Fn41_testUnshiftAfterReverse() ? "通过" : "失败"));
// console.log("测试42 - 反转后使用pop: " + (Fn42_testPopAfterReverse() ? "通过" : "失败"));
// console.log("测试43 - 反转后使用shift: " + (Fn43_testShiftAfterReverse() ? "通过" : "失败"));
// console.log("测试44 - 反转后使用splice: " + (Fn44_testSpliceAfterReverse() ? "通过" : "失败"));
// console.log("测试45 - 反转后数组的every方法: " + (Fn45_testEveryAfterReverse() ? "通过" : "失败"));
// console.log("测试46 - 反转后数组的some方法: " + (Fn46_testSomeAfterReverse() ? "通过" : "失败"));
// console.log("测试47 - 反转后数组的filter方法: " + (Fn47_testFilterAfterReverse() ? "通过" : "失败"));
// console.log("测试48 - 反转后数组的map方法: " + (Fn48_testMapAfterReverse() ? "通过" : "失败"));
// console.log("测试49 - 反转后数组的reduce方法: " + (Fn49_testReduceAfterReverse() ? "通过" : "失败"));
// console.log("测试50 - 反转后数组的reduceRight方法: " + (Fn50_testReduceRightAfterReverse() ? "通过" : "失败"));
// console.log("测试51 - 反转后数组的find方法: " + (Fn51_testFindAfterReverse() ? "通过" : "失败"));
// console.log("测试52 - 反转后数组的findIndex方法: " + (Fn52_testFindIndexAfterReverse() ? "通过" : "失败"));
// console.log("测试53 - 反转后数组的includes方法: " + (Fn53_testIncludesAfterReverse() ? "通过" : "失败"));
// console.log("测试54 - 反转后数组的flat方法（一维）: " + (Fn54_testFlatAfterReverse() ? "通过" : "失败"));
// console.log("测试55 - 反转后数组的flatMap方法: " + (Fn55_testFlatMapAfterReverse() ? "通过" : "失败"));
// console.log("测试56 - 反转后数组的sort方法（验证反转不影响后续排序）: " + (Fn56_testSortAfterReverse() ? "通过" : "失败"));
// console.log("测试57 - 反转后数组的fill方法: " + (Fn57_testFillAfterReverse() ? "通过" : "失败"));
// console.log("测试58 - 反转后数组的copyWithin方法: " + (Fn58_testCopyWithinAfterReverse() ? "通过" : "失败"));
// console.log("测试59 - 对冻结数组使用reverse（应抛出错误）: " + (Fn59_testFrozenArray() ? "通过" : "失败"));
// console.log("测试60 - 对密封数组使用reverse（允许修改内容）: " + (Fn60_testSealedArray() ? "通过" : "失败"));
// console.log("测试61 - 反转后数组的toLocaleString方法: " + (Fn61_testToLocaleStringAfterReverse() ? "通过" : "失败"));
// console.log("测试62 - 反转后数组的flat(Infinity)方法: " + (Fn62_testFlatInfinityAfterReverse() ? "通过" : "失败"));
// console.log("测试63 - 反转后使用数组解构: " + (Fn63_testDestructuringAfterReverse() ? "通过" : "失败"));
// console.log("测试64 - 反转后使用扩展运算符: " + (Fn64_testSpreadAfterReverse() ? "通过" : "失败"));
// console.log("测试65 - 反转后数组的isArray检查: " + (Fn65_testIsArrayAfterReverse() ? "通过" : "失败"));
// console.log("测试66 - 反转后数组的constructor检查: " + (Fn66_testConstructorAfterReverse() ? "通过" : "失败"));
// console.log("测试67 - 反转后数组的prototype检查: " + (Fn67_testPrototypeAfterReverse() ? "通过" : "失败"));
// console.log("测试68 - 反转后数组的isPrototypeOf检查: " + (Fn68_testIsPrototypeOfAfterReverse() ? "通过" : "失败"));
// console.log("测试69 - 反转后数组的hasOwnProperty检查: " + (Fn69_testHasOwnPropertyAfterReverse() ? "通过" : "失败"));
// console.log("测试70 - 反转后数组的propertyIsEnumerable检查: " + (Fn70_testPropertyIsEnumerableAfterReverse() ? "通过" : "失败"));
// console.log("测试71 - 反转后数组的toSource方法（非标准，但部分环境支持）: " + (Fn71_testToSourceAfterReverse() ? "通过" : "失败"));
// console.log("测试72 - 反转后数组的toString与join比较: " + (Fn72_testToStringVsJoinAfterReverse() ? "通过" : "失败"));
// console.log("测试73 - 反转后数组的findLast方法: " + (Fn73_testFindLastAfterReverse() ? "通过" : "失败"));
// console.log("测试74 - 反转后数组的findLastIndex方法: " + (Fn74_testFindLastIndexAfterReverse() ? "通过" : "失败"));
// console.log("测试75 - 反转后数组的with方法（替换元素）: " + (Fn75_testWithAfterReverse() ? "通过" : "失败"));
// console.log("测试76 - 反转后数组的values迭代器: " + (Fn76_testValuesIteratorAfterReverse() ? "通过" : "失败"));
// console.log("测试77 - 反转后数组的keys迭代器: " + (Fn77_testKeysIteratorAfterReverse() ? "通过" : "失败"));
// console.log("测试78 - 反转后数组的entries迭代器: " + (Fn78_testEntriesIteratorAfterReverse() ? "通过" : "失败"));
// console.log("测试79 - 反转后数组的flatMap链式调用: " + (Fn79_testFlatMapChainAfterReverse() ? "通过" : "失败"));
// console.log("测试80 - 反转后数组的map链式调用: " + (Fn80_testMapChainAfterReverse() ? "通过" : "失败"));
// console.log("测试81 - 反转后数组的filter链式调用: " + (Fn81_testFilterChainAfterReverse() ? "通过" : "失败"));
// console.log("测试82 - 反转后数组的reduce链式调用: " + (Fn82_testReduceChainAfterReverse() ? "通过" : "失败"));
// console.log("测试83 - 反转后数组的forEach方法: " + (Fn83_testForEachAfterReverse() ? "通过" : "失败"));
// console.log("测试84 - 包含正则表达式的数组反转: " + (Fn84_testWithRegExp() ? "通过" : "失败"));
// console.log("测试85 - 长度为6的数组反转（偶数长度）: " + (Fn85_testEvenLengthArray() ? "通过" : "失败"));
// console.log("测试86 - 长度为7的数组反转（奇数长度）: " + (Fn86_testOddLengthArray() ? "通过" : "失败"));
// console.log("测试87 - 反转后使用for...of循环验证顺序: " + (Fn87_testForOfAfterReverse() ? "通过" : "失败"));
// console.log("测试88 - 反转后使用传统for循环验证顺序: " + (Fn88_testForLoopAfterReverse() ? "通过" : "失败"));
// console.log("测试89 - 包含循环引用对象的数组反转: " + (Fn89_testCircularReference() ? "通过" : "失败"));
// console.log("测试90 - 反转后数组作为参数传递给函数: " + (Fn90_testAsFunctionParameter() ? "通过" : "失败"));
// console.log("测试91 - 反转后数组的map方法链式调用: " + (Fn91_testMapChaining() ? "通过" : "失败"));
// console.log("测试92 - 反转后数组的filter和map组合使用: " + (Fn92_testFilterMapCombination() ? "通过" : "失败"));
// console.log("测试93 - 使用Array.of创建的数组反转: " + (Fn93_testArrayOfReverse() ? "通过" : "失败"));
// console.log("测试94 - 使用Array构造函数创建的数组反转: " + (Fn94_testArrayConstructorReverse() ? "通过" : "失败"));
// console.log("测试95 - 使用Array.from创建的数组反转: " + (Fn95_testArrayFromReverse() ? "通过" : "失败"));
// console.log("测试96 - 反转后数组的长度被修改后再次反转: " + (Fn96_testLengthModifiedAfterReverse() ? "通过" : "失败"));
// console.log("测试97 - 反转后数组的元素被删除后验证: " + (Fn97_testElementDeletedAfterReverse() ? "通过" : "失败"));
// console.log("测试98 - 包含DOM无关的对象数组反转（如Math对象）: " + (Fn98_testMathObjectArray() ? "通过" : "失败"));
// console.log("测试99 - 反转后数组的find方法查找不存在的元素: " + (Fn99_testFindNonExistent() ? "通过" : "失败"));
// console.log("测试100 - 反转后数组的every方法验证所有元素: " + (Fn100_testEveryCondition() ? "通过" : "失败"));
// console.log("测试101 - 反转后数组的some方法验证存在元素: " + (Fn101_testSomeCondition() ? "通过" : "失败"));
// console.log("测试102 - 反转后数组的reduce方法计算乘积: " + (Fn102_testReduceProduct() ? "通过" : "失败"));
// console.log("测试103 - 反转后数组的flatMap方法处理嵌套数组: " + (Fn103_testFlatMapNested() ? "通过" : "失败"));
// console.log("测试104 - 对Uint8Array类型数组使用reverse: " + (Fn104_testUint8ArrayReverse() ? "通过" : "失败"));
// console.log("测试105 - 对Float64Array类型数组使用reverse: " + (Fn105_testFloat64ArrayReverse() ? "通过" : "失败"));
// console.log("测试106 - 反转后数组的concat方法与空数组: " + (Fn106_testConcatEmptyArray() ? "通过" : "失败"));
// console.log("测试107 - 反转后数组的slice方法获取最后一个元素: " + (Fn107_testSliceLastElement() ? "通过" : "失败"));
// console.log("测试108 - 反转后数组的splice方法删除第一个元素: " + (Fn108_testSpliceFirstElement() ? "通过" : "失败"));
// console.log("测试109 - 反转后数组的unshift方法添加多个元素: " + (Fn109_testUnshiftMultiple() ? "通过" : "失败"));
// console.log("测试110 - 反转后数组的push方法添加多个元素: " + (Fn110_testPushMultiple() ? "通过" : "失败"));
// console.log("测试111 - 反转后数组的shift方法连续调用: " + (Fn111_testShiftMultiple() ? "通过" : "失败"));
// console.log("测试112 - 反转后数组的pop方法连续调用: " + (Fn112_testPopMultiple() ? "通过" : "失败"));
// console.log("测试113 - 反转后数组的fill方法填充全部元素: " + (Fn113_testFillAllElements() ? "通过" : "失败"));
// console.log("测试114 - 反转后数组的copyWithin方法复制全部元素: " + (Fn114_testCopyWithinAll() ? "通过" : "失败"));
// console.log("测试115 - 包含相同元素的数组反转: " + (Fn115_testDuplicateElements() ? "通过" : "失败"));
// console.log("测试116 - 包含递增序列的数组反转: " + (Fn116_testIncreasingSequence() ? "通过" : "失败"));
// console.log("测试117 - 包含递减序列的数组反转: " + (Fn117_testDecreasingSequence() ? "通过" : "失败"));
// console.log("测试118 - 反转后数组的indexOf查找第一个出现的元素: " + (Fn118_testIndexOfFirstOccurrence() ? "通过" : "失败"));
// console.log("测试119 - 反转后数组的lastIndexOf查找最后出现的元素: " + (Fn119_testLastIndexOfLastOccurrence() ? "通过" : "失败"));
// console.log("测试120 - 反转后数组的join方法使用自定义分隔符: " + (Fn120_testJoinWithSeparator() ? "通过" : "失败"));
// console.log("测试121 - 反转后数组的toString方法与原数组比较: " + (Fn121_testToStringComparison() ? "通过" : "失败"));
// console.log("测试122 - 反转后数组的valueOf方法返回自身: " + (Fn122_testValueOfReturnsSelf() ? "通过" : "失败"));
// console.log("测试123 - 反转后数组的flat方法指定深度: " + (Fn123_testFlatWithDepth() ? "通过" : "失败"));
// console.log("测试124 - 反转后数组的sort方法使用自定义比较器: " + (Fn124_testSortWithComparator() ? "通过" : "失败"));
// console.log("测试125 - 对不可扩展数组使用reverse: " + (Fn125_testNonExtensibleArray() ? "通过" : "失败"));
// console.log("测试126 - 反转后数组的toLocaleString使用参数: " + (Fn126_testToLocaleStringWithParams() ? "通过" : "失败"));
// console.log("测试127 - 反转后数组的解构赋值给变量: " + (Fn127_testDestructuringAssignment() ? "通过" : "失败"));
// console.log("测试128 - 反转后数组的扩展运算符创建新数组: " + (Fn128_testSpreadOperator() ? "通过" : "失败"));
// console.log("测试129 - 反转后数组的isArray检查结果: " + (Fn129_testIsArrayResult() ? "通过" : "失败"));
// console.log("测试130 - 反转后数组的constructor属性: " + (Fn130_testConstructorProperty() ? "通过" : "失败"));
// console.log("测试131 - 反转后数组的prototype链检查: " + (Fn131_testPrototypeChain() ? "通过" : "失败"));
// console.log("测试132 - 反转后数组的isPrototypeOf检查: " + (Fn132_testIsPrototypeOf() ? "通过" : "失败"));
// console.log("测试133 - 反转后数组的hasOwnProperty检查不存在的属性: " + (Fn133_testHasOwnPropertyNonExistent() ? "通过" : "失败"));
// console.log("测试134 - 反转后数组的propertyIsEnumerable检查: " + (Fn134_testPropertyIsEnumerable() ? "通过" : "失败"));
// console.log("测试135 - 反转后数组的findLast方法查找最后一个符合条件的元素: " + (Fn135_testFindLast() ? "通过" : "失败"));
// console.log("测试136 - 反转后数组的findLastIndex方法查找索引: " + (Fn136_testFindLastIndex() ? "通过" : "失败"));
// console.log("测试137 - 反转后数组的with方法替换第一个元素: " + (Fn137_testWithReplaceFirst() ? "通过" : "失败"));
// console.log("测试138 - 反转后数组的values迭代器遍历全部元素: " + (Fn138_testValuesIterator() ? "通过" : "失败"));
// console.log("测试139 - 反转后数组的keys迭代器遍历全部索引: " + (Fn139_testKeysIterator() ? "通过" : "失败"));
// console.log("测试140 - 反转后数组的entries迭代器遍历全部键值对: " + (Fn140_testEntriesIterator() ? "通过" : "失败"));
// console.log("测试141 - 反转后数组的flatMap链式调用处理嵌套数组: " + (Fn141_testFlatMapNestedChain() ? "通过" : "失败"));
// console.log("测试142 - 反转后数组的map和filter链式调用: " + (Fn142_testMapFilterChain() ? "通过" : "失败"));
// console.log("测试143 - 反转后数组的filter和reduce链式调用: " + (Fn143_testFilterReduceChain() ? "通过" : "失败"));
// console.log("测试144 - 反转后数组的reduce方法计算最大值: " + (Fn144_testReduceMax() ? "通过" : "失败"));
// console.log("测试145 - 反转后数组的forEach方法修改外部变量: " + (Fn145_testForEachModify() ? "通过" : "失败"));
// console.log("测试146 - 包含BigInt和Number混合的数组反转: " + (Fn146_testMixedBigIntNumber() ? "通过" : "失败"));
// console.log("测试147 - 包含字符串和数字混合的数组反转: " + (Fn147_testMixedStringNumber() ? "通过" : "失败"));
// console.log("测试148 - 反转后数组的元素类型检查: " + (Fn148_testElementTypeCheck() ? "通过" : "失败"));
// console.log("测试149 - 反转后数组的元素严格相等性检查: " + (Fn149_testStrictEquality() ? "通过" : "失败"));
// console.log("测试150 - 反转后数组的元素松散相等性检查: " + (Fn150_testLooseEquality() ? "通过" : "失败"));
// console.log("测试151 - 使用call方法在类数组对象上调用reverse: " + (Fn151_testCallOnArrayLike() ? "通过" : "失败"));
// console.log("测试152 - 使用apply方法在类数组对象上调用reverse: " + (Fn152_testApplyOnArrayLike() ? "通过" : "失败"));
// console.log("测试153 - 使用bind方法绑定reverse到类数组对象: " + (Fn153_testBindOnArrayLike() ? "通过" : "失败"));
// console.log("测试154 - 反转后数组的元素为数组的情况: " + (Fn154_testElementsAreArrays() ? "通过" : "失败"));
// console.log("测试155 - 反转后数组的元素为函数的情况: " + (Fn155_testElementsAreFunctions() ? "通过" : "失败"));
// console.log("测试156 - 反转后数组的元素为日期对象的情况: " + (Fn156_testElementsAreDates() ? "通过" : "失败"));
// console.log("测试157 - 非常大的数组反转（10000元素）: " + (Fn157_testVeryLargeArray() ? "通过" : "失败"));
// console.log("测试158 - 反转后数组的length属性是否可写: " + (Fn158_testLengthWritable() ? "通过" : "失败"));
// console.log("测试159 - 反转后数组的元素被修改后验证: " + (Fn159_testModifyElementsAfterReverse() ? "通过" : "失败"));
// console.log("测试160 - 反转后数组的toString与原数组toString比较: " + (Fn160_testToStringComparisonOriginal() ? "通过" : "失败"));
// console.log("测试161 - 反转后数组的join('')结果: " + (Fn161_testJoinEmptyString() ? "通过" : "失败"));
// console.log("测试162 - 反转后数组的flat方法不改变非嵌套数组: " + (Fn162_testFlatNonNested() ? "通过" : "失败"));
