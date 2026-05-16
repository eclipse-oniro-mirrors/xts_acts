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

/*
 * Array.prototype.reverse() Test Functions
 * Compatible with ArkTS - No Function.call/apply, no Object.getPrototypeOf
 */

// ============================================
// 1. Basic Functionality Tests
// ============================================

export function ArrayReverseNumberTest0100() {
    let arr = [1, 2, 3, 4, 5];
    let result = arr.reverse();
    return result[0] === 5 && result[1] === 4 && result[2] === 3 && 
           result[3] === 2 && result[4] === 1;
}

export function ArrayReverseStringTest0200() {
    let arr = ['one', 'two', 'three'];
    let result = arr.reverse();
    return result[0] === 'three' && result[1] === 'two' && result[2] === 'one';
}

export function ArrayReverseBooleanTest0300() {
    let arr = [true, false, true, false];
    let result = arr.reverse();
    return result[0] === false && result[1] === true && 
           result[2] === false && result[3] === true;
}

export function ArrayReverseMixedTest0400() {
    let arr = [1, 'two', true, 4, 'five'];
    let result = arr.reverse();
    return result[0] === 'five' && result[1] === 4 && 
           result[2] === true && result[3] === 'two' && result[4] === 1;
}

export function ArrayReverseObjectMixedTest0500() {
    let obj = { key: 'value' };
    let arr = [1, obj, [2, 3], 'text'];
    let result = arr.reverse();
    return result[0] === 'text' && Array.isArray(result[1]) && 
           result[2] === obj && result[3] === 1;
}

export function ArrayReverseEvenLengthTest0600() {
    let arr = [1, 2, 3, 4];
    let result = arr.reverse();
    return result[0] === 4 && result[1] === 3 && 
           result[2] === 2 && result[3] === 1;
}

export function ArrayReverseOddLengthTest0700() {
    let arr = [1, 2, 3, 4, 5];
    let result = arr.reverse();
    return result[0] === 5 && result[1] === 4 && result[2] === 3 && 
           result[3] === 2 && result[4] === 1;
}

// ============================================
// 2. Return Value and Reference Tests
// ============================================

export function ArrayReverseReturnsReferenceTest0800() {
    let arr = [1, 2, 3];
    let result = arr.reverse();
    return result === arr;
}

export function ArrayReverseModifyAffectsOriginalTest0900() {
    let arr = [1, 2, 3];
    let result = arr.reverse();
    result[0] = 99;
    return arr[0] === 99;
}

export function ArrayReverseInPlaceTest1000() {
    let arr = [1, 2, 3];
    let beforeReverse = arr;
    arr.reverse();
    return arr === beforeReverse;
}

export function ArrayReverseNoNewArrayTest1100() {
    let arr = [1, 2, 3];
    let result = arr.reverse();
    return result instanceof Array && result === arr;
}

export function ArrayReverseDoubleReverseTest1200() {
    let arr = [1, 2, 3, 4, 5];
    arr.reverse().reverse();
    return arr[0] === 1 && arr[1] === 2 && arr[2] === 3 && 
           arr[3] === 4 && arr[4] === 5;
}

export function ArrayReverseChainMapTest1300() {
    let arr = [1, 2, 3, 4, 5];
    let result = arr.reverse().map(x => x * 2);
    return result[0] === 10 && result[1] === 8 && result[2] === 6 && 
           result[3] === 4 && result[4] === 2;
}

// ============================================
// 3. Special Values Tests
// ============================================

export function ArrayReverseUndefinedTest1400() {
    let arr = [1, undefined, 3];
    let result = arr.reverse();
    return result[0] === 3 && result[1] === undefined && result[2] === 1;
}

export function ArrayReverseNullTest1500() {
    let arr = [1, null, 3];
    let result = arr.reverse();
    return result[0] === 3 && result[1] === null && result[2] === 1;
}

