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

// Test at() with positive index 0
export function ArrayAtTest0001() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const result = arr.at(0);
    return result === 'a';
}

// Test at() with middle positive index
export function ArrayAtTest0002() {
    const arr = [10, 20, 30, 40, 50];
    const result = arr.at(2);
    return result === 30;
}

// Test at() with last positive index
export function ArrayAtTest0003() {
    const arr = ['first', 'middle', 'last'];
    const result = arr.at(arr.length - 1);
    return result === 'last';
}

// Test at() equivalence with bracket notation
export function ArrayAtTest0004() {
    const arr = [1, 2, 3, 4, 5];
    const index = 2;
    const bracketResult = arr[index];
    const atResult = arr.at(index);
    return bracketResult === atResult;
}

// Test at() consistency with multiple calls
export function ArrayAtTest0005() {
    const arr = [1, 2, 3];
    const result1 = arr.at(1);
    const result2 = arr.at(1);
    const result3 = arr.at(1);
    return result1 === result2 && result2 === result3;
}

// Test at() with single element array
export function ArrayAtTest0006() {
    const arr = ['only'];
    const result = arr.at(0);
    return result === 'only';
}

// Test at() with negative index -1
export function ArrayAtTest0007() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.at(-1);
    return result === 5;
}

// Test at() with negative index -2
export function ArrayAtTest0008() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const result = arr.at(-2);
    return result === 'd';
}

// Test at() with negative index -3
export function ArrayAtTest0009() {
    const arr = [10, 20, 30, 40, 50];
    const result = arr.at(-3);
    return result === 30;
}

// Test at() with negative index equal to array length
export function ArrayAtTest0010() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.at(-arr.length);
    return result === 1;
}

// Test at() negative index equivalence with length calculation
export function ArrayAtTest0011() {
    const arr = ['x', 'y', 'z'];
    const negativeResult = arr.at(-1);
    const lengthResult = arr[arr.length - 1];
    return negativeResult === lengthResult;
}

// Test at() negative index vs traditional method
export function ArrayAtTest0012() {
    const colors = ['red', 'green', 'blue'];
    const atWay = colors.at(-1);
    const lengthWay = colors[colors.length - 1];
    return atWay === lengthWay;
}

// Test at() with two element array and index -1
export function ArrayAtTest0013() {
    const arr = ['first', 'last'];
    const result = arr.at(-1);
    return result === 'last';
}

// Test at() with two element array and index -2
export function ArrayAtTest0014() {
    const arr = ['first', 'last'];
    const result = arr.at(-2);
    return result === 'first';
}

// Test at() with index equal to array length
export function ArrayAtTest0015() {
    const arr = [1, 2, 3];
    const result = arr.at(3);
    return result === undefined;
}

// Test at() with index greater than array length
export function ArrayAtTest0016() {
    const arr = ['a', 'b'];
    const result = arr.at(100);
    return result === undefined;
}

// Test at() with very large positive index
export function ArrayAtTest0017() {
    const arr = [1, 2, 3];
    const result = arr.at(Number.MAX_SAFE_INTEGER);
    return result === undefined;
}

// Test at() with negative index absolute value greater than array length
export function ArrayAtTest0018() {
    const arr = [1, 2, 3];
    const result = arr.at(-4);
    return result === undefined;
}

// Test at() with negative index absolute value equals array length plus one
export function ArrayAtTest0019() {
    const arr = ['a', 'b', 'c'];
    const result = arr.at(-(arr.length + 1));
    return result === undefined;
}

// Test at() with very large negative index
export function ArrayAtTest0020() {
    const arr = [1, 2, 3];
    const result = arr.at(-Number.MAX_SAFE_INTEGER);
    return result === undefined;
}

// Test at() with last valid positive index
export function ArrayAtTest0021() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.at(arr.length - 1);
    return result === 5;
}

// Test at() with first valid negative index
export function ArrayAtTest0022() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.at(-arr.length);
    return result === 1;
}

