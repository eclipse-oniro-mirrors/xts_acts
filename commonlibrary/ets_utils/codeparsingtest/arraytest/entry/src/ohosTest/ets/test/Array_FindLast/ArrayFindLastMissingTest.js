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

// Basic findLast functionality tests
// Test finding last element greater than 10
export function ArrayFindLastBasicTest0100() {
    const arr = [5, 12, 8, 130, 44];
    const result = arr.findLast(element => element > 10);
    return result === 44;
}

// Test finding last occurrence of duplicate value
export function ArrayFindLastBasicTest0200() {
    const arr = [1, 2, 3, 4, 5, 3];
    const result = arr.findLast(element => element === 3);
    return result === 3;
}

// Test finding unique element matching condition
export function ArrayFindLastBasicTest0300() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => element > 4);
    return result === 5;
}

// Test finding first element in array
export function ArrayFindLastBasicTest0400() {
    const arr = [10, 5, 3, 2, 1];
    const result = arr.findLast(element => element >= 10);
    return result === 10;
}

// Test finding last element in array
export function ArrayFindLastBasicTest0500() {
    const arr = [1, 2, 3, 4, 10];
    const result = arr.findLast(element => element >= 10);
    return result === 10;
}

// Test returning undefined when no match found
export function ArrayFindLastBasicTest0600() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => element > 10);
    return result === undefined;
}

// Test empty array returns undefined
export function ArrayFindLastBasicTest0700() {
    const arr = [];
    const result = arr.findLast(element => element > 0);
    return result === undefined;
}

// Test arrow function as callback
export function ArrayFindLastBasicTest0800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(x => x === 3);
    return result === 3;
}

// Test arrow function with object destructuring
export function ArrayFindLastBasicTest0900() {
    const inventory = [
        { name: "apples", quantity: 2 },
        { name: "bananas", quantity: 0 },
        { name: "fish", quantity: 1 },
        { name: "cherries", quantity: 5 }
    ];
    const result = inventory.findLast(({ quantity }) => quantity < 2);
    return result.name === "fish" && result.quantity === 1;
}

// Test named function as callback
export function ArrayFindLastBasicTest1000() {
    const arr = [4, 6, 8, 12];
    function isEven(element) {
        return element % 2 === 0;
    }
    const result = arr.findLast(isEven);
    return result === 12;
}

// Test anonymous function as callback
export function ArrayFindLastBasicTest1100() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(function(element) {
        return element > 3;
    });
    return result === 5;
}

// Callback parameter tests
// Test element parameter receives correct values
export function ArrayFindLastCallbackTest1200() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    arr.findLast(element => {
        visited.push(element);
        return element === 3;
    });
    return JSON.stringify(visited) === JSON.stringify([5, 4, 3]);
}

// Test element parameter with various types
export function ArrayFindLastCallbackTest1300() {
    const arr = [1, "string", true, null, undefined, { a: 1 }, [1, 2]];
    const result = arr.findLast(element => typeof element === "object");
    return Array.isArray(result) && result.length === 2;
}

// Test index parameter receives correct values
export function ArrayFindLastCallbackTest1400() {
    const arr = ["a", "b", "c", "d", "e"];
    const visited = [];
    arr.findLast((element, index) => {
        visited.push({ element, index });
        return index === 2;
    });
    return visited.length === 3 && 
           visited[0].element === "e" && visited[0].index === 4 &&
           visited[1].element === "d" && visited[1].index === 3 &&
           visited[2].element === "c" && visited[2].index === 2;
}

// Test index decreases from high to low
export function ArrayFindLastCallbackTest1500() {
    const arr = [1, 2, 3, 4, 5];
    const indices = [];
    arr.findLast((element, index) => {
        indices.push(index);
        return false;
    });
    return JSON.stringify(indices) === JSON.stringify([4, 3, 2, 1, 0]);
}

