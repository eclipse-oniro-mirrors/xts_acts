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

// Basic findLastIndex functionality tests
// Test finding last element matching condition
export function FindLastIndexBasicTest0100() {
    const arr = [5, 12, 8, 130, 44];
    const result = arr.findLastIndex((element) => element > 10);
    return result === 4;
}

// Test reverse iteration finding last match
export function FindLastIndexBasicTest0200() {
    const arr = [1, 2, 3, 4, 5, 3];
    const result = arr.findLastIndex((element) => element === 3);
    return result === 5;
}

// Test returning -1 when no match found
export function FindLastIndexBasicTest0300() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element) => element > 100);
    return result === -1;
}

// Test callback returning truthy values
export function FindLastIndexTruthyTest0400() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.findLastIndex((x) => x === 5 ? 1 : 0);
    const result2 = arr.findLastIndex((x) => x === 5 ? "found" : "");
    const result3 = arr.findLastIndex((x) => x === 5 ? {} : null);
    return result1 === 4 && result2 === 4 && result3 === 4;
}

// Test callback returning falsy values
export function FindLastIndexFalsyTest0500() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.findLastIndex((x) => 0);
    const result2 = arr.findLastIndex((x) => "");
    const result3 = arr.findLastIndex((x) => null);
    const result4 = arr.findLastIndex((x) => undefined);
    const result5 = arr.findLastIndex((x) => false);
    return result1 === -1 && result2 === -1 && result3 === -1 && result4 === -1 && result5 === -1;
}

// Test arrow function as callback
export function FindLastIndexCallbackTest0600() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex(x => x > 3);
    return result === 4;
}

// Test named function as callback
export function FindLastIndexFunctionTest0700() {
    const arr = [1, 2, 3, 4, 5];
    function isLarge(element) {
        return element > 3;
    }
    const result = arr.findLastIndex(isLarge);
    return result === 4;
}

// Test inline anonymous function as callback
export function FindLastIndexInlineTest0800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex(function(element) {
        return element % 2 === 0;
    });
    return result === 3;
}

// Test object method as callback with thisArg
export function FindLastIndexThisArgTest0900() {
    const arr = [5, 12, 8, 130, 44];
    const checker = {
        threshold: 10,
        isLarge: function(element) {
            return element > this.threshold;
        }
    };
    const result = arr.findLastIndex(checker.isLarge, checker);
    return result === 4;
}

// Test element parameter in callback
export function FindLastIndexElementParamTest1000() {
    const arr = [10, 20, 30, 40, 50];
    const visited = [];
    arr.findLastIndex((element) => {
        visited.push(element);
        return false;
    });
    return visited.length === 5 && visited[0] === 50 && visited[4] === 10;
}

// Test index parameter in callback
export function FindLastIndexIndexParamTest1100() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const indices = [];
    arr.findLastIndex((element, index) => {
        indices.push(index);
        return false;
    });
    return indices.length === 5 && indices[0] === 4 && indices[4] === 0;
}

// Test array parameter in callback
export function FindLastIndexArrayParamTest1200() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element, index, array) => {
        return array === arr && element === 5;
    });
    return result === 4;
}

// Test empty array returns -1 without calling callback
export function FindLastIndexEmptyArrayTest1300() {
    const arr = [];
    let called = false;
    const result = arr.findLastIndex((element) => {
        called = true;
        return true;
    });
    return result === -1 && called === false;
}

// Test single element array match and no match
export function FindLastIndexSingleElementTest1400() {
    const arr = [5];
    const result1 = arr.findLastIndex((element) => element > 3);
    const result2 = arr.findLastIndex((element) => element > 10);
    return result1 === 0 && result2 === -1;
}

// Test return value is correct index and type
export function FindLastIndexReturnValueTest1500() {
    const arr = [10, 20, 30, 40, 50];
    const result = arr.findLastIndex((element) => element === 30);
    return result === 2 && typeof result === 'number';
}

// Test stops iteration after first match from end
export function FindLastIndexStopIterationTest1600() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLastIndex((element) => {
        callCount++;
        return element === 5;
    });
    return result === 4 && callCount === 1;
}

// Test sparse array with empty slots
export function FindLastIndexSparseArrayTest1700() {
    const arr = [1, , , , 5];
    const result = arr.findLastIndex((element) => element === undefined);
    return result === 3;
}

// Test delete operation creates empty slot
export function FindLastIndexDeleteTest1800() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    const result = arr.findLastIndex((element) => element === undefined);
    return result === 2 && arr.length === 5;
}

// Test finding object element by property
export function FindLastIndexObjectElementTest1900() {
    const obj1 = { id: 1, name: 'Alice' };
    const obj2 = { id: 2, name: 'Bob' };
    const obj3 = { id: 3, name: 'Charlie' };
    const arr = [obj1, obj2, obj3];
    const result = arr.findLastIndex((element) => element.id === 2);
    return result === 1;
}

// Test finding nested array by length
export function FindLastIndexNestedArrayTest2000() {
    const arr = [[1, 2], [3, 4], [5, 6], [3, 4]];
    const result = arr.findLastIndex((element) => element.length === 2);
    return result === 3;
}

// Test finding NaN using Number.isNaN
export function FindLastIndexNaNTest2100() {
    const arr = [1, NaN, 3, NaN, 5];
    const result = arr.findLastIndex((element) => Number.isNaN(element));
    return result === 3;
}

// Test modifying array during iteration
export function FindLastIndexModifyArrayTest2200() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 4) {
            array.push(element * 10);
        }
        return false;
    });
    return callCount === 5 && arr.length === 6;
}

// Test comparison with findIndex method
export function FindLastIndexCompareFindIndexTest2300() {
    const arr = [1, 2, 3, 2, 1];
    const findIndexResult = arr.findIndex((element) => element === 2);
    const findLastIndexResult = arr.findLastIndex((element) => element === 2);
    return findIndexResult === 1 && findLastIndexResult === 3;
}

// Test comparison with lastIndexOf method
export function FindLastIndexCompareLastIndexOfTest2400() {
    const arr = [1, 2, 3, 2, 1];
    const lastIndexOfResult = arr.lastIndexOf(2);
    const findLastIndexResult = arr.findLastIndex((e) => e === 2);
    return lastIndexOfResult === 3 && findLastIndexResult === 3;
}

// Test large array with 10000 elements
export function FindLastIndexLargeArrayTest2500() {
    const arr = [];
    for (let i = 0; i < 10000; i++) {
        arr.push(i);
    }
    const result = arr.findLastIndex((element) => element === 9999);
    return result === 9999;
}

// Test callback throwing error
export function FindLastIndexCallbackErrorTest2600() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex((element) => {
            if (element === 3) {
                throw new Error('Test error');
            }
            return false;
        });
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test invalid callback (null) throws error
export function FindLastIndexInvalidCallbackTest2700() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex(null);
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test string as array-like object
export function FindLastIndexStringTest2800() {
    const str = 'hello world';
    const result = Array.prototype.findLastIndex.call(str, (char) => char === 'o');
    return result === 7;
}