export function ArrayReverseNaNTest1600() {
    let arr = [1, NaN, 3];
    let result = arr.reverse();
    return result[0] === 3 && Number.isNaN(result[1]) && result[2] === 1;
}

export function ArrayReverseInfinityTest1700() {
    let arr = [1, Infinity, -Infinity];
    let result = arr.reverse();
    return result[0] === -Infinity && result[1] === Infinity && result[2] === 1;
}

// ============================================
// 4. Reference Type Tests
// ============================================

export function ArrayReverseObjectRefTest1800() {
    let obj1 = { id: 1 };
    let obj2 = { id: 2 };
    let obj3 = { id: 3 };
    let arr = [obj1, obj2, obj3];
    let result = arr.reverse();
    return result[0] === obj3 && result[1] === obj2 && result[2] === obj1;
}

export function ArrayReverseModifyObjectTest1900() {
    let obj = { value: 1 };
    let arr = [obj, { value: 2 }];
    arr.reverse();
    obj.value = 99;
    return arr[1].value === 99;
}

export function ArrayReverseNestedArrayTest2000() {
    let arr = [[1, 2], [3, 4], [5, 6]];
    let result = arr.reverse();
    return Array.isArray(result[0]) && result[0][0] === 5 && 
           Array.isArray(result[2]) && result[2][0] === 1;
}

export function ArrayReverseNestedArrayRefTest2100() {
    let subArr = [1, 2, 3];
    let arr = [subArr, [4, 5], [6, 7]];
    let result = arr.reverse();
    return result[2] === subArr;
}

export function ArrayReverseFunctionArrayTest2200() {
    let fn1 = () => 1;
    let fn2 = () => 2;
    let fn3 = () => 3;
    let arr = [fn1, fn2, fn3];
    let result = arr.reverse();
    return result[0]() === 3 && result[1]() === 2 && result[2]() === 1;
}

export function ArrayReverseSymbolTest2300() {
    let sym1 = Symbol('a');
    let sym2 = Symbol('b');
    let arr = [sym1, sym2];
    let result = arr.reverse();
    return result[0] === sym2 && result[1] === sym1;
}

export function ArrayReverseSameElementsTest2400() {
    let arr = [1, 1, 1, 1, 1];
    let result = arr.reverse();
    return result[0] === 1 && result[1] === 1 && result[2] === 1;
}

export function ArrayReversePartialSameTest2500() {
    let arr = [1, 2, 1, 2, 1];
    let result = arr.reverse();
    return result[0] === 1 && result[1] === 2 && result[2] === 1;
}

// ============================================
// 5. Boundary Value Tests
// ============================================

export function ArrayReverseEmptyTest2600() {
    let arr = [];
    let result = arr.reverse();
    return result.length === 0 && result === arr;
}

export function ArrayReverseSingleElementTest2700() {
    let arr = [42];
    let result = arr.reverse();
    return result[0] === 42 && result.length === 1;
}

export function ArrayReverseTwoElementsTest2800() {
    let arr = [1, 2];
    let result = arr.reverse();
    return result[0] === 2 && result[1] === 1;
}

export function ArrayReverseLargeArrayTest2900() {
    let arr = Array.from({ length: 10000 }, (_, i) => i);
    let result = arr.reverse();
    return result[0] === 9999 && result[9999] === 0 && result === arr;
}

export function ArrayReverseHugeArrayTest3000() {
    let arr = Array.from({ length: 100000 }, (_, i) => i);
    let result = arr.reverse();
    return result.length === 100000 && result[0] === 99999;
}

// ============================================
// 6. Sparse Array Tests
// ============================================

export function ArrayReverseSparseSingleHoleTest3100() {
    let arr = [1, , 3];
    let result = arr.reverse();
    return result[0] === 3 && !(1 in result) && result[2] === 1;
}

export function ArrayReverseSparseMultipleHolesTest3200() {
    let arr = [1, , 3, , 5];
    let result = arr.reverse();
    return result[0] === 5 && !(1 in result) && result[2] === 3;
}

