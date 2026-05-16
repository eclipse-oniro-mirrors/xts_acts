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

/**
 * Test result interface
 * @typedef {Object} TestResult
 * @property {boolean|string} result - Test result value
 * @property {boolean|string|undefined} expected - Expected value
 */

/**
 * Test Map key-value pair conversion
 * @returns {TestResult} Test result
 */
export function testMapKeyValueConversion() {
    const map = new Map([[1, "one"], [2, "two"]]);
    const result = Array.from(map);
    return { result: JSON.stringify(result), expected: JSON.stringify([[1, "one"], [2, "two"]]) };
}

/**
 * Test Map.keys() conversion
 * @returns {TestResult} Test result
 */
export function testMapKeysConversion() {
    const map = new Map([["a", 1], ["b", 2]]);
    const result = Array.from(map.keys());
    return { result: JSON.stringify(result), expected: JSON.stringify(["a", "b"]) };
}

/**
 * Test empty Map conversion
 * @returns {TestResult} Test result
 */
export function testEmptyMapConversion() {
    const map = new Map();
    const result = Array.from(map);
    return { result: JSON.stringify(result), expected: JSON.stringify([]) };
}

/**
 * Test Int8Array conversion
 * @returns {TestResult} Test result
 */
export function testInt8ArrayConversion() {
    if (typeof Int8Array === 'undefined') {
        return { result: 'Int8Array not supported', expected: 'Int8Array not supported' };
    }
    const typed = new Int8Array([1, 2, 3]);
    const result = Array.from(typed);
    return {
        result: JSON.stringify({ isArray: Array.isArray(result), values: result }),
        expected: JSON.stringify({ isArray: true, values: [1, 2, 3] })
    };
}

/**
 * Test Float32Array conversion
 * @returns {TestResult} Test result
 */
export function testFloat32ArrayConversion() {
    if (typeof Float32Array === 'undefined') {
        return { result: 'Float32Array not supported', expected: 'Float32Array not supported' };
    }
    const typed = new Float32Array([1.1, 2.2, 3.3]);
    const result = Array.from(typed);
    const roundedResult = result.map(num => Number(num.toFixed(2)));
    return {
        result: JSON.stringify(roundedResult),
        expected: JSON.stringify([1.1, 2.2, 3.3])
    };
}

/**
 * Test BigInt TypedArray conversion
 * @returns {TestResult} Test result
 */
export function testBigIntTypedArrayConversion() {
    if (typeof BigInt64Array === 'undefined' || typeof BigInt === 'undefined') {
        return { result: 'BigInt64Array not supported', expected: 'BigInt64Array not supported' };
    }
    const typed = new BigInt64Array([1n, 2n, 3n]);
    const result = Array.from(typed);
    return {
        result: JSON.stringify(result.map(num => num.toString())),
        expected: JSON.stringify(["1", "2", "3"])
    };
}

/**
 * Test difference with mapping
 * @returns {TestResult} Test result
 */
export function testMappingDifference() {
    const arr1 = Array.from([1, 2, 3], x => x * 2);
    const arr2 = [...[1, 2, 3]].map(x => x * 2);
    return {
        result: JSON.stringify({ from: arr1, spread: arr2 }),
        expected: JSON.stringify({ from: [2, 4, 6], spread: [2, 4, 6] })
    };
}

/**
 * Test Array.from on subclass of Array
 * @returns {TestResult} Test result
 */
export function testSubclassFrom() {
    class MyArray extends Array { }
    const result = MyArray.from([1, 2, 3]);
    return {
        result: JSON.stringify({ isInstance: result instanceof MyArray, values: result }),
        expected: JSON.stringify({ isInstance: true, values: [1, 2, 3] })
    };
}

/**
 * Test subclass from with mapFn
 * @returns {TestResult} Test result
 */
export function testSubclassFromWithMapFn() {
    class MyArray extends Array { }
    const result = MyArray.from([1, 2, 3], x => x * 2);
    return {
        result: JSON.stringify({ isInstance: result instanceof MyArray, values: result }),
        expected: JSON.stringify({ isInstance: true, values: [2, 4, 6] })
    };
}

/**
 * Test subclass from with thisArg
 * @returns {TestResult} Test result
 */
export function testSubclassFromWithThisArg() {
    class MyArray extends Array { }
    const ctx = { multiplier: 10 };
    const result = MyArray.from([1, 2, 3], function (x) {
        return x * this.multiplier;
    }, ctx);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([10, 20, 30])
    };
}

/**
 * Test Array.from.call with custom constructor accepting length
 * @returns {TestResult} Test result
 */
