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

export function ArrayShiftBasicTest0100() {
    let arr = [1, 2, 3, 4, 5];
    let result = arr.shift();
    return result === 1 && arr.length === 4 && arr[0] === 2;
}

export function ArrayShiftBasicTest0200() {
    let arr = [100];
    let result = arr.shift();
    return result === 100 && arr.length === 0;
}

export function ArrayShiftModifyTest0300() {
    let arr = ['a', 'b', 'c'];
    let originalArr = arr;
    arr.shift();
    return arr === originalArr;
}

export function ArrayShiftReturnTest0400() {
    let arr = [42, 43, 44];
    let result = arr.shift();
    return result === 42 && typeof result === 'number';
}

export function ArrayShiftReturnTest0500() {
    let arr = ['hello', 'world'];
    let result = arr.shift();
    return result === 'hello' && typeof result === 'string';
}

export function ArrayShiftReturnTest0600() {
    let obj = { id: 1 };
    let arr = [obj, { id: 2 }];
    let result = arr.shift();
    return result === obj && result.id === 1;
}

export function ArrayShiftReturnTest0700() {
    let innerArr = [1, 2];
    let arr = [innerArr, [3, 4]];
    let result = arr.shift();
    return Array.isArray(result) && result[0] === 1 && result[1] === 2;
}

export function ArrayShiftEmptyTest0800() {
    let arr = [];
    let result = arr.shift();
    return result === undefined && typeof result === 'undefined';
}

export function ArrayShiftLengthTest0900() {
    let arr = [1, 2, 3, 4];
    let originalLength = arr.length;
    arr.shift();
    return originalLength === 4 && arr.length === 3;
}

export function ArrayShiftLengthTest1000() {
    let arr = [100];
    arr.shift();
    return arr.length === 0;
}

export function ArrayShiftLengthTest1100() {
    let arr = [];
    arr.shift();
    return arr.length === 0;
}

export function ArrayShiftLiteralEmptyTest1200() {
    let arr = [];
    let result = arr.shift();
    return result === undefined && arr.length === 0;
}

export function ArrayShiftConstructorTest1300() {
    let arr = new Array();
    let result = arr.shift();
    return result === undefined && arr.length === 0;
}

export function ArrayShiftConstructorTest1400() {
    let arr = new Array(5);
    let result = arr.shift();
    return result === undefined && arr.length === 4;
}

export function ArrayShiftNumberTest1500() {
    let arr = [123, 456, 789];
    let result = arr.shift();
    return result === 123 && typeof result === 'number';
}

export function ArrayShiftStringTest1600() {
    let arr = ['first', 'second', 'third'];
    let result = arr.shift();
    return result === 'first';
}

export function ArrayShiftBooleanTest1700() {
    let arr = [true, false, true];
    let result = arr.shift();
    return result === true && typeof result === 'boolean';
}

export function ArrayShiftObjectTest1800() {
    let obj1 = { name: 'Alice' };
    let arr = [obj1, { name: 'Bob' }];
    let result = arr.shift();
    return result.name === 'Alice';
}

export function ArrayShiftFunctionTest1900() {
    let fn = function() { return 42; };
    let arr = [fn, () => 100];
    let result = arr.shift();
    return result() === 42 && typeof result === 'function';
}

export function ArrayShiftDateTest2000() {
    let date = new Date('2024-01-01');
    let arr = [date, new Date()];
    let result = arr.shift();
    return result instanceof Date;
}

export function ArrayShiftRegExpTest2100() {
    let regex = /test/g;
    let arr = [regex, /other/i];
    let result = arr.shift();
    return result.test('test') === true;
}

export function ArrayShiftMapTest2200() {
    let map = new Map([['key', 'value']]);
    let arr = [map, new Map()];
    let result = arr.shift();
    return result instanceof Map;
}

export function ArrayShiftSetTest2300() {
    let set = new Set([1, 2, 3]);
    let arr = [set, new Set()];
    let result = arr.shift();
    return result instanceof Set;
}

export function ArrayShiftSparseTest2400() {
    let arr = [undefined, undefined, 3, 4];
    let result = arr.shift();
    return result === undefined && arr.length === 3;
}

export function ArrayShiftSparseTest2500() {
    let arr = [undefined, undefined, undefined];
    let result = arr.shift();
    return result === undefined && arr.length === 2;
}

export function ArrayShiftSparseTest2600() {
    let arr = [1, undefined, 3];
    arr.shift();
    return arr[0] === undefined && arr[1] === 3;
}

export function ArrayShiftSingleElementTest2700() {
    let arr = [42];
    let result = arr.shift();
    return result === 42 && arr.length === 0;
}