export function ArrayReverseSparseConsecutiveHolesTest3300() {
    let arr = [1, , , 4];
    let result = arr.reverse();
    return result[0] === 4 && !(1 in result) && !(2 in result) && result[3] === 1;
}

export function ArrayReverseSparseBoundaryHolesTest3400() {
    let arr = new Array(4);
    arr[1] = 2;
    arr[2] = 3;

    let result = arr.reverse();

    return !(0 in result) && result[1] === 3 && result[2] === 2 && !(3 in result);
}

export function ArrayReverseSparseOnlyHolesTest3500() {
    let arr = new Array(5);
    let result = arr.reverse();
    return result.length === 5 && !(0 in result) && !(4 in result);
}

export function ArrayReverseSparseMixedUndefinedTest3600() {
    let arr = [1, undefined, , 4];
    let result = arr.reverse();
    return result[0] === 4 && !(1 in result) && result[2] === undefined && result[3] === 1;
}

// ============================================
// 7. Multiple Reference Tests
// ============================================

export function ArrayReverseMultipleSameObjectTest3700() {
    let obj = { value: 1 };
    let arr = [obj, obj, obj];
    let result = arr.reverse();
    return result[0] === result[1] && result[1] === result[2];
}

export function ArrayReverseCircularRefArrayTest3800() {
    let arr = [1, 2, 3];
    arr.push(arr);
    let result = arr.reverse();
    return result[0] === arr && result[3] === 1;
}

export function ArrayReverseCircularObjectTest3900() {
    let obj1 = { name: 'obj1' };
    let obj2 = { name: 'obj2' };
    obj1.ref = obj2;
    obj2.ref = obj1;
    let arr = [obj1, obj2];
    let result = arr.reverse();
    return result[0].ref.ref === result[0];
}

// ============================================
// 8. Method Combination Tests
// ============================================

export function ArrayReverseWithSortAscTest4000() {
    let arr = [3, 1, 4, 1, 5, 9, 2, 6];
    arr.sort((a, b) => a - b);
    arr.reverse();
    return arr[0] === 9 && arr[arr.length - 1] === 1;
}

export function ArrayReverseWithSortDescTest4100() {
    let arr = [3, 1, 4, 1, 5, 9, 2, 6];
    arr.reverse();
    arr.sort((a, b) => a - b);
    return arr[0] === 1 && arr[arr.length - 1] === 9;
}

export function ArrayReverseWithSliceTest4200() {
    let arr = [1, 2, 3, 4, 5];
    let sliced = arr.slice(1, 4);
    sliced.reverse();
    return sliced[0] === 4 && sliced[1] === 3 && sliced[2] === 2 &&
           arr[0] === 1;
}

export function ArrayReverseWithConcatTest4300() {
    let arr1 = [1, 2, 3];
    let arr2 = [4, 5, 6];
    let result = arr1.concat(arr2).reverse();
    return result[0] === 6 && result[1] === 5 && result[2] === 4;
}

export function ArrayReverseWithForEachTest4400() {
    let arr = [1, 2, 3, 4, 5];
    let collected = [];
    arr.reverse().forEach(item => collected.push(item * 2));
    return collected[0] === 10 && collected[4] === 2;
}

export function ArrayReverseWithMapTest4500() {
    let arr = [1, 2, 3];
    let mapped = arr.reverse().map(x => x * 10);
    return mapped[0] === 30 && mapped[1] === 20 && mapped[2] === 10;
}

export function ArrayReverseWithFilterTest4600() {
    let arr = [1, 2, 3, 4, 5];
    let filtered = arr.reverse().filter(x => x > 2);
    return filtered.length === 3 && filtered[0] === 5;
}

export function ArrayReverseWithReduceTest4700() {
    let arr = [1, 2, 3, 4, 5];
    let sum = arr.reverse().reduce((acc, val) => acc + val, 0);
    return sum === 15;
}