export function testCustomConstructorWithLength() {
    function MyConstructor(len) {
        this.length = len;
    }
    const result = Array.from.call(MyConstructor, { length: 3, 0: "a", 1: "b" });
    return {
        result: JSON.stringify({ isInstance: result instanceof MyConstructor, hasLength: result.length === 3 }),
        expected: JSON.stringify({ isInstance: true, hasLength: true })
    };
}

/**
 * Test Array.from.call with custom constructor without parameters
 * @returns {TestResult} Test result
 */
export function testCustomConstructorNoParams() {
    function NoParamConstructor() {
        this.custom = true;
    }
    const result = Array.from.call(NoParamConstructor, [1, 2, 3]);
    return {
        result: JSON.stringify(result.custom),
        expected: JSON.stringify(true)
    };
}

/**
 * Test Array.from.call with plain object as this
 * @returns {TestResult} Test result
 */
export function testPlainObjectAsThis() {
    const result = Array.from.call({}, [1, 2, 3]);
    return {
        result: JSON.stringify({ isArray: Array.isArray(result), values: result }),
        expected: JSON.stringify({ isArray: true, values: [1, 2, 3] })
    };
}

/**
 * Test Array.from.call with null as this
 * @returns {TestResult} Test result
 */
export function testNullAsThis() {
    const result = Array.from.call(null, [1, 2, 3]);
    return {
        result: JSON.stringify({ isArray: Array.isArray(result), values: result }),
        expected: JSON.stringify({ isArray: true, values: [1, 2, 3] })
    };
}

/**
 * Test constructor returning object
 * @returns {TestResult} Test result
 */
export function testConstructorReturningObject() {
    function ReturningConstructor(len) {
        return { custom: true, length: len };
    }
    const result = Array.from.call(ReturningConstructor, [1, 2, 3]);
    return {
        result: JSON.stringify(result.custom),
        expected: JSON.stringify(true)
    };
}

/**
 * Test constructor returning primitive value
 * @returns {TestResult} Test result
 */
export function testConstructorReturningPrimitive() {
    function PrimitiveReturn(len) {
        return 42;
    }
    const result = Array.from.call(PrimitiveReturn, [1, 2, 3]);
    return {
        result: JSON.stringify(typeof result),
        expected: JSON.stringify("object")
    };
}

/**
 * Test Set deduplication
 * @returns {TestResult} Test result
 */
export function testSetDeduplication() {
    const unique = arr => Array.from(new Set(arr));
    const result = unique([1, 2, 2, 3, 3, 3]);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([1, 2, 3])
    };
}

/**
 * Test Map to object array conversion
 * @returns {TestResult} Test result
 */
export function testMapToObjectArray() {
    const map = new Map([["a", 1], ["b", 2]]);
    const objArray = Array.from(map, ([key, value]) => ({ key, value }));
    return {
        result: JSON.stringify(objArray),
        expected: JSON.stringify([{ key: "a", value: 1 }, { key: "b", value: 2 }])
    };
}

/**
 * Test chain operations
 * @returns {TestResult} Test result
 */
export function testChainOperations() {
    const result = Array.from([1, 2, 3, 4, 5])
        .filter(x => x % 2 === 0)
        .map(x => x * x)
        .reduce((acc, val) => acc + val, 0);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(20)
    };
}

/**
 * Test function composition
 * @returns {TestResult} Test result
 */
export function testFunctionComposition() {
    const compose = (fn1, fn2) => x => fn1(fn2(x));
    const double = arr => arr.map(x => x * 2);
    const sum = arr => arr.reduce((a, b) => a + b, 0);
    const doubleAndSum = compose(sum, double);
    const result = doubleAndSum(Array.from([1, 2, 3]));
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(12)
    };
}

/**
 * Test arrow function as mapFn
 * @returns {TestResult} Test result
 */
export function testArrowFunctionAsMapFn() {
    const result = Array.from([1, 2, 3], x => x * x);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([1, 4, 9])
    };
}

/**
 * Test arrow function ignores thisArg
 * @returns {TestResult} Test result
 */
export function testArrowFunctionIgnoresThisArg() {
    const context = { value: 100 };
    const result = Array.from([1, 2, 3], (x) => {
        return x;
    }, context);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([1, 2, 3])
    };
}

/**
 * Test inline arrow function as mapFn
 * @returns {TestResult} Test result
 */
export function testInlineArrowFunctionAsMapFn() {
    const result = Array.from([1, 2, 3], x => x + 10);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([11, 12, 13])
    };
}

/**
 * Test arrow function with multiple parameters
 * @returns {TestResult} Test result
 */
