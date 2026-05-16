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
 * Test callback function handles different types of elements
 * @returns {Object} Test result
 */
export function testCallbackHandlesDifferentTypes() {
    const arr = [1, 'string', true, { a: 1 }];
    const result = arr.flatMap(element => [typeof element]);
    return {
        result: result.length,
        expected: 4
    };
}

/**
 * Test thisArg correctly binds this in callback
 * @returns {Object} Test result
 */
export function testThisArgBinding() {
    const arr = [1, 2, 3];
    const obj = { multiplier: 10 };
    const result = arr.flatMap(function (x) {
        return [x * this.multiplier];
    }, obj);
    return {
        result: result.length,
        expected: 3
    };
}

/**
 * Test arrow function ignores thisArg
 * @returns {Object} Test result
 */
export function testArrowFunctionIgnoresThisArg() {
    const arr = [1, 2, 3];
    const obj = { multiplier: 10 };
    const outerThis = this;
    let capturedThis;
    const result = arr.flatMap((x) => {
        capturedThis = this;
        return [x];
    }, obj);
    const isThisCorrect = capturedThis === outerThis;
    return {
        result: isThisCorrect ? result.length : 0,
        expected: 3
    };
}

/**
 * Test flatMap handles mixed nesting levels
 * @returns {Object} Test result
 */
export function testMixedNestingLevels() {
    const arr = [1, 2, 3];
    const result = arr.flatMap(x => {
        return x === 1 ? [x] : x === 2 ? [[x]] : [[[x]]];
    });
    return {
        result: result.length,
        expected: 3
    };
}

/**
 * Test flatMap expands object properties
 * @returns {Object} Test result
 */
export function testExpandObjectProperties() {
    const arr = [{ a: 1, b: 2 }, { a: 3, b: 4 }];
    const result = arr.flatMap(obj => [obj.a, obj.b]);
    return {
        result: result.length,
        expected: 4
    };
}

/**
 * Test flatMap handles empty array with thisArg
 * @returns {Object} Test result
 */
export function testEmptyArrayWithThisArg() {
    const arr = [];
    const obj = { multiplier: 10 };
    const result = arr.flatMap(function (x) {
        return [x * this.multiplier];
    }, obj);
    return {
        result: result.length,
        expected: 0
    };
}

/**
 * Test flatMap throws TypeError when callback is not a function
 * @returns {Object} Test result
 */
export function testCallbackNotFunction() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.flatMap('not a function');
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return {
        result: errorCaught,
        expected: true,
        errorName,
        expectedErrorName: 'TypeError'
    };
}

/**
 * Test flatMap throws TypeError when callback is null
 * @returns {Object} Test result
 */
export function testCallbackIsNull() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.flatMap(null);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return {
        result: errorCaught,
        expected: true,
        errorName,
        expectedErrorName: 'TypeError'
    };
}

/**
 * Test flatMap throws TypeError when callback is undefined
 * @returns {Object} Test result
 */
export function testCallbackIsUndefined() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.flatMap(undefined);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return {
        result: errorCaught,
        expected: true,
        errorName,
        expectedErrorName: 'TypeError'
    };
}

/**
 * Test flatMap throws TypeError when this is null
 * @returns {Object} Test result
 */
export function testThisIsNull() {
    let errorCaught = false;
    let errorName;
    try {
        Array.prototype.flatMap.call(null, (x) => [x * 2]);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return {
        result: errorCaught,
        expected: true,
        errorName,
        expectedErrorName: 'TypeError'
    };
}

/**
 * Test flatMap throws TypeError when this is undefined
 * @returns {Object} Test result
 */
export function testThisIsUndefined() {
    let errorCaught = false;
    let errorName;
    try {
        Array.prototype.flatMap.call(undefined, (x) => [x * 2]);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return {
        result: errorCaught,
        expected: true,
        errorName,
        expectedErrorName: 'TypeError'
    };
}

/**
 * Test flatMap and concat results comparison
 * @returns {Object} Test result
 */
export function testFlatMapVsConcat() {
    const arr = [1, 2, 3];
    const flatMapResult = arr.flatMap(x => [x, x * 2]);
    const concatResult = [].concat(...arr.map(x => [x, x * 2]));
    return {
        result: flatMapResult.length,
        expected: concatResult.length
    };
}

/**
 * Test thisArg as primitive value is converted to object
 * @returns {Object} Test result
 */
export function testThisArgAsPrimitiveValue() {
    const arr = [1, 2, 3];
    const result = arr.flatMap(function (x) {
        return [String(this) + x];
    }, 'prefix');
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['prefix1', 'prefix2', 'prefix3'])
    };
}

/**
 * Test flatMap handles mixed nesting levels
 * @returns {Object} Test result
 */
export function testMixedNestingLevelsFlatMap() {
    const arr = [1, 2, 3];
    const result = arr.flatMap(x => {
        return x === 1 ? [x] : x === 2 ? [[x]] : [[[x]]];
    });
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([1, [2], [[3]]])
    };
}

/**
 * Test flatMap handles sparse array with real empty slots
 * @returns {Object} Test result
 */
export function testSparseArrayWithEmptySlots() {
    const arr = [1, , , 4];
    const result = arr.flatMap(x => [x * 2]);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([2, 8])
    };
}