// Test at() with just out of bounds positive index
export function ArrayAtTest0023() {
    const arr = [1, 2, 3];
    const result = arr.at(arr.length);
    return result === undefined;
}

// Test at() with just out of bounds negative index
export function ArrayAtTest0024() {
    const arr = [1, 2, 3];
    const result = arr.at(-arr.length - 1);
    return result === undefined;
}

// Test at() with positive float parameter
export function ArrayAtTest0025() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const result = arr.at(2.9);
    return result === 'c';
}

// Test at() with negative float parameter
export function ArrayAtTest0026() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const result = arr.at(-2.9);
    return result === 'd';
}

// Test at() with floats near integers
export function ArrayAtTest0027() {
    const arr = [1, 2, 3];
    const result1 = arr.at(1.1);
    const result2 = arr.at(1.9);
    return result1 === result2;
}

// Test at() with numeric string parameter
export function ArrayAtTest0028() {
    const arr = ['a', 'b', 'c', 'd'];
    const result = arr.at('2');
    return result === 'c';
}

// Test at() with negative numeric string parameter
export function ArrayAtTest0029() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.at('-1');
    return result === 5;
}

// Test at() with invalid string parameter
export function ArrayAtTest0030() {
    const arr = ['a', 'b', 'c'];
    const result = arr.at('invalid');
    return result === 'a';
}

// Test at() with boolean true parameter
export function ArrayAtTest0031() {
    const arr = ['first', 'second', 'third'];
    const result = arr.at(true);
    return result === 'second';
}

// Test at() with boolean false parameter
export function ArrayAtTest0032() {
    const arr = ['first', 'second', 'third'];
    const result = arr.at(false);
    return result === 'first';
}

// Test at() with object with valueOf parameter
export function ArrayAtTest0033() {
    const arr = ['a', 'b', 'c', 'd'];
    const obj = {
        valueOf() {
            return 2;
        }
    };
    const result = arr.at(obj);
    return result === 'c';
}

// Test at() with plain object parameter
export function ArrayAtTest0034() {
    const arr = ['first', 'second', 'third'];
    const result = arr.at({});
    return result === 'first';
}

// Test at() with null parameter
export function ArrayAtTest0035() {
    const arr = ['a', 'b', 'c'];
    const result = arr.at(null);
    return result === 'a';
}

// Test at() with undefined parameter
export function ArrayAtTest0036() {
    const arr = ['a', 'b', 'c'];
    const result = arr.at(undefined);
    return result === 'a';
}

// Test at() with no parameter
export function ArrayAtTest0037() {
    const arr = ['first', 'second', 'third'];
    const result = arr.at();
    return result === 'first';
}

// Test at() with NaN parameter
export function ArrayAtTest0038() {
    const arr = ['zero', 'one', 'two'];
    const result = arr.at(NaN);
    return result === 'zero';
}

// Test at() with expression result is NaN
export function ArrayAtTest0039() {
    const arr = [1, 2, 3];
    const result = arr.at(0 / 0);
    return result === 1;
}

// Test at() with positive Infinity parameter
export function ArrayAtTest0040() {
    const arr = [1, 2, 3];
    const result = arr.at(Infinity);
    return result === undefined;
}

// Test at() with negative Infinity parameter
export function ArrayAtTest0041() {
    const arr = [1, 2, 3];
    const result = arr.at(-Infinity);
    return result === undefined;
}

// Test at() with positive zero parameter
export function ArrayAtTest0042() {
    const arr = ['a', 'b', 'c'];
    const result = arr.at(+0);
    return result === 'a';
}

// Test at() with negative zero parameter
export function ArrayAtTest0043() {
    const arr = ['a', 'b', 'c'];
    const result = arr.at(-0);
    return result === 'a';
}

// Test at() with parameter beyond safe integer range
export function ArrayAtTest0044() {
    const arr = [1, 2, 3];
    const result = arr.at(Number.MAX_SAFE_INTEGER + 1);
    return result === undefined;
}

// Test at() with BigInt parameter
export function ArrayAtTest0045() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const result = arr.at(Number(BigInt(2)));
    return result === 'c';
}

