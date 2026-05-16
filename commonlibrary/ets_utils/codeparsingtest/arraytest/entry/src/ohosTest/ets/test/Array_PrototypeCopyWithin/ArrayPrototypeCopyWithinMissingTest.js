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

// Test copyWithin on array-like object with positive indices
export function CopyWithinArrayLikeTest0100() {
    const arrayLike = { length: 5, 3: 1 };
    Array.prototype.copyWithin.call(arrayLike, 0, 3);
    return arrayLike[0] === 1 && arrayLike[3] === 1 && arrayLike.length === 5;
}

// Test copyWithin on array-like object with source after target
export function CopyWithinArrayLikeTest0200() {
    const arrayLike = { length: 5, 3: 1 };
    Array.prototype.copyWithin.call(arrayLike, 3, 1);
    return !arrayLike.hasOwnProperty('3') && arrayLike.length === 5;
}

// Test copyWithin on array-like object preserving extra properties
export function CopyWithinArrayLikeTest0300() {
    const arrayLike = { 0: 'a', 1: 'b', 2: 'c', length: 3, extra: 'test' };
    Array.prototype.copyWithin.call(arrayLike, 0, 1);
    return arrayLike.extra === 'test' && arrayLike[0] === 'b' && arrayLike.length === 3;
}

// Test copyWithin with string target parameter
export function CopyWithinTypeConvTest0400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin('2');
    return result[0] === 1 && result[1] === 2 && result[2] === 1 && result[3] === 2 && result[4] === 3;
}

// Test copyWithin with non-numeric string target
export function CopyWithinTypeConvTest0500() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin('abc');
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with string start parameter
export function CopyWithinTypeConvTest0600() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(0, '3');
    return result[0] === 4 && result[1] === 5 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with NaN target parameter
export function CopyWithinTypeConvTest0700() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(NaN);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with Infinity target parameter
export function CopyWithinTypeConvTest0800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(Infinity);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with -Infinity target parameter
export function CopyWithinTypeConvTest0900() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(-Infinity);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with boolean true target parameter
export function CopyWithinTypeConvTest1000() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(true);
    return result[0] === 1 && result[1] === 1 && result[2] === 2 && result[3] === 3 && result[4] === 4;
}

// Test copyWithin with boolean false target parameter
export function CopyWithinTypeConvTest1100() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(false);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with null target parameter
export function CopyWithinTypeConvTest1200() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(null);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with object target parameter
export function CopyWithinTypeConvTest1300() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin({});
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with no arguments
export function CopyWithinArgsTest1400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin();
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with extra arguments beyond three
export function CopyWithinArgsTest1500() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(0, 3, 4, 5, 6);
    return result[0] === 4 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with null this context
