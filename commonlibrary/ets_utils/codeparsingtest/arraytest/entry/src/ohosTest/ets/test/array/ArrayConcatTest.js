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

// 测试1：基本功能 - 合并两个数组
export function Fn01_testConcatTwoArrays() {
    const arr1 = [1, 2, 3];
    const arr2 = [4, 5, 6];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, 2, 3, 4, 5, 6]) &&
        JSON.stringify(arr1) === JSON.stringify([1, 2, 3]) &&
        JSON.stringify(arr2) === JSON.stringify([4, 5, 6]);
}

// 测试2：合并多个参数 - 包含数组和单个值
export function Fn02_testConcatMultipleParams() {
    const arr = ['a', 'b'];
    const result = arr.concat('c', ['d', 'e'], 'f', ['g']);
    return JSON.stringify(result) === JSON.stringify(['a', 'b', 'c', 'd', 'e', 'f', 'g']);
}

// 测试3：处理嵌套数组 - concat只会扁平化一层
export function Fn03_testConcatNestedArrays() {
    const arr1 = [1, [2, 3]];
    const arr2 = [4, [5, [6]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, [2, 3], 4, [5, [6]]]);
}

// 测试4：合并空数组和非空数组
export function Fn04_concatEmptyAndNonEmpty() {
    const arr1 = [];
    const arr2 = [1, 2, 3];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, 2, 3]) &&
        JSON.stringify(arr1) === JSON.stringify([]);
}

// 测试5：合并多个空数组
export function Fn05_concatMultipleEmptyArrays() {
    const arr1 = [];
    const arr2 = [];
    const arr3 = [];
    const result = arr1.concat(arr2, arr3);
    return JSON.stringify(result) === JSON.stringify([]);
}

// 测试6：合并数组与null值
export function Fn06_concatWithNull() {
    const arr = [1, 2];
    const result = arr.concat(null);
    return JSON.stringify(result) === JSON.stringify([1, 2, null]);
}

// 测试7：合并数组与undefined值
export function Fn07_concatWithUndefined() {
    const arr = [1, 2];
    const result = arr.concat(undefined);
    return JSON.stringify(result) === JSON.stringify([1, 2, undefined]);
}

// 测试8：合并数组与布尔值
export function Fn08_concatWithBooleans() {
    const arr = [1];
    const result = arr.concat(true, false);
    return JSON.stringify(result) === JSON.stringify([1, true, false]);
}

// 测试9：合并数组与数字
export function Fn09_concatWithNumbers() {
    const arr = ['a'];
    const result = arr.concat(100, 3.14);
    return JSON.stringify(result) === JSON.stringify(['a', 100, 3.14]);
}

// 测试10：合并数组与字符串
export function Fn10_concatWithStrings() {
    const arr = [1, 2];
    const result = arr.concat('hello', 'world');
    return JSON.stringify(result) === JSON.stringify([1, 2, 'hello', 'world']);
}

// 测试11：合并数组与对象
export function Fn11_concatWithObjects() {
    const arr = [1];
    const obj = { a: 1 };
    const result = arr.concat(obj);
    return result.length === 2 && result[1] === obj;
}

// 测试12：处理类数组对象(arguments)
export function Fn12_concatWithArguments() {

    function test() {
        const arr = [1, 2];
        return arr.concat(arguments);
    }

    const result = test(3, 4, 5);
    return JSON.stringify(result) === JSON.stringify([1, 2, { "0": 3, "1": 4, "2": 5 }]);
}

// 测试13：处理类数组对象(带length属性)
export function Fn13_concatWithArrayLike() {
    const arr = [1];
    const arrayLike = { 0: 'a', 1: 'b', length: 2 };
    const result = arr.concat(arrayLike);
    return JSON.stringify(result) === JSON.stringify([1, { '0': 'a', '1': 'b', length: 2 }]);
}

// 测试14：处理可迭代的类数组对象
export function Fn14_concatWithIterable() {
    const arr = [1];
    const iterable = {
        0: 'a',
        1: 'b',
        length: 2,
        [Symbol.iterator]: function* () {
            yield this[0];
            yield this[1];
        }
    };
    const result = arr.concat(iterable);
    return JSON.stringify(result) === JSON.stringify([1, { "0": "a", "1": "b", "length": 2 }]);
}

// 测试15：处理稀疏数组合并
export function Fn15_concatSparseArrays() {
    const arr1 = [1, , 3];
    const arr2 = [4, , 6];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, null, 3, 4, null, 6]);
}

// 测试16：合并后数组长度验证
export function Fn16_verifyResultLength() {
    const arr1 = [1, 2, 3];
    const arr2 = [4, 5];
    const arr3 = [6];
    const result = arr1.concat(arr2, arr3);
    return result.length === 6;
}

// 测试17：合并包含Date对象的数组
export function Fn17_concatWithDateObjects() {
    const date = new Date(2023, 0, 1);
    const arr1 = [date];
    const arr2 = [new Date(2024, 0, 1)];
    const result = arr1.concat(arr2);
    return result[0] === date && result.length === 2;
}

// 测试18：合并包含RegExp对象的数组
export function Fn18_concatWithRegExp() {
    const regex1 = /test/;
    const regex2 = /demo/g;
    const arr = [regex1];
    const result = arr.concat(regex2);
    return result[0] === regex1 && result[1] === regex2;
}

// 测试19：合并包含函数的数组
export function Fn19_concatWithFunctions() {
    const func1 = () => 1;
    const func2 = function () {
        return 2;
    };
    const arr = [func1];
    const result = arr.concat(func2);
    return result[0] === func1 && result[1] === func2;
}

// 测试20：合并三层嵌套数组
export function Fn20_concatThreeLevelNestedArrays() {
    const arr1 = [1, [2, [3]]];
    const arr2 = [4, [5, [6, [7]]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, [2, [3]], 4, [5, [6, [7]]]]);
}

// 测试21：合并零个参数(返回原数组副本)
export function Fn21_concatWithNoArguments() {
    const arr = [1, 2, 3];
    const result = arr.concat();
    return JSON.stringify(result) === JSON.stringify(arr) && result !== arr;
}

// 测试22：合并一个参数为非数组值
export function Fn22_concatWithSingleNonArray() {
    const arr = [1, 2];
    const result = arr.concat('test');
    return JSON.stringify(result) === JSON.stringify([1, 2, 'test']);
}