export function testArrowFunctionWithMultipleParams() {
    const result = Array.from([10, 20, 30], (element, index) => element + index);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([10, 21, 32])
    };
}

/**
 * Test object as thisArg
 * @returns {TestResult} Test result
 */
export function testObjectAsThisArg() {
    const context = { multiplier: 5 };
    function multiply(x) {
        return x * this.multiplier;
    }
    const result = Array.from([1, 2, 3], multiply, context);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([5, 10, 15])
    };
}

/**
 * Test array as thisArg
 * @returns {TestResult} Test result
 */
export function testArrayAsThisArg() {
    const arr = [10, 20, 30];
    function getValue(x) {
        return this[x];
    }
    const result = Array.from([0, 1, 2], getValue, arr);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([10, 20, 30])
    };
}

/**
 * Test thisArg is null
 * @returns {TestResult} Test result
 */
export function testThisArgIsNull() {
    function logThis(x) {
        return x;
    }
    const result = Array.from([1, 2, 3], logThis, null);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([1, 2, 3])
    };
}

/**
 * Test thisArg is undefined
 * @returns {TestResult} Test result
 */
export function testThisArgIsUndefined() {
    function logThis(x) {
        return x;
    }
    const result = Array.from([1, 2, 3], logThis, undefined);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([1, 2, 3])
    };
}

/**
 * Test thisArg is primitive value
 * @returns {TestResult} Test result
 */
export function testThisArgIsPrimitive() {
    function prefix(x) {
        return String(this) + x;
    }
    const result = Array.from([1, 2, 3], prefix, "prefix");
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["prefix1", "prefix2", "prefix3"])
    };
}

/**
 * Test array-like object with length
 * @returns {TestResult} Test result
 */
export function testArrayLikeWithLength() {
    const arrayLike = {
        0: "a",
        1: "b",
        2: "c",
        length: 3
    };
    const result = Array.from(arrayLike);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b", "c"])
    };
}

/**
 * Test array-like with length 0
 * @returns {TestResult} Test result
 */
export function testArrayLikeLengthZero() {
    const result = Array.from({ length: 0 });
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([])
    };
}

/**
 * Test array-like with length exceeding actual indices
 * @returns {TestResult} Test result
 */
export function testArrayLikeLengthExceedsIndices() {
    const arrayLike = {
        0: "a",
        1: "b",
        length: 5
    };
    const result = Array.from(arrayLike);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b", undefined, undefined, undefined])
    };
}

/**
 * Test array-like with missing middle index
 * @returns {TestResult} Test result
 */
export function testArrayLikeMissingMiddleIndex() {
    const arrayLike = {
        0: "a",
        2: "c",
        length: 3
    };
    const result = Array.from(arrayLike);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", undefined, "c"])
    };
}

/**
 * Test array-like with only length property
 * @returns {TestResult} Test result
 */
export function testArrayLikeOnlyLength() {
    const result = Array.from({ length: 3 });
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([undefined, undefined, undefined])
    };
}

/**
 * Test array-like with negative length
 * @returns {TestResult} Test result
 */
export function testArrayLikeNegativeLength() {
    const result = Array.from({ length: -1, 0: "a" });
    return {
        result: JSON.stringify(result.length),
        expected: JSON.stringify(0)
    };
}

/**
 * Test array-like with decimal length
 * @returns {TestResult} Test result
 */
export function testArrayLikeDecimalLength() {
    const result = Array.from({ length: 2.9, 0: "a", 1: "b", 2: "c" });
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b"])
    };
}

/**
 * Test length boundary value 0
 * @returns {TestResult} Test result
 */
export function testLengthBoundaryZero() {
    const result = Array.from({ length: 0 });
    return {
        result: JSON.stringify(result.length),
        expected: JSON.stringify(0)
    };
}

/**
 * Test length boundary value 1
 * @returns {TestResult} Test result
 */
export function testLengthBoundaryOne() {
    const result = Array.from({ length: 1, 0: "a" });
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a"])
    };
}

/**
 * Test length boundary value large number
 * @returns {TestResult} Test result
 */
export function testLengthBoundaryLarge() {
    // Use a reasonable size to avoid memory issues
    const result = Array.from({ length: 1000 });
    return {
        result: JSON.stringify(result.length),
        expected: JSON.stringify(1000)
    };
}

/**
 * Test length boundary value NaN
 * @returns {TestResult} Test result
 */
export function testLengthBoundaryNaN() {
    const result = Array.from({ length: NaN, 0: "a" });
    return {
        result: JSON.stringify(result.length),
        expected: JSON.stringify(0)
    };
}

