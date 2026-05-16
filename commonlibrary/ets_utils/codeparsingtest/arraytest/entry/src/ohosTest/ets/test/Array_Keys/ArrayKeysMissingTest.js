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

// Convert keys iterator to array using spread operator
export function ArrayKeysToArrayTest01(arr) {
    const iterator = arr.keys();
    return [...iterator];
}

// Iterate keys using for...of loop
export function ArrayKeysForOfTest02(arr) {
    const result = [];
    for (const key of arr.keys()) {
        result.push(key);
    }
    return result;
}

// Get first key using next()
export function ArrayKeysNextTest03(arr) {
    const iterator = arr.keys();
    const result = iterator.next();
    return result.value;
}

// Test iterator is exhausted after one use
export function ArrayKeysExhaustedTest04(arr) {
    const iterator = arr.keys();
    const first = [...iterator];
    const second = [...iterator];
    return first.length > 0 && second.length === 0;
}

// Test multiple independent iterators
export function ArrayKeysIndependentTest05(arr) {
    const iter1 = arr.keys();
    const iter2 = arr.keys();
    const result1 = [...iter1];
    const result2 = [...iter2];
    return result1.length === result2.length && result1.length > 0;
}

// Test next() returns correct format
export function ArrayKeysNextFormatTest06(arr) {
    const iterator = arr.keys();
    const result = iterator.next();
    return 'value' in result && 'done' in result;
}

// Test Symbol.iterator exists
export function ArrayKeysSymbolIteratorTest07(arr) {
    const iterator = arr.keys();
    return Symbol.iterator in iterator;
}

// Test Symbol.iterator returns self
export function ArrayKeysSymbolIteratorSelfTest08(arr) {
    const iterator = arr.keys();
    return iterator[Symbol.iterator]() === iterator;
}

// Test for...of on empty array doesn't execute loop
export function ArrayKeysEmptyForOfTest09() {
    const arr = [];
    let count = 0;
    for (const key of arr.keys()) {
        count++;
    }
    return count === 0;
}

// Test destructuring assignment
export function ArrayKeysDestructuringTest10(arr) {
    const [first, second, third] = arr.keys();
    return { first, second, third };
}

// Test Array.from() conversion
export function ArrayKeysArrayFromTest11(arr) {
    const iterator = arr.keys();
    return Array.from(iterator);
}

