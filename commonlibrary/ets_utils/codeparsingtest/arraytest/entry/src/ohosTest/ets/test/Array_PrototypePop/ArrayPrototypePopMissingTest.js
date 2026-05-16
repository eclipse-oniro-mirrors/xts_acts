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

// Test pop with Symbol elements
export function PopSymbolTest0100() {
    'use strict';
    const sym = Symbol('test');
    const arr = [sym, 2, 3];
    try {
        const result = arr.pop();
        return result === 3 && arr.length === 2;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test pop with BigInt elements
export function PopBigIntTest0200() {
    'use strict';
    const arr = [1n, 2n, 3n];
    const result = arr.pop();
    return result === 3n && arr.length === 2;
}

// Test array-like object with pop.call
export function PopArrayLikeTest0300() {
    'use strict';
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const result = Array.prototype.pop.call(arrayLike);
    return result === 'c' && arrayLike.length === 2;
}

// Test arguments object with pop.call
export function PopArgumentsTest0400() {
    'use strict';
    function test() {
        return Array.prototype.pop.call(arguments);
    }
    const result = test(1, 2, 3);
    return result === 3;
}

// Test string with pop.call
export function PopStringTest0500() {
    'use strict';
    const str = 'hello';
    try {
        Array.prototype.pop.call(str);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test TypedArray with pop
export function PopTypedArrayTest0600() {
    'use strict';
    const typedArr = new Uint8Array([1, 2, 3]);
    try {
        const result = typedArr.pop();
        return false;
    } catch (e) {
        const isTargetError = e instanceof TypeError;
        return isTargetError && typedArr.length === 3;
    }
}

// Test sparse array with delete
export function PopSparseDeleteTest0700() {
    'use strict';
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    const result = arr.pop();
    return result === 5 && arr.length === 4;
}

// Test sparse array vs explicit undefined
export function PopSparseVsUndefinedTest0800() {
    'use strict';
    const sparse = new Array(3);
    const withUndefined = [undefined, undefined, undefined];
    const sparseResult = sparse.pop();
    const undefResult = withUndefined.pop();
    return sparseResult === undefined && undefResult === undefined && sparse.length === 2 && withUndefined.length === 2;
}

// Test extreme sparse array
export function PopExtremeSparseTest0900() {
    'use strict';
    const arr = [];
    arr[0] = 'start';
    arr[1000] = 'end';
    const result = arr.pop();
    return result === 'end' && arr.length === 1000;
}

// Test thisArg as number
export function PopThisArgNumberTest1000() {
    'use strict';
    const arr = [1, 2, 3];
    Array.prototype.pop.call(arr);
    return arr.length === 2;
}

// Test null prototype object
export function PopNullPrototypeTest1100() {
    'use strict';
    const obj = Object.create(null);
    obj[0] = 'a';
    obj[1] = 'b';
    obj.length = 2;
    const result = Array.prototype.pop.call(obj);
    return result === 'b' && obj.length === 1;
}

// Test proxy array
export function PopProxyTest1200() {
    'use strict';
    const arr = [1, 2, 3];
    let getCallCount = 0;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            getCallCount++;
            return target[prop];
        }
    });
    const result = proxy.pop();
    return result === 3 && getCallCount > 0;
}

// Test non-array object calling pop
export function PopNonArrayTest1300() {
    'use strict';
    const obj = { 0: 'a', 1: 'b', name: 'test' };
    const result =Array.prototype.pop.call(obj);
    return result === undefined && obj.length === 0;
}

// Test length property is not number
export function PopInvalidLengthTest1400() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        length: '3'
    };
    const result = Array.prototype.pop.call(obj);
    return result === undefined && obj.length === 2;
}

// Test length property is negative
export function PopNegativeLengthTest1500() {
    'use strict';
    const obj = {
        0: 'a',
        length: -1
    };
    const result = Array.prototype.pop.call(obj);
    return result === undefined && obj.length === 0;
}