// Test at() with empty array and index 0
export function ArrayAtTest0046() {
    const arr = [];
    const result = arr.at(0);
    return result === undefined;
}

// Test at() with empty array and negative index
export function ArrayAtTest0047() {
    const arr = [];
    const result = arr.at(-1);
    return result === undefined;
}

// Test at() with empty array and various indices
export function ArrayAtTest0048() {
    const arr = [];
    const result1 = arr.at(0);
    const result2 = arr.at(1);
    const result3 = arr.at(-1);
    const result4 = arr.at(100);
    return result1 === undefined && result2 === undefined && result3 === undefined && result4 === undefined;
}

// Test at() with sparse array holes
export function ArrayAtTest0049() {
    const arr = [1, , , 4];
    const result = arr.at(2);
    return result === undefined;
}

// Test at() with sparse array end holes
export function ArrayAtTest0050() {
    const arr = [1, , , 4, , 6];
    const result = arr.at(-2);
    return result === undefined;
}

// Test at() with sparse array valid elements
export function ArrayAtTest0051() {
    const arr = [1, , , 4, , 6];
    const result = arr.at(-1);
    return result === 6;
}

// Test at() with sparse array created by delete
export function ArrayAtTest0052() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    const result = arr.at(2);
    return result === undefined;
}

// Test at() after modifying array length
export function ArrayAtTest0053() {
    const arr = [1, 2, 3, 4, 5];
    arr.length = 3;
    const result = arr.at(4);
    return result === undefined;
}

// Test at() with array length 0
export function ArrayAtTest0054() {
    const arr = [1, 2, 3];
    arr.length = 0;
    const result = arr.at(0);
    return result === undefined;
}

// Test at() with simple array-like object
export function ArrayAtTest0055() {
    const arrayLike = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const result = Array.prototype.at.call(arrayLike, 1);
    return result === 'b';
}

// Test at() with array-like object and negative index
export function ArrayAtTest0056() {
    const arrayLike = {
        length: 2,
        0: 'first',
        1: 'last'
    };
    const result = Array.prototype.at.call(arrayLike, -1);
    return result === 'last';
}

// Test at() with string as array-like
export function ArrayAtTest0057() {
    const str = 'hello';
    const result = Array.prototype.at.call(str, 1);
    return result === 'e';
}

// Test at() with string and negative index
export function ArrayAtTest0058() {
    const str = 'world';
    const result = Array.prototype.at.call(str, -1);
    return result === 'd';
}

// Test at() with arguments object
export function ArrayAtTest0059() {
    function test() {
        return Array.prototype.at.call(arguments, 0);
    }
    const result = test('a', 'b', 'c');
    return result === 'a';
}

// Test at() with arguments object and negative index
export function ArrayAtTest0060() {
    function test() {
        return Array.prototype.at.call(arguments, -1);
    }
    const result = test('x', 'y', 'z');
    return result === 'z';
}

// Test at() with TypedArray
export function ArrayAtTest0061() {
    const typedArr = new Int8Array([10, 20, 30, 40, 50]);
    const result = typedArr.at(-1);
    return result === 50;
}

// Test at() with array-like object with length 0
export function ArrayAtTest0062() {
    const arrayLike = {
        length: 0
    };
    const result = Array.prototype.at.call(arrayLike, 0);
    return result === undefined;
}

// Test at() with array-like object with length mismatch
export function ArrayAtTest0063() {
    const arrayLike = {
        length: 5,
        0: 'a',
        1: 'b'
    };
    const result1 = Array.prototype.at.call(arrayLike, 0);
    const result2 = Array.prototype.at.call(arrayLike, 2);
    return result1 === 'a' && result2 === undefined;
}

// Test at(-1) vs arr[length-1]
export function ArrayAtTest0064() {
    const arr = [1, 2, 3, 4, 5];
    const atWay = arr.at(-1);
    const lengthWay = arr[arr.length - 1];
    return atWay === lengthWay;
}