export function ArrayShiftLargeArrayTest2800() {
    let arr = new Array(10000).fill(0);
    arr[0] = 'first';
    let result = arr.shift();
    return result === 'first' && arr.length === 9999 && arr[0] === 0;
}

export function ArrayShiftMaxValueTest2900() {
    let arr = [Number.MAX_VALUE, 100];
    let result = arr.shift();
    return result === Number.MAX_VALUE;
}

export function ArrayShiftMinValueTest3000() {
    let arr = [Number.MIN_VALUE, 100];
    let result = arr.shift();
    return result === Number.MIN_VALUE;
}

export function ArrayShiftInfinityTest3100() {
    let arr = [Infinity, 100];
    let result = arr.shift();
    return result === Infinity && !isFinite(result);
}

export function ArrayShiftNegativeInfinityTest3200() {
    let arr = [-Infinity, 100];
    let result = arr.shift();
    return result === -Infinity;
}

export function ArrayShiftEmptyStringTest3300() {
    let arr = ['', 'not empty'];
    let result = arr.shift();
    return result === '' && result.length === 0;
}

export function ArrayShiftUndefinedTest3400() {
    let arr = [undefined, 2, 3];
    let result = arr.shift();
    return result === undefined && arr.length === 2;
}

export function ArrayShiftNullTest3500() {
    let arr = [null, 2, 3];
    let result = arr.shift();
    return result === null && arr.length === 2;
}

export function ArrayShiftNaNTest3600() {
    let arr = [NaN, 2, 3];
    let result = arr.shift();
    return Number.isNaN(result) === true;
}

export function ArrayShiftZeroTest3700() {
    let arr = [0, 2, 3];
    let result = arr.shift();
    return result === 0;
}

export function ArrayShiftNegativeZeroTest3800() {
    let arr = [-0, 2, 3];
    let result = arr.shift();
    return result === 0;
}

export function ArrayShiftFalseTest3900() {
    let arr = [false, true, false];
    let result = arr.shift();
    return result === false && typeof result === 'boolean';
}

export function ArrayShiftMultipleCallTest4000() {
    let arr = [1, 2, 3, 4, 5];
    let results = [];
    while (arr.length > 0) {
        results.push(arr.shift());
    }
    return results.length === 5 && results[0] === 1 && results[4] === 5 && arr.length === 0;
}

export function ArrayShiftMultipleCallTest4100() {
    let arr = ['a', 'b', 'c'];
    let r1 = arr.shift();
    let r2 = arr.shift();
    let r3 = arr.shift();
    return r1 === 'a' && r2 === 'b' && r3 === 'c';
}

export function ArrayShiftMultipleCallTest4200() {
    let arr = [];
    let r1 = arr.shift();
    let r2 = arr.shift();
    let r3 = arr.shift();
    return r1 === undefined && r2 === undefined && r3 === undefined;
}

export function ArrayShiftPopComboTest4300() {
    let arr = [1, 2, 3, 4, 5];
    let first = arr.shift();
    let last = arr.pop();
    return first === 1 && last === 5 && arr.length === 3;
}

export function ArrayShiftUnshiftComboTest4400() {
    let arr = [2, 3, 4];
    let removed = arr.shift();
    arr.unshift(1);
    return removed === 2 && arr[0] === 1 && arr.length === 3;
}

export function ArrayShiftPushComboTest4500() {
    let queue = [1, 2, 3];
    queue.push(4);
    let dequeued = queue.shift();
    return dequeued === 1 && queue.length === 3;
}

export function ArrayShiftMapComboTest4600() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    let mapped = arr.map(x => x * 2);
    return mapped[0] === 4 && mapped[1] === 6 && mapped[2] === 8;
}

export function ArrayShiftFilterComboTest4700() {
    let arr = [1, 2, 3, 4, 5];
    arr.shift();
    let filtered = arr.filter(x => x > 2);
    return filtered.length === 3 && filtered[0] === 3;
}

export function ArrayShiftForEachComboTest4800() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    let sum = 0;
    arr.forEach(x => sum += x);
    return sum === 9;
}

export function ArrayShiftArrayLikeTest4900() {
    let arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    let result = Array.prototype.shift.call(arrayLike);
    return result === 'a' && arrayLike.length === 2 && arrayLike[0] === 'b';
}