// 测试23：合并多个非数组值
export function Fn23_concatWithMultipleNonArrays() {
    const arr = [1];
    const result = arr.concat(2, '3', true, null);
    return JSON.stringify(result) === JSON.stringify([1, 2, '3', true, null]);
}

// 测试24：处理极大长度的数组合并
export function Fn24_concatLargeArrays() {
    const arr1 = new Array(1000).fill(0);
    const arr2 = new Array(2000).fill(1);
    const result = arr1.concat(arr2);
    return result.length === 3000 && result[999] === 0 && result[1000] === 1;
}

// 测试25：合并包含Symbol的数组
export function Fn25_concatWithSymbols() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = [sym1];
    const result = arr.concat(sym2);
    return result[0] === sym1 && result[1] === sym2;
}

// 测试26：合并包含BigInt的数组
export function Fn26_concatWithBigInts() {
    const big1 = 100n;
    const big2 = 200n;
    const arr = [big1];
    const result = arr.concat(big2);
    return result[0] === big1 && result[1] === big2;
}

// 测试27：处理数组中包含undefined元素
export function Fn27_concatWithUndefinedElements() {
    const arr1 = [1, undefined, 3];
    const arr2 = [4, undefined];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, undefined, 3, 4, undefined]);
}

// 测试28：处理数组中包含null元素
export function Fn28_concatWithNullElements() {
    const arr1 = [1, null, 3];
    const arr2 = [4, null];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, null, 3, 4, null]);
}

// 测试29：合并后元素引用验证(对象)
export function Fn29_verifyObjectReferences() {
    const obj = { a: 1 };
    const arr1 = [obj];
    const arr2 = [obj];
    const result = arr1.concat(arr2);
    return result[0] === obj && result[1] === obj && result[0] === result[1];
}

// 测试30：合并后原始值验证
export function Fn30_verifyPrimitiveValues() {
    const str = 'test';
    const num = 123;
    const arr1 = [str];
    const arr2 = [num];
    const result = arr1.concat(arr2);
    return result[0] === str && result[1] === num;
}

// 测试31：合并空数组到非空数组开头
export function Fn31_concatEmptyArrayAtStart() {
    const arr1 = [1, 2];
    const arr2 = [];
    const result = arr2.concat(arr1);
    return JSON.stringify(result) === JSON.stringify([1, 2]);
}

// 测试32：合并四层嵌套数组
export function Fn32_concatFourLevelNestedArrays() {
    const arr1 = [1, [2, [3, [4]]]];
    const arr2 = [[[[5]]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, [2, [3, [4]]], [[[5]]]]);
}

// 测试33：处理无迭代器的类数组对象
export function Fn33_concatNonIterableArrayLike() {
    const arr = [1];
    const arrayLike = { 0: 'a', 1: 'b', length: 2 };
    const result = arr.concat(arrayLike);
    return JSON.stringify(result) === JSON.stringify([1, arrayLike]);
}

// 测试34：合并数组与空字符串
export function Fn34_concatWithEmptyString() {
    const arr = [1, 2];
    const result = arr.concat('');
    return JSON.stringify(result) === JSON.stringify([1, 2, '']);
}

// 测试35：合并数组与长字符串
export function Fn35_concatWithLongString() {
    const longStr = 'a'.repeat(1000);
    const arr = [1];
    const result = arr.concat(longStr);
    return result[1] === longStr;
}

// 测试36：合并数组与数值0
export function Fn36_concatWithZero() {
    const arr = [1];
    const result = arr.concat(0, -0);
    return JSON.stringify(result) === JSON.stringify([1, 0, -0]);
}

// 测试37：合并数组与NaN
export function Fn37_concatWithNaN() {
    const arr = [1];
    const result = arr.concat(NaN);
    return isNaN(result[1]) && result.length === 2;
}

// 测试38：合并数组与Infinity
export function Fn38_concatWithInfinity() {
    const arr = [1];
    const result = arr.concat(Infinity, -Infinity);
    return result[1] === Infinity && result[2] === -Infinity;
}

// 测试39：处理数组中包含空数组元素
export function Fn39_concatWithEmptyArrayElements() {
    const arr1 = [1, [], 3];
    const arr2 = [[], 5];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, [], 3, [], 5]);
}

// 测试40：合并数组与多维数组(仅扁平化一层)
export function Fn40_concatMultiDimensionalArrays() {
    const arr1 = [1, [2, 3]];
    const arr2 = [4, [5, [6, 7]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, [2, 3], 4, [5, [6, 7]]]);
}

// 测试41：合并数组与包含数组的对象
export function Fn41_concatWithObjectContainingArray() {
    const arr = [1];
    const obj = { prop: [2, 3] };
    const result = arr.concat(obj);
    return result[1] === obj && result[1].prop[0] === 2;
}

// 测试42：处理数组中包含循环引用
export function Fn42_concatWithCircularReference() {
    const arr1 = [1];
    arr1.push(arr1);
    const arr2 = [2];
    const result = arr1.concat(arr2);
    return result[0] === 1 && result[1] === arr1 && result[2] === 2;
}

// 测试43：合并数组与Map对象
export function Fn43_concatWithMap() {
    const map = new Map();
    map.set('a', 1);
    const arr = [1];
    const result = arr.concat(map);
    return result[1] === map && result[1].get('a') === 1;
}

// 测试44：合并数组与Set对象
export function Fn44_concatWithSet() {
    const set = new Set();
    set.add(1);
    const arr = [1];
    const result = arr.concat(set);
    return result[1] === set && result[1].has(1);
}

// 测试45：处理数组中包含WeakMap
export function Fn45_concatWithWeakMap() {
    const wm = new WeakMap();
    const obj = {};
    wm.set(obj, 1);
    const arr = [1];
    const result = arr.concat(wm);
    return result[1] === wm;
}

// 测试46：处理数组中包含WeakSet
export function Fn46_concatWithWeakSet() {
    const ws = new WeakSet();
    const obj = {};
    ws.add(obj);
    const arr = [1];
    const result = arr.concat(ws);
    return result[1] === ws;
}