// Test array parameter references original array
export function ArrayFindLastCallbackTest1600() {
    const arr = [1, 2, 3, 4, 5];
    let arrayRef = null;
    arr.findLast((element, index, array) => {
        arrayRef = array;
        return element === 3;
    });
    return arrayRef === arr && arrayRef.length === 5;
}

// Test using array parameter to access other elements
// findLast iterates from right to left, so it finds 20 first (20 === 10*2)
export function ArrayFindLastCallbackTest1700() {
    const arr = [10, 20, 30, 40, 50];
    const result = arr.findLast((element, index, array) => {
        if (index > 0) {
            return element === array[index - 1] * 2;
        }
        return false;
    });
    // From right to left: 50(!=40*2), 40(!=30*2), 30(!=20*2), 20(==10*2) -> returns 20
    return result === 20;
}

// Test using all three parameters
// findLast iterates from right to left
// index=4: 5 === 5-4=1? false
// index=3: 4 === 5-3=2? false
// index=2: 3 === 5-2=3? true -> returns 3
export function ArrayFindLastCallbackTest1800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast((element, index, array) => {
        return element === array.length - index;
    });
    // From right to left: 5(!=1), 4(!=2), 3(==3) -> returns 3
    return result === 3;
}

// Test partial parameters omitted
export function ArrayFindLastCallbackTest1900() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.findLast(element => element > 3);
    const result2 = arr.findLast((element, index) => element === index + 1);
    return result1 === 5 && result2 === 5;
}

// thisArg parameter tests
// Test thisArg with object context
export function ArrayFindLastThisArgTest2000() {
    const arr = [1, 2, 3, 4, 5];
    const context = { threshold: 3 };
    const result = arr.findLast(function(element) {
        return element > this.threshold;
    }, context);
    return result === 5;
}

// Test thisArg with complex object
export function ArrayFindLastThisArgTest2100() {
    const inventory = [
        { name: "apples", quantity: 2 },
        { name: "bananas", quantity: 0 },
        { name: "fish", quantity: 1 }
    ];
    const context = { minQuantity: 1 };
    const result = inventory.findLast(function(item) {
        return item.quantity >= this.minQuantity;
    }, context);
    return result.name === "fish" && result.quantity === 1;
}

// Test thisArg with null
export function ArrayFindLastThisArgTest2200() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(function(element) {
        return element > 3;
    }, null);
    return result === 5;
}

// Test thisArg with undefined
export function ArrayFindLastThisArgTest2300() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(function(element) {
        return element > 3;
    }, undefined);
    return result === 5;
}

// Test thisArg omitted
export function ArrayFindLastThisArgTest2400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(function(element) {
        return element > 3;
    });
    return result === 5;
}

// Test thisArg with primitive number
export function ArrayFindLastThisArgTest2500() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(function(element) {
        return element > 3;
    }, 0);
    return result === 5;
}

// Test thisArg with primitive string
// "test".length = 4, "dddd".length = 4, so we need >= to match
export function ArrayFindLastThisArgTest2600() {
    const arr = ["a", "bb", "ccc", "dddd"];
    const result = arr.findLast(function(element) {
        return element.length >= this.length;
    }, "test");
    // "dddd".length (4) >= "test".length (4), so it matches
    return result === "dddd";
}

// Return value tests
// Test returning element itself
export function ArrayFindLastReturnTest2700() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => element > 3);
    return result === 5 && typeof result === "number";
}

// Test returning object element (reference check)
export function ArrayFindLastReturnTest2800() {
    const obj1 = { id: 1, name: "obj1" };
    const obj2 = { id: 2, name: "obj2" };
    const obj3 = { id: 3, name: "obj3" };
    const arr = [obj1, obj2, obj3];
    const result = arr.findLast(obj => obj.id > 1);
    return result === obj3 && result.id === 3;
}

// Test returning array element (reference check)
export function ArrayFindLastReturnTest2900() {
    const arr = [[1, 2], [3, 4], [5, 6]];
    const result = arr.findLast(subArr => subArr.length === 2);
    return result.length === 2 && result === arr[2];
}

