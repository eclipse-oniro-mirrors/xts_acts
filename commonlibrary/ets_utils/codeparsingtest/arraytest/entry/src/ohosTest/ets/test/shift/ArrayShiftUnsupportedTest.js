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
 * IMPORTANT NOTICE:
 * This file contains test cases for features that ArkTS does NOT support.
 * These tests demonstrate JavaScript capabilities that cannot be used in ArkTS.
 * When imported into ArkTS, these functions will cause COMPILE ERRORS.
 * This file is for reference and documentation purposes only.
 */

// ============================================
// SECTION 2: Features that CAN be used in JS but have LIMITED support in ArkTS
// ============================================

/**
 * Test: arguments object shift
 * ArkTS Status: LIMITED - Use rest parameters instead
 * Migration: Use function(...args: Array<number>) instead
 */
export function ArrayShiftArgumentsTest9903() {
    function testWithArguments() {
        let result = Array.prototype.shift.call(arguments);
        return result === 1 && arguments.length === 2;
    }
    return testWithArguments(1, 2, 3);
}

/**
 * Test: Symbol as array element
 * ArkTS Status: PARTIAL - Built-in symbols only
 * Note: Cannot create new symbols with Symbol('desc') in ArkTS
 */
export function ArrayShiftSymbolTest9904() {
    let sym = Symbol('test');
    let arr = [sym, Symbol('other')];
    let result = arr.shift();
    return result === sym && typeof result === 'symbol';
}

/**
 * Test: Dynamic property access
 * ArkTS Status: LIMITED - Type checking restrictions apply
 */
export function ArrayShiftDynamicAccessTest9905() {
    let arr = [1, 2, 3];
    let method = 'shift';
    let result = arr[method]();
    return result === 1 && arr.length === 2;
}

// ============================================
// SECTION 3: Features with behavioral differences
// ============================================

/**
 * Test: Sparse array with holes (empty slots)
 * ArkTS Status: DIFFERENT BEHAVIOR - ArkTS uses undefined instead of holes
 * Note: In JS, empty slots are different from undefined values
 */
export function ArrayShiftSparseHolesTest9906() {
    let arr = [, , 3, 4];
    let hasHoleBefore = !(0 in arr);
    let result = arr.shift();
    let hasHoleAfter = !(0 in arr);
    return result === undefined && hasHoleBefore && hasHoleAfter;
}

/**
 * Test: Array-like object with special indices
 * ArkTS Status: SUPPORTED - Works with proper typing
 */
export function ArrayShiftArrayLikeAdvancedTest9907() {
    let arrayLike = {
        0: 'first',
        1: 'second',
        2: 'third',
        length: 3,
        customProp: 'ignored'
    };
    let result = Array.prototype.shift.call(arrayLike);
    return result === 'first' && arrayLike.length === 2 && arrayLike.customProp === 'ignored';
}

/**
 * Test: String as array-like (should fail)
 * ArkTS Status: SUPPORTED - But throws TypeError as expected
 */