// 测试47：合并数组与正则表达式对象
export function Fn47_concatWithRegExpObjects() {
    const regex1 = /pattern/;
    const regex2 = /another/gmi;
    const arr = [regex1];
    const result = arr.concat(regex2);
    return result[0] === regex1 && result[1] === regex2;
}

// 测试48：合并数组与错误对象
export function Fn48_concatWithErrorObjects() {
    const err1 = new Error('Error 1');
    const err2 = new TypeError('Type Error');
    const arr = [err1];
    const result = arr.concat(err2);
    return result[0] === err1 && result[1] === err2;
}

// 测试49：合并数组与JSON对象
export function Fn49_concatWithJson() {
    const arr = [1];
    const result = arr.concat(JSON);
    return result[1] === JSON;
}

// 测试50：处理数组中包含日期对象
export function Fn50_concatWithDateObjects() {
    const date1 = new Date(2023, 0, 1);
    const date2 = new Date(2024, 0, 1);
    const arr = [date1];
    const result = arr.concat(date2);
    return result[0] === date1 && result[1] === date2;
}

// 测试51：合并数组与数组缓冲区
export function Fn51_concatWithArrayBuffer() {
    const buffer = new ArrayBuffer(8);
    const arr = [1];
    const result = arr.concat(buffer);
    return result[1] === buffer && result[1].byteLength === 8;
}

// 测试52：处理数组中包含类型化数组
export function Fn52_concatWithTypedArrays() {
    const typedArr = new Uint8Array([1, 2, 3]);
    const arr = [1];
    const result = arr.concat(typedArr);
    return JSON.stringify(result) === JSON.stringify([1, { "0": 1, "1": 2, "2": 3 }]);
}

// 测试53：合并数组与生成器对象
export function Fn53_concatWithGenerator() {

    function* generator() {
        yield 1;
        yield 2;
    }

    const arr = [0];
    const result = arr.concat(generator());
    return JSON.stringify(result) === JSON.stringify([0, {}]);
}

// 测试54：处理数组中包含Promise对象
export function Fn54_concatWithPromise() {
    const promise = Promise.resolve(1);
    const arr = [1];
    const result = arr.concat(promise);
    return result[1] === promise;
}

// 测试55：合并数组与async函数
export function Fn55_concatWithAsyncFunction() {
    const asyncFunc = async () => 1;
    const arr = [1];
    const result = arr.concat(asyncFunc);
    return result[1] === asyncFunc;
}

// 测试56：处理数组中包含箭头函数
export function Fn56_concatWithArrowFunctions() {
    const arrow1 = () => 1;
    const arrow2 = () => 2;
    const arr = [arrow1];
    const result = arr.concat(arrow2);
    return result[0] === arrow1 && result[1] === arrow2;
}

// 测试57：合并数组与类实例
export function Fn57_concatWithClassInstances() {
    class MyClass {
        constructor(value) {
            this.value = value;
        }
    }

    const instance1 = new MyClass(1);
    const instance2 = new MyClass(2);
    const arr = [instance1];
    const result = arr.concat(instance2);
    return result[0] === instance1 && result[1] === instance2;
}

// 测试58：处理数组中包含数字对象(new Number())
export function Fn58_concatWithNumberObjects() {
    const numObj1 = new Number(1);
    const numObj2 = new Number(2);
    const arr = [numObj1];
    const result = arr.concat(numObj2);
    return result[0] === numObj1 && result[1] === numObj2;
}

// 测试59：处理数组中包含字符串对象(new String())
export function Fn59_concatWithStringObjects() {
    const strObj1 = new String('a');
    const strObj2 = new String('b');
    const arr = [strObj1];
    const result = arr.concat(strObj2);
    return result[0] === strObj1 && result[1] === strObj2;
}

// 测试60：处理数组中包含布尔对象(new Boolean())
export function Fn60_concatWithBooleanObjects() {
    const boolObj1 = new Boolean(true);
    const boolObj2 = new Boolean(false);
    const arr = [boolObj1];
    const result = arr.concat(boolObj2);
    return result[0] === boolObj1 && result[1] === boolObj2;
}

// 测试61：合并数组与空对象
export function Fn61_concatWithEmptyObjects() {
    const arr = [1];
    const result = arr.concat({}, {});
    return result.length === 3 && result[1] !== result[2];
}

// 测试62：合并数组与数组的原型
export function Fn62_concatWithArrayPrototype() {
    const arr = [1];
    const result = arr.concat(Array.prototype);
    return result[1] === undefined;
}

// 测试63：处理数组中包含undefined和null
export function Fn63_concatWithUndefinedAndNull() {
    const arr1 = [undefined, null];
    const arr2 = [null, undefined];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([undefined, null, null, undefined]);
}

// 测试64：合并数组与多个嵌套数组
export function Fn64_concatWithMultipleNestedArrays() {
    const arr1 = [1, [2, [3]]];
    const arr2 = [[4], 5, [6, [7, [8]]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, [2, [3]], [4], 5, [6, [7, [8]]]]);
}

// 测试65：处理数组中包含稀疏元素和正常元素
export function Fn65_concatSparseAndDenseElements() {
    const arr1 = [1, , 3];
    const arr2 = [4, 5, , 7];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, null, 3, 4, 5, null, 7]);
}

// 测试66：合并数组与包含函数的数组
export function Fn66_concatWithArraysOfFunctions() {
    const func1 = () => 1;
    const func2 = () => 2;
    const arr1 = [func1];
    const arr2 = [func2];
    const result = arr1.concat(arr2);
    return result[0] === func1 && result[1] === func2;
}

// 测试67：处理数组中包含正则表达式的数组
export function Fn67_concatWithArraysOfRegExp() {
    const regex1 = /a/;
    const regex2 = /b/;
    const arr1 = [regex1];
    const arr2 = [regex2];
    const result = arr1.concat(arr2);
    return result[0] === regex1 && result[1] === regex2;
}

// 测试68：合并数组与包含日期的数组
export function Fn68_concatWithArraysOfDates() {
    const date1 = new Date(2023, 0, 1);
    const date2 = new Date(2024, 0, 1);
    const arr1 = [date1];
    const arr2 = [date2];
    const result = arr1.concat(arr2);
    return result[0] === date1 && result[1] === date2;
}

// 测试69：处理数组中包含不同类型的对象
export function Fn69_concatWithMixedObjectTypes() {
    const obj = { a: 1 };
    const arr = [1, 'a', true];
    const result = arr.concat(obj, new Date());
    return result[3] === obj && result[4] instanceof Date;
}