// Test returning undefined when no match
export function ArrayFindLastReturnTest3000() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => element > 10);
    return result === undefined && typeof result === "undefined";
}

// Test empty array returns undefined
export function ArrayFindLastReturnTest3100() {
    const arr = [];
    const result = arr.findLast(element => element > 0);
    return result === undefined;
}

// Test callback always returns false
export function ArrayFindLastReturnTest3200() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => false);
    return result === undefined;
}

// Test callback returns true
export function ArrayFindLastReturnTest3300() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => true);
    return result === 5;
}

// Test callback returns non-boolean truthy values
export function ArrayFindLastReturnTest3400() {
    const arr = [0, "", null, false, 1, "hello"];
    const result = arr.findLast(element => element);
    return result === "hello";
}

// Test callback returns number
// findLast iterates from right to left
// First element (5): 5>3 returns 1(true), found immediately, count=1
// To test multiple iterations, we need to skip the first match
export function ArrayFindLastReturnTest3500() {
    const arr = [1, 2, 3, 4, 5];
    let count = 0;
    const result = arr.findLast(element => {
        count++;
        return element > 4 ? 1 : 0;  // Only 5 satisfies this
    });
    // 5 > 4, returns 1 (truthy), found at first iteration, count = 1
    return result === 5 && count === 1;
}

// Test return value type checking
export function ArrayFindLastReturnTest3600() {
    const arr = [1, "string", true, null, undefined, {}, []];
    const typeNum = typeof arr.findLast(x => typeof x === "number");
    const typeStr = typeof arr.findLast(x => typeof x === "string");
    const typeBool = typeof arr.findLast(x => typeof x === "boolean");
    const typeNull = typeof arr.findLast(x => x === null);
    const typeUndef = typeof arr.findLast(x => x === undefined);
    const typeArr = typeof arr.findLast(x => Array.isArray(x));
    return typeNum === "number" && typeStr === "string" && 
           typeBool === "boolean" && typeNull === "object" && 
           typeUndef === "undefined" && typeArr === "object";
}

// Sparse array tests
// Test sparse array with holes treated as undefined
export function ArrayFindLastSparseTest3700() {
    const arr = [1, , , , 5];
    const visited = [];
    const result = arr.findLast((element, index) => {
        visited.push({ index, value: element, isUndefined: element === undefined });
        return false;
    });
    return visited.length === 5 &&
           visited[0].index === 4 && visited[0].value === 5 &&
           visited[1].index === 3 && visited[1].isUndefined === true &&
           visited[2].index === 2 && visited[2].isUndefined === true &&
           visited[3].index === 1 && visited[3].isUndefined === true &&
           visited[4].index === 0 && visited[4].value === 1;
}

// Test finding undefined in sparse array
export function ArrayFindLastSparseTest3800() {
    const arr = [1, , , , 5];
    const result = arr.findLast(element => element === undefined);
    return result === undefined;
}

// Test sparse array with large gaps
export function ArrayFindLastSparseTest3900() {
    const arr = [];
    arr[0] = 1;
    arr[100] = 100;
    arr[200] = 200;
    const result = arr.findLast(element => element > 50);
    return result === 200;
}

// Test sparse array created with delete
export function ArrayFindLastSparseTest4000() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    delete arr[3];
    const result = arr.findLast((element, index) => {
        return element === 2;
    });
    return result === 2;
}

// Test sparse array with all holes
export function ArrayFindLastSparseTest4100() {
    const arr = new Array(5);
    const result = arr.findLast(element => element === undefined);
    return result === undefined;
}

// Edge case tests
// Test single element array matching condition
export function ArrayFindLastEdgeTest4200() {
    const arr = [5];
    const result = arr.findLast(element => element > 0);
    return result === 5;
}

// Test single element array not matching condition
export function ArrayFindLastEdgeTest4300() {
    const arr = [5];
    const result = arr.findLast(element => element > 10);
    return result === undefined;
}

