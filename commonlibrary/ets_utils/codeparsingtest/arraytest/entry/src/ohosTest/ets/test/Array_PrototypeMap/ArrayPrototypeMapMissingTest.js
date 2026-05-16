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

// Test arrow function ignores thisArg
export function MapArrowFunctionThisTest0100() {
    const arr = [1, 2, 3];
    const obj = { multiplier: 10 };
    const result = arr.map((element) => element * 2, obj); 
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

// Test arrow function this context
export function MapArrowFunctionThisContextTest0200() {
    const arr = [1, 2, 3];
    const obj = { value: 10 };
    const result = arr.map(function() {
        return this.value;
    }, obj);
    return JSON.stringify(result) === JSON.stringify([10, 10, 10]);
}

// Test Symbol elements
export function MapSymbolTest0300() {
    const sym = Symbol('test');
    const arr = [sym, 2, 3];
    try {
        const result = arr.map((x) => x);
        return result.length === 3;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test BigInt elements
export function MapBigIntTest0400() {
    const arr = [1n, 2n, 3n];
    const result = arr.map((x) => x * 2n);
    const bigIntStringify = (data) => JSON.stringify(data, (key, value) => {
        return typeof value === 'bigint' ? Number(value) : value;
    });
    return bigIntStringify(result) === bigIntStringify([2, 4, 6]);
}

// Test array-like object with map.call
export function MapArrayLikeTest0500() {
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const result = Array.prototype.map.call(arrayLike, (x) => x.toUpperCase());
    return JSON.stringify(result) === JSON.stringify(['A', 'B', 'C']);
}

// Test arguments object with map.call
export function MapArgumentsTest0600() {
    function test() {
        return Array.prototype.map.call(arguments, (x) => x * 2);
    }
    const result = test(1, 2, 3);
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

// Test string with map.call
export function MapStringTest0700() {
    const str = 'hello';
    const result = Array.prototype.map.call(str, (x) => x.toUpperCase());
    return JSON.stringify(result) === JSON.stringify(['H', 'E', 'L', 'L', 'O']);
}

// Test TypedArray with map
export function MapTypedArrayTest0800() {
    const typedArr = new Uint8Array([1, 2, 3]);
    const result = typedArr.map((x) => x * 2);
    return JSON.stringify(Array.from(result)) === JSON.stringify([2, 4, 6]);
}

// Test sparse array with delete
export function MapSparseDeleteTest0900() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    let callCount = 0;
    const result = arr.map((x) => {
        callCount++;
        return x;
    });
    return callCount === 4 && JSON.stringify(result) === JSON.stringify([1, 2, undefined, 4, 5]);
}

// Test sparse array vs explicit undefined
export function MapSparseVsUndefinedTest1000() {
    const sparse = new Array(3);
    const withUndefined = [undefined, undefined, undefined];
    let sparseCallCount = 0;
    let undefCallCount = 0;
    sparse.map((x) => {
        sparseCallCount++;
        return x;
    });
    withUndefined.map((x) => {
        undefCallCount++;
        return x;
    });
    return sparseCallCount === 0 && undefCallCount === 3;
}

// Test sparse array forEach vs map comparison
export function MapSparseForEachTest1100() {
    const arr = [1, , 3, , 5];
    let mapCount = 0;
    let forEachCount = 0;
    arr.map((x) => {
        mapCount++;
        return x;
    });
    arr.forEach(() => forEachCount++);
    return mapCount === 3 && forEachCount === 3;
}

// Test extreme sparse array
export function MapExtremeSparseTest1200() {
    const arr = [];
    arr[0] = 'start';
    arr[1000] = 'end';
    let callCount = 0;
    const result = arr.map((x) => {
        callCount++;
        return x;
    });
    return callCount === 2 && result[0] === 'start' && result[1000] === 'end';
}

// Test callback throws error
export function MapCallbackErrorTest1300() {
    const arr = [1, 2, 3];
    try {
        arr.map((x) => {
            if (x === 2) {
                throw new Error('Callback error');
            }
            return x;
        });
        return false;
    } catch (e) {
        return e.message === 'Callback error';
    }
}

// Test thisArg as number
export function MapThisArgNumberTest1400() {
    const arr = [1, 2, 3];
    let thisValue = null;
    arr.map(function() {
        thisValue = this;
        return 0;
    }, 42);
    return thisValue === 42;
}

// Test thisArg as string
export function MapThisArgStringTest1500() {
    const arr = [1, 2, 3];
    let thisValue = null;
    arr.map(function() {
        thisValue = this;
        return 0;
    }, 'test');
    return thisValue === 'test';
}

// Test thisArg as boolean
export function MapThisArgBooleanTest1600() {
    const arr = [1, 2, 3];
    let thisValue = null;
    arr.map(function() {
        thisValue = this;
        return 0;
    }, true);
    return thisValue === true;
}

// Test thisArg as Symbol
export function MapThisArgSymbolTest1700() {
    const arr = [1, 2, 3];
    const sym = Symbol('test');
    let thisValue = null;
    arr.map(function() {
        thisValue = this;
        return 0;
    }, sym);
    return thisValue === sym;
}

// Test null prototype object
export function MapNullPrototypeTest1800() {
    const obj = Object.create(null);
    obj.value = 10;
    const arr = [1, 2, 3];
    const result = arr.map(function() {
        return this.value;
    }, obj);
    return JSON.stringify(result) === JSON.stringify([10, 10, 10]);
}

// Test prototype chain modification
export function MapPrototypeChainTest1900() {
    function MyClass() {}
    MyClass.prototype.multiplier = 2;
    const obj = new MyClass();
    const arr = [1, 2, 3];
    const result = arr.map(function(x) {
        return x * this.multiplier;
    }, obj);
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

// Test frozen array
export function MapFrozenTest2000() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.map((x) => x * 2);
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

// Test sealed array
export function MapSealedTest2100() {
    const arr = Object.seal([1, 2, 3]);
    const result = arr.map((x) => x * 2);
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

// Test Proxy array
export function MapProxyTest2200() {
    const arr = [1, 2, 3];
    let getCallCount = 0;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            getCallCount++;
            return target[prop];
        }
    });
    const result = proxy.map((x) => x * 2);
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]) && getCallCount > 0;
}