// 测试70：合并数组与空参数(无参数)
export function Fn70_concatWithEmptyParameters() {
    const arr = [1, 2, 3];
    const result = arr.concat();
    return JSON.stringify(result) === JSON.stringify(arr) && result !== arr;
}

// 测试71：合并数组与单个空数组
export function Fn71_concatWithSingleEmptyArray() {
    const arr = [1, 2];
    const result = arr.concat([]);
    return JSON.stringify(result) === JSON.stringify([1, 2]);
}

// 测试72：合并数组与多个空数组
export function Fn72_concatWithMultipleEmptyArrays() {
    const arr = [1];
    const result = arr.concat([], [], []);
    return JSON.stringify(result) === JSON.stringify([1]);
}

// 测试73：处理数组中包含0和-0
export function Fn73_concatWithZeroAndNegativeZero() {
    const arr1 = [0];
    const arr2 = [-0];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([0, -0]);
}

// 测试74：处理数组中包含true和false
export function Fn74_concatWithTrueAndFalse() {
    const arr1 = [true];
    const arr2 = [false];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([true, false]);
}

// 测试75：合并数组与包含BigInt的数组
export function Fn75_concatWithArraysOfBigInt() {
    const big1 = 100n;
    const big2 = 200n;
    const arr1 = [big1];
    const arr2 = [big2];
    const result = arr1.concat(arr2);
    return result[0] === big1 && result[1] === big2;
}

// 测试76：合并数组与包含Symbol的数组
export function Fn76_concatWithArraysOfSymbols() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr1 = [sym1];
    const arr2 = [sym2];
    const result = arr1.concat(arr2);
    return result[0] === sym1 && result[1] === sym2;
}

// 测试77：处理数组中包含空字符串和非空字符串
export function Fn77_concatWithEmptyAndNonEmptyStrings() {
    const arr1 = ['', 'a'];
    const arr2 = ['b', ''];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify(['', 'a', 'b', '']);
}

// 测试78：处理数组中包含各种数值(整数、浮点数、负数)
export function Fn78_concatWithVariousNumbers() {
    const arr1 = [10, -5];
    const arr2 = [3.14, -2.71];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([10, -5, 3.14, -2.71]);
}

// 测试79：合并数组与包含数组的数组(三层嵌套)
export function Fn79_concatThreeLevelNestedArrays() {
    const arr1 = [[[1]]];
    const arr2 = [2, [[3]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([[[1]], 2, [[3]]]);
}

// 测试80：合并数组与包含数组的数组(四层嵌套)
export function Fn80_concatFourLevelNestedArrays() {
    const arr1 = [[[[1]]]];
    const arr2 = [[[[2]]]];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([[[[1]]], [[[2]]]]);
}

// 测试81：处理数组中包含循环引用的对象
export function Fn81_concatWithCircularObjects() {
    const obj = { a: 1 };
    obj.self = obj;
    const arr1 = [obj];
    const arr2 = [obj];
    const result = arr1.concat(arr2);
    return result[0] === obj && result[1] === obj && result[0].self === obj;
}

// 测试82：合并数组与包含Map和Set的数组
export function Fn82_concatWithMapAndSet() {
    const map = new Map();
    const set = new Set();
    const arr1 = [map];
    const arr2 = [set];
    const result = arr1.concat(arr2);
    return result[0] === map && result[1] === set;
}

// 测试83：处理数组中包含WeakMap和WeakSet的数组
export function Fn83_concatWithWeakMapAndWeakSet() {
    const wm = new WeakMap();
    const ws = new WeakSet();
    const arr1 = [wm];
    const arr2 = [ws];
    const result = arr1.concat(arr2);
    return result[0] === wm && result[1] === ws;
}

// 测试84：合并数组与包含错误对象的数组
export function Fn84_concatWithErrorObjects() {
    const err1 = new Error('Error 1');
    const err2 = new Error('Error 2');
    const arr1 = [err1];
    const arr2 = [err2];
    const result = arr1.concat(arr2);
    return result[0] === err1 && result[1] === err2;
}

// 测试85：处理数组中包含各种内置对象
export function Fn85_concatWithBuiltInObjects() {
    const arr1 = [Math];
    const arr2 = [JSON];
    const result = arr1.concat(arr2);
    return result[0] === Math && result[1] === JSON;
}

// 测试86：合并数组与包含自定义对象的数组
export function Fn86_concatWithCustomObjects() {
    const obj1 = { id: 1 };
    const obj2 = { id: 2 };
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0] === obj1 && result[1] === obj2;
}

// 测试87：处理数组中包含数组缓冲区和类型化数组
export function Fn87_concatWithArrayBufferAndTypedArray() {
    const buffer = new ArrayBuffer(8);
    const typedArr = new Uint8Array([1, 2]);
    const arr1 = [buffer];
    const arr2 = [typedArr];
    const result = arr1.concat(arr2);
    return JSON.stringify(result[0]) === JSON.stringify({}) &&
        JSON.stringify(result[1]) === JSON.stringify({ "0": 1, "1": 2 });
}

// 测试88：合并数组与包含生成器和Promise的数组
export function Fn88_concatWithGeneratorAndPromise() {

    function* generator() {
        yield 1;
    }

    const promise = Promise.resolve();
    const arr1 = [generator()];
    const arr2 = [promise];
    const result = arr1.concat(arr2);
    return result[1] === promise;
}

// 测试89：合并数组与包含各种函数类型的数组
export function Fn89_concatWithVariousFunctionTypes() {

    function func() {
    }

    const arrow = () => {
    };
    const arr1 = [func];
    const arr2 = [arrow];
    const result = arr1.concat(arr2);
    return result[0] === func && result[1] === arrow;
}

// 测试90：处理数组中包含类实例的数组
export function Fn90_concatWithClassInstances() {
    class Test {
        constructor() {
        }
    }

    const instance1 = new Test();
    const instance2 = new Test();
    const arr1 = [instance1];
    const arr2 = [instance2];
    const result = arr1.concat(arr2);
    return result[0] === instance1 && result[1] === instance2;
}

// 测试91：处理数组中包含包装对象的数组
export function Fn91_concatWithWrapperObjects() {
    const numObj = new Number(1);
    const strObj = new String('a');
    const arr1 = [numObj];
    const arr2 = [strObj];
    const result = arr1.concat(arr2);
    return result[0] === numObj && result[1] === strObj;
}

// 测试92：合并数组与包含空对象和非空对象的数组
export function Fn92_concatWithEmptyAndNonEmptyObjects() {
    const obj = { a: 1 };
    const arr1 = [{}];
    const arr2 = [obj];
    const result = arr1.concat(arr2);
    return JSON.stringify(result[0]) === '{}' && result[1] === obj;
}

// 测试93：处理数组中包含数组原型和对象原型的数组
export function Fn93_concatWithPrototypes() {
    const arr1 = [Array.prototype];
    const arr2 = [Object.prototype];
    const result = arr1.concat(arr2);
    return result[0] === Array.prototype && result[1] === Object.prototype;
}

// 测试94：合并非常大的数组(简化版)
export function Fn94_concatVeryLargeArrays() {
    const arr1 = new Array(10000).fill('a');
    const arr2 = new Array(20000).fill('b');
    const result = arr1.concat(arr2);
    return result.length === 30000 && result[9999] === 'a' && result[10000] === 'b';
}

// 测试95：合并非常小的数组(单个元素)
export function Fn95_concatVerySmallArrays() {
    const arr1 = [1];
    const arr2 = [2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, 2]);
}

