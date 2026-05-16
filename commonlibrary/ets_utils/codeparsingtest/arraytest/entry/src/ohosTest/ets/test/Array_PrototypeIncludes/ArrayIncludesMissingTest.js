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

// Test Symbol type with includes
export function ArrayIncludesSymbolTest0100() {
    const sym1 = Symbol("foo");
    const sym2 = Symbol("foo");
    const arr = [sym1, Symbol("bar")];
    return arr.includes(sym1) === true && arr.includes(sym2) === false;
}

// Test array-like object with Array.prototype.includes.call
export function ArrayIncludesArrayLikeTest0200() {
    const arrayLike = {
        length: 3,
        0: "a",
        1: "b",
        2: "c"
    };
    return Array.prototype.includes.call(arrayLike, "a") === true &&
        Array.prototype.includes.call(arrayLike, "d") === false;
}

// Test array-like object with fromIndex
export function ArrayIncludesArrayLikeIndexTest0300() {
    const arrayLike = {
        length: 5,
        0: 1,
        1: 2,
        2: 3,
        3: 4,
        4: 5
    };
    return Array.prototype.includes.call(arrayLike, 3, 0) === true &&
        Array.prototype.includes.call(arrayLike, 3, 2) === true &&
        Array.prototype.includes.call(arrayLike, 3, 3) === false;
}

// Test string as array-like object
export function ArrayIncludesStringLikeTest0400() {
    const str = "hello";
    return Array.prototype.includes.call(str, "h") === true &&
        Array.prototype.includes.call(str, "e") === true &&
        Array.prototype.includes.call(str, "x") === false;
}

// Test string with fromIndex
export function ArrayIncludesStringIndexTest0500() {
    const str = "abc";
    return Array.prototype.includes.call(str, "a", 0) === true &&
        Array.prototype.includes.call(str, "a", 1) === false &&
        Array.prototype.includes.call(str, "c", 2) === true;
}

// Test arguments object with includes
export function ArrayIncludesArgumentsTest0600() {
    function test() {
        return Array.prototype.includes.call(arguments, 1) === true &&
            Array.prototype.includes.call(arguments, 4) === false;
    }
    return test(1, 2, 3);
}

// Test custom object with Symbol.isConcatSpreadable
export function ArrayIncludesCustomObjTest0700() {
    const customObj = {
        length: 3,
        0: "x",
        1: "y",
        2: "z",
        [Symbol.isConcatSpreadable]: true
    };
    return Array.prototype.includes.call(customObj, "x") === true &&
        Array.prototype.includes.call(customObj, "y", 1) === true &&
        Array.prototype.includes.call(customObj, "z", 3) === false;
}

// Test array-like with length 0
export function ArrayIncludesZeroLengthTest0800() {
    const arrayLike = {
        length: 0,
        0: "a"
    };
    return Array.prototype.includes.call(arrayLike, "a") === false &&
        Array.prototype.includes.call(arrayLike, undefined) === false;
}

// Test array-like with length greater than actual properties
export function ArrayIncludesExcessLengthTest0900() {
    const arrayLike = {
        length: 5,
        0: "a",
        1: "b"
    };
    return Array.prototype.includes.call(arrayLike, "a") === true &&
        Array.prototype.includes.call(arrayLike, undefined) === true;
}

// Test array-like with length less than actual properties
export function ArrayIncludesLessLengthTest1000() {
    const arrayLike = {
        length: 2,
        0: "a",
        1: "b",
        2: "c",
        3: "d"
    };
    return Array.prototype.includes.call(arrayLike, "a") === true &&
        Array.prototype.includes.call(arrayLike, "b") === true &&
        Array.prototype.includes.call(arrayLike, "c") === false &&
        Array.prototype.includes.call(arrayLike, "d") === false;
}

// Test sparse array with empty slots
export function ArrayIncludesSparseTest1100() {
    const arr = [1, , 3];
    return arr.length === 3 &&
        arr.includes(undefined) === true &&
        (1 in arr) === false;
}

// Test sparse array with multiple empty slots
export function ArrayIncludesMultiSparseTest1200() {
    const arr = [1, , , 4, , 6];
    return arr.includes(undefined) === true &&
        arr.includes(1) === true &&
        arr.includes(4) === true &&
        arr.includes(6) === true;
}

// Test delete operation creates empty slot
export function ArrayIncludesDeleteTest1300() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    return (2 in arr) === false &&
        arr.includes(undefined) === true &&
        arr.includes(3) === false;
}