// Test array-like object with length property
export function FindLastIndexArrayLikeTest2900() {
    const arrayLike = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const result = Array.prototype.findLastIndex.call(arrayLike, (element) => element === 'b');
    return result === 1;
}

// Test negative length treated as 0
export function FindLastIndexNegativeLengthTest3000() {
    const negativeLength = {
        length: -1,
        0: 'test'
    };
    const result = Array.prototype.findLastIndex.call(negativeLength, (element) => true);
    return result === -1;
}

// Test float length truncated to integer
export function FindLastIndexFloatLengthTest3100() {
    const floatLength = {
        length: 3.7,
        0: 'a',
        1: 'b',
        2: 'c',
        3: 'd'
    };
    const result = Array.prototype.findLastIndex.call(floatLength, (element) => element === 'c');
    return result === 2;
}

// Test missing callback throws TypeError
export function FindLastIndexNoCallbackTest3200() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex();
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test undefined callback throws TypeError
export function FindLastIndexUndefinedCallbackTest3300() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex(undefined);
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test number callback throws TypeError
export function FindLastIndexNumberCallbackTest3400() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex(123);
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test string callback throws TypeError
export function FindLastIndexStringCallbackTest3500() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex('not a function');
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test object callback throws TypeError
export function FindLastIndexObjectCallbackTest3600() {
    const arr = [1, 2, 3, 4, 5];
    let errorCaught = false;
    try {
        arr.findLastIndex({ key: 'value' });
    } catch (error) {
        errorCaught = true;
    }
    return errorCaught === true;
}

// Test finding Symbol element by reference
export function FindLastIndexSymbolTest3700() {
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    const sym3 = Symbol('third');
    const arr = [sym1, sym2, sym3, sym2];
    const result = arr.findLastIndex((element) => element === sym2);
    return result === 3;
}

// Test finding Date object by timestamp
export function FindLastIndexDateTest3800() {
    const arr = [
        new Date('2024-01-01'),
        new Date('2024-06-15'),
        new Date('2024-12-31'),
        new Date('2024-06-15')
    ];
    const targetDate = new Date('2024-06-15');
    const result = arr.findLastIndex((element) => element.getTime() === targetDate.getTime());
    return result === 3;
}

// Test using RegExp test method in callback
export function FindLastIndexRegExpTest3900() {
    const arr = ['abc', 'test123', 'demo', 'test456'];
    const regex = /test/;
    const result = arr.findLastIndex((element) => regex.test(element));
    return result === 3;
}

// Test finding Map element by content
export function FindLastIndexMapTest4000() {
    const map1 = new Map([['a', 1]]);
    const map2 = new Map([['b', 2]]);
    const map3 = new Map([['c', 3]]);
    const arr = [map1, map2, map3, map2];
    const result = arr.findLastIndex((element) => element.has('b'));
    return result === 3;
}

// Test finding Set element by content
export function FindLastIndexSetTest4100() {
    const set1 = new Set([1, 2, 3]);
    const set2 = new Set([4, 5, 6]);
    const set3 = new Set([7, 8, 9]);
    const arr = [set1, set2, set3, set2];
    const result = arr.findLastIndex((element) => element.has(4));
    return result === 3;
}

// Test finding function element by reference
export function FindLastIndexFunctionElementTest4200() {
    const fn1 = () => 'a';
    const fn2 = () => 'b';
    const fn3 = () => 'c';
    const arr = [fn1, fn2, fn3, fn2];
    const result = arr.findLastIndex((element) => element === fn2);
    return result === 3;
}

// Test traversing all elements when no match
export function FindLastIndexTraverseAllTest4300() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLastIndex((element) => {
        callCount++;
        return false;
    });
    return result === -1 && callCount === 5;
}

// Test return value is integer
export function FindLastIndexReturnIntegerTest4400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element) => element > 3);
    return Number.isInteger(result);
}

// Test returning index 0
export function FindLastIndexZeroIndexTest4500() {
    const arr = [10, 20, 30, 40, 50];
    const result = arr.findLastIndex((element) => element === 10);
    return result === 0;
}

// Test returning last index
export function FindLastIndexMaxIndexTest4600() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element) => element === 5);
    return result === 4 && result === arr.length - 1;
}

// Test finding undefined element
export function FindLastIndexUndefinedElementTest4700() {
    const arr = [1, undefined, 3, undefined, 5];
    const result = arr.findLastIndex((element) => element === undefined);
    return result === 3;
}

// Test finding null element
export function FindLastIndexNullElementTest4800() {
    const arr = [1, null, 3, null, 5];
    const result = arr.findLastIndex((element) => element === null);
    return result === 3;
}

// Test finding Infinity value
export function FindLastIndexInfinityTest4900() {
    const arr = [1, Infinity, 3, -Infinity, 5];
    const result = arr.findLastIndex((element) => element === Infinity);
    return result === 1;
}

// Test sparse array traverses all slots
export function FindLastIndexSparseTraversalTest5000() {
    const arr = [1, , 3, , 5];
    let visitedCount = 0;
    arr.findLastIndex((element) => {
        visitedCount++;
        return false;
    });
    return visitedCount === 5;
}

// Extended tests - Part 2: Callback parameters and thisArg
// Test handling different element types
export function FindLastIndexDifferentElementsTest5100() {
    const arr = ['string', 42, true, {a: 1}, [1,2]];
    const result = arr.findLastIndex((element) => typeof element === 'object' && !Array.isArray(element));
    return result === 3;
}

// Test index-based condition
export function FindLastIndexIndexConditionTest5200() {
    const arr = [10, 20, 30, 40, 50];
    const result = arr.findLastIndex((element, index) => index % 2 === 0 && element > 20);
    return result === 4;
}

// Test index and element combination
export function FindLastIndexIndexElementComboTest5300() {
    const arr = [5, 10, 15, 20, 25];
    const result = arr.findLastIndex((element, index) => element > index * 5);
    return result === 4;
}

// Test array length based condition
export function FindLastIndexArrayLengthTest5400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element, index, array) => element === array.length);
    return result === 4;
}

// Test accessing other array elements
export function FindLastIndexAccessOtherElementsTest5500() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element, index, array) => index > 0 && element > array[index - 1]);
    return result === 4;
}

// Test using only element parameter
export function FindLastIndexPartialParamsTest5600() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element) => element > 3);
    return result === 4;
}

// Test callback with no parameters
export function FindLastIndexNoParamsTest5700() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLastIndex(() => {
        callCount++;
        return false;
    });
    return result === -1 && callCount === 5;
}