// 测试96：处理数组中包含多种特殊值的组合
export function Fn96_concatWithMixedSpecialValues() {
    const arr1 = [null, undefined, NaN];
    const arr2 = [Infinity, -Infinity, 0, -0];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([null, undefined, NaN, Infinity, -Infinity, 0, -0]);
}

// 测试97：合并数组与包含正则表达式的数组(不同标志)
export function Fn97_concatWithRegExpWithFlags() {
    const regex1 = /test/;
    const regex2 = /test/g;
    const regex3 = /test/gi;
    const arr1 = [regex1];
    const arr2 = [regex2, regex3];
    const result = arr1.concat(arr2);
    return result[0] === regex1 && result[1] === regex2 && result[2] === regex3;
}

// 测试98：处理数组中包含日期对象的数组(不同时间)
export function Fn98_concatWithDifferentDates() {
    const date1 = new Date(2023, 0, 1);
    const date2 = new Date(2023, 6, 1);
    const arr1 = [date1];
    const arr2 = [date2];
    const result = arr1.concat(arr2);
    return result[0] === date1 && result[1] === date2 && result[0].getTime() < result[1].getTime();
}

// 测试99：合并数组与包含相同对象引用的数组
export function Fn99_concatWithSameObjectReferences() {
    const obj = { a: 1 };
    const arr1 = [obj];
    const arr2 = [obj];
    const result = arr1.concat(arr2);
    return result[0] === obj && result[1] === obj && result[0] === result[1];
}

// 测试100：处理数组中包含不同对象但相同内容的数组
export function Fn100_concatWithSimilarObjects() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0] === obj1 && result[1] === obj2 && result[0] !== result[1];
}

// 测试101：合并数组与包含函数的数组(不同函数类型)
export function Fn101_concatWithDifferentFunctionTypes() {

    function func() {
    }

    const asyncFunc = async () => {
    };

    function* generator() {
    }

    const arr1 = [func];
    const arr2 = [asyncFunc, generator];
    const result = arr1.concat(arr2);
    return result[0] === func && result[1] === asyncFunc && result[2] === generator;
}

// 测试102：处理数组中包含箭头函数和普通函数的数组
export function Fn102_concatWithArrowAndRegularFunctions() {

    function regularFunc() {
    }

    const arrowFunc = () => {
    };
    const arr1 = [regularFunc];
    const arr2 = [arrowFunc];
    const result = arr1.concat(arr2);
    return result[0] === regularFunc && result[1] === arrowFunc;
}

// 测试103：合并数组与包含类和构造函数的数组
export function Fn103_concatWithClassesAndConstructors() {
    class MyClass {
    }

    function MyConstructor() {
    }

    const arr1 = [MyClass];
    const arr2 = [MyConstructor];
    const result = arr1.concat(arr2);
    return result[0] === MyClass && result[1] === MyConstructor;
}

// 测试104：处理数组中包含静态方法和实例方法的数组
export function Fn104_concatWithStaticAndInstanceMethods() {
    class MyClass {
        static staticMethod() {
        }

        instanceMethod() {
        }
    }

    const arr1 = [MyClass.staticMethod];
    const arr2 = [new MyClass().instanceMethod];
    const result = arr1.concat(arr2);
    return result[0] === MyClass.staticMethod && result[1] === new MyClass().instanceMethod;
}

// 测试105：合并数组与包含各种符号属性的对象数组
export function Fn105_concatWithSymbolProperties() {
    const sym = Symbol('test');
    const obj1 = { [sym]: 1 };
    const obj2 = { [sym]: 2 };
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0][sym] === 1 && result[1][sym] === 2;
}

// 测试106：处理数组中包含不可枚举属性的对象数组
export function Fn106_concatWithNonEnumerableProperties() {
    const obj1 = {};
    Object.defineProperty(obj1, 'a', { value: 1, enumerable: false });
    const obj2 = {};
    Object.defineProperty(obj2, 'b', { value: 2, enumerable: false });
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0].a === 1 && result[1].b === 2;
}

// 测试107：合并数组与包含可枚举和不可枚举属性的对象数组
export function Fn107_concatWithMixedEnumerableProperties() {
    const obj1 = { a: 1 };
    Object.defineProperty(obj1, 'b', { value: 2, enumerable: false });
    const obj2 = { c: 3 };
    Object.defineProperty(obj2, 'd', { value: 4, enumerable: false });
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0].a === 1 && result[0].b === 2 && result[1].c === 3 && result[1].d === 4;
}

// 测试108：合并数组与包含getter和setter的对象数组
export function Fn108_concatWithGettersAndSetters() {
    const obj1 = {
        get value() {
            return 1;
        },
        set value(v) {
        }
    };
    const obj2 = {
        get value() {
            return 2;
        },
        set value(v) {
        }
    };
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0].value === 1 && result[1].value === 2;
}