// Test at() readability comparison
export function ArrayAtTest0065() {
    const colors = ['red', 'green', 'blue'];
    const last1 = colors[colors.length - 1];
    const last2 = colors.at(-1);
    return last1 === last2;
}

// Test at(-1) vs slice(-1)[0]
export function ArrayAtTest0066() {
    const arr = ['a', 'b', 'c', 'd'];
    const atWay = arr.at(-1);
    const sliceWay = arr.slice(-1)[0];
    return atWay === sliceWay;
}

// Test at() return value type difference
export function ArrayAtTest0067() {
    const arr = [1, 2, 3];
    const atResult = arr.at(-1);
    const sliceResult = arr.slice(-1);
    return typeof atResult === 'number' && Array.isArray(sliceResult);
}

// Test at() with direct access known index
export function ArrayAtTest0068() {
    const arr = [10, 20, 30, 40, 50];
    const index = 2;
    const atWay = arr.at(index);
    const findWay = arr.find((val, i) => i === index);
    return atWay === findWay;
}

// Test at() does not modify array
export function ArrayAtTest0069() {
    const arr1 = [1, 2, 3];
    const arr2 = [1, 2, 3];
    const atResult = arr1.at(-1);
    const popResult = arr2.pop();
    return atResult === popResult && arr1.length === 3 && arr2.length === 2;
}

// Test at() in chained calls
export function ArrayAtTest0070() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr
        .filter(x => x > 2)
        .map(x => x * 10)
        .at(-1);
    return result === 50;
}

// Test at() with multiple method calls
export function ArrayAtTest0071() {
    const arr = ['apple', 'banana', 'cherry', 'date'];
    const result = arr
        .sort()
        .reverse()
        .at(1);
    return result === 'cherry';
}

// Test at() returns element itself
export function ArrayAtTest0072() {
    const arr = [1, 2, 3];
    const result = arr.at(1);
    return result === 2 && typeof result === 'number';
}

// Test at() returns object reference
export function ArrayAtTest0073() {
    const obj = { name: 'test' };
    const arr = [obj];
    const result = arr.at(0);
    result.name = 'modified';
    return obj.name === 'modified';
}

// Test at() returns array reference
export function ArrayAtTest0074() {
    const inner = [1, 2, 3];
    const arr = [inner];
    const result = arr.at(0);
    result.push(4);
    return inner.length === 4;
}

// Test at() returns undefined for out of bounds
export function ArrayAtTest0075() {
    const arr = [1, 2, 3];
    const result1 = arr.at(10);
    const result2 = arr.at(-10);
    return result1 === undefined && result2 === undefined;
}

// Test at() returns undefined for holes
export function ArrayAtTest0076() {
    const arr = [1, , 3];
    const result = arr.at(1);
    return result === undefined;
}

// Test at() returns explicit undefined element
export function ArrayAtTest0077() {
    const arr = [1, undefined, 3];
    const result = arr.at(1);
    return result === undefined && arr.hasOwnProperty(1);
}

// Test at() returns null element
export function ArrayAtTest0078() {
    const arr = [1, null, 3];
    const result = arr.at(1);
    return result === null;
}

// Test at() preserves primitive types
export function ArrayAtTest0079() {
    const arr = [1, 'str', true, null, undefined];
    const result1 = typeof arr.at(0) === 'number';
    const result2 = typeof arr.at(1) === 'string';
    const result3 = typeof arr.at(2) === 'boolean';
    return result1 && result2 && result3;
}

// Test at() with Symbol type
export function ArrayAtTest0080() {
    const sym = Symbol('test');
    const arr = [sym];
    const result = arr.at(0);
    return result === sym;
}

// Test at() is read-only operation
export function ArrayAtTest0081() {
    const arr = [1, 2, 3];
    arr.at(0);
    return JSON.stringify(arr) === JSON.stringify([1, 2, 3]);
}

// Test at() multiple calls have no effect
export function ArrayAtTest0082() {
    const arr = [1, 2, 3];
    arr.at(0);
    arr.at(-1);
    arr.at(100);
    return arr.length === 3 && JSON.stringify(arr) === JSON.stringify([1, 2, 3]);
}