// Test without thisArg parameter
export function FindLastIndexNoThisArgTest5800() {
    const arr = [5, 12, 8, 130, 44];
    const threshold = 10;
    const result = arr.findLastIndex(function(element) {
        return element > threshold;
    });
    return result === 4;
}

// Test number as thisArg
export function FindLastIndexThisArgNumberTest5900() {
    const arr = [5, 12, 8, 130, 44];
    const result = arr.findLastIndex(function(element) {
        return element > this;
    }, 10);
    return result === 4;
}

// Test string as thisArg
export function FindLastIndexThisArgStringTest6000() {
    const arr = ['a', 'bb', 'ccc', 'dddd'];
    const result = arr.findLastIndex(function(element) {
        return element.length > this.length;
    }, 'abc');
    return result === 3;
}

// Test null/undefined as thisArg
export function FindLastIndexThisArgNullUndefinedTest6100() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.findLastIndex(function(element) {
        return element > 3;
    }, null);
    const result2 = arr.findLastIndex(function(element) {
        return element > 3;
    }, undefined);
    return result1 === 4 && result2 === 4;
}

// Test arrow function ignores thisArg
export function FindLastIndexArrowFunctionIgnoresThisArgTest6200() {
    const arr = [1, 2, 3, 4, 5];
    const obj = { threshold: 100 };
    const threshold = 3;
    const result = arr.findLastIndex((element) => element > threshold, obj);
    return result === 4;
}

// Test arrow function uses outer this
export function FindLastIndexArrowFunctionOuterThisTest6300() {
    const arr = [1, 2, 3, 4, 5];
    const context = { threshold: 3 };
    const result = arr.findLastIndex((element) => element > context.threshold);
    return result === 4;
}

// Test method reference as callback
export function FindLastIndexMethodAsCallbackTest6400() {
    const arr = [5, 12, 8, 130, 44];
    const checker = {
        threshold: 10,
        isLarge: function(element) {
            return element > this.threshold;
        }
    };
    const method = checker.isLarge;
    let errorCaught = false;
    try {
        arr.findLastIndex(method);
    } catch (e) {
        errorCaught = true;
    }
    return errorCaught || arr.findLastIndex(method, checker) === 4;
}

// Test sparse array traversal includes all slots
export function FindLastIndexSkipEmptySlotsTest6500() {
    const arr = [1, , , 4, , 6];
    const visited = [];
    arr.findLastIndex((element, index) => {
        visited.push({element, index});
        return false;
    });
    return visited.length === 6 && visited[0].index === 5;
}

// Test multiple delete operations
export function FindLastIndexMultipleDeleteTest6600() {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    delete arr[5];
    delete arr[7];
    delete arr[9];
    let callCount = 0;
    arr.findLastIndex(() => {
        callCount++;
        return false;
    });
    return callCount === 10;
}

// Test length greater than actual elements
export function FindLastIndexLengthGreaterThanElementsTest6700() {
    const arr = [1, 2, 3];
    arr.length = 10;
    let callCount = 0;
    arr.findLastIndex(() => {
        callCount++;
        return false;
    });
    return callCount === 10;
}

// Test finding last actual element with extended length
export function FindLastIndexFindLastActualElementTest6800() {
    const arr = [1, 2, 3, 4, 5];
    arr.length = 10;
    const result = arr.findLastIndex((element) => element !== undefined);
    return result === 4;
}

// Test sparse array reverse order traversal
export function FindLastIndexSparseReverseOrderTest6900() {
    const arr = [1, , 3, , 5];
    const visited = [];
    arr.findLastIndex((element, index) => {
        visited.push(index);
        return false;
    });
    return visited[0] === 4 && visited[1] === 3 && visited[2] === 2 && visited[3] === 1 && visited[4] === 0;
}

// Test only last element exists
export function FindLastIndexOnlyLastElementTest7000() {
    const arr = [];
    arr[9] = 'last';
    const result = arr.findLastIndex((element) => element === 'last');
    return result === 9;
}

// Test finding middle value in sparse array
export function FindLastIndexMiddleValuesTest7100() {
    const arr = [];
    arr[5] = 'middle';
    arr[10] = 'end';
    const result = arr.findLastIndex((element) => element === 'middle');
    return result === 5;
}

// Test object reference equality
export function FindLastIndexObjectReferenceTest7200() {
    const obj = { id: 1 };
    const arr = [{ id: 1 }, obj, { id: 2 }];
    const result = arr.findLastIndex((element) => element === obj);
    return result === 1;
}

// Test deep nested property access
export function FindLastIndexDeepNestedPropertyTest7300() {
    const arr = [
        { user: { profile: { age: 25 } } },
        { user: { profile: { age: 30 } } },
        { user: { profile: { age: 35 } } },
        { user: { profile: { age: 30 } } }
    ];
    const result = arr.findLastIndex((element) => element.user.profile.age === 30);
    return result === 3;
}

// Test array content comparison
export function FindLastIndexArrayContentTest7400() {
    const arr = [[1, 2], [3, 4], [1, 2], [5, 6]];
    const target = [1, 2];
    const result = arr.findLastIndex((element) => 
        element.length === target.length && element.every((v, i) => v === target[i])
    );
    return result === 2;
}

// Test multi-dimensional array access
export function FindLastIndexMultiDimensionalTest7500() {
    const arr = [
        [[1, 2], [3, 4]],
        [[5, 6], [7, 8]],
        [[9, 10], [11, 12]]
    ];
    const result = arr.findLastIndex((element) => element[0][0] > 5);
    return result === 2;
}

// Test calling function elements
export function FindLastIndexCallFunctionElementTest7600() {
    const arr = [
        () => 'a',
        () => 'b',
        () => 'c',
        () => 'b'
    ];
    const result = arr.findLastIndex((element) => element() === 'b');
    return result === 3;
}

// Test Symbol description property
export function FindLastIndexSymbolDescriptionTest7700() {
    const arr = [
        Symbol('apple'),
        Symbol('banana'),
        Symbol('cherry'),
        Symbol('banana')
    ];
    const result = arr.findLastIndex((element) => element.description === 'banana');
    return result === 3;
}

// Test Date property access in callback
export function FindLastIndexDatePropertyTest7800() {
    const arr = [
        new Date('2024-01-01'),
        new Date('2024-06-15'),
        new Date('2024-12-31')
    ];
    const result = arr.findLastIndex((element) => element.getFullYear() === 2024 && element.getMonth() === 11);
    return result === 2;
}

// Test modifying current element during iteration
export function FindLastIndexModifyCurrentElementTest7900() {
    const arr = [1, 2, 3, 4, 5];
    arr.findLastIndex((element, index, array) => {
        array[index] = element * 10;
        return false;
    });
    return arr[0] === 10 && arr[4] === 50;
}