// 测试109：合并数组与包含代理对象的数组
export function Fn109_concatWithProxyObjects() {
    const target1 = { a: 1 };
    const proxy1 = new Proxy(target1, {});
    const target2 = { b: 2 };
    const proxy2 = new Proxy(target2, {});
    const arr1 = [proxy1];
    const arr2 = [proxy2];
    const result = arr1.concat(arr2);
    return result[0] === proxy1 && result[1] === proxy2 && result[0].a === 1 && result[1].b === 2;
}

// 测试110：合并数组与包含数组的Proxy对象
export function Fn110_concatWithProxyContainingArray() {
    const target = [1, 2];
    const proxy = new Proxy(target, {});
    const arr = [0];
    const result = arr.concat(proxy);
    return JSON.stringify(result) === JSON.stringify([0, 1, 2]);
}

// 测试111：处理数组中包含不同编码的字符串
export function Fn111_concatWithDifferentEncodedStrings() {
    const arr1 = ['café', 'àéîôü'];
    const arr2 = ['ñç', 'ßø'];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify(['café', 'àéîôü', 'ñç', 'ßø']);
}

// 测试112：合并数组与包含Symbol作为键的对象
export function Fn112_concatWithSymbolKeyObjects() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    const arr = [1];
    const result = arr.concat(obj);
    return result[1][sym] === 'value';
}

// 测试113：处理数组中包含只读属性的对象
export function Fn113_concatWithReadOnlyObjects() {
    const obj = Object.freeze({ a: 1 });
    const arr1 = [obj];
    const arr2 = [Object.seal({ b: 2 })];
    const result = arr1.concat(arr2);
    return result[0].a === 1 && result[1].b === 2;
}

// 测试114：合并数组与包含大量属性的对象
export function Fn114_concatWithObjectsWithManyProperties() {
    const obj = {};
    for (let i = 0; i < 100; i++) {
        obj[`prop${i}`] = i;
    }
    const arr = [1];
    const result = arr.concat(obj);
    return result[1] === obj && result[1].prop99 === 99;
}

// 测试115：处理数组中包含函数返回值的数组
export function Fn115_concatWithFunctionReturnValues() {
    const func = () => [1, 2];
    const arr = [0];
    const result = arr.concat(func());
    return JSON.stringify(result) === JSON.stringify([0, 1, 2]);
}

// 测试116：合并数组与动态生成的数组
export function Fn116_concatWithDynamicallyGeneratedArrays() {
    const arr1 = [1, 2];
    const arr2 = Array.from({ length: 3 }, (_, i) => i + 3);
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, 2, 3, 4, 5]);
}

// 测试117：处理数组中包含计算属性的对象
export function Fn117_concatWithObjectsWithComputedProperties() {
    const key = 'dynamicKey';
    const obj1 = { [key]: 1 };
    const obj2 = { [key + '2']: 2 };
    const arr1 = [obj1];
    const arr2 = [obj2];
    const result = arr1.concat(arr2);
    return result[0].dynamicKey === 1 && result[1].dynamicKey2 === 2;
}

// 测试118：合并数组与包含正则表达式结果的数组
export function Fn118_concatWithRegExpResults() {
    const match1 = 'test123'.match(/\d+/);
    const match2 = 'abc456def'.match(/\d+/);
    const arr1 = [match1];
    const arr2 = [match2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([['123'], ['456']]);
}

// 测试119：处理数组中包含日期字符串的数组
export function Fn119_concatWithDateStrings() {
    const date1 = new Date().toISOString();
    const date2 = new Date().toString();
    const arr1 = [date1];
    const arr2 = [date2];
    const result = arr1.concat(arr2);
    return result[0] === date1 && result[1] === date2;
}

// 测试120：合并数组与包含ArrayBuffer视图的数组
export function Fn120_concatWithArrayBufferViews() {
    const buffer = new ArrayBuffer(16);
    const view1 = new Uint32Array(buffer, 0, 2);
    const view2 = new Float64Array(buffer, 8, 1);
    view1[0] = 12345;
    view2[0] = 3.14;
    const arr1 = [view1];
    const arr2 = [view2];
    const result = arr1.concat(arr2);
    return result[0][0] === 12345 && result[1][0] === 3.14;
}

// 测试121：处理数组中包含类型化数组的数组
export function Fn121_concatWithArraysOfTypedArrays() {
    const typed1 = new Int8Array([1, 2]);
    const typed2 = new Uint16Array([3, 4]);
    const arr1 = [typed1];
    const arr2 = [typed2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([{ "0": 1, "1": 2 }, { "0": 3, "1": 4 }]);
}

// 测试123：处理数组中包含BigInt运算结果的数组
export function Fn123_concatWithBigIntOperations() {
    const big1 = 100n + 200n;
    const big2 = 500n - 300n;
    const arr1 = [big1];
    const arr2 = [big2];
    const result = arr1.concat(arr2);
    return result[0] === 300n && result[1] === 200n;
}

// 测试124：合并数组与包含函数绑定的数组
export function Fn124_concatWithBoundFunctions() {
    const obj = { value: 10 };

    function getValue() {
        return this.value;
    }

    const bound1 = getValue.bind(obj);
    const bound2 = getValue.bind({ value: 20 });
    const arr1 = [bound1];
    const arr2 = [bound2];
    const result = arr1.concat(arr2);
    return result[0]() === 10 && result[1]() === 20;
}

// 测试125：处理数组中包含生成器迭代结果的数组
export function Fn125_concatWithGeneratorResults() {

    function* generator() {
        yield 1;
        yield 2;
        yield 3;
    }

    const arr1 = [...generator()];
    const arr2 = [...generator()].map(x => x * 2);
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([1, 2, 3, 2, 4, 6]);
}

// 测试126：合并数组与包含Promise状态的数组
export function Fn126_concatWithPromiseStates() {
    const promise1 = Promise.resolve(1);
    const promise2 = Promise.reject(new Error('test'));
    const arr1 = [promise1];
    const arr2 = [promise2];
    const result = arr1.concat(arr2);
    return result[0] === promise1 && result[1] === promise2;
}

// 测试127：处理数组中包含已处理和未处理的Promise
export function Fn127_concatWithSettledPromises() {
    const promise1 = Promise.resolve(1);
    const promise2 = Promise.resolve(2);
    const arr1 = [promise1];
    const arr2 = [promise2];
    const result = arr1.concat(arr2);
    return result[0] === promise1 && result[1] === promise2;
}

// 测试128：合并数组与包含类静态属性的数组
export function Fn128_concatWithClassStaticProperties() {
    class MyClass {
        static staticProp = 10;
    }

    const arr1 = [MyClass.staticProp];
    const arr2 = [MyClass];
    const result = arr1.concat(arr2);
    return result[0] === 10 && result[1] === MyClass;
}

// 测试129：处理数组中包含类实例方法的数组
export function Fn129_concatWithClassInstanceMethods() {
    class MyClass {
        method() {
            return 1;
        }
    }

    const instance = new MyClass();
    const arr1 = [instance.method];
    const arr2 = [new MyClass().method];
    const result = arr1.concat(arr2);
    return result[0]() === 1 && result[1]() === 1;
}

// 测试130：合并数组与包含类型转换结果的数组
export function Fn130_concatWithTypeConversionResults() {
    const val = '123';
    const res1 = [Number(val), Boolean(val), String(123)];
    const res2 = [Object(val), Array.from(val), JSON.parse(val)];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [123, true, '123'],
        [new String('123'), ['1', '2', '3'], 123]
    ]);
}