// Test large array last element
export function ArrayFindLastEdgeTest4400() {
    const arr = Array.from({ length: 10000 }, (_, i) => i + 1);
    const result = arr.findLast(element => element === 10000);
    return result === 10000;
}

// Test large array first element
export function ArrayFindLastEdgeTest4500() {
    const arr = Array.from({ length: 10000 }, (_, i) => i + 1);
    const result = arr.findLast(element => element === 1);
    return result === 1;
}

// Test array with Number.MAX_VALUE
export function ArrayFindLastEdgeTest4600() {
    const arr = [1, 2, 3, Number.MAX_VALUE, 5];
    const result = arr.findLast(element => element === Number.MAX_VALUE);
    return result === Number.MAX_VALUE;
}

// Test array with Infinity
export function ArrayFindLastEdgeTest4700() {
    const arr = [1, 2, 3, Infinity, 5];
    const result = arr.findLast(element => element === Infinity);
    return result === Infinity;
}

// Test array with -Infinity
export function ArrayFindLastEdgeTest4800() {
    const arr = [1, 2, 3, -Infinity, 5];
    const result = arr.findLast(element => element === -Infinity);
    return result === -Infinity;
}

// Test callback returns true immediately
export function ArrayFindLastEdgeTest4900() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLast(element => {
        callCount++;
        return true;
    });
    return result === 5 && callCount === 1;
}

// Test callback always returns false
export function ArrayFindLastEdgeTest5000() {
    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;
    const result = arr.findLast(element => {
        callCount++;
        return false;
    });
    return result === undefined && callCount === 5;
}

// Exception handling tests
// Test callback throws error
export function ArrayFindLastErrorTest5100() {
    const arr = [1, 2, 3, 4, 5];
    try {
        arr.findLast(element => {
            if (element === 3) {
                throw new Error("Found 3");
            }
            return false;
        });
        return false;
    } catch (error) {
        return error.message === "Found 3";
    }
}

// Test callbackFn is not a function
export function ArrayFindLastErrorTest5200() {
    const arr = [1, 2, 3, 4, 5];
    try {
        arr.findLast("not a function");
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// Test callbackFn is null
export function ArrayFindLastErrorTest5300() {
    const arr = [1, 2, 3, 4, 5];
    try {
        arr.findLast(null);
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// Test callbackFn is undefined
export function ArrayFindLastErrorTest5400() {
    const arr = [1, 2, 3, 4, 5];
    try {
        arr.findLast(undefined);
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// Test calling on null
export function ArrayFindLastErrorTest5500() {
    try {
        Array.prototype.findLast.call(null, () => true);
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// Test calling on undefined
export function ArrayFindLastErrorTest5600() {
    try {
        Array.prototype.findLast.call(undefined, () => true);
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// Array modification tests
// Test modifying already visited elements - findLast visits from end to start
// When at index 4 (last element), we modify array[0], then continue searching
// The search will eventually reach index 0 and find the modified value
export function ArrayFindLastModifyTest5700() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast((element, index, array) => {
        if (index === 4) {
            array[2] = 100;
        }
        return element === 100;
    });
    // Since we modified index 2 and findLast visits it after index 4,
    // it should find 100 at index 2
    return result === 100 && arr[2] === 100;
}

// Test modifying current element
export function ArrayFindLastModifyTest5800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast((element, index, array) => {
        if (index === 3) {
            array[index] = 10;
            return element === 4;
        }
        return false;
    });
    return result === 4 && arr[3] === 10;
}

// Test modifying unvisited elements
export function ArrayFindLastModifyTest5900() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push({ index, value: element });
        if (index === 4) {
            array[2] = 100;
        }
        return element === 100;
    });
    return visited.length === 3 && 
           visited[2].value === 100 && 
           result === 100;
}

// Test adding elements during iteration
export function ArrayFindLastModifyTest6000() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push(element);
        if (index === 4) {
            array.push(6, 7, 8);
        }
        return false;
    });
    return JSON.stringify(visited) === JSON.stringify([5, 4, 3, 2, 1]) && 
           arr.length === 8;
}

// Test reducing array length during iteration
export function ArrayFindLastModifyTest6100() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push(index);
        if (index === 4) {
            array.length = 2;
        }
        return false;
    });
    return JSON.stringify(visited) === JSON.stringify([4, 3, 2, 1, 0]) && 
           arr.length === 2;
}