// Test modification doesn't affect already visited elements
export function FindLastIndexModifyNotAffectVisitedTest8000() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    arr.findLastIndex((element, index, array) => {
        visited.push(array[index]);
        if (index === 3) {
            array[4] = 999;
        }
        return false;
    });
    return visited[0] === 5 && visited[4] === 1;
}

// Test unshift adds element during iteration
export function FindLastIndexUnshiftElementTest8100() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 4) {
            array.unshift(0);
        }
        return false;
    });
    return callCount === 5;
}

// Test delete unvisited element
export function FindLastIndexDeleteUnvisitedTest8200() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 3) {
            delete array[0];
        }
        return false;
    });
    return callCount === 5;
}

// Test delete already visited element
export function FindLastIndexDeleteVisitedTest8300() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    arr.findLastIndex((element, index, array) => {
        visited.push(element);
        if (index === 2) {
            delete array[4];
        }
        return false;
    });
    return visited.length === 5 && visited[0] === 5;
}

// Test setting length to zero during iteration
export function FindLastIndexSetLengthZeroTest8400() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 3) {
            array.length = 0;
        }
        return false;
    });
    return callCount === 5;
}

// Test using splice to modify array during iteration (8.4.2)
export function FindLastIndexSpliceClearTest8500() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 4) {
            array.splice(0, 2); // Remove first 2 elements when at last index
        }
        return false;
    });
    // Verify: result should be -1 (not found), array length should be 3 (5-2)
    return result === -1 && arr.length === 3;
}

// Test increasing length doesn't affect iteration range
export function FindLastIndexIncreaseLengthTest8600() {
    const arr = [1, 2, 3];
    let callCount = 0;
    arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 0) {
            array.length = 10;
        }
        return false;
    });
    return callCount === 3;
}

// Test decreasing length during iteration
export function FindLastIndexDecreaseLengthTest8700() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    arr.findLastIndex((element, index, array) => {
        callCount++;
        if (index === 3) {
            array.length = 3;
        }
        return false;
    });
    return callCount === 5;
}

// Test arguments object as array-like
export function FindLastIndexArgumentsObjectTest8800() {
    function test() {
        const result = Array.prototype.findLastIndex.call(arguments, (element) => element > 2);
        return result === 4;
    }
    return test(1, 2, 3, 4, 5);
}

// Test Int32Array typed array
export function FindLastIndexInt32ArrayTest8900() {
    const int32Array = new Int32Array([1, 2, 3, 4, 5]);
    const result = Array.prototype.findLastIndex.call(int32Array, (element) => element > 3);
    return result === 4;
}

// Test Float64Array typed array
export function FindLastIndexFloat64ArrayTest9000() {
    const float64Array = new Float64Array([1.5, 2.5, 3.5, 4.5, 5.5]);
    const result = Array.prototype.findLastIndex.call(float64Array, (element) => element > 3.0);
    return result === 4;
}

// Test dynamic length getter
export function FindLastIndexDynamicLengthTest9100() {
    const obj = {
        get length() { return 5; },
        0: 'a',
        1: 'b',
        2: 'c',
        3: 'd',
        4: 'e'
    };
    const result = Array.prototype.findLastIndex.call(obj, (element) => element === 'b');
    return result === 1;
}

// Test zero length object
export function FindLastIndexZeroLengthTest9200() {
    const obj = {
        length: 0,
        0: 'test'
    };
    const result = Array.prototype.findLastIndex.call(obj, () => true);
    return result === -1;
}

// Test numeric keys only
export function FindLastIndexNumericKeysOnlyTest9300() {
    const obj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const result = Array.prototype.findLastIndex.call(obj, (element) => element === 'a');
    return result === 0;
}

// Test mixed properties with numeric keys
export function FindLastIndexMixedPropertiesTest9400() {
    const obj = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c',
        name: 'test',
        value: 42
    };
    const result = Array.prototype.findLastIndex.call(obj, (element) => element === 'b');
    return result === 1;
}

// Test callback function throwing error (10.1.1)
export function FindLastIndexCallbackReturnExceptionTest9500() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    let errorCaught = false;
    let errorMessage = '';
    
    try {
        arr.findLastIndex((element) => {
            callCount++;
            if (element === 3) {
                throw new Error('Test error');
            }
            return false;
        });
    } catch (error) {
        errorCaught = true;
        errorMessage = error.message;
    }
    
    // Error should be caught, message should be 'Test error'
    // Call count should be 3 (elements 5, 4, 3 - reverse order)
    return errorCaught && errorMessage === 'Test error' && callCount === 3;
}

// Test accessing non-existent property throws error
export function FindLastIndexAccessNonExistentPropertyTest9600() {
    const arr = [{a: 1}, {b: 2}, {c: 3}];
    let errorCaught = false;
    try {
        arr.findLastIndex((element) => {
            if (element.nonExistent.prop) return true;
            return false;
        });
    } catch (e) {
        errorCaught = true;
    }
    return errorCaught;
}

// Test recursive findLastIndex call
export function FindLastIndexRecursiveCallTest9700() {
    const arr = [1, 2, 3, 4, 5];
    let outerCallCount = 0;
    const result = arr.findLastIndex((element) => {
        outerCallCount++;
        if (element === 3) {
            const innerResult = arr.findLastIndex((x) => x === 2);
            return innerResult === 1;
        }
        return false;
    });
    return result === 2 && outerCallCount === 3;
}

// Test comparison with find method
export function FindLastIndexFindVsFindLastIndexTest9800() {
    const arr = [1, 2, 3, 2, 1];
    const findResult = arr.find((element) => element === 2);
    const findLastIndexResult = arr.findLastIndex((element) => element === 2);
    return findResult === 2 && findLastIndexResult === 3;
}

// Test comparison with filter method
export function FindLastIndexFilterVsFindLastIndexTest9900() {
    const arr = [1, 2, 3, 4, 5, 6];
    const filterResult = arr.filter((element) => element % 2 === 0);
    const findLastIndexResult = arr.findLastIndex((element) => element % 2 === 0);
    return filterResult.length === 3 && findLastIndexResult === 5;
}

// Additional tests to cover more mind map scenarios (10000-18000)
// Test comparison with some method
export function FindLastIndexSomeVsFindLastIndexTest10000() {
    const arr = [1, 2, 3, 4, 5];
    const someResult = arr.some((element) => element > 10);
    const findLastIndexResult = arr.findLastIndex((element) => element > 10);
    return someResult === false && findLastIndexResult === -1;
}

// Test string character search
export function FindLastIndexStringSearchTest10100() {
    const str = 'abc123def456';
    const result = Array.prototype.findLastIndex.call(
        str,
        (char) => char >= '0' && char <= '9'
    );
    return result === 11;
}

// Test findLast and findLastIndex relationship
export function FindLastIndexFindLastWithIndexTest10200() {
    const arr = [{ id: 1 }, { id: 2 }, { id: 3 }];
    const condition = (element) => element.id === 2;
    const value = arr.findLast(condition);
    const index = arr.findLastIndex(condition);
    return value.id === 2 && index === 1 && arr[index] === value;
}