export function ArrayShiftFrozenTest5000() {
    try {
        let arr = Object.freeze([1, 2, 3]);
        arr.shift();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ArrayShiftSealedTest5100() {
    try {
        let arr = Object.seal([1, 2, 3]);
        arr.shift();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ArrayShiftTypedArrayTest5200() {
    let arr = new Int8Array([1, 2, 3]);
    try {
        arr.shift();
        return false;
    } catch (e) {
        return true;
    }
}

export function ArrayShiftJoinTest5300() {
    let arr = [1, 2, 3];
    arr.shift();
    let joined = arr.join('-');
    return joined === '2-3';
}

export function ArrayShiftIndexOfTest5400() {
    let arr = [1, 2, 3, 2];
    arr.shift();
    let index = arr.indexOf(2);
    return index === 0;
}

export function ArrayShiftIncludesTest5500() {
    let arr = [1, 2, 3];
    arr.shift();
    return arr.includes(2) === true && arr.includes(1) === false;
}

export function ArrayShiftFindTest5600() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    let found = arr.find(x => x > 2);
    return found === 3;
}

export function ArrayShiftEveryTest5700() {
    let arr = [1, 2, 3];
    arr.shift();
    return arr.every(x => x > 0) === true;
}

export function ArrayShiftSomeTest5800() {
    let arr = [1, 2, 3];
    arr.shift();
    return arr.some(x => x > 2) === true;
}

export function ArrayShiftReduceTest5900() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    let sum = arr.reduce((acc, x) => acc + x, 0);
    return sum === 9;
}

export function ArrayShiftSliceTest6000() {
    let arr = [1, 2, 3, 4, 5];
    arr.shift();
    let sliced = arr.slice(0, 2);
    return sliced[0] === 2 && sliced[1] === 3 && arr[0] === 2;
}

export function ArrayShiftSpliceTest6100() {
    let arr = [1, 2, 3, 4, 5];
    arr.shift();
    arr.splice(1, 1);
    return arr[0] === 2 && arr[1] === 4 && arr.length === 3;
}

export function ArrayShiftReverseTest6200() {
    let arr = [1, 2, 3];
    arr.shift();
    arr.reverse();
    return arr[0] === 3 && arr[1] === 2;
}

export function ArrayShiftSortTest6300() {
    let arr = [3, 1, 2];
    arr.shift();
    arr.sort();
    return arr[0] === 1 && arr[1] === 2;
}

export function ArrayShiftConcatTest6400() {
    let arr1 = [1, 2];
    arr1.shift();
    let arr2 = [3, 4];
    let concat = arr1.concat(arr2);
    return concat[0] === 2 && concat[1] === 3 && concat.length === 3;
}

export function ArrayShiftFillTest6500() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    arr.fill(0, 1, 2);
    return arr[0] === 2 && arr[1] === 0 && arr[2] === 4;
}

export function ArrayShiftFlatTest6600() {
    let arr = [[1, 2], [3, 4]];
    arr.shift();
    let flat = arr.flat();
    return flat[0] === 3 && flat[1] === 4;
}

export function ArrayShiftFromTest6700() {
    let arr = Array.from([1, 2, 3]);
    let result = arr.shift();
    return result === 1 && arr.length === 2;
}

export function ArrayShiftOfTest6800() {
    let arr = Array.of(1, 2, 3);
    let result = arr.shift();
    return result === 1 && arr.length === 2;
}

export function ArrayShiftBigIntTest6900() {
    let arr = [9007199254740991n, 123n];
    let result = arr.shift();
    return result === 9007199254740991n && typeof result === 'bigint';
}

export function ArrayShiftSymbolTest7000() {
    let sym = Symbol('test');
    let arr = [sym, Symbol('other')];
    let result = arr.shift();
    return result === sym && typeof result === 'symbol';
}

export async function ArrayShiftAsyncTest7100() {
    let arr = [1, 2, 3];
    let promise = new Promise((resolve) => {
        setTimeout(() => {
            let result = arr.shift();
            resolve(result);
        }, 10);
    });
    let result = await promise;
    return result === 1 && arr.length === 2;
}

export function ArrayShiftNestedArrayTest7200() {
    let arr = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
    let result = arr.shift();
    return Array.isArray(result) && result[0][0] === 1;
}

export function ArrayShiftMixedArrayTest7300() {
    let arr = [1, 'string', true, null, undefined];
    let result = arr.shift();
    return result === 1;
}

export function ArrayShiftObjectArrayTest7400() {
    let arr = [{a: 1}, {b: 2}];
    let result = arr.shift();
    return result.a === 1;
}

export function ArrayShiftSparseMixedTest7500() {
    let arr = [undefined, 2, undefined, 4];
    let result = arr.shift();
    return result === undefined && arr[0] === 2 && arr.length === 3;
}

export function ArrayShiftWithUndefinedTest7600() {
    let arr = [undefined, undefined, 3];
    let result = arr.shift();
    arr.shift();
    return result === undefined && arr[0] === 3;
}

export function ArrayShiftPreserveOrderTest7700() {
    let arr = [10, 20, 30, 40, 50];
    arr.shift();
    return arr[0] === 20 && arr[1] === 30 && arr[2] === 40 && arr[3] === 50;
}

export function ArrayShiftRepeatedTest7800() {
    let arr = [1, 1, 1];
    let r1 = arr.shift();
    let r2 = arr.shift();
    let r3 = arr.shift();
    return r1 === 1 && r2 === 1 && r3 === 1 && arr.length === 0;
}

export function ArrayShiftNegativeNumbersTest7900() {
    let arr = [-5, -3, -1];
    let result = arr.shift();
    return result === -5 && arr[0] === -3;
}

export function ArrayShiftFloatNumbersTest8000() {
    let arr = [3.14, 2.71, 1.41];
    let result = arr.shift();
    return result === 3.14 && arr[0] === 2.71;
}

export function ArrayShiftBooleanArrayTest8100() {
    let arr = [true, false, true, false];
    let result = arr.shift();
    return result === true && arr[0] === false;
}

export function ArrayShiftStringArrayTest8200() {
    let arr = ['alpha', 'beta', 'gamma'];
    let result = arr.shift();
    return result === 'alpha' && arr.length === 2;
}

export function ArrayShiftNullUndefinedTest8300() {
    let arr = [null, undefined, null];
    let r1 = arr.shift();
    let r2 = arr.shift();
    return r1 === null && r2 === undefined;
}

export function ArrayShiftToStringTest8400() {
    let arr = [1, 2, 3];
    arr.shift();
    return arr.toString() === '2,3';
}

export function ArrayShiftToLocaleStringTest8500() {
    let arr = [1000, 2000];
    arr.shift();
    return arr.toLocaleString().includes('1000');
}

export function ArrayShiftLastIndexOfTest8600() {
    let arr = [1, 2, 3, 2];
    arr.shift();
    let index = arr.lastIndexOf(2);
    return index === 2;
}

export function ArrayShiftFindIndexTest8700() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    let index = arr.findIndex(x => x > 2);
    return index === 1;
}