// Array-like object tests
// Test basic array-like object
export function ArrayFindLastLikeTest6200() {
    const arrayLike = {
        length: 3,
        0: "a",
        1: "b",
        2: "c"
    };
    const result = Array.prototype.findLast.call(arrayLike, element => element === "b");
    return result === "b";
}

// Test string as array-like
export function ArrayFindLastLikeTest6300() {
    const str = "hello";
    const result = Array.prototype.findLast.call(str, char => char === "l");
    return result === "l";
}

// Test arguments object
export function ArrayFindLastLikeTest6400() {
    function testFindLast() {
        return Array.prototype.findLast.call(arguments, arg => arg > 2);
    }
    const result = testFindLast(1, 2, 3, 4, 5);
    return result === 5;
}

// Test TypedArray
export function ArrayFindLastLikeTest6500() {
    const typedArray = new Int32Array([1, 2, 3, 4, 5]);
    const result = typedArray.findLast(element => element > 3);
    return result === 5;
}

// Test array-like with length greater than actual elements
export function ArrayFindLastLikeTest6600() {
    const arrayLike = {
        length: 5,
        0: "a",
        1: "b"
    };
    const visited = [];
    const result = Array.prototype.findLast.call(arrayLike, (element, index) => {
        visited.push({ index, element });
        return false;
    });
    return visited.length === 5 &&
           visited[0].index === 4 && visited[0].element === undefined &&
           visited[4].index === 0 && visited[4].element === "a";
}

// Method interaction tests
// Test findLast vs find difference
export function ArrayFindLastInteractionTest6700() {
    const arr = [5, 12, 8, 130, 44];
    const findByFind = arr.find(element => element > 10);
    const findByFindLast = arr.findLast(element => element > 10);
    return findByFind === 12 && findByFindLast === 44;
}

// Test findLast with findLastIndex
export function ArrayFindLastInteractionTest6800() {
    const arr = [5, 12, 8, 130, 44];
    const value = arr.findLast(element => element > 10);
    const index = arr.findLastIndex(element => element > 10);
    return value === 44 && index === 4 && arr[index] === value;
}

// Test findLast vs filter
export function ArrayFindLastInteractionTest6900() {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const findLastResult = arr.findLast(element => element > 5);
    const filterResult = arr.filter(element => element > 5);
    return findLastResult === 10 && filterResult.length === 5;
}

// Test findLast vs some
export function ArrayFindLastInteractionTest7000() {
    const arr = [1, 2, 3, 4, 5];
    const hasLargeNumber = arr.some(element => element > 3);
    const lastLargeNumber = arr.findLast(element => element > 3);
    return hasLargeNumber === true && lastLargeNumber === 5;
}

// Test findLast with map
export function ArrayFindLastInteractionTest7100() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.map(x => x * 2).findLast(x => x > 6);
    return result === 10;
}

// Test findLast with reverse
export function ArrayFindLastInteractionTest7200() {
    const arr = [1, 2, 3, 4, 5];
    const reversed = [...arr].reverse();
    const result = reversed.findLast(element => element > 3);
    return result === 4;
}

// Test chained method calls
export function ArrayFindLastInteractionTest7300() {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const result = arr
        .filter(x => x % 2 === 0)
        .map(x => x * 2)
        .findLast(x => x < 15);
    return result === 12;
}

// Test findLast vs lastIndexOf
export function ArrayFindLastInteractionTest7400() {
    const arr = [1, 2, 3, 4, 5, 4, 3, 2, 1];
    const indexByLastIndexOf = arr.lastIndexOf(3);
    const valueByFindLast = arr.findLast(x => x === 3);
    const indexByFindLastIndex = arr.findLastIndex(x => x === 3);
    return indexByLastIndexOf === 6 && valueByFindLast === 3 && indexByFindLastIndex === 6;
}