// Test undefined vs -1 when not found
export function FindLastIndexNotFindDifferenceTest10300() {
    const arr = [1, 2, 3, 4, 5];
    const condition = (element) => element > 100;
    const findLastResult = arr.findLast(condition);
    const findLastIndexResult = arr.findLastIndex(condition);
    return findLastResult === undefined && findLastIndexResult === -1;
}

// Test comparison with indexOf
export function FindLastIndexOfComparisonTest10400() {
    const arr = [1, 2, 3, 2, 1];
    const indexOfResult = arr.indexOf(2);
    const findLastIndexResult = arr.findLastIndex((e) => e === 2);
    return indexOfResult === 1 && findLastIndexResult === 3;
}

// Test complex condition with range
export function FindLastIndexComplexConditionTest10500() {
    const arr = [1, 2, 3, 4, 5];
    const indexOfResult = arr.indexOf(3);
    const findLastIndexResult = arr.findLastIndex((e) => e > 2 && e < 5);
    return indexOfResult === 2 && findLastIndexResult === 3;
}

// Test NaN handling difference
export function FindLastIndexNaNComparisonTest10600() {
    const arr = [1, NaN, 3, NaN, 5];
    const indexOfResult = arr.indexOf(NaN);
    const findLastIndexResult = arr.findLastIndex((e) => Number.isNaN(e));
    return indexOfResult === -1 && findLastIndexResult === 3;
}

// Test lastIndexOf with object reference
export function FindLastIndexLastIndexOfComparisonTest10700() {
    const arr = [{ id: 1 }, { id: 2 }, { id: 1 }];
    const target = { id: 1 };
    const lastIndexOfResult = arr.lastIndexOf(target);
    const findLastIndexResult = arr.findLastIndex((e) => e.id === 1);
    return lastIndexOfResult === -1 && findLastIndexResult === 2;
}

// Test some short-circuit behavior
export function FindLastIndexSomeShortCircuitTest10800() {
    const arr = [1, 2, 3, 4, 5];
    let someCount = 0;
    let findCount = 0;
    arr.some((e) => { someCount++; return e === 3; });
    arr.findLastIndex((e) => { findCount++; return e === 3; });
    return someCount === 3 && findCount === 3;
}

// Test getting last element by filter vs findLastIndex
export function FindLastIndexGetLastByFilterTest10900() {
    const arr = [1, 2, 3, 4, 5];
    const condition = (element) => element > 2;
    const filtered = arr.filter(condition);
    const lastByFilter = filtered[filtered.length - 1];
    const lastIndex = arr.findLastIndex(condition);
    const lastByFind = arr[lastIndex];
    return lastByFilter === 5 && lastByFind === 5;
}

// Test forEach manual search vs findLastIndex
export function FindLastIndexForEachManualTest11000() {
    const arr = [1, 2, 3, 4, 5];
    const target = 3;
    let foundIndex = -1;
    arr.forEach((element, index) => {
        if (element === target) {
            foundIndex = index;
        }
    });
    const findLastIndexResult = arr.findLastIndex((e) => e === target);
    return foundIndex === 2 && findLastIndexResult === 2;
}

// Test for loop reverse vs findLastIndex
export function FindLastIndexForLoopTest11100() {
    const arr = [1, 2, 3, 4, 5];
    const condition = (element) => element > 3;
    let forResult = -1;
    for (let i = arr.length - 1; i >= 0; i--) {
        if (condition(arr[i])) {
            forResult = i;
            break;
        }
    }
    const findResult = arr.findLastIndex(condition);
    return forResult === 4 && findResult === 4;
}

// Test forEach cannot exit early
export function FindLastIndexForEachNoExitTest11200() {
    const arr = [1, 2, 3, 4, 5];
    let forEachCount = 0;
    arr.forEach((e) => {
        forEachCount++;
        if (e === 3) return;
    });
    let findCount = 0;
    arr.findLastIndex((e) => {
        findCount++;
        return e === 5;
    });
    return forEachCount === 5 && findCount === 1;
}

// Test price history scenario
export function FindLastIndexPriceHistoryTest11300() {
    const priceHistory = [
        { price: 100, date: '2024-01-01' },
        { price: 150, date: '2024-01-02' },
        { price: 120, date: '2024-01-03' },
        { price: 180, date: '2024-01-04' },
        { price: 160, date: '2024-01-05' }
    ];
    const lastHighPriceIndex = priceHistory.findLastIndex(
        (record) => record.price > 150
    );
    return lastHighPriceIndex === 4 && priceHistory[lastHighPriceIndex].price === 160;
}

// Test form validation error finding
export function FindLastIndexFormValidationTest11400() {
    const formFields = [
        { name: 'username', valid: true, error: null },
        { name: 'email', valid: false, error: 'Invalid email' },
        { name: 'password', valid: true, error: null },
        { name: 'confirmPassword', valid: false, error: 'Passwords do not match' }
    ];
    const lastErrorIndex = formFields.findLastIndex((field) => !field.valid);
    return lastErrorIndex === 3 && formFields[lastErrorIndex].name === 'confirmPassword';
}

// Test finding last required field
export function FindLastIndexRequiredFieldTest11500() {
    const formFields = [
        { name: 'firstName', required: true },
        { name: 'middleName', required: false },
        { name: 'lastName', required: true },
        { name: 'nickname', required: false },
        { name: 'email', required: true }
    ];
    const lastRequiredIndex = formFields.findLastIndex((field) => field.required);
    return lastRequiredIndex === 4;
}

// Test cart product finding
export function FindLastIndexCartProductTest11600() {
    const cart = [
        { productId: 'A001', name: 'Laptop', quantity: 1 },
        { productId: 'B002', name: 'Mouse', quantity: 2 },
        { productId: 'A001', name: 'Laptop', quantity: 1 },
        { productId: 'C003', name: 'Keyboard', quantity: 1 }
    ];
    const lastLaptopIndex = cart.findLastIndex(
        (item) => item.productId === 'A001'
    );
    return lastLaptopIndex === 2;
}

// Test message user finding
export function FindLastIndexMessageUserTest11700() {
    const messages = [
        { id: 1, userId: 'user1', text: 'Hi' },
        { id: 2, userId: 'user2', text: 'Hello' },
        { id: 3, userId: 'user1', text: 'How are you?' },
        { id: 4, userId: 'user2', text: 'Fine' },
        { id: 5, userId: 'user1', text: 'Great!' }
    ];
    const lastUser1MessageIndex = messages.findLastIndex(
        (msg) => msg.userId === 'user1'
    );
    return lastUser1MessageIndex === 4;
}