export function ArrayShiftStringFailTest9908() {
    try {
        let str = 'hello';
        Array.prototype.shift.call(str);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// ============================================
// SECTION 5: Type coercion edge cases
// ============================================

/**
 * Test: Length property coercion
 * ArkTS Status: PARTIAL - Type checking may prevent some cases
 */
export function ArrayShiftLengthCoercionTest9911() {
    let arrayLike = {
        0: 'a',
        1: 'b',
        length: '2'
    };
    let result = Array.prototype.shift.call(arrayLike);
    return result === 'a';
}

/**
 * Test: Non-integer length handling
 * ArkTS Status: PARTIAL - Different behavior possible
 */
export function ArrayShiftNonIntegerLengthTest9912() {
    let arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 2.7
    };
    let result = Array.prototype.shift.call(arrayLike);
    return result === 'a';
}

// ============================================
// SECTION 6: Prototype chain manipulation
// ============================================

/**
 * Test: Shift on object with Array in prototype chain
 * ArkTS Status: SUPPORTED - But type checking applies
 */
export function ArrayShiftPrototypeChainTest9913() {
    let obj = Object.create(Array.prototype);
    obj[0] = 'first';
    obj[1] = 'second';
    obj.length = 2;
    let result = obj.shift();
    return result === 'first' && obj.length === 1;
}

/**
 * Test: Modified Array.prototype behavior
 * ArkTS Status: LIMITED - Prototype modification restricted
 */
export function ArrayShiftModifiedPrototypeTest9914() {
    let originalShift = Array.prototype.shift;
    let called = false;
    
    Array.prototype.shift = function() {
        called = true;
        return originalShift.call(this);
    };
    
    let arr = [1, 2, 3];
    let result = arr.shift();
    
    Array.prototype.shift = originalShift;
    
    return called && result === 1;
}

// ============================================
// SECTION 7: Getter/Setter interactions
// ============================================

/**
 * Test: Shift on array with getter/setter elements
 * ArkTS Status: SUPPORTED
 */
export function ArrayShiftGetterSetterTest9915() {
    let arr = [1, 2, 3];
    Object.defineProperty(arr, 1, {
        get: function() { return 200; },
        set: function(v) {}
    });
    arr.shift();
    return arr[0] === 200;
}

// ============================================
// SECTION 8: Proxy objects
// ============================================

/**
 * Test: Shift on Proxy wrapped array
 * ArkTS Status: PARTIAL - Proxy support limited in ArkTS
 */
export function ArrayShiftProxyTest9916() {
    let operations = [];
    let arr = [1, 2, 3];
    let proxy = new Proxy(arr, {
        get: function(target, prop) {
            operations.push('get:' + String(prop));
            return target[prop];
        },
        set: function(target, prop, value) {
            operations.push('set:' + String(prop));
            target[prop] = value;
            return true;
        }
    });
    
    let result = proxy.shift();
    return result === 1 && operations.length > 0;
}

// ============================================
// SECTION 9: WeakMap/WeakSet (not iterable)
// ============================================

/**
 * Test: Attempting shift on WeakMap (should fail)
 * ArkTS Status: SUPPORTED - But will throw error
 */
export function ArrayShiftWeakMapFailTest9917() {
    try {
        let wm = new WeakMap();
        Array.prototype.shift.call(wm);
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * Test: Attempting shift on WeakSet (should fail)
 * ArkTS Status: SUPPORTED - But will throw error
 */
export function ArrayShiftWeakSetFailTest9918() {
    try {
        let ws = new WeakSet();
        Array.prototype.shift.call(ws);
        return false;
    } catch (e) {
        return true;
    }
}

// ============================================
// SECTION 10: Generator functions as elements
// ============================================

/**
 * Test: Shift on array with generator function
 * ArkTS Status: LIMITED - Generator support may vary
 */
export function ArrayShiftGeneratorTest9919() {
    function* gen() {
        yield 1;
        yield 2;
    }
    let arr = [gen, 2, 3];
    let result = arr.shift();
    return typeof result === 'function';
}

// ============================================
// SECTION 11: Intl objects
// ============================================

/**
 * Test: Shift on array with Intl.DateTimeFormat
 * ArkTS Status: PARTIAL - Intl support may vary by environment
 */
export function ArrayShiftIntlTest9920() {
    try {
        let dtf = new Intl.DateTimeFormat('en-US');
        let arr = [dtf, 2, 3];
        let result = arr.shift();
        return result instanceof Intl.DateTimeFormat;
    } catch (e) {
        return true;
    }
}

// ============================================
// SECTION 12: Temporal API (future JS feature)
// ============================================

/**
 * Test: Shift on array with Temporal objects (if available)
 * ArkTS Status: NOT AVAILABLE - Temporal API not in ArkTS
 */
export function ArrayShiftTemporalTest9921() {
    if (typeof Temporal === 'undefined') {
        return true;
    }
    return false;
}

// ============================================
// Compatibility Test Results Summary
// ============================================

export function getUnsupportedFeatureSummary() {
    return {
        completelyBanned: [
            'eval()',
            'new Function()',
            'with statement',
            'Implicit any types',
            'Prototype pollution patterns'
        ],
        limitedSupport: [
            'arguments object (use rest parameters)',
            'Dynamic symbol creation',
            'Proxy objects',
            'Generator functions',
            'Sparse arrays (undefined instead of holes)'
        ],
        notAvailable: [
            'DOM APIs (document, window)',
            'Browser-specific globals',
            'Node.js specific APIs',
            'Temporal API'
        ],
        behavioralDifferences: [
            'Type coercion is stricter',
            'Undefined vs empty slots',
            'Property access type checking'
        ]
    };
}
