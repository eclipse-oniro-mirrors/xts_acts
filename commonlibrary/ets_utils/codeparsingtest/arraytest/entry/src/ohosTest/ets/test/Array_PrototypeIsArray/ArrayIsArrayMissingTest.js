/*
 * Copyright (c) 2026 RKH Corp.
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

// Test array-like object created from Array.prototype
export function ArrayIsArrayProtoTest0100() {
    const obj = Object.create(Array.prototype);
    return Array.isArray(obj) === false;
}

// Test array after delete operation
export function ArrayIsArrayDeleteTest0200() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    return Array.isArray(arr) === true && arr.length === 5;
}

// Test array with mixed content types
export function ArrayIsArrayMixedTest0300() {
    const arr = [{}, [], function() {}];
    return Array.isArray(arr) === true;
}

// Test Symbol value
export function ArrayIsArraySymbolTest0400() {
    const sym = Symbol();
    return Array.isArray(sym) === false;
}

// Test Symbol.iterator value
export function ArrayIsArraySymbolIterTest0500() {
    const symIter = Symbol.iterator;
    return Array.isArray(symIter) === false;
}

// Test spread operator result
export function ArrayIsArraySpreadTest0600() {
    const arr1 = [1, 2, 3];
    const arr2 = [...arr1];
    return Array.isArray(arr2) === true && arr2.length === 3;
}

// Test generator function result
export function ArrayIsArrayGeneratorTest0700() {
    function* gen() {
        yield 1;
        yield 2;
        yield 3;
    }
    const genResult = gen();
    return Array.isArray(genResult) === false;
}

// Test string iterator
export function ArrayIsArrayStringIterTest0800() {
    const str = 'hello';
    const strIter = str[Symbol.iterator]();
    return Array.isArray(strIter) === false;
}

// Test async function
export async function ArrayIsArrayAsyncTest0900() {
    const asyncFn = async () => {
        return 1;
    };
    return Array.isArray(asyncFn) === false;
}

// Test constructor functions
export function ArrayIsArrayConstructorTest1000() {
    const result1 = Array.isArray(Array);
    const result2 = Array.isArray(Object);
    const result3 = Array.isArray(Function);
    return result1 === false && result2 === false && result3 === false;
}

// Test Date object
export function ArrayIsArrayDateTest1100() {
    const date = new Date('2024-01-01');
    return Array.isArray(date) === false;
}

// Test String object
export function ArrayIsArrayStringObjTest1200() {
    const strObj = new String('test');
    return Array.isArray(strObj) === false;
}

// Test Map entries iterator
export function ArrayIsArrayMapEntriesTest1300() {
    const map = new Map();
    map.set(1, 'a');
    const entries = map.entries();
    return Array.isArray(entries) === false;
}

// Test array-like object
export function ArrayIsArrayArrayLikeTest1400() {
    const arrayLike = { 0: 'a', 1: 'b', length: 2 };
    return Array.isArray(arrayLike) === false;
}

// Test empty array from Array.of
export function ArrayIsArrayEmptyOfTest1500() {
    const arr = Array.of();
    return Array.isArray(arr) === true && arr.length === 0;
}

// Test Array subclass instance
export function ArrayIsArraySubclassTest1600() {
    class MyArray extends Array {
        constructor(...args) {
            super(...args);
        }
    }
    const myArr = new MyArray(1, 2, 3);
    const mapped = myArr.map(x => x * 2);
    return Array.isArray(myArr) === true && Array.isArray(mapped) === true;
}

// Test array after find operation
export function ArrayIsArrayFindTest1700() {
    const arr = [1, 2, 3, 4, 5];
    const found = arr.find(x => x > 3);
    return found === 4 && Array.isArray(arr) === true;
}

// Test array after flat operation
export function ArrayIsArrayFlatTest1800() {
    const arr = [[1, 2], [3, 4]];
    const flat = arr.flat();
    return Array.isArray(flat) === true && flat.length === 4;
}

// Test array after flatMap operation
export function ArrayIsArrayFlatMapTest1900() {
    const arr = [1, 2, 3];
    const flatMapped = arr.flatMap(x => [x, x * 2]);
    return Array.isArray(flatMapped) === true && flatMapped.length === 6;
}

// Test array after join operation
export function ArrayIsArrayJoinTest2000() {
    const arr = [1, 2, 3];
    const joined = arr.join(',');
    return joined === '1,2,3' && Array.isArray(arr) === true;
}

// Test array after every operation
export function ArrayIsArrayEveryTest2100() {
    const arr = [1, 2, 3];
    const allPositive = arr.every(x => x > 0);
    return allPositive === true && Array.isArray(arr) === true;
}

// Test array after some operation
export function ArrayIsArraySomeTest2200() {
    const arr = [1, 2, 3];
    const hasEven = arr.some(x => x % 2 === 0);
    return hasEven === true && Array.isArray(arr) === true;
}

// Test array after forEach operation
export function ArrayIsArrayForEachTest2300() {
    const arr = [1, 2, 3];
    let sum = 0;
    arr.forEach(x => { sum += x; });
    return sum === 6 && Array.isArray(arr) === true;
}

// Test array after indexOf operation
export function ArrayIsArrayIndexOfTest2400() {
    const arr = [1, 2, 3, 2, 1];
    const index = arr.indexOf(2);
    return index === 1 && Array.isArray(arr) === true;
}

// Test array after includes operation
export function ArrayIsArrayIncludesTest2500() {
    const arr = [1, 2, 3];
    const hasTwo = arr.includes(2);
    return hasTwo === true && Array.isArray(arr) === true;
}

// Test array after reduceRight operation
export function ArrayIsArrayReduceRightTest2600() {
    const arr = [1, 2, 3];
    const result = arr.reduceRight((acc, curr) => acc - curr, 10);
    return result === 4 && Array.isArray(arr) === true;
}

// Test array after toLocaleString operation
export function ArrayIsArrayLocaleStringTest2700() {
    const arr = [1, 2, 3];
    const localeStr = arr.toLocaleString();
    return typeof localeStr === 'string' && Array.isArray(arr) === true;
}

// Test array after toString operation
export function ArrayIsArrayToStringTest2800() {
    const arr = [1, 2, 3];
    const str = arr.toString();
    return str === '1,2,3' && Array.isArray(arr) === true;
}

// Test array values iterator
export function ArrayIsArrayValuesTest2900() {
    const arr = [1, 2, 3];
    const values = arr.values();
    return Array.isArray(values) === false && Array.isArray(arr) === true;
}

// Test array keys iterator
export function ArrayIsArrayKeysTest3000() {
    const arr = [1, 2, 3];
    const keys = arr.keys();
    return Array.isArray(keys) === false && Array.isArray(arr) === true;
}

// Test array entries iterator
export function ArrayIsArrayEntriesTest3100() {
    const arr = [1, 2, 3];
    const entries = arr.entries();
    return Array.isArray(entries) === false && Array.isArray(arr) === true;
}

// Test array with undefined element
export function ArrayIsArrayUndefinedTest3200() {
    const arr = [1, undefined, 3];
    return Array.isArray(arr) === true && arr.length === 3;
}

// Test array with null element
export function ArrayIsArrayNullTest3300() {
    const arr = [1, null, 3];
    return Array.isArray(arr) === true && arr.length === 3;
}

// Test array with NaN element
export function ArrayIsArrayNaNTest3400() {
    const arr = [1, NaN, 3];
    return Array.isArray(arr) === true && arr.length === 3;
}

// Test generator function itself
export function ArrayIsArrayGenFnTest3500() {
    function* genFn() {
        yield 1;
    }
    return Array.isArray(genFn) === false;
}