export function ArrayShiftFlatMapTest8800() {
    let arr = [1, 2, 3];
    arr.shift();
    let mapped = arr.flatMap(x => [x, x * 2]);
    return mapped.length === 4 && mapped[0] === 2 && mapped[1] === 4;
}

export function ArrayShiftReduceRightTest8900() {
    let arr = [1, 2, 3, 4];
    arr.shift();
    let result = arr.reduceRight((acc, x) => acc - x, 0);
    return result === -9;
}

export function ArrayShiftEntriesTest9000() {
    let arr = ['a', 'b', 'c'];
    arr.shift();
    let entries = Array.from(arr.entries());
    return entries[0][0] === 0 && entries[0][1] === 'b';
}

export function ArrayShiftKeysTest9100() {
    let arr = ['a', 'b', 'c'];
    arr.shift();
    let keys = Array.from(arr.keys());
    return keys[0] === 0 && keys[1] === 1;
}

export function ArrayShiftValuesTest9200() {
    let arr = ['a', 'b', 'c'];
    arr.shift();
    let values = Array.from(arr.values());
    return values[0] === 'b' && values[1] === 'c';
}

export function ArrayShiftCopyWithinTest9300() {
    let arr = [1, 2, 3, 4, 5];
    arr.shift();
    arr.copyWithin(0, 2);
    return arr[0] === 4 && arr[1] === 5;
}

export function ArrayShiftIsArrayTest9400() {
    let arr = [1, 2, 3];
    arr.shift();
    return Array.isArray(arr) === true;
}

export function ArrayShiftInstanceOfTest9500() {
    let arr = [1, 2, 3];
    arr.shift();
    return arr instanceof Array === true;
}

export function ArrayShiftConstructorTest9600() {
    let arr = [1, 2, 3];
    arr.shift();
    return arr.constructor === Array;
}

export function ArrayShiftPrototypeTest9700() {
    let arr = [1, 2, 3];
    arr.shift();
    return Object.getPrototypeOf(arr) === Array.prototype;
}

export function ArrayShiftLengthWritableTest9800() {
    let arr = [1, 2, 3];
    let desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return desc.writable === true;
}

export function ArrayShiftPropertyEnumerationTest9900() {
    let arr = [1, 2, 3];
    arr.shift();
    let keys = Object.keys(arr);
    return keys.length === 2 && keys[0] === '0' && keys[1] === '1';
}

export function ArrayShiftPreventExtensionsTest10000() {
    let arr = Object.preventExtensions([1, 2, 3]);
    try {
        arr.shift();
        return arr.length === 2 && arr[0] === 2;
    } catch (e) {
        return false;
    }
}