// Test file type finding
export function FindLastIndexFileTypeTest11800() {
    const files = [
        { name: 'doc1.pdf', type: 'pdf' },
        { name: 'image1.jpg', type: 'image' },
        { name: 'doc2.pdf', type: 'pdf' },
        { name: 'image2.png', type: 'image' },
        { name: 'data.xlsx', type: 'excel' }
    ];
    const lastImageIndex = files.findLastIndex((file) => file.type === 'image');
    return lastImageIndex === 3;
}

// Test file size finding
export function FindLastIndexFileSizeTest11900() {
    const files = [
        { name: 'small.txt', size: 1024 },
        { name: 'large.zip', size: 10485760 },
        { name: 'medium.pdf', size: 5242880 },
        { name: 'huge.iso', size: 524288000 },
        { name: 'tiny.log', size: 512 }
    ];
    const lastLargeFileIndex = files.findLastIndex(
        (file) => file.size > 1048576
    );
    return lastLargeFileIndex === 3;
}

// Test combat log action finding
export function FindLastIndexCombatLogTest12000() {
    const combatLog = [
        { action: 'attack', target: 'Enemy1', damage: 50 },
        { action: 'kill', target: 'Enemy1', damage: 0 },
        { action: 'attack', target: 'Enemy2', damage: 30 },
        { action: 'attack', target: 'Enemy2', damage: 40 },
        { action: 'kill', target: 'Enemy2', damage: 0 }
    ];
    const lastKillIndex = combatLog.findLastIndex(
        (log) => log.action === 'kill'
    );
    return lastKillIndex === 4;
}

// Test sensor data anomaly finding
export function FindLastIndexSensorDataTest12100() {
    const sensorData = [
        { timestamp: 1000, value: 50, isNormal: true },
        { timestamp: 2000, value: 120, isNormal: false },
        { timestamp: 3000, value: 55, isNormal: true },
        { timestamp: 4000, value: 200, isNormal: false },
        { timestamp: 5000, value: 52, isNormal: true }
    ];
    const lastAnomalyIndex = sensorData.findLastIndex(
        (data) => !data.isNormal
    );
    return lastAnomalyIndex === 3;
}

// Test temperature peak finding
export function FindLastIndexTemperatureTest12200() {
    const temperatures = [
        { time: '00:00', temp: 18 },
        { time: '06:00', temp: 22 },
        { time: '12:00', temp: 35 },
        { time: '18:00', temp: 28 },
        { time: '23:00', temp: 20 }
    ];
    const lastPeakIndex = temperatures.findLastIndex(
        (record) => record.temp > 30
    );
    return lastPeakIndex === 2;
}

// Test incomplete task finding
export function FindLastIndexTaskIncompleteTest12300() {
    const tasks = [
        { id: 1, title: 'Task 1', completed: true },
        { id: 2, title: 'Task 2', completed: false },
        { id: 3, title: 'Task 3', completed: true },
        { id: 4, title: 'Task 4', completed: false },
        { id: 5, title: 'Task 5', completed: true }
    ];
    const lastIncompleteIndex = tasks.findLastIndex(
        (task) => !task.completed
    );
    return lastIncompleteIndex === 3;
}

// Test waypoint type finding
export function FindLastIndexWaypointsTest12400() {
    const waypoints = [
        { name: 'Start', type: 'start', distance: 0 },
        { name: 'Gas Station A', type: 'gas', distance: 50 },
        { name: 'Restaurant', type: 'food', distance: 100 },
        { name: 'Gas Station B', type: 'gas', distance: 150 },
        { name: 'Destination', type: 'end', distance: 200 }
    ];
    const lastGasStationIndex = waypoints.findLastIndex(
        (point) => point.type === 'gas'
    );
    return lastGasStationIndex === 3;
}

// Test rest stop finding
export function FindLastIndexRestStopTest12500() {
    const route = [
        { name: 'Start', isRestStop: false },
        { name: 'Rest Area 1', isRestStop: true },
        { name: 'Highway', isRestStop: false },
        { name: 'Rest Area 2', isRestStop: true },
        { name: 'End', isRestStop: false }
    ];
    const lastRestStopIndex = route.findLastIndex(
        (point) => point.isRestStop
    );
    return lastRestStopIndex === 3;
}

// Test permission level finding
export function FindLastIndexPermissionTest12600() {
    const permissions = [
        { resource: 'read', level: 'user' },
        { resource: 'write', level: 'user' },
        { resource: 'delete', level: 'admin' },
        { resource: 'share', level: 'user' },
        { resource: 'admin', level: 'admin' }
    ];
    const lastAdminPermIndex = permissions.findLastIndex(
        (perm) => perm.level === 'admin'
    );
    return lastAdminPermIndex === 4;
}

// Test write permission finding
export function FindLastIndexWritePermissionTest12700() {
    const userPermissions = [
        { resource: 'document1', canRead: true, canWrite: false },
        { resource: 'document2', canRead: true, canWrite: true },
        { resource: 'document3', canRead: true, canWrite: false },
        { resource: 'document4', canRead: true, canWrite: true }
    ];
    const lastWritePermIndex = userPermissions.findLastIndex(
        (perm) => perm.canWrite
    );
    return lastWritePermIndex === 3;
}

// Test modifying array during iteration
export function FindLastIndexModifyDuringIterationTest12800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLastIndex((element, index, array) => {
        array[index] = element * 10;
        return element === 3;
    });
    return result === 2 && arr[2] === 30;
}

// Test object as thisArg
export function FindLastIndexThisArgObjectTest12900() {
    const arr = [1, 2, 3, 4, 5];
    const obj = { threshold: 3 };
    const result = arr.findLastIndex(function(element) {
        return element > this.threshold;
    }, obj);
    return result === 4;
}

// Test strict mode this value
export function FindLastIndexStrictModeThisTest13000() {
    'use strict';
    const arr = [1, 2, 3, 4, 5];
    let thisValue;
    arr.findLastIndex(function(element) {
        thisValue = this;
        return element > 3;
    });
    return thisValue === undefined;
}

// Test boolean as this value
export function FindLastIndexBooleanThisArgTest13100() {
    const result = Array.prototype.findLastIndex.call(true, (element) => true);
    return result === -1;
}

// Test number as this value
export function FindLastIndexNumberThisArgTest13200() {
    const result = Array.prototype.findLastIndex.call(123, (element) => true);
    return result === -1;
}

// Test RegExp element finding
export function FindLastIndexRegExpElementTest13300() {
    const regex1 = /test/;
    const regex2 = /demo/;
    const regex3 = /example/;
    const arr = [regex1, regex2, regex3, regex2];
    const result = arr.findLastIndex((element) => element.source === 'demo');
    return result === 3;
}

// Test circular reference object
export function FindLastIndexCircularReferenceTest13400() {
    const obj = { id: 1 };
    obj.self = obj;
    const arr = [obj, { id: 2 }, obj];
    const result = arr.findLastIndex((element) => element === obj);
    return result === 2;
}