// Special value tests
// Test finding NaN
export function ArrayFindLastSpecialTest7500() {
    const arr = [1, 2, NaN, 4, 5];
    const result = arr.findLast(element => Number.isNaN(element));
    return Number.isNaN(result);
}

// Test NaN not equal to itself
export function ArrayFindLastSpecialTest7600() {
    const arr = [1, 2, NaN, 4, 5];
    const result = arr.findLast(element => element === NaN);
    return result === undefined;
}

// Test finding null
export function ArrayFindLastSpecialTest7700() {
    const arr = [1, null, 3, null, 5];
    const result = arr.findLast(element => element === null);
    return result === null;
}

// Test finding undefined
export function ArrayFindLastSpecialTest7800() {
    const arr = [1, undefined, 3, undefined, 5];
    const result = arr.findLast(element => element === undefined);
    return result === undefined;
}

// Test distinguishing null and undefined
export function ArrayFindLastSpecialTest7900() {
    const arr = [1, null, undefined, null, undefined];
    const lastNull = arr.findLast(element => element === null);
    const lastUndefined = arr.findLast(element => element === undefined);
    return lastNull === null && lastUndefined === undefined;
}

// Test finding boolean true
export function ArrayFindLastSpecialTest8000() {
    const arr = [true, false, true, false, true];
    const result = arr.findLast(element => element === true);
    return result === true;
}

// Test finding falsy values
export function ArrayFindLastSpecialTest8100() {
    const arr = [1, 0, "", false, null, undefined, NaN];
    const result = arr.findLast(element => !element);
    return Number.isNaN(result);
}

// Test finding Symbol
export function ArrayFindLastSpecialTest8200() {
    const sym1 = Symbol("a");
    const sym2 = Symbol("b");
    const arr = [sym1, sym2, sym1];
    const result = arr.findLast(element => element === sym1);
    return result === sym1;
}

// Test finding BigInt
export function ArrayFindLastSpecialTest8300() {
    const arr = [1n, 2n, 3n, 4n, 5n];
    const result = arr.findLast(element => element > 3n);
    return result === 5n;
}

// Test finding object by reference
export function ArrayFindLastSpecialTest8400() {
    const obj1 = { id: 1 };
    const obj2 = { id: 2 };
    const obj3 = { id: 3 };
    const arr = [obj1, obj2, obj3, obj2];
    const result = arr.findLast(element => element === obj2);
    return result === obj2;
}

// Test finding object by property
export function ArrayFindLastSpecialTest8500() {
    const obj1 = { id: 1, active: false };
    const obj2 = { id: 2, active: true };
    const obj3 = { id: 3, active: true };
    const arr = [obj1, obj2, obj3];
    // Find the last object where id > 1 (which is obj3)
    const result = arr.findLast(obj => obj.id > 1);
    return result === obj3;
}

// Test array containing functions
export function ArrayFindLastSpecialTest8600() {
    const arr = [
        () => 1,
        () => 2,
        () => 3,
        () => 4,
        () => 5
    ];
    const result = arr.findLast(fn => fn() > 3);
    return result() === 5;
}

// Test array containing RegExp
export function ArrayFindLastSpecialTest8700() {
    const arr = [/abc/, /def/, /ghi/];
    const result = arr.findLast(regex => regex.test("def"));
    return result.toString() === "/def/";
}

// Test array containing Date objects
export function ArrayFindLastSpecialTest8800() {
    const arr = [
        new Date("2020-01-01"),
        new Date("2021-01-01"),
        new Date("2022-01-01")
    ];
    const threshold = new Date("2021-06-01");
    const result = arr.findLast(date => date > threshold);
    return result.getFullYear() === 2022;
}