// 测试131：处理数组中包含模块导出对象
export function Fn131_concatWithModuleExports() {
    const moduleObj = { exports: { a: 1 } };
    const arr1 = [moduleObj];
    const arr2 = [moduleObj.exports];
    const result = arr1.concat(arr2);
    return result[0] === moduleObj && result[1] === moduleObj.exports;
}

// 测试132：合并数组与包含配置对象的数组
export function Fn132_concatWithConfigObjects() {
    const config1 = { debug: true, port: 3000 };
    const config2 = { debug: false, port: 8080 };
    const arr1 = [config1];
    const arr2 = [config2];
    const result = arr1.concat(arr2);
    return result[0].port === 3000 && result[1].port === 8080;
}

// 测试133：处理数组中包含嵌套配置对象的数组
export function Fn133_concatWithNestedConfigObjects() {
    const config1 = { db: { host: 'localhost', port: 5432 } };
    const config2 = { app: { name: 'test', version: '1.0' } };
    const arr1 = [config1];
    const arr2 = [config2];
    const result = arr1.concat(arr2);
    return result[0].db.port === 5432 && result[1].app.name === 'test';
}

// 测试134：合并数组与包含错误堆栈信息的对象
export function Fn134_concatWithErrorStacks() {
    try {
        throw new Error('Test error');
    } catch (err1) {
        try {
            throw new TypeError('Type error');
        } catch (err2) {
            const arr1 = [err1];
            const arr2 = [err2];
            const result = arr1.concat(arr2);
            return result[0] instanceof Error && result[1] instanceof TypeError;
        }
    }
}

// 测试135：处理数组中包含定时器ID的数组
export function Fn135_concatWithTimerIds() {
    const timeoutId = setTimeout(() => {
    }, 0);
    const intervalId = setInterval(() => {
    }, 0);
    clearTimeout(timeoutId);
    clearInterval(intervalId);
    const arr1 = [timeoutId];
    const arr2 = [intervalId];
    const result = arr1.concat(arr2);
    return typeof result[0] === 'number' && typeof result[1] === 'number';
}

// 测试136：合并数组与包含Buffer对象的数组(Node.js)
export function Fn136_concatWithBufferObjects() {
    if (typeof Buffer === 'undefined') {
        return true;
    }
    const buffer1 = Buffer.from('hello');
    const buffer2 = Buffer.from('world');
    const arr1 = [buffer1];
    const arr2 = [buffer2];
    const result = arr1.concat(arr2);
    return result[0].toString() === 'hello' && result[1].toString() === 'world';
}

// 测试137：处理数组中包含算术运算结果的数组
export function Fn137_concatWithArithmeticResults() {
    const a = 10;
    const b = 3;
    const res1 = [a + b, a - b, a * b];
    const res2 = [a / b, a % b, Math.pow(a, 2)];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [13, 7, 30],
        [10 / 3, 1, 100]
    ]);
}

// 测试138：合并数组与包含查询字符串解析结果的数组
export function Fn138_concatWithQueryStringParsed() {
    const parse = (str) => {
        const obj = {};
        str.split('&').forEach(pair => {
            const [key, value] = pair.split('=');
            obj[key] = decodeURIComponent(value);
        });
        return obj;
    };
    const qs1 = parse('name=test&age=20');
    const qs2 = parse('page=1&limit=10');
    const arr1 = [qs1];
    const arr2 = [qs2];
    const result = arr1.concat(arr2);
    return result[0].name === 'test' && result[1].page === '1';
}

// 测试140：合并数组与包含集合操作结果的数组
export function Fn140_concatWithSetOperations() {
    const set1 = new Set([1, 2, 3]);
    const set2 = new Set([3, 4, 5]);
    const union = new Set([...set1, ...set2]);
    const arr1 = [Array.from(set1)];
    const arr2 = [Array.from(union)];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([[1, 2, 3], [1, 2, 3, 4, 5]]);
}

// 测试141：处理数组中包含映射操作结果的数组
export function Fn141_concatWithMapOperations() {
    const map1 = new Map([['a', 1], ['b', 2]]);
    const map2 = new Map([['c', 3], ['d', 4]]);
    const arr1 = [Array.from(map1.values())];
    const arr2 = [Array.from(map2.keys())];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([[1, 2], ['c', 'd']]);
}

// 测试142：合并数组与包含数学计算结果的数组
export function Fn142_concatWithMathResults() {
    const math1 = [Math.PI, Math.E];
    const math2 = [Math.sqrt(25), Math.pow(2, 10)];
    const arr1 = [math1];
    const arr2 = [math2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([[Math.PI, Math.E], [5, 1024]]);
}

// 测试143：处理数组中包含日期计算结果的数组
export function Fn143_concatWithDateCalculations() {
    const date = new Date();
    const date1 = [date.getFullYear(), date.getMonth() + 1];
    const date2 = [date.getDate(), date.getHours()];
    const arr1 = [date1];
    const arr2 = [date2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([date1, date2]);
}

// 测试144：合并数组与包含字符串操作结果的数组
export function Fn144_concatWithStringOperations() {
    const str = 'Hello World';
    const str1 = [str.toUpperCase(), str.toLowerCase()];
    const str2 = [str.split(' '), str.substring(0, 5)];
    const arr1 = [str1];
    const arr2 = [str2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        ['HELLO WORLD', 'hello world'],
        [['Hello', 'World'], 'Hello']
    ]);
}

// 测试145：处理数组中包含数组方法结果的数组
export function Fn145_concatWithArrayMethodResults() {
    const arr = [1, 2, 3, 4, 5];
    const res1 = [arr.filter(x => x % 2 === 0), arr.map(x => x * 2)];
    const res2 = [arr.reduce((a, b) => a + b, 0), arr.slice(2)];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [[2, 4], [2, 4, 6, 8, 10]],
        [15, [3, 4, 5]]
    ]);
}