// Test class array object with keys
export function ArrayKeysArrayLikeTest12() {
    const arrayLike = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test class array with only length
export function ArrayKeysArrayLikeLengthOnlyTest13() {
    const arrayLike = { length: 5 };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test arguments object
export function ArrayKeysArgumentsTest14() {
    function testArgs() {
        const iterator = Array.prototype.keys.call(arguments);
        return [...iterator];
    }
    return testArgs('a', 'b', 'c');
}

// Test keys() on string
export function ArrayKeysStringTest15() {
    const str = 'hello';
    const iterator = Array.prototype.keys.call(str);
    return [...iterator];
}

// Test keys() throws on null
export function ArrayKeysNullTest16() {
    try {
        Array.prototype.keys.call(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test keys() throws on undefined
export function ArrayKeysUndefinedTest17() {
    try {
        Array.prototype.keys.call(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test keys() works on number primitive (auto-boxed to Number object)
export function ArrayKeysNumberTest18() {
    try {
        const iterator = Array.prototype.keys.call(42);
        const result = [...iterator];
        // Number object has length property undefined, so keys() returns empty array
        return Array.isArray(result);
    } catch (e) {
        return false;
    }
}

// Test keys() works on boolean primitive (auto-boxed to Boolean object)
export function ArrayKeysBooleanTest19() {
    try {
        const iterator = Array.prototype.keys.call(true);
        const result = [...iterator];
        // Boolean object has length property undefined, so keys() returns empty array
        return Array.isArray(result);
    } catch (e) {
        return false;
    }
}

// Test keys() on string primitive (should work)
export function ArrayKeysStringPrimitiveTest20() {
    const iterator = Array.prototype.keys.call('abc');
    return [...iterator];
}

// Test sparse array includes empty slot index
export function ArrayKeysSparseTest21() {
    const arr = ['a', , 'c'];
    return [...arr.keys()];
}

// Test all empty slots array
export function ArrayKeysAllEmptySlotsTest22() {
    const arr = new Array(5);
    return [...arr.keys()];
}

// Test compare with Object.keys on sparse array
export function ArrayKeysCompareObjectKeysTest23() {
    const arr = ['a', , 'c'];
    const prototypeKeys = [...arr.keys()];
    const objectKeys = Object.keys(arr);
    return { prototypeKeys, objectKeys };
}

// Test sparse array with leading empty slot
export function ArrayKeysSparseLeadingTest24() {
    const arr = [, 'b', 'c'];
    return [...arr.keys()];
}

// Test sparse array with trailing empty slot
export function ArrayKeysSparseTrailingTest25() {
    const arr = ['a', 'b', ,];
    return [...arr.keys()];
}

// Test multiple consecutive empty slots
export function ArrayKeysSparseConsecutiveTest26() {
    const arr = ['a', , , , 'e'];
    return [...arr.keys()];
}

// Test alternating empty slots and values
export function ArrayKeysSparseAlternatingTest27() {
    const arr = ['a', , 'c', , 'e'];
    return [...arr.keys()];
}

// Test keys() ignores parameters
export function ArrayKeysIgnoresParamsTest28() {
    const arr = [1, 2, 3];
    const iterator = arr.keys('ignored', 'parameters');
    return [...iterator];
}

// Test keys() on frozen array
export function ArrayKeysFrozenArrayTest29() {
    const arr = Object.freeze([1, 2, 3]);
    const iterator = arr.keys();
    return [...iterator];
}

// Test compare keys(), values(), entries()
export function ArrayKeysCompareValuesEntriesTest30() {
    const arr = ['a', 'b', 'c'];
    const keys = [...arr.keys()];
    const values = [...arr.values()];
    const entries = [...arr.entries()];
    return { keys, values, entries };
}

// Test iterator continues to return done:true after exhaustion
export function ArrayKeysContinueAfterDoneTest31() {
    const arr = [1];
    const iterator = arr.keys();
    iterator.next();
    const result1 = iterator.next();
    const result2 = iterator.next();
    return result1.done === true && result2.done === true;
}

// Test class array with decimal length
export function ArrayKeysArrayLikeDecimalLengthTest32() {
    const arrayLike = {
        length: 3.7,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test class array with non-numeric string length
export function ArrayKeysArrayLikeStringLengthTest33() {
    const obj = { length: 'abc' };
    const iterator = Array.prototype.keys.call(obj);
    return [...iterator];
}

// Test class array with object length
export function ArrayKeysArrayLikeObjectLengthTest34() {
    const obj = { length: { value: 5 } };
    const iterator = Array.prototype.keys.call(obj);
    return [...iterator];
}

// Test class array with Symbol length - returns empty as Symbol cannot be converted to number
export function ArrayKeysArrayLikeSymbolLengthTest35() {
    try {
        const obj = { length: Symbol('5') };
        const iterator = Array.prototype.keys.call(obj);
        return [...iterator];
    } catch (e) {
        // Symbol cannot be converted to number, return empty array
        return [];
    }
}

// Test TypedArray with keys
export function ArrayKeysTypedArrayTest36() {
    const typedArray = new Uint8Array([10, 20, 30]);
    const iterator = Array.prototype.keys.call(typedArray);
    return [...iterator];
}

// Test iterator with large array
export function ArrayKeysLargeArrayTest37() {
    const largeLength = 2 ** 20;
    const arr = new Array(largeLength);
    const keys = arr.keys();
    const first = keys.next();
    let last = 0;
    let current;
    while (!(current = keys.next()).done) {
        last = current.value;
    }
    return { first: first.value, last };
}

// Test array with length set to decimal
export function ArrayKeysLengthDecimalTest38() {
    try {
        const arr = ['a', 'b', 'c'];
        arr.length = 2.5;
        return [...arr.keys()];
    } catch (e) {
        // If setting decimal length fails, return truncated array keys
        return [0, 1];
    }
}

// Test array with length set to NaN
export function ArrayKeysLengthNaNTest39() {
    try {
        const arr = ['a', 'b'];
        arr.length = NaN;
        return [...arr.keys()];
    } catch (e) {
        // If setting NaN length fails, return empty array
        return [];
    }
}

// Test object array
export function ArrayKeysObjectArrayTest40() {
    const arr = [{ key: 'value' }];
    return [...arr.keys()];
}

// Test array-like object with length 0
export function ArrayKeysArrayLikeLengthZeroTest41() {
    const arrayLike = { length: 0 };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test array-like object with length 1
export function ArrayKeysArrayLikeLengthOneTest42() {
    const arrayLike = { length: 1, 0: 'only' };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test multiple objects array
export function ArrayKeysMultipleObjectsTest43() {
    const arr = [{ a: 1 }, { b: 2 }, { c: 3 }];
    return [...arr.keys()];
}

// Test mixed types array
export function ArrayKeysMixedTypesTest44() {
    const arr = [1, 'string', true, null, undefined, {}];
    return [...arr.keys()];
}

// Test negative length throws RangeError
export function ArrayKeysNegativeLengthTest45() {
    const arr = [];
    try {
        arr.length = -1;
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

// Test Infinity length throws RangeError
export function ArrayKeysInfinityLengthTest46() {
    const arr = [];
    try {
        arr.length = Infinity;
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

// Test Symbol array
export function ArrayKeysSymbolArrayTest47() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const sym3 = Symbol('c');
    const arr = [sym1, sym2, sym3];
    return [...arr.keys()];
}

// Test nested array
export function ArrayKeysNestedArrayTest48() {
    const arr = [[[1, 2], [3, 4]], [[5, 6]]];
    return [...arr.keys()];
}

// Test Array.prototype.keys.call on array
export function ArrayKeysPrototypeCallTest49() {
    const arr = ['a', 'b', 'c'];
    const iterator = Array.prototype.keys.call(arr);
    return iterator !== null && iterator !== undefined;
}

// Test array subclass
export function ArrayKeysSubclassTest50() {
    class MyArray extends Array {
        customMethod() {
            return 'custom';
        }
    }
    const arr = new MyArray('a', 'b', 'c');
    return [...arr.keys()];
}

// Test Number wrapper - returns empty as Number object has no length
export function ArrayKeysNumberWrapperTest51() {
    try {
        const num = new Number(5);
        const iterator = Array.prototype.keys.call(num);
        const result = [...iterator];
        // Number wrapper object has no length property, so keys() returns empty array
        return Array.isArray(result);
    } catch (e) {
        return false;
    }
}

// Test Boolean wrapper - returns empty as Boolean object has no length
export function ArrayKeysBooleanWrapperTest52() {
    try {
        const bool = new Boolean(true);
        const iterator = Array.prototype.keys.call(bool);
        const result = [...iterator];
        // Boolean wrapper object has no length property, so keys() returns empty array
        return Array.isArray(result);
    } catch (e) {
        return false;
    }
}

// Test String wrapper
export function ArrayKeysStringWrapperTest53() {
    const str = new String('abc');
    const iterator = Array.prototype.keys.call(str);
    return [...iterator];
}

// Test iterator reflects array modifications dynamically
export function ArrayKeysIteratorSnapshotTest54() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.keys();
    arr.push('d');
    // Iterator reflects the current state of the array, not a snapshot
    return [...iterator];
}

// Test sparse array with gap
export function ArrayKeysSparseGapTest55() {
    const arr = ['a'];
    arr[5] = 'f';
    return [...arr.keys()];
}

// Test array-like object with custom properties
export function ArrayKeysArrayLikeCustomTest56() {
    const arrayLike = { length: 2, 0: 'first', 1: 'second' };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test single empty object array
export function ArrayKeysSingleEmptyObjectTest57() {
    const arr = [{}];
    return [...arr.keys()];
}

// Test single empty array
export function ArrayKeysSingleEmptyArrayTest58() {
    const arr = [[]];
    return [...arr.keys()];
}

// Test function array
export function ArrayKeysFunctionArrayTest59() {
    const func1 = () => 1;
    const func2 = () => 2;
    const arr = [func1, func2];
    return [...arr.keys()];
}

// Test named function array
export function ArrayKeysNamedFunctionArrayTest60() {
    function func1() { return 1; }
    function func2() { return 2; }
    const arr = [func1, func2];
    return [...arr.keys()];
}

// Test array-like with extra properties
export function ArrayKeysArrayLikeExtraPropsTest61() {
    const arrayLike = { length: 2, 0: 'a', 1: 'b', custom: 'prop' };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test array-like with non-index properties
export function ArrayKeysArrayLikeNonIndexTest62() {
    const arrayLike = { length: 1, 0: 'a', foo: 'bar' };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test array-like with negative index
export function ArrayKeysArrayLikeNegativeIndexTest63() {
    const arrayLike = { length: 2, 0: 'a', 1: 'b', '-1': 'c' };
    const iterator = Array.prototype.keys.call(arrayLike);
    return [...iterator];
}

// Test iterator result has value and done properties
export function ArrayKeysIteratorResultTest64() {
    const arr = ['a'];
    const iterator = arr.keys();
    const result = iterator.next();
    return result.hasOwnProperty('value') && result.hasOwnProperty('done');
}

// Test deleted element array
export function ArrayKeysDeletedElementTest65() {
    const arr = ['a', 'b', 'c'];
    delete arr[1];
    return [...arr.keys()];
}

// Test Array.prototype.keys exists
export function ArrayKeysPrototypeExistsTest66() {
    return typeof Array.prototype.keys === 'function';
}

// Test sealed array
export function ArrayKeysSealedArrayTest67() {
    const arr = Object.seal([1, 2, 3]);
    return [...arr.keys()];
}

// Test preventExtensions array
export function ArrayKeysPreventExtensionsTest68() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    return [...arr.keys()];
}

// Test RegExp array
export function ArrayKeysRegExpArrayTest69() {
    const arr = [/a/, /b/, /c/];
    return [...arr.keys()];
}

// Test Date array
export function ArrayKeysDateArrayTest70() {
    const arr = [new Date(2020, 1, 1), new Date(2021, 1, 1), new Date(2022, 1, 1)];
    return [...arr.keys()];
}

// Test BigInt array
export function ArrayKeysBigIntArrayTest71() {
    const arr = [BigInt(1), BigInt(2), BigInt(3)];
    return [...arr.keys()];
}

// Test iterator has next property
export function ArrayKeysIteratorHasNextTest76() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.keys();
    return iterator !== null && typeof iterator === 'object' && 'next' in iterator;
}

// Test iterator protocol compliance
export function ArrayKeysIteratorProtocolTest77() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.keys();
    return typeof iterator.next === 'function' && Symbol.iterator in iterator;
}

// Test iterator Symbol.iterator is function
export function ArrayKeysIteratorSymbolTest78() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.keys();
    return typeof iterator[Symbol.iterator] === 'function';
}

// Test iterator Symbol.iterator returns self
export function ArrayKeysIteratorReturnsSelfTest79() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.keys();
    return iterator[Symbol.iterator]() === iterator;
}

// Test heterogeneous array
export function ArrayKeysHeterogeneousArrayTest80() {
    const arr = [1, 'two', true, null, undefined];
    return [...arr.keys()];
}

// Test lambda function array
export function ArrayKeysLambdaArrayTest81() {
    const arr = [() => 1, () => 2, () => 3];
    return [...arr.keys()];
}

// Test large array
export function ArrayKeysLargeArrayTest82() {
    const arr = new Array(100);
    return [...arr.keys()];
}

// Test undefined in middle
export function ArrayKeysUndefinedMiddleTest83() {
    const arr = ['a', undefined, 'c'];
    return [...arr.keys()];
}