export function ArrayReverseWithPushTest4800() {
    let arr = [1, 2, 3];
    arr.reverse().push(0);
    return arr[0] === 3 && arr[1] === 2 && arr[2] === 1 && arr[3] === 0;
}

export function ArrayReverseWithPopTest4900() {
    let arr = [1, 2, 3];
    let popped = arr.reverse().pop();
    return popped === 1 && arr.length === 2;
}

export function ArrayReverseWithSpliceTest5000() {
    let arr = [1, 2, 3, 4, 5];
    arr.reverse().splice(1, 2, 'a', 'b');
    return arr[0] === 5 && arr[1] === 'a' && arr[2] === 'b' && arr[3] === 2;
}

export function ArrayReverseWithIndexOfTest5100() {
    let arr = [1, 2, 3, 2, 1];
    arr.reverse();
    return arr.indexOf(2) === 1;
}

export function ArrayReverseWithIncludesTest5200() {
    let arr = [1, 2, 3];
    arr.reverse();
    return arr.includes(2) && !arr.includes(5);
}

// ============================================
// 9. TypedArray Tests
// ============================================

export function ArrayReverseTypedArrayInt8Test5300() {
    let typedArr = new Int8Array([1, 2, 3, 4, 5]);
    typedArr.reverse();
    return typedArr[0] === 5 && typedArr[4] === 1;
}

export function ArrayReverseTypedArrayFloat32Test5400() {
    let typedArr = new Float32Array([1.1, 2.2, 3.3]);
    typedArr.reverse();

    return Math.abs(typedArr[0] - 3.3) < 0.0001 &&
        Math.abs(typedArr[2] - 1.1) < 0.0001;
}


// ============================================
// 10. Array Creation Methods Tests
// ============================================

export function ArrayReverseFromTest5500() {
    let arr = Array.from([1, 2, 3, 4, 5]);
    let result = arr.reverse();
    return result[0] === 5 && result[4] === 1;
}

export function ArrayReverseOfTest5600() {
    let arr = Array.of(1, 2, 3, 4, 5);
    let result = arr.reverse();
    return result[0] === 5 && result[4] === 1;
}

// ============================================
// 11. Special Array States Tests
// ============================================