// Test mixed sparse array with empty slots and values
export function ArrayIncludesMixedSparseTest1400() {
    const arr = [1, , undefined, , null, , 6];
    return arr.includes(undefined) === true &&
        arr.includes(null) === true &&
        arr.includes(1) === true &&
        arr.includes(6) === true;
}

// Test Array constructor creates sparse array
export function ArrayIncludesConstructorSparseTest1500() {
    const arr = new Array(5);
    return arr.length === 5 &&
        arr.includes(undefined) === true &&
        arr.includes(1) === false;
}

// Test fromIndex with empty slots
export function ArrayIncludesSparseIndexTest1600() {
    const arr = [1, , 3, undefined, 5];
    return arr.includes(undefined, 0) === true &&
        arr.includes(undefined, 2) === true &&
        arr.includes(undefined, 4) === false;
}

// Test negative fromIndex with empty slots
export function ArrayIncludesSparseNegativeTest1700() {
    const arr = [1, , 3, , 5];
    return arr.includes(undefined, -1) === false &&
        arr.includes(undefined, -3) === true &&
        arr.includes(undefined, -5) === true;
}

// Test strict mode this as null throws TypeError
export function ArrayIncludesNullThisTest1800() {
    "use strict";
    try {
        Array.prototype.includes.call(null, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test strict mode this as undefined throws TypeError
export function ArrayIncludesUndefinedThisTest1900() {
    "use strict";
    try {
        Array.prototype.includes.call(undefined, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test Number.NaN with includes
export function ArrayIncludesNumberNaNTest2000() {
    const arr = [1, NaN, 3];
    return arr.includes(Number.NaN) === true &&
        [Number.NaN].includes(NaN) === true;
}

// Test Number.POSITIVE_INFINITY and Number.NEGATIVE_INFINITY
export function ArrayIncludesNumberInfinityTest2100() {
    const arr = [Infinity, -Infinity, 1];
    return arr.includes(Number.POSITIVE_INFINITY) === true &&
        arr.includes(Number.NEGATIVE_INFINITY) === true;
}

// Test void 0 equals undefined
export function ArrayIncludesVoid0Test2200() {
    const arr = [1, undefined, 3];
    return arr.includes(undefined) === true &&
        arr.includes(void 0) === true;
}

// Test wrapper objects don't match primitives
export function ArrayIncludesWrapperTest2300() {
    const arr = [1, "hello", true];
    return arr.includes(new Number(1)) === false &&
        arr.includes(new String("hello")) === false &&
        arr.includes(new Boolean(true)) === false;
}

// Test wrapper objects reference comparison
export function ArrayIncludesWrapperRefTest2400() {
    const numObj = new Number(1);
    const arr = [numObj];
    return arr.includes(numObj) === true &&
        arr.includes(new Number(1)) === false;
}

// Test getter invocation during includes
export function ArrayIncludesGetterTest2500() {
    const arr = [1, 2, 3];
    let counter = 0;
    Object.defineProperty(arr, 1, {
        get() {
            counter++;
            return 20;
        }
    });
    const result = arr.includes(20);
    return result === true && counter > 0;
}

// Test length getter in array-like object
export function ArrayIncludesLengthGetterTest2600() {
    const arrLike = {
        0: "a",
        1: "b",
        2: "c",
        get length() {
            return 3;
        }
    };
    return Array.prototype.includes.call(arrLike, "b") === true;
}

// Test TypedArray with Array.prototype.includes.call
export function ArrayIncludesTypedArrayCallTest2700() {
    const typedArr = new Int8Array([1, 2, 3, 4, 5]);
    return typedArr.includes(3) === true &&
        Array.prototype.includes.call(typedArr, 3) === true;
}

// Test strict mode with delete operation
export function ArrayIncludesStrictDeleteTest2800() {
    "use strict";
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    return arr.includes(undefined) === true &&
        arr.includes(3) === false &&
        (2 in arr) === false;
}

// Test string with includes method directly
export function ArrayIncludesStringDirectTest2900() {
    const str = "hello";
    return str.includes("hel") === true &&
        str.includes("world") === false;
}

// Test includes consistency with multiple calls
export function ArrayIncludesConsistencyTest3000() {
    const arr = [1, 2, 3];
    const result1 = arr.includes(2);
    const result2 = arr.includes(2);
    const result3 = arr.includes(2);
    return result1 === result2 && result2 === result3 && result1 === true;
}