// Test nested arrays
export function ArrayFindLastSpecialTest8900() {
    const arr = [[1, 2], [3, 4], [5, 6], [3, 4]];
    const target = [3, 4];
    const result = arr.findLast(subArr => {
        return subArr.length === target.length && 
               subArr.every((val, idx) => val === target[idx]);
    });
    return result.length === 2 && result[0] === 3 && result[1] === 4;
}

// Test cyclic reference
export function ArrayFindLastSpecialTest9000() {
    const obj1 = { id: 1 };
    const obj2 = { id: 2 };
    obj1.ref = obj2;
    obj2.ref = obj1;
    const arr = [obj1, obj2];
    const result = arr.findLast(obj => obj.id === 2);
    return result.id === 2;
}

// Test array containing WeakMap
export function ArrayFindLastSpecialTest9100() {
    const wm1 = new WeakMap();
    const wm2 = new WeakMap();
    const key = {};
    wm1.set(key, "value1");
    wm2.set(key, "value2");
    const arr = [wm1, wm2];
    const result = arr.findLast(wm => wm.has(key));
    return result === wm2;
}

// Test array-like with negative length
export function ArrayFindLastLikeTest9200() {
    const arrayLike = {
        length: -1,
        0: "a",
        1: "b"
    };
    const result = Array.prototype.findLast.call(arrayLike, element => element === "a");
    return result === undefined;
}

// Test array-like with non-integer length
export function ArrayFindLastLikeTest9300() {
    const arrayLike = {
        length: 2.5,
        0: "a",
        1: "b",
        2: "c"
    };
    const result = Array.prototype.findLast.call(arrayLike, element => element === "c");
    return result === undefined;
}

// Test callback returns Error object (truthy) - should return the element, not the Error
export function ArrayFindLastErrorTest9400() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.findLast(element => {
        // Returning an Error object (truthy) means the condition is met
        // findLast should return the current element (5, the last element)
        return new Error("This is an error");
    });
    // The result should be 5 (the last element), not the Error object
    return result === 5;
}

// Test calling on primitive number - should throw TypeError or return undefined
export function ArrayFindLastErrorTest9500() {
    // In JavaScript, calling findLast on a primitive number should either:
    // 1. Return undefined (if converted to wrapper object with no indexed properties)
    // 2. Throw TypeError (if strict mode prevents boxing)
    try {
        const result = Array.prototype.findLast.call(123, () => true);
        // If no error, result should be undefined
        return result === undefined;
    } catch (e) {
        // If TypeError is thrown, this is also valid behavior
        return e instanceof TypeError;
    }
}

// Test sparse array with only first and last elements
export function ArrayFindLastSparseTest9600() {
    const arr = [];
    arr[0] = "start";
    arr[999] = "end";
    const visited = [];
    const result = arr.findLast((element, index) => {
        if (element !== undefined) {
            visited.push({ index, element });
        }
        return element === "start";
    });
    return visited.length === 2 && 
           visited[0].element === "end" && 
           visited[1].element === "start" &&
           result === "start";
}

// Test delete operation during iteration
export function ArrayFindLastModifyTest9700() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push({ index, value: element });
        if (index === 4) {
            delete array[2];
        }
        return false;
    });
    return visited.length === 5 &&
           visited[0].index === 4 && visited[0].value === 5 &&
           visited[2].index === 2 && visited[2].value === undefined;
}

// Test using splice during iteration
export function ArrayFindLastModifyTest9800() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push({ index, value: element, arrayLength: array.length });
        if (index === 4) {
            array.splice(2, 1);
        }
        return false;
    });
    return visited[0].arrayLength === 5 && 
           visited[1].arrayLength === 4;
}

// Test clearing array during iteration
export function ArrayFindLastModifyTest9900() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push(index);
        if (index === 4) {
            array.length = 0;
        }
        return false;
    });
    return JSON.stringify(visited) === JSON.stringify([4, 3, 2, 1, 0]) && 
           arr.length === 0;
}

// ============================================
// Additional missing test cases (10000+)
// ============================================