// Test at() with number type elements
export function ArrayAtTest0083() {
    const arr = [1, 2.5, -3, 0, Infinity, NaN];
    const result1 = arr.at(0) === 1;
    const result2 = arr.at(1) === 2.5;
    const result3 = arr.at(2) === -3;
    const result4 = arr.at(3) === 0;
    const result5 = arr.at(4) === Infinity;
    const result6 = isNaN(arr.at(5));
    return result1 && result2 && result3 && result4 && result5 && result6;
}

// Test at() with string type elements
export function ArrayAtTest0084() {
    const arr = ['hello', '', 'world', ' ', '123'];
    const result1 = arr.at(0) === 'hello';
    const result2 = arr.at(1) === '';
    const result3 = arr.at(-1) === '123';
    return result1 && result2 && result3;
}

// Test at() with boolean type elements
export function ArrayAtTest0085() {
    const arr = [true, false, true];
    const result = arr.at(1);
    return result === false && typeof result === 'boolean';
}

// Test at() with object elements
export function ArrayAtTest0086() {
    const arr = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' }
    ];
    const result = arr.at(-1);
    return result.name === 'Bob';
}

// Test at() with array elements
export function ArrayAtTest0087() {
    const arr = [[1, 2], [3, 4], [5, 6]];
    const result = arr.at(1);
    return JSON.stringify(result) === JSON.stringify([3, 4]) && Array.isArray(result);
}

// Test at() with function elements
export function ArrayAtTest0088() {
    const fn1 = () => 'hello';
    const fn2 = () => 'world';
    const arr = [fn1, fn2];
    const result = arr.at(-1);
    return result() === 'world';
}

// Test at() with null elements
export function ArrayAtTest0089() {
    const arr = [1, null, 3];
    const result = arr.at(1);
    return result === null;
}

// Test at() with undefined elements
export function ArrayAtTest0090() {
    const arr = [1, undefined, 3];
    const result = arr.at(1);
    return result === undefined;
}

// Test at() with Symbol elements
export function ArrayAtTest0091() {
    const sym = Symbol('unique');
    const arr = [sym];
    const result = arr.at(0);
    return typeof result === 'symbol';
}

// Test at() with BigInt elements
export function ArrayAtTest0092() {
    const arr = [BigInt(1), BigInt(2), BigInt(3)];
    const result = arr.at(1);
    return result === 2n && typeof result === 'bigint';
}

// Test at() with mixed type arrays
export function ArrayAtTest0093() {
    const arr = [1, 'two', true, null, undefined, { id: 3 }, [4, 5]];
    const result1 = typeof arr.at(0) === 'number';
    const result2 = typeof arr.at(1) === 'string';
    const result3 = typeof arr.at(2) === 'boolean';
    const result4 = typeof arr.at(3) === 'object';
    const result5 = typeof arr.at(4) === 'undefined';
    const result6 = typeof arr.at(5) === 'object';
    const result7 = Array.isArray(arr.at(6));
    return result1 && result2 && result3 && result4 && result5 && result6 && result7;
}

// Test at() using call
export function ArrayAtTest0094() {
    const arrayLike = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const result = Array.prototype.at.call(arrayLike, 1);
    return result === 'b';
}

// Test at() using apply
export function ArrayAtTest0095() {
    const arrayLike = {
        length: 2,
        0: 'first',
        1: 'last'
    };
    const result = Array.prototype.at.apply(arrayLike, [-1]);
    return result === 'last';
}

// Test at() using bind
export function ArrayAtTest0096() {
    const arrayLike = {
        length: 3,
        0: 'x',
        1: 'y',
        2: 'z'
    };
    const boundAt = Array.prototype.at.bind(arrayLike);
    const result = boundAt(0);
    return result === 'x';
}