export function CopyWithinErrorTest1600() {
    try {
        Array.prototype.copyWithin.call(null, 0, 3);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test copyWithin with undefined this context
export function CopyWithinErrorTest1700() {
    try {
        Array.prototype.copyWithin.call(undefined, 0, 3);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test copyWithin on frozen array
export function CopyWithinFrozenTest1800() {
    const arr = Object.freeze([1, 2, 3, 4, 5]);
    try {
        arr.copyWithin(0, 3);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test copyWithin on sealed array
export function CopyWithinSealedTest1900() {
    const arr = Object.seal([1, 2, 3, 4, 5]);
    arr.copyWithin(0, 3);
    return arr[0] === 4 && arr[1] === 5 && arr[2] === 3 && arr[3] === 4 && arr[4] === 5;
}

// Test copyWithin on object with readonly property
export function CopyWithinReadonlyTest2000() {
    const obj = { 0: 'a', 1: 'b', 2: 'c', length: 3 };
    Object.defineProperty(obj, '0', { value: 'a', writable: false });
    try {
        Array.prototype.copyWithin.call(obj, 0, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test copyWithin on object without length property
export function CopyWithinNoLengthTest2100() {
    const obj = { 0: 'a', 1: 'b' };
    Array.prototype.copyWithin.call(obj, 0, 1);
    return obj[0] === 'a' && obj[1] === 'b';
}

// Test copyWithin on object with non-numeric length
export function CopyWithinNoLengthTest2200() {
    const obj = { 0: 'a', 1: 'b', length: 'abc' };
    Array.prototype.copyWithin.call(obj, 0, 1);
    return obj[0] === 'a' && obj[1] === 'b' && obj.length === 'abc';
}

// Test copyWithin method length property
export function CopyWithinPropertyTest2300() {
    return Array.prototype.copyWithin.length === 2;
}

// Test copyWithin method name property
export function CopyWithinPropertyTest2400() {
    return Array.prototype.copyWithin.name === 'copyWithin';
}

// Test copyWithin on arguments object
export function CopyWithinArgumentsTest2500() {
    function testFn() {
        Array.prototype.copyWithin.call(arguments, 0, 2);
        return arguments[0] === 3 && arguments[1] === 4 && arguments[2] === 5 && arguments[3] === 4 && arguments[4] === 5;
    }
    return testFn(1, 2, 3, 4, 5);
}

// Test copyWithin on sparse array
export function CopyWithinSparseTest2600() {
    const arr = [1, , 3];
    arr.copyWithin(2, 1, 2);
    return arr[0] === 1 && !(2 in arr) && arr.length === 3;
}

// Test copyWithin with target at last index
export function CopyWithinTargetTest2700() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(4);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 1;
}

// Test copyWithin with object reference element
export function CopyWithinObjRefTest2800() {
    const obj = { a: 1 };
    const arr = [obj, 2, 3, 4, 5];
    arr.copyWithin(1, 0, 1);
    obj.a = 2;
    return arr[1].a === 2;
}

// Test copyWithin with nested array reference
export function CopyWithinObjRefTest2900() {
    const inner = [1, 2];
    const arr = [inner, 3, 4, 5, 6];
    arr.copyWithin(1, 0, 1);
    inner.push(3);
    return arr[1].length === 3 && arr[1][2] === 3;
}

// Test copyWithin with undefined start parameter
export function CopyWithinDefaultTest3000() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(2, undefined);
    return result[0] === 1 && result[1] === 2 && result[2] === 1 && result[3] === 2 && result[4] === 3;
}

// Test copyWithin with undefined end parameter
export function CopyWithinDefaultTest3100() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(0, 2, undefined);
    return result[0] === 3 && result[1] === 4 && result[2] === 5 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with negative start parameter
export function CopyWithinMixedTest3200() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(0, -2);
    return result[0] === 4 && result[1] === 5 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with all negative parameters
export function CopyWithinMixedTest3300() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(-2, -3, -1);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 3 && result[4] === 4;
}

// Test copyWithin with target exceeding negative bounds
export function CopyWithinNegBoundTest3400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.copyWithin(-10);
    return result[0] === 1 && result[1] === 2 && result[2] === 3 && result[3] === 4 && result[4] === 5;
}

// Test copyWithin with target beyond array length
export function CopyWithinExtendTest3500() {
    const arr = [1, 2, 3];
    arr.copyWithin(5, 0, 1);
    return arr.length === 3 && arr[0] === 1 && arr[1] === 2 && arr[2] === 3;
}

// Test copyWithin on Proxy object
export function CopyWithinProxyTest3600() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return target[prop];
        }
    });
    Array.prototype.copyWithin.call(proxy, 0, 3, 4);
    return proxy[0] === 4 && proxy[1] === 2 && proxy[2] === 3;
}

// Test copyWithin with null element value
export function CopyWithinSpecialValTest3700() {
    const arr = [1, null, 3, 4, 5];
    const result = arr.copyWithin(0, 1, 3);
    return result[0] === null && result[1] === 3 && result[2] === 3;
}

// Test copyWithin with undefined element value
export function CopyWithinSpecialValTest3800() {
    const arr = [1, undefined, 3, 4, 5];
    const result = arr.copyWithin(0, 1, 3);
    return result[0] === undefined && result[1] === 3 && result[2] === 3;
}

// Test copyWithin with NaN element value
export function CopyWithinSpecialValTest3900() {
    const arr = [1, NaN, 3, 4, 5];
    const result = arr.copyWithin(0, 1, 3);
    return Number.isNaN(result[0]) && result[1] === 3 && result[2] === 3;
}