// 测试146：合并数组与包含对象方法结果的数组
export function Fn146_concatWithObjectMethodResults() {
    const obj = { a: 1, b: 2, c: 3 };
    const res1 = [Object.keys(obj), Object.values(obj)];
    const res2 = [Object.entries(obj), Object.hasOwn(obj, 'a')];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) ===
    JSON.stringify([[["a", "b", "c"], [1, 2, 3]], [[["a", 1], ["b", 2], ["c", 3]], true]]);
}

// 测试147：处理数组中包含函数参数的数组
export function Fn147_concatWithFunctionParameters() {

    function getParams(...args) {
        return args;
    }

    const params1 = getParams(1, 'a', true);
    const params2 = getParams({ x: 1 }, [2, 3]);
    const arr1 = [params1];
    const arr2 = [params2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [1, 'a', true],
        [{ x: 1 }, [2, 3]]
    ]);
}

// 测试148：合并数组与包含函数返回值的数组
export function Fn148_concatWithFunctionReturnValues() {

    function func1() {
        return { a: 1 };
    }

    function func2() {
        return [2, 3];
    }

    const arr1 = [func1()];
    const arr2 = [func2()];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([{ a: 1 }, [2, 3]]);
}

// 测试149：处理数组中包含异步函数结果的数组
export function Fn149_concatWithAsyncFunctionResults() {
    const asyncFunc = async () => 1;
    const arr1 = [asyncFunc()];
    const arr2 = [asyncFunc()];
    const result = arr1.concat(arr2);
    return result[0] instanceof Promise && result[1] instanceof Promise;
}

// 测试150：合并数组与包含生成器函数迭代结果的数组
export function Fn150_concatWithGeneratorIteration() {

    function* gen() {
        yield 1;
        yield 2;
        yield 3;
    }

    const iter1 = gen();
    const iter2 = gen();
    const arr1 = [iter1.next(), iter1.next()];
    const arr2 = [iter2.next(), iter2.next(), iter2.next()];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        { value: 1, done: false }, { value: 2, done: false },
        { value: 1, done: false }, { value: 2, done: false }, { value: 3, done: false }
    ]);
}

// 测试151：处理数组中包含代理函数的数组
export function Fn151_concatWithProxyFunctions() {
    const targetFunc = (x) => x * 2;
    const proxyFunc = new Proxy(targetFunc, {
        apply(target, thisArg, args) {
            return target(...args) + 1;
        }
    });
    const arr1 = [targetFunc];
    const arr2 = [proxyFunc];
    const result = arr1.concat(arr2);
    return result[0](3) === 6 && result[1](3) === 7;
}

// 测试152：合并数组与包含反射API结果的数组
export function Fn152_concatWithReflectResults() {
    const obj = { a: 1, b: 2 };
    const res1 = [Reflect.get(obj, 'a'), Reflect.has(obj, 'b')];
    const res2 = [Reflect.ownKeys(obj), Reflect.set(obj, 'c', 3)];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [1, true],
        [['a', 'b'], true]
    ]) && obj.c === 3;
}

// 测试153：处理数组中包含Symbol方法结果的数组
export function Fn153_concatWithSymbolMethodResults() {
    const sym1 = Symbol('test');
    const sym2 = Symbol.for('shared');
    const res1 = [sym1.toString(), Symbol.keyFor(sym2)];
    const res2 = [sym1.description, Symbol.for('shared') === sym2];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [`Symbol(test)`, 'shared'],
        ['test', true]
    ]);
}

// 测试154：合并数组与包含类型检查结果的数组
export function Fn154_concatWithTypeCheckResults() {
    const val1 = 'string';
    const val2 = 123;
    const val3 = { a: 1 };
    const res1 = [typeof val1, typeof val2, typeof val3];
    const res2 = [val1 instanceof String, val3 instanceof Object];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        ['string', 'number', 'object'],
        [false, true]
    ]);
}

// 测试155：处理数组中包含错误处理结果的数组
export function Fn155_concatWithErrorHandlingResults() {
    let res1, res2;
    try {
        JSON.parse('invalid');
    } catch (e) {
        res1 = [e.name, e.message];
    }
    try {
        [1, 2].toUpperCase();
    } catch (e) {
        res2 = [e.name, e.message];
    }
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return result[0][0] === 'SyntaxError' && result[1][0] === 'TypeError';
}

// 测试156：合并数组与包含位运算结果的数组
export function Fn156_concatWithBitwiseOperations() {
    const a = 5;
    const b = 3;
    const res1 = [a & b, a | b, a ^ b];
    const res2 = [~a, a << 1, a >> 1];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [1, 7, 6],
        [-6, 10, 2]
    ]);
}

// 测试157：处理数组中包含逻辑运算结果的数组
export function Fn157_concatWithLogicalOperations() {
    const a = true;
    const b = false;
    const c = 0;
    const d = 'test';
    const res1 = [a && b, a || b, !a];
    const res2 = [c && d, c || d, !c];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [false, true, false],
        [0, 'test', true]
    ]);
}

// 测试158：合并数组与包含比较运算结果的数组
export function Fn158_concatWithComparisonResults() {
    const a = 5;
    const b = 10;
    const c = '5';
    const res1 = [a < b, a > b, a === b];
    const res2 = [a == c, a === c, a !== c];
    const arr1 = [res1];
    const arr2 = [res2];
    const result = arr1.concat(arr2);
    return JSON.stringify(result) === JSON.stringify([
        [true, false, false],
        [true, false, true]
    ]);
}