// Test at() on Array prototype
export function ArrayAtTest0097() {
    const arr = [1, 2, 3];
    const result1 = !arr.hasOwnProperty('at');
    const result2 = Array.prototype.hasOwnProperty('at');
    const result3 = typeof Array.prototype.at === 'function';
    return result1 && result2 && result3;
}

// Test at() with inherited array
export function ArrayAtTest0098() {
    class MyArray extends Array {
        constructor(...args) {
            super(...args);
        }
    }
    const myArr = new MyArray(1, 2, 3);
    const result = myArr.at(-1);
    return result === 3;
}

// Test at() method length property
export function ArrayAtTest0099() {
    return Array.prototype.at.length === 1;
}

// Test at() method name property
export function ArrayAtTest0100() {
    return Array.prototype.at.name === 'at';
}

// Test at() in strict mode
export function ArrayAtTest0101() {
    'use strict';
    const arr = [1, 2, 3];
    const result = arr.at(0);
    return result === 1;
}

// Test at() in non-strict mode
export function ArrayAtTest0102() {
    const arr = [1, 2, 3];
    const result = arr.at(0);
    return result === 1;
}

// Test at() with frozen array
export function ArrayAtTest0103() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.at(1);
    return result === 2;
}

// Test at() with sealed array
export function ArrayAtTest0104() {
    const arr = Object.seal([1, 2, 3]);
    const result = arr.at(-1);
    return result === 3;
}

// Test at() with this is null
export function ArrayAtTest0105() {
    try {
        Array.prototype.at.call(null, 0);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test at() with this is undefined
export function ArrayAtTest0106() {
    try {
        Array.prototype.at.call(undefined, 0);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test at() with this is primitive value
export function ArrayAtTest0107() {
    const strResult = Array.prototype.at.call('hello', 0);
    let numResult = false;
    try {
        Array.prototype.at.call(null, 0);
    } catch (e) {
        numResult = e instanceof TypeError;
    }
    return strResult === 'h' && numResult;
}

// Test at() with length is negative
export function ArrayAtTest0108() {
    const arrayLike = {
        length: -1,
        0: 'a'
    };
    const result = Array.prototype.at.call(arrayLike, 0);
    return result === undefined;
}

// Test at() with length is non-numeric
export function ArrayAtTest0109() {
    const arrayLike = {
        length: '3',
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const result = Array.prototype.at.call(arrayLike, 1);
    return result === 'b';
}

// Test at() with length is Infinity
export function ArrayAtTest0110() {
    const arrayLike = {
        length: Infinity,
        0: 'a'
    };
    const result = Array.prototype.at.call(arrayLike, 0);
    return result === 'a';
}

// Test at() with length is NaN
export function ArrayAtTest0111() {
    const arrayLike = {
        length: NaN,
        0: 'a'
    };
    const result = Array.prototype.at.call(arrayLike, 0);
    return result === undefined;
}

// Test at() with getter throws exception
export function ArrayAtTest0112() {
    const arr = {
        0: 'a',
        1: 'b',
        length: 3,
        get 2() {
            throw new Error('Getter error');
        }
    };
    try {
        Array.prototype.at.call(arr, 2);
        return false;
    } catch (e) {
        return e.message === 'Getter error';
    }
}

// Test at() with Proxy interception
export function ArrayAtTest0113() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 0) {
                return 'proxied';
            }
            return target[prop];
        }
    });
    const result = Array.prototype.at.call(proxy, 0);
    return result === 'proxied';
}

// Test at() with object without length
export function ArrayAtTest0114() {
    const obj = {
        0: 'a',
        1: 'b'
    };
    const result = Array.prototype.at.call(obj, 0);
    return result === undefined;
}

// Test at() with circular reference object
export function ArrayAtTest0115() {
    const arr = [1, 2, 3];
    arr.push(arr);
    const result = arr.at(-1);
    return result === arr;
}

// Test at() after modifying length
export function ArrayAtTest0116() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.at(10);
    arr.length = 10;
    return result === undefined;
}

// Test at() after deleting element
export function ArrayAtTest0117() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    const result = arr.at(2);
    return result === undefined;
}
