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
 * Array.prototype.shift() Additional Tests
 * Tests for features not fully covered or require JS environment
 */

/**
 * @tc.name   ArrayShiftSymbolTestA100
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_SYMBOL_A100
 * @tc.desc   Test shift() with Symbol type elements
 */
export function ArrayShiftSymbolTestA100() {
    'use strict';
    let sym = Symbol('test');
    let arr = [sym, Symbol('other')];
    let result = arr.shift();
    return result === sym && typeof result === 'symbol' && arr.length === 1;
}

/**
 * @tc.name   ArrayShiftSymbolArrayTestA200
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_SYMBOL_ARRAY_A200
 * @tc.desc   Test shift() on array with multiple Symbols
 */
export function ArrayShiftSymbolArrayTestA200() {
    'use strict';
    let sym1 = Symbol('first');
    let sym2 = Symbol('second');
    let sym3 = Symbol('third');
    let arr = [sym1, sym2, sym3];
    let result = arr.shift();
    return result === sym1 && arr[0] === sym2 && arr.length === 2;
}

/**
 * @tc.name   ArrayShiftBigIntTestA300
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_BIGINT_A300
 * @tc.desc   Test shift() with BigInt type elements
 */
export function ArrayShiftBigIntTestA300() {
    'use strict';
    let arr = [9007199254740991n, 123n, 456n];
    let result = arr.shift();
    return result === 9007199254740991n && typeof result === 'bigint' && arr.length === 2;
}

/**
 * @tc.name   ArrayShiftBigIntArrayTestA400
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_BIGINT_ARRAY_A400
 * @tc.desc   Test shift() on array with multiple BigInts
 */
export function ArrayShiftBigIntArrayTestA400() {
    'use strict';
    let arr = [1n, 2n, 3n, 4n, 5n];
    let sum = 0n;
    while (arr.length > 0) {
        sum += arr.shift();
    }
    return sum === 15n && arr.length === 0;
}

/**
 * @tc.name   ArrayShiftArgumentsTestA500
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_ARGUMENTS_A500
 * @tc.desc   Test shift() applied to arguments object using Function.call
 */
export function ArrayShiftArgumentsTestA500() {
    'use strict';
    function testFunc() {
        let result = Array.prototype.shift.call(arguments);
        return result === 1 && arguments.length === 2 && arguments[0] === 2;
    }
    return testFunc(1, 2, 3);
}

/**
 * @tc.name   ArrayShiftArrayLikeBasicTestA600
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_ARRAYLIKE_BASIC_A600
 * @tc.desc   Test shift() applied to custom array-like object
 */
export function ArrayShiftArrayLikeBasicTestA600() {
    'use strict';
    let arrayLike = {
        0: 'first',
        1: 'second',
        2: 'third',
        length: 3
    };
    let result = Array.prototype.shift.call(arrayLike);
    return result === 'first' && arrayLike.length === 2 && arrayLike[0] === 'second';
}

/**
 * @tc.name   ArrayShiftArrayLikeNumberTestA700
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_ARRAYLIKE_NUMBER_A700
 * @tc.desc   Test shift() on array-like with numeric values
 */
export function ArrayShiftArrayLikeNumberTestA700() {
    'use strict';
    let arrayLike = {
        0: 10,
        1: 20,
        2: 30,
        length: 3
    };
    let result = Array.prototype.shift.call(arrayLike);
    return result === 10 && arrayLike.length === 2 && arrayLike[0] === 20 && arrayLike[1] === 30;
}

/**
 * @tc.name   ArrayShiftCallNullTestA800
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_CALL_NULL_A800
 * @tc.desc   Test shift() called with null throws TypeError
 */