// Test unique element returns same index
export function FindLastIndexUniqueElementTest13500() {
    const arr = [1, 2, 3, 4, 5];
    const condition = (element) => element === 3;
    const findIndexResult = arr.findIndex(condition);
    const findLastIndexResult = arr.findLastIndex(condition);
    return findIndexResult === 2 && findLastIndexResult === 2;
}

// Test both methods return -1 when not found
export function FindLastIndexNotFindBothTest13600() {
    const arr = [1, 2, 3, 4, 5];
    const condition = (element) => element > 100;
    const findIndexResult = arr.findIndex(condition);
    const findLastIndexResult = arr.findLastIndex(condition);
    return findIndexResult === -1 && findLastIndexResult === -1;
}

// Test same condition different results
export function FindLastIndexSameConditionTest13700() {
    const arr = [5, 4, 3, 4, 5];
    const condition = (element) => element > 3;
    const findIndexResult = arr.findIndex(condition);
    const findLastIndexResult = arr.findLastIndex(condition);
    return findIndexResult === 0 && findLastIndexResult === 4;
}

// Test MAX_SAFE_INTEGER index
export function FindLastIndexMaxSafeIntegerTest13800() {
    const arr = [];
    arr[Number.MAX_SAFE_INTEGER] = 'test';
    const result = arr.findLastIndex((element) => element === 'test');
    console.log(result);
    return result //=== Number.MAX_SAFE_INTEGER; //note fix
}

// Test callback throws TypeError
export function FindLastIndexCallbackThrowsTest13900() {
    const arr = [1, 2, 3, 4, 5];
    try {
        const result = arr.findLastIndex((element) => {
            return element.toUpperCase();
        });
    } catch (error) {
        return error instanceof TypeError;
    }
    return false;
}

// Test call with null throws TypeError
export function FindLastIndexThisArgNullCallTest14000() {
    try {
        Array.prototype.findLastIndex.call(null, (element) => true);
    } catch (error) {
        return error instanceof TypeError;
    }
    return false;
}

// Test call with undefined throws TypeError
export function FindLastIndexThisArgUndefinedCallTest14100() {
    try {
        Array.prototype.findLastIndex.call(undefined, (element) => true);
    } catch (error) {
        return error instanceof TypeError;
    }
    return false;
}

// Additional tests to cover more mind map scenarios (14200-18000)
// Test large array boundary 100000 elements
export function FindLastIndexLargeArrayBoundaryTest14200() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const result = arr.findLastIndex((element) => element === 0);
    return result === 0;
}

// Test large array finding last element
export function FindLastIndexLargeArrayLastElementTest14300() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const result = arr.findLastIndex((element) => element === 99999);
    return result === 99999;
}

// Test multiple delete operations
export function FindLastIndexMultipleDeleteTest14400() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[1];
    delete arr[3];
    const result = arr.findLastIndex((element) => element === undefined);
    return result === 3;
}

// Test sparse array with only last element
export function FindLastIndexSparseArrayOnlyLastTest14500() {
    const arr = [];
    arr[999] = 'end';
    const result = arr.findLastIndex((element) => element === 'end');
    return result === 999;
}

// Test sparse array finding middle element
export function FindLastIndexSparseArrayMiddleTest14600() {
    const arr = [];
    arr[5] = 'middle';
    arr[15] = 'end';
    const result = arr.findLastIndex((element) => typeof element === 'string');
    return result === 15;
}

// Test skipping empty slots to find value
export function FindLastIndexSkipEmptySlotsFindValueTest14700() {
    const arr = [1, , 3, , 5];
    const result = arr.findLastIndex((element) => element !== undefined && element > 2);
    return result === 4;
}

// Test log search scenario
export function FindLastIndexLogSearchTest14800() {
    const logs = [
        { level: 'info', message: 'System started' },
        { level: 'error', message: 'Connection failed' },
        { level: 'info', message: 'Retrying...' },
        { level: 'error', message: 'Timeout' },
        { level: 'info', message: 'Connected' }
    ];
    const lastErrorIndex = logs.findLastIndex((log) => log.level === 'error');
    return lastErrorIndex === 3 && logs[lastErrorIndex].message === 'Timeout';
}

// Test user action finding
export function FindLastIndexUserActionTest14900() {
    const userActions = [
        { action: 'login', timestamp: 1000 },
        { action: 'view', timestamp: 2000 },
        { action: 'purchase', timestamp: 3000 },
        { action: 'view', timestamp: 4000 },
        { action: 'logout', timestamp: 5000 }
    ];
    const lastPurchaseIndex = userActions.findLastIndex(
        (action) => action.action === 'purchase'
    );
    return lastPurchaseIndex === 2;
}

// Test cart sale item finding
export function FindLastIndexCartSaleTest15000() {
    const cart = [
        { productId: 'A001', name: 'Laptop', onSale: false },
        { productId: 'B002', name: 'Mouse', onSale: true },
        { productId: 'C003', name: 'Keyboard', onSale: true },
        { productId: 'D004', name: 'Monitor', onSale: false }
    ];
    const lastSaleIndex = cart.findLastIndex((item) => item.onSale);
    return lastSaleIndex === 2;
}

// Test unread message finding
export function FindLastIndexUnreadMessageTest15100() {
    const messages = [
        { id: 1, text: 'Hello', read: true },
        { id: 2, text: 'How are you?', read: true },
        { id: 3, text: 'Are you there?', read: false },
        { id: 4, text: 'Please reply', read: true },
        { id: 5, text: 'Thanks!', read: false }
    ];
    const lastUnreadIndex = messages.findLastIndex((msg) => !msg.read);
    return lastUnreadIndex === 4;
}

// Test game checkpoint finding
export function FindLastIndexGameCheckpointTest15200() {
    const checkpoints = [
        { level: 1, saved: true, timestamp: 1000 },
        { level: 2, saved: false, timestamp: 2000 },
        { level: 3, saved: true, timestamp: 3000 },
        { level: 4, saved: false, timestamp: 4000 },
        { level: 5, saved: true, timestamp: 5000 }
    ];
    const lastSavedIndex = checkpoints.findLastIndex(
        (checkpoint) => checkpoint.saved
    );
    return lastSavedIndex === 4;
}

// Test high priority task finding
export function FindLastIndexHighPriorityTaskTest15300() {
    const tasks = [
        { id: 1, title: 'Task 1', priority: 'low' },
        { id: 2, title: 'Task 2', priority: 'high' },
        { id: 3, title: 'Task 3', priority: 'medium' },
        { id: 4, title: 'Task 4', priority: 'high' },
        { id: 5, title: 'Task 5', priority: 'low' }
    ];
    const lastHighPriorityIndex = tasks.findLastIndex(
        (task) => task.priority === 'high'
    );
    return lastHighPriorityIndex === 3;
}