/**
 * Test length boundary value Infinity
 * @returns {TestResult} Test result
 */
export function testLengthBoundaryInfinity() {
    try {
        Array.from({ length: Infinity });
        return {
            result: JSON.stringify(false),
            expected: JSON.stringify(true)
        };
    } catch (e) {
        return {
            result: JSON.stringify(e instanceof RangeError),
            expected: JSON.stringify(true)
        };
    }
}

/**
 * Test length boundary value string number
 * @returns {TestResult} Test result
 */
export function testLengthBoundaryStringNumber() {
    const result = Array.from({ length: "5", 0: "a", 1: "b" });
    return {
        result: JSON.stringify({ length: result.length, values: result }),
        expected: JSON.stringify({ length: 5, values: ["a", "b", undefined, undefined, undefined] })
    };
}

/**
 * Test index boundary value negative
 * @returns {TestResult} Test result
 */
export function testIndexBoundaryNegative() {
    const arrayLike = {
        0: "a",
        "-1": "b",
        length: 1
    };
    const result = Array.from(arrayLike);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a"])
    };
}

/**
 * Test index boundary value non-integer
 * @returns {TestResult} Test result
 */
export function testIndexBoundaryNonInteger() {
    const arrayLike = {
        0: "a",
        "1.5": "b",
        length: 2
    };
    const result = Array.from(arrayLike);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", undefined])
    };
}

/**
 * Test index boundary value string
 * @returns {TestResult} Test result
 */
export function testIndexBoundaryString() {
    const arrayLike = {
        "0": "a",
        "1": "b",
        length: 2
    };
    const result = Array.from(arrayLike);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b"])
    };
}

/**
 * Test circular reference array-like object
 * @returns {TestResult} Test result
 */
export function testCircularReferenceArrayLike() {
    const obj = {
        0: "a",
        1: "b",
        length: 2
    };
    obj.self = obj;
    const result = Array.from(obj);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b"])
    };
}

/**
 * Test frozen array-like object
 * @returns {TestResult} Test result
 */
export function testFrozenArrayLike() {
    const frozen = Object.freeze({
        0: "a",
        1: "b",
        length: 2
    });
    const result = Array.from(frozen);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b"])
    };
}

/**
 * Test sealed array-like object
 * @returns {TestResult} Test result
 */
export function testSealedArrayLike() {
    const sealed = Object.seal({
        0: "a",
        1: "b",
        length: 2
    });
    const result = Array.from(sealed);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["a", "b"])
    };
}

/**
 * Test array-like object with prototype properties
 * @returns {TestResult} Test result
 */
export function testPrototypePropertiesArrayLike() {
    const proto = { 0: "x" };
    const obj = Object.create(proto);
    obj[1] = "b";
    obj.length = 2;
    const result = Array.from(obj);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(["x", "b"])
    };
}

// Export functions
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testMapKeyValueConversion,
        testMapKeysConversion,
        testEmptyMapConversion,
        testInt8ArrayConversion,
        testFloat32ArrayConversion,
        testBigIntTypedArrayConversion,
        testMappingDifference,
        testSubclassFrom,
        testSubclassFromWithMapFn,
        testSubclassFromWithThisArg,
        testCustomConstructorWithLength,
        testCustomConstructorNoParams,
        testPlainObjectAsThis,
        testNullAsThis,
        testConstructorReturningObject,
        testConstructorReturningPrimitive,
        testSetDeduplication,
        testMapToObjectArray,
        testChainOperations,
        testFunctionComposition,
        testArrowFunctionAsMapFn,
        testArrowFunctionIgnoresThisArg,
        testInlineArrowFunctionAsMapFn,
        testArrowFunctionWithMultipleParams,
        testObjectAsThisArg,
        testArrayAsThisArg,
        testThisArgIsNull,
        testThisArgIsUndefined,
        testThisArgIsPrimitive,
        testArrayLikeWithLength,
        testArrayLikeLengthZero,
        testArrayLikeLengthExceedsIndices,
        testArrayLikeMissingMiddleIndex,
        testArrayLikeOnlyLength,
        testArrayLikeNegativeLength,
        testArrayLikeDecimalLength,
        testLengthBoundaryZero,
        testLengthBoundaryOne,
        testLengthBoundaryLarge,
        testLengthBoundaryNaN,
        testLengthBoundaryInfinity,
        testLengthBoundaryStringNumber,
        testIndexBoundaryNegative,
        testIndexBoundaryNonInteger,
        testIndexBoundaryString,
        testCircularReferenceArrayLike,
        testFrozenArrayLike,
        testSealedArrayLike,
        testPrototypePropertiesArrayLike
    };
}