export function ArrayShiftCallNullTestA800() {
    'use strict';
    try {
        Array.prototype.shift.call(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayShiftCallUndefinedTestA900
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_CALL_UNDEFINED_A900
 * @tc.desc   Test shift() called with undefined throws TypeError
 */
export function ArrayShiftCallUndefinedTestA900() {
    'use strict';
    try {
        Array.prototype.shift.call(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayShiftCallNumberTestB100
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_CALL_NUMBER_B100
 * @tc.desc   Test shift() called with number throws TypeError
 */
export function ArrayShiftCallNumberTestB100() {
    'use strict';
    try {
        Array.prototype.shift.call(123);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayShiftCallStringTestB200
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_CALL_STRING_B200
 * @tc.desc   Test shift() called with string throws TypeError (strings are immutable)
 */
export function ArrayShiftCallStringTestB200() {
    'use strict';
    try {
        Array.prototype.shift.call('hello');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayShiftSparseFullTestB300
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_SPARSE_FULL_B300
 * @tc.desc   Test shift() on fully sparse array
 */
export function ArrayShiftSparseFullTestB300() {
    'use strict';
    let arr = [, , ,]; // eslint-disable-line no-sparse-arrays
    let result = arr.shift();
    return result === undefined && arr.length === 2 && !(0 in arr);
}

/**
 * @tc.name   ArrayShiftSparseAfterShiftTestB400
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_SPARSE_AFTER_B400
 * @tc.desc   Test shift() produces sparse array with correct indexing
 */
export function ArrayShiftSparseAfterShiftTestB400() {
    'use strict';
    let arr = [1, , 3];
    arr.shift();
    return arr[0] === undefined && arr[1] === 3 && !(0 in arr) && arr.length === 2;
}

/**
 * @tc.name   ArrayShiftSparseMixedTestB500
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_SPARSE_MIXED_B500
 * @tc.desc   Test shift() on sparse array with empty and actual values
 */
export function ArrayShiftSparseMixedTestB500() {
    'use strict';
    let arr = [, 2, , 4];
    let result = arr.shift();
    return result === undefined && arr[0] === 2 && arr.length === 3;
}

/**
 * @tc.name   ArrayShiftProxyTestB600
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_PROXY_B600
 * @tc.desc   Test shift() on Proxy wrapped array
 */
export function ArrayShiftProxyTestB600() {
    'use strict';
    let arr = [1, 2, 3];
    let getCount = 0;
    let setCount = 0;
    let proxy = new Proxy(arr, {
        get(target, prop) {
            getCount++;
            return target[prop];
        },
        set(target, prop, value) {
            setCount++;
            target[prop] = value;
            return true;
        }
    });
    let result = proxy.shift();
    return result === 1 && getCount > 0 && arr.length === 2;
}

/**
 * @tc.name   ArrayShiftReadOnlyLengthTestB700
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_READONLY_LENGTH_B700
 * @tc.desc   Test shift() on array with read-only length property
 */
export function ArrayShiftReadOnlyLengthTestB700() {
    'use strict';
    try {
        let arr = [1, 2, 3];
        Object.defineProperty(arr, 'length', { writable: false });
        arr.shift();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayShiftTypedArrayInt8TestB800
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_TYPED_INT8_B800
 * @tc.desc   Test shift() on Int8Array (should fail as TypedArray has no shift method)
 */
export function ArrayShiftTypedArrayInt8TestB800() {
    'use strict';
    let arr = new Int8Array([1, 2, 3]);
    try {
        arr.shift();
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * @tc.name   ArrayShiftTypedArrayFloat64TestB900
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_TYPED_FLOAT64_B900
 * @tc.desc   Test shift() on Float64Array (should fail as TypedArray has no shift method)
 */
export function ArrayShiftTypedArrayFloat64TestB900() {
    'use strict';
    let arr = new Float64Array([1.1, 2.2, 3.3]);
    try {
        arr.shift();
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * @tc.name   ArrayShiftAlternatingPushShiftTestC100
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_ALT_PUSH_SHIFT_C100
 * @tc.desc   Test alternating push and shift operations
 */
export function ArrayShiftAlternatingPushShiftTestC100() {
    'use strict';
    let arr = [1, 2, 3];
    arr.shift();
    arr.push(4);
    arr.shift();
    return arr[0] === 3 && arr[1] === 4 && arr.length === 2;
}

/**
 * @tc.name   ArrayShiftAlternatingUnshiftShiftTestC200
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_ALT_UNSHIFT_SHIFT_C200
 * @tc.desc   Test alternating unshift and shift operations
 */
export function ArrayShiftAlternatingUnshiftShiftTestC200() {
    'use strict';
    let arr = [2, 3, 4];
    arr.unshift(1);
    let removed = arr.shift();
    return removed === 1 && arr[0] === 2 && arr.length === 3;
}

/**
 * @tc.name   ArrayShiftLargeStringTestC300
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_LARGE_STRING_C300
 * @tc.desc   Test shift() with very long string element
 */
export function ArrayShiftLargeStringTestC300() {
    'use strict';
    let longStr = 'a'.repeat(10000);
    let arr = [longStr, 'short'];
    let result = arr.shift();
    return result.length === 10000 && result === longStr && arr[0] === 'short';
}

/**
 * @tc.name   ArrayShiftObjectWithValueOfTestC400
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_OBJ_VALUEOF_C400
 * @tc.desc   Test shift() with object having valueOf method
 */
export function ArrayShiftObjectWithValueOfTestC400() {
    'use strict';
    let obj = {
        valueOf() { return 42; }
    };
    let arr = [obj, 2, 3];
    let result = arr.shift();
    return result === obj && result.valueOf() === 42;
}

/**
 * @tc.name   ArrayShiftObjectWithToStringTestC500
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_OBJ_TOSTRING_C500
 * @tc.desc   Test shift() with object having toString method
 */
export function ArrayShiftObjectWithToStringTestC500() {
    'use strict';
    let obj = {
        toString() { return 'custom'; }
    };
    let arr = [obj, 2, 3];
    let result = arr.shift();
    return result.toString() === 'custom';
}

/**
 * @tc.name   ArrayShiftGeneratorTestC600
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_GENERATOR_C600
 * @tc.desc   Test shift() with generator function results
 */
export function ArrayShiftGeneratorTestC600() {
    'use strict';
    function* gen() {
        yield 1;
        yield 2;
        yield 3;
    }
    let arr = [gen(), 2, 3];
    let result = arr.shift();
    return result !== undefined && typeof result.next === 'function';
}

/**
 * @tc.name   ArrayShiftPromiseTestC700
 * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADD_PROMISE_C700
 * @tc.desc   Test shift() with Promise elements
 */
export async function ArrayShiftPromiseTestC700() {
    'use strict';
    let promise1 = Promise.resolve(1);
    let promise2 = Promise.resolve(2);
    let arr = [promise1, promise2, 3];
    let result = arr.shift();
    let resolved = await result;
    return resolved === 1 && arr.length === 2;
}