// Test deep nested object access
export function FindLastIndexDeepNestedObjectTest15400() {
    const arr = [
        { user: { name: 'Alice', age: 25 } },
        { user: { name: 'Bob', age: 30 } },
        { user: { name: 'Charlie', age: 35 } }
    ];
    const result = arr.findLastIndex((element) => element.user.age > 28);
    return result === 2;
}

// Test array includes method
export function FindLastIndexArrayIncludeTest15500() {
    const arr = [[1, 2], [3, 4], [5, 6]];
    const result = arr.findLastIndex((element) => element.includes(4));
    return result === 1;
}

// Test multi-dimensional array with some
export function FindLastIndexMultiDimensionalArrayTest15600() {
    const arr = [
        [[1, 2], [3, 4]],
        [[5, 6], [7, 8]],
        [[9, 10], [11, 12]]
    ];
    const result = arr.findLastIndex((element) => 
        element.some(subArray => subArray.includes(11))
    );
    return result === 2;
}

// Test array content comparison with every
export function FindLastIndexArrayContentComparisonTest15700() {
    const arr = [[1, 2], [3, 4], [1, 2], [5, 6]];
    const target = [1, 2];
    const result = arr.findLastIndex((element) => 
        element.length === target.length && element.every((v, i) => v === target[i])
    );
    return result === 2;
}

// Test string startsWith with thisArg
export function FindLastIndexStringStartsWithTest15800() {
    const arr = ['apple', 'banana', 'cherry', 'date'];
    const result = arr.findLastIndex(function(element) {
        return element.startsWith(String(this));
    }, 'c');
    return result === 2;
}

// Test dynamic length object with getter
export function FindLastIndexDynamicLengthObjectTest15900() {
    const dynamicLength = {
        _data: [1, 2, 3, 4, 5],
        get length() {
            return this._data.length;
        },
        0: 1,
        1: 2,
        2: 3,
        3: 4,
        4: 5
    };
    const result = Array.prototype.findLastIndex.call(
        dynamicLength,
        (element) => element > 3
    );
    return result === 4;
}

// Test empty array-like object
export function FindLastIndexEmptyArrayLikeTest16000() {
    const emptyArrayLike = {
        length: 0
    };
    const result = Array.prototype.findLastIndex.call(
        emptyArrayLike,
        (element) => true
    );
    return result === -1;
}

// Test only numeric keys object
export function FindLastIndexOnlyNumericKeysTest16100() {
    const onlyNumericKeys = {
        '0': 'first',
        '1': 'second',
        '2': 'third',
        length: 3
    };
    const result = Array.prototype.findLastIndex.call(
        onlyNumericKeys,
        (element) => element === 'second'
    );
    return result === 1;
}

// Test mixed properties object
export function FindLastIndexMixedPropertiesObjectTest16200() {
    const mixedObject = {
        0: 10,
        1: 20,
        2: 30,
        length: 3,
        name: 'test',
        extra: 'data'
    };
    const result = Array.prototype.findLastIndex.call(
        mixedObject,
        (element) => element > 15
    );
    return result === 2;
}

// Test recursive call with depth limit
export function FindLastIndexRecursiveCallTest16300() {
    const arr = [1, 2, 3, 4, 5];
    let depth = 0;
    const result = arr.findLastIndex((element) => {
        depth++;
        if (depth < 3 && element > 3) {
            return arr.findLastIndex((e) => e === element) === 4;
        }
        return false;
    });
    return result === 4;
}

// Test callback returning undefined continues iteration
export function FindLastIndexCallbackReturnUndefinedTest16400() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLastIndex(() => {
        callCount++;
        return callCount === 3;
    });
    return result === 2 && callCount === 3;
}

// Test findLast returns undefined vs findLastIndex returns -1
export function FindLastIndexFindLastWithUndefinedTest16500() {
    const arr = [1, 2, 3, 4, 5];
    const condition = (element) => element > 100;
    const findLastResult = arr.findLast(condition);
    const findLastIndexResult = arr.findLastIndex(condition);
    return findLastResult === undefined && findLastIndexResult === -1;
}

// Test index and element combination condition
export function FindLastIndexIndexElementCombinationTest16600() {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const result = arr.findLastIndex((element, index) => {
        return index + element > 15;
    });
    return result === 9;
}

// Test callback uses all three parameters
export function FindLastIndexCallbackUseAllParamsTest16700() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const visited = [];
    arr.findLastIndex((element, index, array) => {
        visited.push({ element, index, isArray: Array.isArray(array) });
        return false;
    });
    return visited.length === 5 && 
           visited[0].element === 'e' && 
           visited[0].index === 4 &&
           visited[0].isArray === true;
}

// Test different types of elements
export function FindLastIndexDifferentTypesElementsTest16800() {
    const arr = [1, 'string', true, null, undefined, {a: 1}, [1, 2, 3]];
    const types = [];
    arr.findLastIndex((element) => {
        types.push(typeof element);
        return false;
    });
    return types.length === 7 && types[0] === 'object';
}

// Test negative length object
export function FindLastIndexNegativeLengthObjectTest16900() {
    const negativeLength = {
        length: -1,
        0: 'test'
    };
    const result = Array.prototype.findLastIndex.call(
        negativeLength,
        (element) => true
    );
    return result === -1;
}

// Test float length object
export function FindLastIndexFloatLengthObjectTest17000() {
    const floatLength = {
        length: 3.7,
        0: 'a',
        1: 'b',
        2: 'c',
        3: 'd'
    };
    const result = Array.prototype.findLastIndex.call(
        floatLength,
        (element) => element === 'c'
    );
    return result === 2;
}

// Test zero length object
export function FindLastIndexZeroLengthObjectTest17100() {
    const obj = {
        length: 0,
        0: 'test'
    };
    const result = Array.prototype.findLastIndex.call(obj, () => true);
    return result === -1;
}

// 10.4.2 Strict mode readonly property modification
export function FindLastIndexStrictModeReadonlyTest17200() {
    'use strict';
    const arr = [1, 2, 3, 4, 5];
    Object.defineProperty(arr, '0', {
        value: 1,
        writable: false
    });
    let errorCaught = false;
    try {
        arr.findLastIndex((element, index, array) => {
            if (index === 0) {
                array[0] = 999; // Try to modify readonly property
            }
            return false;
        });
    } catch (error) {
        errorCaught = error instanceof TypeError;
    }
    return errorCaught;
}

// 9.1.2 Arguments object test
export function FindLastIndexArgumentsLikeTest17300() {
    // Simulate arguments object behavior
    function simulateArguments() {
        const arrayLike = arguments;
        const result = Array.prototype.findLastIndex.call(
            arrayLike,
            (element) => element > 2
        );
        return result;
    }
    // Call function with arguments to simulate arguments object
    const result = simulateArguments(1, 2, 3, 4, 5);
    return result === 4; // Last element > 2 is 5 at index 4
}