// Test length property is Infinity
export function PopInfinityLengthTest1600() {
    'use strict';
    const obj = {
        0: 'a',
        length: Infinity
    };
    const result = Array.prototype.pop.call(obj);
    return result === undefined && obj.length === 0;
}

// Test pop with WeakMap/WeakSet reference
export function PopWeakMapTest1700() {
    'use strict';
    const wm = new WeakMap();
    const obj = {id: 1};
    wm.set(obj, 'metadata');
    const arr = [obj];
    const popped = arr.pop();
    return wm.get(popped) === 'metadata' && wm.has(obj);
}

// Test pop with WeakSet reference
export function PopWeakSetTest1800() {
    'use strict';
    const ws = new WeakSet();
    const obj = {id: 1};
    ws.add(obj);
    const arr = [obj];
    const popped = arr.pop();
    return ws.has(popped) && ws.has(obj);
}

// Test pop with null as this
export function PopNullThisTest1900() {
    'use strict';
    try {
        Array.prototype.pop.call(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test pop with undefined as this
export function PopUndefinedThisTest2000() {
    'use strict';
    try {
        Array.prototype.pop.call(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test pop with number as this
export function PopNumberThisTest2100() {
    'use strict';
    try {
        Array.prototype.pop.call(42);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test pop with boolean as this
export function PopBooleanThisTest2200() {
    'use strict';
    try {
        Array.prototype.pop.call(true);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test pop with fractional length
export function PopFractionalLengthTest2300() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 2.5
    };
    const result = Array.prototype.pop.call(obj);
    return result === 'b' && obj.length === 1;
}

// Test pop with NaN length
export function PopNaNLengthTest2400() {
    'use strict';
    const obj = {
        0: 'a',
        length: NaN
    };
    const result = Array.prototype.pop.call(obj);
    return result === undefined && obj.length === 0;
}

// Test pop with no length property
export function PopNoLengthTest2500() {
    'use strict';
    const obj = {
        0: 'a',
        1: 'b',
        name: 'test'
    };
    const result = Array.prototype.pop.call(obj);
    return result === undefined && obj.length === 0 && obj[0] === 'a';
}

// Test pop with read-only length in non-strict mode
export function PopNonStrictReadOnlyLengthTest2600() {
    const arr = [1, 2, 3];
    Object.defineProperty(arr, 'length', {
        value: 3,
        writable: false
    });s
    arr.pop();
    return arr.length === 3;
}

// Test pop on frozen array
export function PopFrozenArrayTest2700() {
    'use strict';
    const arr = [1, 2, 3];
    Object.freeze(arr);
    try {
        arr.pop();
        return false;
    } catch (e) {
        return e instanceof TypeError && arr.length === 3;
    }
}

// Test pop on sealed array
export function PopSealedArrayTest2800() {
    'use strict';
    const arr = [1, 2, 3];
    Object.seal(arr);
    try {
        arr.pop();
        return false;
    } catch (e) {
        return e instanceof TypeError && arr.length === 3;
    }
}

// Test pop on non-extensible array
export function PopNonExtensibleArrayTest2900() {
    'use strict';
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    const result = arr.pop();
    return result === 3 && arr.length === 2;
}

// Test pop with non-configurable elements
export function PopNonConfigurableElementTest3000() {
    'use strict';
    const arr = [1, 2, 3];
    Object.defineProperty(arr, '2', {
        value: 3,
        configurable: false,
        writable: false
    });
    try {
        arr.pop();
        return false;
    } catch (e) {
        return e instanceof TypeError && arr.length === 3;
    }
}

// Test pop with getter/setter elements
export function PopGetterSetterElementTest3100() {
    'use strict';
    let value = 10;
    const arr = [];
    Object.defineProperty(arr, '0', {
        get() { return value; },
        set(v) { value = v; },
        configurable: true
    });
    arr.length = 1;
    const result = arr.pop();
    return result === 10 && arr.length === 0;
}