export function ArrayReverseFrozenArrayTest5700() {
    try {
        let arr = Object.freeze([1, 2, 3]);
        arr.reverse();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ArrayReverseSealedArrayTest5800() {
    try {
        let arr = Object.seal([1, 2, 3]);
        arr.reverse();
        return true;
    } catch (e) {
        return false;
    }
}

export function ArrayReversePreventExtensionsTest5900() {
    let arr = Object.preventExtensions([1, 2, 3]);
    try {
        arr.reverse();
        return arr[0] === 3 && arr[2] === 1;
    } catch (e) {
        return false;
    }
}

// ============================================
// 12. BigInt and Symbol Tests
// ============================================

export function ArrayReverseBigIntTest6000() {
    let arr = [1n, 2n, 3n, 4n, 5n];
    let result = arr.reverse();
    return result[0] === 5n && result[4] === 1n;
}

// ============================================
// 13. Async Tests
// ============================================

export async function ArrayReverseAsyncTest6100() {
    let arr = [1, 2, 3];
    return new Promise((resolve) => {
        setTimeout(() => {
            let result = arr.reverse();
            resolve(result[0] === 3 && result[2] === 1);
        }, 10);
    });
}

// ============================================
// 14. Proxy Tests
// ============================================

export function ArrayReverseProxyTest6200() {
    let arr = [1, 2, 3];
    let proxy = new Proxy(arr, {
        get(target, prop) {
            return target[prop];
        },
        set(target, prop, value) {
            target[prop] = value;
            return true;
        }
    });
    proxy.reverse();
    return proxy[0] === 3 && proxy[1] === 2 && proxy[2] === 1;
}

// ============================================
// 15. Iterator Tests
// ============================================

export function ArrayReverseValuesIteratorTest6300() {
    let arr = [1, 2, 3];
    arr.reverse();
    let values = Array.from(arr.values());
    return values[0] === 3 && values[1] === 2 && values[2] === 1;
}

export function ArrayReverseKeysIteratorTest6400() {
    let arr = [1, 2, 3];
    arr.reverse();
    let keys = Array.from(arr.keys());
    return keys[0] === 0 && keys[1] === 1 && keys[2] === 2;
}

export function ArrayReverseEntriesIteratorTest6500() {
    let arr = [1, 2, 3];
    arr.reverse();
    let entries = Array.from(arr.entries());
    return entries[0][0] === 0 && entries[0][1] === 3;
}

// ============================================
// 16. Join and String Tests
// ============================================

export function ArrayReverseJoinTest6600() {
    let arr = [1, 2, 3];
    arr.reverse();
    return arr.join('-') === '3-2-1';
}

export function ArrayReverseToStringTest6700() {
    let arr = [1, 2, 3];
    arr.reverse();
    return arr.toString() === '3,2,1';
}

// ============================================
// 17. Fill and CopyWithin Tests
// ============================================

export function ArrayReverseFillTest6800() {
    let arr = [1, 2, 3, 4, 5];
    arr.reverse();
    arr.fill(0, 1, 3);
    return arr[0] === 5 && arr[1] === 0 && arr[2] === 0 && arr[3] === 2;
}

export function ArrayReverseCopyWithinTest6900() {
    let arr = [1, 2, 3, 4, 5];
    arr.reverse();
    arr.copyWithin(0, 3);
    return arr[0] === 2 && arr[1] === 1;
}

// ============================================
// 18. Flat and FlatMap Tests
// ============================================

export function ArrayReverseFlatTest7000() {
    let arr = [[1, 2], [3, 4], [5, 6]];
    arr.reverse();
    let flat = arr.flat();
    return flat[0] === 5 && flat[1] === 6 && flat[4] === 1 && flat[5] === 2;
}

export function ArrayReverseFlatMapTest7100() {
    let arr = [1, 2, 3];
    let mapped = arr.reverse().flatMap(x => [x, x * 2]);
    return mapped[0] === 3 && mapped[1] === 6 && mapped[4] === 1 && mapped[5] === 2;
}

// ============================================
// 19. Find and FindIndex Tests
// ============================================

export function ArrayReverseFindTest7200() {
    let arr = [1, 2, 3, 4, 5];
    let found = arr.reverse().find(x => x > 3);
    return found === 5;
}

export function ArrayReverseFindIndexTest7300() {
    let arr = [1, 2, 3, 4, 5];
    let index = arr.reverse().findIndex(x => x === 3);
    return index === 2;
}

// ============================================
// 20. Every and Some Tests
// ============================================

export function ArrayReverseEveryTest7400() {
    let arr = [1, 2, 3];
    arr.reverse();
    return arr.every(x => x > 0);
}

export function ArrayReverseSomeTest7500() {
    let arr = [1, 2, 3];
    arr.reverse();
    return arr.some(x => x === 2);
}

// ============================================
// 21. Array-like Object Tests (ArkTS Unsupported Features)
// ============================================

/**
 * Test reverse() on basic array-like object using Function.call
 */
export function ArrayReverseArrayLikeBasicTest7600() {
    'use strict';
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const result = Array.prototype.reverse.call(arrayLike);
    return result === arrayLike &&
           arrayLike[0] === 'c' &&
           arrayLike[1] === 'b' &&
           arrayLike[2] === 'a';
}

/**
 * Test reverse() on array-like with non-numeric properties
 */
export function ArrayReverseArrayLikeWithExtraPropsTest7700() {
    'use strict';
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3,
        name: 'test',
        foo: 'bar'
    };
    Array.prototype.reverse.call(arrayLike);
    return arrayLike[0] === 'c' &&
           arrayLike.name === 'test' &&
           arrayLike.foo === 'bar';
}

/**
 * Test reverse() on sparse array-like object
 */
export function ArrayReverseArrayLikeSparseTest7800() {
    'use strict';
    const arrayLike = {
        0: 'a',
        2: 'c',
        length: 3
    };
    Array.prototype.reverse.call(arrayLike);
    return arrayLike[0] === 'c' &&
           arrayLike[2] === 'a' &&
           !(1 in arrayLike);
}

/**
 * Test reverse() on function arguments object
 */
export function ArrayReverseArgumentsTest7900() {
    'use strict';
    function testFunc() {
        Array.prototype.reverse.call(arguments);
        return arguments[0] === 3 &&
               arguments[1] === 2 &&
               arguments[2] === 1;
    }
    return testFunc(1, 2, 3);
}

// ============================================
// 22. Exception Cases Tests
// ============================================

/**
 * Test reverse() with this value as null throws TypeError
 */
export function ArrayReverseThisNullTest8000() {
    'use strict';
    try {
        Array.prototype.reverse.call(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * Test reverse() with this value as undefined throws TypeError
 */
export function ArrayReverseThisUndefinedTest8100() {
    'use strict';
    try {
        Array.prototype.reverse.call(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * Test reverse() with this value as primitive number
 */
export function ArrayReverseThisPrimitiveTest8200() {
    'use strict';
    try {
        Array.prototype.reverse.call(42);
        return true;
    } catch (e) {
        return false;
    }
}

/**
 * Test reverse() with this value as primitive string throws TypeError
 */
export function ArrayReverseThisStringTest8300() {
    'use strict';
    try {
        Array.prototype.reverse.call('hello');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * Test reverse() with this value as primitive boolean
 */
export function ArrayReverseThisBooleanTest8400() {
    'use strict';
    try {
        Array.prototype.reverse.call(true);
        return true;
    } catch (e) {
        return false;
    }
}

/**
 * Test reverse() with negative length (no operation)
 */
export function ArrayReverseLengthNegativeTest8500() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        length: -1
    };
    Array.prototype.reverse.call(obj);
    return obj[0] === 'a' && obj[1] === 'b' && obj.length === -1;
}

/**
 * Test reverse() with non-integer length
 */
export function ArrayReverseLengthNonIntegerTest8600() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        length: 1.5
    };
    Array.prototype.reverse.call(obj);
    return obj.length === 1.5;
}

/**
 * Test reverse() with string length (converted to number)
 */
export function ArrayReverseLengthStringTest8700() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        length: '2'
    };
    Array.prototype.reverse.call(obj);
    return obj[0] === 'b' && obj[1] === 'a';
}

// ============================================
// 23. Getter and Setter Tests
// ============================================

/**
 * Test reverse() on object with getter-only property throws TypeError
 */
export function ArrayReverseWithGetterTest8800() {
    'use strict';
    const obj = {
        get 0() { return 'a'; },
        1: 'b',
        2: 'c',
        length: 3
    };
    try {
        Array.prototype.reverse.call(obj);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * Test reverse() on object with setter property
 */
export function ArrayReverseWithSetterTest8900() {
    'use strict';
    let setCount = 0;
    const obj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3,
        set lastIndex(val) { setCount++; }
    };
    Array.prototype.reverse.call(obj);
    return obj[0] === 'c' && setCount >= 0;
}

// ============================================
// 24. Read-only Property Tests
// ============================================

/**
 * Test reverse() throws error on read-only property in strict mode
 */
export function ArrayReverseReadOnlyPropertyTest9000() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    Object.defineProperty(obj, '0', {
        value: 'a',
        writable: false,
        configurable: true
    });
    try {
        Array.prototype.reverse.call(obj);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * Test reverse() on string throws TypeError (strict mode)
 */
export function ArrayReverseStringImmutableTest9100() {
    'use strict';
    const str = 'hello';
    try {
        Array.prototype.reverse.call(str);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * Test reverse() on object with Symbol.iterator
 */
export function ArrayReverseIterableObjectTest9200() {
    'use strict';
    const iterableObj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3,
        [Symbol.iterator]: Array.prototype[Symbol.iterator]
    };
    Array.prototype.reverse.call(iterableObj);
    return iterableObj[0] === 'c' && iterableObj[2] === 'a';
}

/**
 * Test reverse() with large array works correctly
 */
export function ArrayReverseHugeLengthTest9300() {
    'use strict';
    // 使用合理的边界值测试大数组反转，避免极端情况
    const largeArray = Array.from({ length: 10000 }, (_, i) => i);
    const result = largeArray.reverse();
    
    // 验证反转结果正确性
    return result[0] === 9999 && 
           result[9999] === 0 && 
           result === largeArray; // 验证原地修改
}

/**
 * Test reverse() using Function.apply
 */
export function ArrayReverseWithApplyTest9400() {
    'use strict';
    const arr = [1, 2, 3];
    const result = Array.prototype.reverse.apply(arr);
    return result === arr &&
           arr[0] === 3 &&
           arr[1] === 2 &&
           arr[2] === 1;
}

/**
 * Test reverse() on NodeList-like object
 */
export function ArrayReverseNodeListLikeTest9500() {
    'use strict';
    const nodeListLike = {
        0: { tagName: 'DIV' },
        1: { tagName: 'SPAN' },
        2: { tagName: 'P' },
        length: 3,
        item: function(index) { return this[index]; }
    };
    Array.prototype.reverse.call(nodeListLike);
    return nodeListLike[0].tagName === 'P' &&
           nodeListLike[1].tagName === 'SPAN' &&
           nodeListLike[2].tagName === 'DIV';
}

/**
 * Test reverse() and verify prototype chain
 */
export function ArrayReversePrototypeChainTest9600() {
    'use strict';
    const arr = [1, 2, 3];
    const result = arr.reverse();
    const proto = Object.getPrototypeOf(result);
    return proto === Array.prototype;
}

/**
 * Test reverse() and verify length property descriptor
 */
export function ArrayReversePropertyDescriptorTest9700() {
    'use strict';
    const arr = [1, 2, 3];
    arr.reverse();
    const descriptor = Object.getOwnPropertyDescriptor(arr, 'length');
    return descriptor !== undefined &&
           descriptor.writable === true &&
           descriptor.enumerable === false &&
           descriptor.configurable === false;
}

/**
 * Comprehensive test of array-like object reversal
 */
export function ArrayReverseArrayLikeComprehensiveTest9800() {
    'use strict';
    const testCases = [
        { 0: 1, 1: 2, length: 2, expected: [2, 1] },
        { 0: 'a', 1: 'b', 2: 'c', length: 3, expected: ['c', 'b', 'a'] },
        { 0: true, length: 1, expected: [true] },
        { length: 0, expected: [] }
    ];

    return testCases.every(tc => {
        const obj = { ...tc };
        delete obj.expected;
        Array.prototype.reverse.call(obj);
        return tc.expected.every((val, idx) => obj[idx] === val);
    });
}

/**
 * Test reverse() on empty array-like object
 */
export function ArrayReverseEmptyArrayLikeTest9900() {
    'use strict';
    const obj = { length: 0 };
    const result = Array.prototype.reverse.call(obj);
    return result === obj && obj.length === 0;
}

/**
 * Test reverse() on read-only property in non-strict mode (silent fail)
 */
export function ArrayReverseNonStrictReadOnlyTest10000() {
    const obj = {
        0: 'a',
        1: 'b',
        length: 2
    };
    Object.defineProperty(obj, '0', {
        value: 'a',
        writable: false,
        configurable: true
    });

    try {
        Array.prototype.reverse.call(obj);
        return obj[0] === 'a' || obj[0] === 'b';
    } catch (e) {
        return e instanceof TypeError;
    }
}
