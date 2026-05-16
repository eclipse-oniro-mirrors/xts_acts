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
 * Array.prototype.reduceRight() - Unsupported Feature Tests with Output Logging
 * This file contains tests that log actual outputs for comparison with MD expectations
 */

// ============================================
// Symbol Tests (0100-0200)
// ============================================

/**
 * @tc.name   ArrayReduceRightSymbolInitialTest0100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_SYMBOL_INITIAL_0100
 * @tc.desc   Test reduceRight() with Symbol as initial value
 */
export function ArrayReduceRightSymbolInitialTest0100() {
    'use strict';
    let arr = [1, 2];
    let sym = Symbol('test');

    let firstAcc = null;
    let result = arr.reduceRight((acc, cur) => {
        if (firstAcc === null) {
            firstAcc = acc;
        }
        if (typeof acc === 'symbol') {
            return cur;
        }
        return acc;
    }, sym);

    let pass = typeof firstAcc === 'symbol' && result === 2;
    return pass;
}
/**
 * @tc.name   ArrayReduceRightSymbolArrayTest0200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_SYMBOL_ARRAY_0200
 * @tc.desc   Test reduceRight() with array of Symbols
 */
export function ArrayReduceRightSymbolArrayTest0200() {
    'use strict';
    console.log('[Test0200] Testing array of Symbols');
    
    let arr = [Symbol('a'), Symbol('b'), Symbol('c')];
    console.log('[Test0200] Array length:', arr.length);
    console.log('[Test0200] Symbols:', arr.map(s => s.toString()));
    
    let result = arr.reduceRight((acc, cur, index) => {
        console.log(`[Test0200] Index ${index}: acc="${acc}", cur=${cur.toString()}`);
        return acc + String(cur);
    }, '');
    
    console.log('[Test0200] Concatenated result:', result);
    console.log('[Test0200] Result length:', result.length);
    
    let pass = result.includes('Symbol') && result.length > 0;
    console.log('[Test0200] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

// ============================================
// BigInt Tests (0300-0400)
// ============================================

/**
 * @tc.name   ArrayReduceRightBigIntInitialTest0300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_BIGINT_INITIAL_0300
 * @tc.desc   Test reduceRight() with BigInt initial value
 */
export function ArrayReduceRightBigIntInitialTest0300() {
    'use strict';
    console.log('[Test0300] Testing BigInt addition');
    
    let arr = [1n, 2n, 3n];
    console.log('[Test0300] Input array:', arr.map(x => x.toString() + 'n'));
    console.log('[Test0300] Initial value: 0n');
    
    let result = arr.reduceRight((acc, cur, index) => {
        console.log(`[Test0300] Index ${index}: acc=${acc}n, cur=${cur}n, sum=${acc + cur}n`);
        return acc + cur;
    }, 0n);
    
    console.log('[Test0300] Final result:', result.toString() + 'n');
    console.log('[Test0300] Result type:', typeof result);
    
    let pass = result === 6n && typeof result === 'bigint';
    console.log('[Test0300] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

/**
 * @tc.name   ArrayReduceRightBigInt64ArrayTest0400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_BIGINT64_0400
 * @tc.desc   Test reduceRight() on BigInt64Array
 */
export function ArrayReduceRightBigInt64ArrayTest0400() {
    'use strict';
    console.log('[Test0400] Testing BigInt64Array');
    
    let arr = new BigInt64Array([1n, 2n, 3n]);
    console.log('[Test0400] BigInt64Array:', Array.from(arr).map(x => x.toString() + 'n'));
    console.log('[Test0400] Array type:', arr.constructor.name);
    
    let sum = arr.reduceRight((acc, cur) => acc + cur, 0n);
    console.log('[Test0400] Reduce result:', sum.toString() + 'n');
    
    let pass = sum === 6n;
    console.log('[Test0400] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

// ============================================
// Promise Tests (0500-0600)
// ============================================

/**
 * @tc.name   ArrayReduceRightPromiseChainTest0500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_PROMISE_0500
 * @tc.desc   Test reduceRight() creating promise chain
 */
export function ArrayReduceRightPromiseChainTest0500() {
    'use strict';
    console.log('[Test0500] Testing Promise chain creation');
    
    let arr = [1, 2, 3];
    console.log('[Test0500] Input array:', arr);
    
    let result = arr.reduceRight(async (acc, cur) => {
        let val = await acc;
        console.log(`[Test0500] Resolved acc=${val}, cur=${cur}, returning Promise(${val + cur})`);
        return val + cur;
    }, Promise.resolve(0));
    
    console.log('[Test0500] Result type:', result.constructor.name);
    console.log('[Test0500] Is Promise:', result instanceof Promise);
    
    let pass = result instanceof Promise;
    console.log('[Test0500] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

/**
 * @tc.name   ArrayReduceRightPromiseResolveTest0600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_PROMISE_RESOLVE_0600
 * @tc.desc   Test reduceRight() promise chain resolves correctly
 */
export async function ArrayReduceRightPromiseResolveTest0600() {
    'use strict';
    console.log('[Test0600] Testing Promise chain resolution');
    
    let arr = [1, 2, 3];
    console.log('[Test0600] Input array:', arr);
    console.log('[Test0600] Initial: Promise.resolve(0)');
    
    let result = await arr.reduceRight(async (acc, cur) => {
        let val = await acc;
        let newVal = val + cur;
        console.log(`[Test0600] ${val} + ${cur} = ${newVal}`);
        return newVal;
    }, Promise.resolve(0));
    
    console.log('[Test0600] Final resolved value:', result);
    console.log('[Test0600] Expected: 6');
    
    let pass = result === 6;
    console.log('[Test0600] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

// ============================================
// Array-like Tests (0700-0900)
// ============================================

/**
 * @tc.name   ArrayReduceRightArrayLikeBasicTest0700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_ARRAYLIKE_BASIC_0700
 * @tc.desc   Test reduceRight() on array-like object using Function.call
 */
export function ArrayReduceRightArrayLikeBasicTest0700() {
    'use strict';
    console.log('[Test0700] Testing array-like object with Function.call');
    
    let arrayLike = {
        0: 1,
        1: 2,
        2: 3,
        length: 3
    };
    console.log('[Test0700] Array-like object:', arrayLike);
    console.log('[Test0700] Using: Array.prototype.reduceRight.call()');
    
    let result = Array.prototype.reduceRight.call(arrayLike, (acc, cur, index) => {
        console.log(`[Test0700] Index ${index}: acc=${acc}, cur=${cur}`);
        return acc + cur;
    }, 0);
    
    console.log('[Test0700] Final result:', result);
    console.log('[Test0700] Expected: 6');
    
    let pass = result === 6;
    console.log('[Test0700] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

/**
 * @tc.name   ArrayReduceRightArrayLikeStringTest0800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_ARRAYLIKE_STRING_0800
 * @tc.desc   Test reduceRight() on string (array-like) using Function.call
 */
export function ArrayReduceRightArrayLikeStringTest0800() {
    'use strict';
    console.log('[Test0800] Testing string as array-like with Function.call');
    
    let str = 'abc';
    console.log('[Test0800] Input string:', str);
    console.log('[Test0800] String length:', str.length);
    console.log('[Test0800] String indices: 0="' + str[0] + '", 1="' + str[1] + '", 2="' + str[2] + '"');
    
    let result = Array.prototype.reduceRight.call(str, (acc, cur, index) => {
        console.log(`[Test0800] Index ${index}: acc="${acc}", cur="${cur}"`);
        return acc + cur;
    }, '');
    
    console.log('[Test0800] Concatenated result:', result);
    console.log('[Test0800] Expected: "cba"');
    
    let pass = result === 'cba';
    console.log('[Test0800] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

/**
 * @tc.name   ArrayReduceRightArgumentsTest0900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_ARGUMENTS_0900
 * @tc.desc   Test reduceRight() on arguments object using Function.call
 */
export function ArrayReduceRightArgumentsTest0900() {
    'use strict';
    console.log('[Test0900] Testing arguments object with Function.call');
    
    function testFunc() {
        console.log('[Test0900] Arguments object length:', arguments.length);
        console.log('[Test0900] Arguments:', Array.from(arguments));
        
        let result = Array.prototype.reduceRight.call(arguments, (acc, cur, index) => {
            console.log(`[Test0900] Index ${index}: acc=${acc}, cur=${cur}`);
            return acc + cur;
        }, 0);
        
        console.log('[Test0900] Result:', result);
        return result;
    }
    
    let result = testFunc(1, 2, 3);
    console.log('[Test0900] Expected: 6');
    
    let pass = result === 6;
    console.log('[Test0900] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

// ============================================
// Callback Validation Tests (1000-1400)
// ============================================

/**
 * @tc.name   ArrayReduceRightCallbackUndefinedTest1000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_CB_UNDEF_1000
 * @tc.desc   Test reduceRight() with undefined callback throws TypeError
 */
export function ArrayReduceRightCallbackUndefinedTest1000() {
    'use strict';
    console.log('[Test1000] Testing undefined callback');
    
    let arr = [1, 2, 3];
    console.log('[Test1000] Array:', arr);
    console.log('[Test1000] Callback: undefined');
    
    try {
        arr.reduceRight(undefined);
        console.log('[Test1000] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1000] Exception thrown:', e.name);
        console.log('[Test1000] Message:', e.message);
        console.log('[Test1000] Is TypeError:', e instanceof TypeError);
        let pass = e instanceof TypeError;
        console.log('[Test1000] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

/**
 * @tc.name   ArrayReduceRightCallbackNullTest1100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_CB_NULL_1100
 * @tc.desc   Test reduceRight() with null callback throws TypeError
 */
export function ArrayReduceRightCallbackNullTest1100() {
    'use strict';
    console.log('[Test1100] Testing null callback');
    
    let arr = [1, 2, 3];
    console.log('[Test1100] Array:', arr);
    console.log('[Test1100] Callback: null');
    
    try {
        arr.reduceRight(null);
        console.log('[Test1100] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1100] Exception thrown:', e.name);
        console.log('[Test1100] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1100] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

/**
 * @tc.name   ArrayReduceRightCallbackNumberTest1200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_CB_NUMBER_1200
 * @tc.desc   Test reduceRight() with number callback throws TypeError
 */
export function ArrayReduceRightCallbackNumberTest1200() {
    'use strict';
    console.log('[Test1200] Testing number callback');
    
    let arr = [1, 2, 3];
    console.log('[Test1200] Array:', arr);
    console.log('[Test1200] Callback: 123');
    
    try {
        arr.reduceRight(123);
        console.log('[Test1200] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1200] Exception thrown:', e.name);
        console.log('[Test1200] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1200] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

/**
 * @tc.name   ArrayReduceRightCallbackStringTest1300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_CB_STRING_1300
 * @tc.desc   Test reduceRight() with string callback throws TypeError
 */
export function ArrayReduceRightCallbackStringTest1300() {
    'use strict';
    console.log('[Test1300] Testing string callback');
    
    let arr = [1, 2, 3];
    console.log('[Test1300] Array:', arr);
    console.log('[Test1300] Callback: "not a function"');
    
    try {
        arr.reduceRight('not a function');
        console.log('[Test1300] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1300] Exception thrown:', e.name);
        console.log('[Test1300] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1300] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

/**
 * @tc.name   ArrayReduceRightCallbackObjectTest1400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_CB_OBJECT_1400
 * @tc.desc   Test reduceRight() with object callback throws TypeError
 */
export function ArrayReduceRightCallbackObjectTest1400() {
    'use strict';
    console.log('[Test1400] Testing object callback');
    
    let arr = [1, 2, 3];
    console.log('[Test1400] Array:', arr);
    console.log('[Test1400] Callback: {}');
    
    try {
        arr.reduceRight({});
        console.log('[Test1400] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1400] Exception thrown:', e.name);
        console.log('[Test1400] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1400] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

// ============================================
// Missing Callback Tests (1500)
// ============================================

/**
 * @tc.name   ArrayReduceRightNoCallbackTest1500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_NO_CB_1500
 * @tc.desc   Test reduceRight() with no callback throws TypeError
 */
export function ArrayReduceRightNoCallbackTest1500() {
    'use strict';
    console.log('[Test1500] Testing missing callback');
    
    let arr = [1, 2, 3];
    console.log('[Test1500] Array:', arr);
    console.log('[Test1500] Callback: (none)');
    
    try {
        arr.reduceRight();
        console.log('[Test1500] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1500] Exception thrown:', e.name);
        console.log('[Test1500] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1500] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

// ============================================
// Property Access Tests (1600-1700)
// ============================================

/**
 * @tc.name   ArrayReduceRightAccessNullPropertyTest1600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_NULL_PROP_1600
 * @tc.desc   Test reduceRight() accessing property of null throws TypeError
 */
export function ArrayReduceRightAccessNullPropertyTest1600() {
    'use strict';
    console.log('[Test1600] Testing null property access');
    
    let arr = [1, null, 3];
    console.log('[Test1600] Array:', arr);
    console.log('[Test1600] Attempting: null.value');
    
    try {
        arr.reduceRight((acc, cur, index) => {
            console.log(`[Test1600] Index ${index}: cur=`, cur);
            if (cur === null) {
                console.log('[Test1600] Accessing null.value...');
            }
            return acc + cur.value; // null.value throws
        }, 0);
        console.log('[Test1600] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1600] Exception thrown:', e.name);
        console.log('[Test1600] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1600] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

/**
 * @tc.name   ArrayReduceRightAccessUndefinedPropertyTest1700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_UNDEF_PROP_1700
 * @tc.desc   Test reduceRight() accessing property of undefined throws TypeError
 */
export function ArrayReduceRightAccessUndefinedPropertyTest1700() {
    'use strict';
    console.log('[Test1700] Testing undefined property access');
    
    let arr = [1, undefined, 3];
    console.log('[Test1700] Array:', arr);
    console.log('[Test1700] Attempting: undefined.value');
    
    try {
        arr.reduceRight((acc, cur, index) => {
            console.log(`[Test1700] Index ${index}: cur=`, cur);
            if (cur === undefined) {
                console.log('[Test1700] Accessing undefined.value...');
            }
            return acc + cur.value; // undefined.value throws
        }, 0);
        console.log('[Test1700] ERROR: No exception thrown');
        return false;
    } catch (e) {
        console.log('[Test1700] Exception thrown:', e.name);
        console.log('[Test1700] Message:', e.message);
        let pass = e instanceof TypeError;
        console.log('[Test1700] Test result:', pass ? 'PASS' : 'FAIL');
        return pass;
    }
}

// ============================================
// Array Modification Tests (1800)
// ============================================

/**
 * @tc.name   ArrayReduceRightDeleteElementTest1800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_DELETE_1800
 * @tc.desc   Test reduceRight() deleting element during iteration
 */
export function ArrayReduceRightDeleteElementTest1800() {
    'use strict';
    console.log('[Test1800] Testing array modification during iteration');
    
    let arr = [1, 2, 3, 4, 5];
    console.log('[Test1800] Initial array:', arr);
    
    let visited = [];
    let result = arr.reduceRight((acc, cur, index, array) => {
        visited.push({ index, value: cur });
        console.log(`[Test1800] Index ${index}: acc=${acc}, cur=${cur}`);
        
        if (cur === 3) {
            console.log(`[Test1800] Removing element at index ${index}`);
            array.splice(index, 1); // Delete current element
            console.log('[Test1800] Array after removal:', [...array]);
        }
        
        return acc + cur;
    }, 0);
    
    console.log('[Test1800] Visited elements:', visited);
    console.log('[Test1800] Final result:', result);
    console.log('[Test1800] Final array:', arr);
    console.log('[Test1800] Expected sum: 15 (1+2+3+4+5)');
    
    let pass = visited.length === 5 && result === 15;
    console.log('[Test1800] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

// ============================================
// Iterator/Generator Tests (1900-2000)
// ============================================

/**
 * @tc.name   ArrayReduceRightIteratorTest1900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_ITERATOR_1900
 * @tc.desc   Test reduceRight() with iterator object
 */
export function ArrayReduceRightIteratorTest1900() {
    'use strict';
    console.log('[Test1900] Testing iterator object');
    
    let obj = {
        0: 1,
        1: 2,
        2: 3,
        length: 3,
        [Symbol.iterator]: function() {
            let i = 0;
            return {
                next: () => ({
                    value: this[i++],
                    done: i > this.length
                })
            };
        }
    };
    
    console.log('[Test1900] Object with iterator:', obj);
    console.log('[Test1900] Has Symbol.iterator:', Symbol.iterator in obj);
    
    let arr = Array.from(obj);
    console.log('[Test1900] Array.from(obj):', arr);
    
    let result = arr.reduceRight((acc, cur, index) => {
        console.log(`[Test1900] Index ${index}: acc=${acc}, cur=${cur}`);
        return acc + cur;
    }, 0);
    
    console.log('[Test1900] Final result:', result);
    console.log('[Test1900] Expected: 6');
    
    let pass = result === 6;
    console.log('[Test1900] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

/**
 * @tc.name   ArrayReduceRightGeneratorTest2000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_HYBRID_GENERATOR_2000
 * @tc.desc   Test reduceRight() with generator function
 */
export function ArrayReduceRightGeneratorTest2000() {
    'use strict';
    console.log('[Test2000] Testing generator function');
    
    function* gen() {
        console.log('[Test2000] Generator yielding 1');
        yield 1;
        console.log('[Test2000] Generator yielding 2');
        yield 2;
        console.log('[Test2000] Generator yielding 3');
        yield 3;
        console.log('[Test2000] Generator done');
    }
    
    console.log('[Test2000] Creating generator...');
    let genInstance = gen();
    console.log('[Test2000] Generator instance:', genInstance);
    
    let arr = [...gen()];
    console.log('[Test2000] Spread into array:', arr);
    
    let result = arr.reduceRight((acc, cur, index) => {
        console.log(`[Test2000] Index ${index}: acc=${acc}, cur=${cur}`);
        return acc + cur;
    }, 0);
    
    console.log('[Test2000] Final result:', result);
    console.log('[Test2000] Expected: 6');
    
    let pass = result === 6;
    console.log('[Test2000] Test result:', pass ? 'PASS' : 'FAIL');
    return pass;
}

// ============================================
// Helper function to run all tests
// ============================================

export async function runAllTests() {
    console.log('\n========================================');
    console.log('Running All reduceRight Hybrid Tests');
    console.log('========================================\n');
    
    const tests = [
        ArrayReduceRightSymbolInitialTest0100,
        ArrayReduceRightSymbolArrayTest0200,
        ArrayReduceRightBigIntInitialTest0300,
        ArrayReduceRightBigInt64ArrayTest0400,
        ArrayReduceRightPromiseChainTest0500,
        ArrayReduceRightArrayLikeBasicTest0700,
        ArrayReduceRightArrayLikeStringTest0800,
        ArrayReduceRightArgumentsTest0900,
        ArrayReduceRightCallbackUndefinedTest1000,
        ArrayReduceRightCallbackNullTest1100,
        ArrayReduceRightCallbackNumberTest1200,
        ArrayReduceRightCallbackStringTest1300,
        ArrayReduceRightCallbackObjectTest1400,
        ArrayReduceRightNoCallbackTest1500,
        ArrayReduceRightAccessNullPropertyTest1600,
        ArrayReduceRightAccessUndefinedPropertyTest1700,
        ArrayReduceRightDeleteElementTest1800,
        ArrayReduceRightIteratorTest1900,
        ArrayReduceRightGeneratorTest2000
    ];
    
    let passCount = 0;
    let failCount = 0;
    
    for (const test of tests) {
        try {
            console.log(`\n--- Running ${test.name} ---`);
            let result = test();
            if (result instanceof Promise) {
                result = await result;
            }
            if (result) {
                passCount++;
            } else {
                failCount++;
            }
        } catch (e) {
            console.log(`ERROR in ${test.name}:`, e.message);
            failCount++;
        }
    }
    
    console.log('\n========================================');
    console.log(`Results: ${passCount} passed, ${failCount} failed`);
    console.log('========================================\n');
    
    return { passCount, failCount };
}