// Test non-array object calling map
export function MapNonArrayTest2300() {
    const map = new Map([[1, 'a'], [2, 'b']]);
    try {
        Array.prototype.map.call(map, (x) => x);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test length property is not number
export function MapInvalidLengthTest2400() {
    const obj = {
        0: 'a',
        1: 'b',
        length: '3'
    };
    const result = Array.prototype.map.call(obj, (x) => x);
    return JSON.stringify(result) === JSON.stringify(['a', 'b', undefined]);
}

// Test length property is negative
export function MapNegativeLengthTest2500() {
    const obj = {
        0: 'a',
        length: -1
    };
    const result = Array.prototype.map.call(obj, (x) => x);
    return result.length === 0;
}

// Test length property is Infinity
export function MapInfinityLengthTest2600() {
    const obj = {
        0: 'a',
        length: Infinity
    };
    try {
        Array.prototype.map.call(obj, (x) => x);
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

// Test parseInt trap
export function MapParseIntTrapTest2700() {
    const arr = ['1', '2', '3'];
    const result = arr.map(parseInt);
    return JSON.stringify(result) === JSON.stringify([1, NaN, NaN]);
}

// Test correct parseInt usage
export function MapParseIntCorrectTest2800() {
    const arr = ['1', '2', '3'];
    const result = arr.map((x) => parseInt(x, 10));
    return JSON.stringify(result) === JSON.stringify([1, 2, 3]);
}

// Test map with filter and reduce
export function MapFilterReduceTest2900() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr
        .map((x) => x * 2)
        .filter((x) => x > 5)
        .reduce((acc, val) => acc + val, 0);
    return result === 24;
}

// Test map with spread operator
export function MapSpreadTest3000() {
    const arr = [1, 2, 3];
    const result = [...arr.map((x) => x * 2)];
    return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

// Test map with destructuring
export function MapDestructuringTest3100() {
    const arr = [{ x: 1, y: 2 }, { x: 3, y: 4 }];
    const result = arr.map(({ x, y }) => x + y);
    return JSON.stringify(result) === JSON.stringify([3, 7]);
}

// Test map with Date objects
export function MapDateTest3200() {
    const arr = [1000, 2000, 3000];
    const result = arr.map((x) => new Date(x).getTime());
    return JSON.stringify(result) === JSON.stringify([1000, 2000, 3000]);
}

// Test map with RegExp objects
export function MapRegExpTest3300() {
    const arr = ['test', 'example'];
    const result = arr.map((x) => new RegExp(x).test(x));
    return JSON.stringify(result) === JSON.stringify([true, true]);
}

// Test map with functions
export function MapFunctionTest3400() {
    const arr = [1, 2, 3];
    const result = arr.map((x) => {
        return function() {
            return x;
        };
    });
    return result.length === 3 && result[0]() === 1 && result[1]() === 2 && result[2]() === 3;
}

// Test map with nested arrays
export function MapNestedArrayTest3500() {
    const arr = [[1, 2], [3, 4], [5, 6]];
    const result = arr.map((x) => x.map((y) => y * 2));
    return JSON.stringify(result) === JSON.stringify([[2, 4], [6, 8], [10, 12]]);
}

// Test map with circular reference
export function MapCircularReferenceTest3600() {
    const obj = { value: 1 };
    obj.self = obj;
    const arr = [obj];
    try {
        const result = arr.map((x) => x.value);
        return JSON.stringify(result) === JSON.stringify([1]);
    } catch (e) {
        return false;
    }
}

// Test map with NaN and Infinity
export function MapNaNInfinityTest3700() {
    const arr = [NaN, Infinity, -Infinity, 0, -0];
    const result = arr.map((x) => x);
    return result.length === 5 && isNaN(result[0]) && result[1] === Infinity && result[2] === -Infinity && result[3] === 0 && result[4] === -0;
}

// Test map with 0 and -0
export function MapZeroTest3800() {
    const arr = [0, -0];
    const result = arr.map((x) => x);
    return result.length === 2 && result[0] === 0 && result[1] === -0;
}

// Test map with undefined and null
export function MapUndefinedNullTest3900() {
    const arr = [undefined, null, 1];
    const result = arr.map((x) => x);
    return JSON.stringify(result) === JSON.stringify([undefined, null, 1]);
}

// Test map with boolean values
export function MapBooleanTest4000() {
    const arr = [true, false, 1, 0];
    const result = arr.map((x) => Boolean(x));
    return JSON.stringify(result) === JSON.stringify([true, false, true, false]);
}

// Test map with string values
export function MapStringValueTest4100() {
    const arr = ['', 'test', '   ', null];
    const result = arr.map((x) => Boolean(x));
    return JSON.stringify(result) === JSON.stringify([false, true, true, false]);
}

// Test map with object values
export function MapObjectValueTest4200() {
    const arr = [{}, { key: 'value' }, null];
    const result = arr.map((x) => Boolean(x));
    return JSON.stringify(result) === JSON.stringify([true, true, false]);
}

// Test map with empty string
export function MapEmptyStringTest4300() {
    const arr = ['', 'a', 'b'];
    const result = arr.map((x) => x.length);
    return JSON.stringify(result) === JSON.stringify([0, 1, 1]);
}

// Test map with whitespace string
export function MapWhitespaceStringTest4400() {
    const arr = ['   ', '  test  ', '\n\t'];
    const result = arr.map((x) => x.trim());
    return JSON.stringify(result) === JSON.stringify(['', 'test', '']);
}

// Test map() throws error when callback is not a function
export function MapNonFunctionCallbackTest4500() {
    const arr = [1, 2, 3];
    try {
        arr.map('not a function');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test map() throws error when callback is null
export function MapNullCallbackTest4600() {
    const arr = [1, 2, 3];
    try {
        arr.map(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test map() throws error when callback is undefined
export function MapUndefinedCallbackTest4700() {
    const arr = [1, 2, 3];
    try {
        arr.map(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test map() throws error when no callback provided
export function MapNoCallbackTest4800() {
    const arr = [1, 2, 3];
    try {
        arr.map();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test map() throws error when callback is object
export function MapObjectCallbackTest4900() {
    const arr = [1, 2, 3];
    try {
        arr.map({});
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}