// Test arrow function ignores thisArg (3.3.1)
export function ArrayFindLastThisArgTest10000() {
    const arr = [1, 2, 3, 4, 5];
    const context = { threshold: 3 };
    const result = arr.findLast((element) => {
        return element > 3;
    }, context);
    return result === 5;
}

// Test skip undefined to find other values (5.1.3)
export function ArrayFindLastSparseTest10100() {
    const arr = [1, undefined, 3, undefined, 5];
    const result = arr.findLast(element => element !== undefined);
    return result === 5;
}

// Test Number.MIN_VALUE (6.4.2)
export function ArrayFindLastEdgeTest10200() {
    const arr = [Number.MAX_VALUE, Number.MIN_VALUE, 0, -Number.MIN_VALUE];
    const result = arr.findLast(element => element > 0 && element < 1);
    return result === Number.MIN_VALUE;
}

// Test callback is not callable (7.1.2)
export function ArrayFindLastErrorTest10300() {
    try {
        const arr = [1, 2, 3];
        arr.findLast({ notAFunction: true });
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// Test unshift adds elements (8.4.2)
export function ArrayFindLastModifyTest10400() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push({ index, length: array.length });
        if (index === 4) {
            array.unshift(0);
        }
        return false;
    });
    return visited[0].length === 5 && visited[0].index === 4;
}

// Test increasing array length (8.5.2)
export function ArrayFindLastModifyTest10500() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    const result = arr.findLast((element, index, array) => {
        visited.push({ index, length: array.length });
        if (index === 4) {
            array.length = 10;
        }
        return false;
    });
    return visited[0].length === 5 && arr.length === 10;
}

// Test string find uppercase letters (9.2.2)
export function ArrayFindLastLikeTest10600() {
    const str = "Hello World";
    const result = Array.prototype.findLast.call(str, char => char === char.toUpperCase() && char !== char.toLowerCase());
    return result === "W";
}

// Test empty arguments object (9.3.2)
export function ArrayFindLastLikeTest10700() {
    function testFunc() {
        return Array.prototype.findLast.call(arguments, element => element > 0);
    }
    const result = testFunc();
    return result === undefined;
}

// Test custom array-like object (9.6.1)
export function ArrayFindLastLikeTest10800() {
    const customObj = {
        0: "first",
        1: "second",
        2: "third",
        length: 3,
        customProp: "value"
    };
    const result = Array.prototype.findLast.call(customObj, element => element.includes("d"));
    return result === "third";
}

// Test array-like with length 0 (9.7.1)
export function ArrayFindLastLikeTest10900() {
    const arrayLike = {
        0: "a",
        1: "b",
        length: 0
    };
    const result = Array.prototype.findLast.call(arrayLike, () => true);
    return result === undefined;
}

// Test callback using mapping logic (10.5.2)
export function ArrayFindLastInteractionTest11000() {
    const arr = [1, 2, 3, 4, 5];
    const mapped = arr.map(x => x * 2);
    const result = mapped.findLast(element => element > 5);
    return result === 10;
}

// Test findLast vs reverse+find (10.6.2)
export function ArrayFindLastInteractionTest11100() {
    const arr = [1, 2, 3, 4, 5];
    const findLastResult = arr.findLast(x => x > 2);
    const reverseFindResult = [...arr].reverse().find(x => x > 2);
    return findLastResult === reverseFindResult && findLastResult === 5;
}

// Test Symbol.for (11.4.2)
export function ArrayFindLastSpecialTest11200() {
    const sym1 = Symbol.for("test");
    const sym2 = Symbol.for("test");
    const arr = [Symbol("other"), sym1, Symbol("another"), sym2];
    const result = arr.findLast(element => element === Symbol.for("test"));
    return result === sym2;
}

// Test BigInt mixed with Number (11.5.2)
export function ArrayFindLastSpecialTest11300() {
    const arr = [1n, 2n, 3, 4n, 5];
    const result = arr.findLast(element => typeof element === "bigint");
    return result === 4n;
}
