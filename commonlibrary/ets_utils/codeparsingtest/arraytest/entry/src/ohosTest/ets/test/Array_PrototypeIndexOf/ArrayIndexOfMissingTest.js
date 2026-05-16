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

// Test basic array-like object
export function ArrayIndexOfArrayLikeTest0100() {
    const arrayLike = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const result = Array.prototype.indexOf.call(arrayLike, 'b');
    return result === 1;
}

// Test array-like object with non-existing element
export function ArrayIndexOfArrayLikeTest0200() {
    const arrayLike = {
        length: 3,
        0: 1,
        1: 2,
        2: 3
    };
    const result = Array.prototype.indexOf.call(arrayLike, 5);
    return result === -1;
}

// Test array-like object with fromIndex
export function ArrayIndexOfArrayLikeTest0300() {
    const arrayLike = {
        length: 5,
        0: 'a',
        1: 'b',
        2: 'c',
        3: 'b',
        4: 'd'
    };
    const result = Array.prototype.indexOf.call(arrayLike, 'b', 2);
    return result === 3;
}

// Test arguments object
export function ArrayIndexOfArgumentsTest0400() {
    function test() {
        return Array.prototype.indexOf.call(arguments, 2);
    }
    const result = test(1, 2, 3, 4, 5);
    return result === 1;
}

// Test arguments object with non-existing element
export function ArrayIndexOfArgumentsTest0500() {
    function test() {
        return Array.prototype.indexOf.call(arguments, 10);
    }
    const result = test(1, 2, 3);
    return result === -1;
}

// Test string as array-like object
export function ArrayIndexOfStringTest0600() {
    const str = 'hello';
    const result = Array.prototype.indexOf.call(str, 'l');
    return result === 2;
}

// Test string with non-existing character
export function ArrayIndexOfStringTest0700() {
    const str = 'hello';
    const result = Array.prototype.indexOf.call(str, 'z');
    return result === -1;
}

// Test object without length property
export function ArrayIndexOfNoLengthTest0800() {
    const obj = {
        0: 'a',
        1: 'b'
    };
    const result = Array.prototype.indexOf.call(obj, 'a');
    return result === -1;
}

// Test object with negative length
export function ArrayIndexOfNegativeLengthTest0900() {
    const obj = {
        length: -1,
        0: 'a',
        1: 'b'
    };
    const result = Array.prototype.indexOf.call(obj, 'a');
    return result === -1;
}

// Test object with non-numeric length
export function ArrayIndexOfNonNumericLengthTest1000() {
    const obj = {
        length: 'abc',
        0: 'a',
        1: 'b'
    };
    const result = Array.prototype.indexOf.call(obj, 'a');
    return result === -1;
}

// Test custom array-like object with indexOf method
export function ArrayIndexOfCustomObjTest1100() {
    const customObj = {
        length: 4,
        0: 'zero',
        1: 'one',
        2: 'two',
        3: 'three',
        indexOf: Array.prototype.indexOf
    };
    const result = customObj.indexOf('two');
    return result === 2;
}

// Test null as this value
export function ArrayIndexOfNullThisTest1200() {
    try {
        Array.prototype.indexOf.call(null, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test undefined as this value
export function ArrayIndexOfUndefinedThisTest1300() {
    try {
        Array.prototype.indexOf.call(undefined, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test Symbol type in array
export function ArrayIndexOfSymbolTest1400() {
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const arr = [sym1, sym2];
    const result1 = arr.indexOf(sym1);
    const result2 = arr.indexOf(Symbol('test'));
    return result1 === 0 && result2 === -1;
}

// Test BigInt type in array
export function ArrayIndexOfBigIntTest1500() {
    const arr = [1n, 2n, 3n, 4n, 5n];
    const result = arr.indexOf(3n);
    return result === 2;
}

// Test function reference in array
export function ArrayIndexOfFunctionTest1600() {
    const func = () => 'test';
    const arr = [func, () => 'test'];
    const result1 = arr.indexOf(func);
    const result2 = arr.indexOf(() => 'test');
    return result1 === 0 && result2 === -1;
}

// Test Date object reference in array
export function ArrayIndexOfDateTest1700() {
    const date = new Date('2024-01-01');
    const arr = [date, new Date('2024-01-01')];
    const result1 = arr.indexOf(date);
    const result2 = arr.indexOf(new Date('2024-01-01'));
    return result1 === 0 && result2 === -1;
}

// Test RegExp object reference in array
export function ArrayIndexOfRegExpTest1800() {
    const regex = /test/;
    const arr = [regex, /test/];
    const result1 = arr.indexOf(regex);
    const result2 = arr.indexOf(/test/);
    return result1 === 0 && result2 === -1;
}

// Test wrapper objects not equal to primitives
export function ArrayIndexOfWrapperTest1900() {
    const arr = [new Number(1), new String('a'), new Boolean(true)];
    const result1 = arr.indexOf(1);
    const result2 = arr.indexOf('a');
    const result3 = arr.indexOf(true);
    return result1 === -1 && result2 === -1 && result3 === -1;
}

// Test wrapper object instances
export function ArrayIndexOfWrapperInstTest2000() {
    const numObj = new Number(1);
    const arr = [numObj, new Number(1)];
    const result = arr.indexOf(new Number(1));
    return result === -1;
}

// Test delete creates hole - multiple deletes
export function ArrayIndexOfDeleteMultipleTest2100() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[1];
    delete arr[3];
    const result = arr.indexOf(5);
    return result === 4;
}

// Test new Array(length) sparse array
export function ArrayIndexOfSparseConstructorTest2200() {
    const arr = new Array(5);
    arr[2] = 'test';
    const result1 = arr.indexOf('test');
    const result2 = arr.indexOf(undefined);
    return result1 === 2 && result2 === -1;
}

// Test Array(length) with multiple assignments
export function ArrayIndexOfSparseAssignTest2300() {
    const arr = new Array(10);
    arr[0] = 'a';
    arr[5] = 'b';
    arr[9] = 'c';
    const result1 = arr.indexOf('a');
    const result2 = arr.indexOf('b');
    const result3 = arr.indexOf('c');
    return result1 === 0 && result2 === 5 && result3 === 9;
}

// Test mixed holes and undefined
export function ArrayIndexOfMixedHolesTest2400() {
    const arr = [1, , undefined, , 5];
    const result = arr.indexOf(undefined);
    return result === 2;
}

// Test fromIndex across holes
export function ArrayIndexOfFromIndexHolesTest2500() {
    const arr = [1, , , 4, 5];
    const result = arr.indexOf(4, 2);
    return result === 3;
}

// Test negative fromIndex with sparse array
export function ArrayIndexOfNegFromIndexSparseTest2600() {
    const arr = [1, , , 4, 5];
    const result = arr.indexOf(4, -3);
    return result === 3;
}

// Test modifying length creates holes
export function ArrayIndexOfLengthIncreaseTest2700() {
    const arr = [1, 2, 3];
    arr.length = 6;
    const result1 = arr.indexOf(1);
    const result2 = arr.indexOf(undefined);
    return result1 === 0 && result2 === -1;
}

// Test fromIndex as string number
export function ArrayIndexOfFromStringNumTest2800() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.indexOf(3, '2');
    return result === 2;
}

// Test fromIndex as non-numeric string
export function ArrayIndexOfFromStringNonNumTest2900() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.indexOf(1, 'abc');
    return result === 0;
}

// Test empty array from Array.of
export function ArrayIndexOfEmptyOfTest3000() {
    const arr = Array.of();
    const result = arr.indexOf(1);
    return result === -1 && arr.length === 0;
}

// Test indexOf with findIndex comparison
export function ArrayIndexOfFindIndexTest3100() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.indexOf(3);
    const result2 = arr.findIndex(x => x === 3);
    return result1 === 2 && result2 === 2;
}

// Test findIndex with complex condition
export function ArrayIndexOfFindIndexComplexTest3200() {
    const arr = [{id: 1}, {id: 2}, {id: 3}];
    const result = arr.findIndex(obj => obj.id === 2);
    return result === 1;
}

// Test removeAll using indexOf and splice
export function ArrayIndexOfRemoveAllTest3300() {
    const arr = ['a', 'b', 'c', 'b', 'd'];
    let index = arr.indexOf('b');
    while (index !== -1) {
        arr.splice(index, 1);
        index = arr.indexOf('b');
    }
    return arr.length === 3 && arr[0] === 'a' && arr[1] === 'c' && arr[2] === 'd';
}

// Test union operation using indexOf
export function ArrayIndexOfUnionTest3400() {
    const arr1 = [1, 2, 3];
    const arr2 = [2, 3, 4];
    const union = [...new Set([...arr1, ...arr2])];
    return union.length === 4 && union.includes(1) && union.includes(4);
}

// Test using indexOf with forEach to collect indices
export function ArrayIndexOfForEachTest3500() {
    const arr = ['a', 'b', 'c', 'b', 'd'];
    const indices = [];
    arr.forEach((item, index) => {
        if (item === 'b') {
            indices.push(index);
        }
    });
    return indices.length === 2 && indices[0] === 1 && indices[1] === 3;
}

// Test using reduce with indexOf to count occurrences
export function ArrayIndexOfReduceTest3600() {
    const arr = ['a', 'b', 'c', 'b', 'd'];
    const count = arr.reduce((acc, item) => {
        acc[item] = (acc[item] || 0) + 1;
        return acc;
    }, {});
    return count['a'] === 1 && count['b'] === 2 && count['c'] === 1 && count['d'] === 1;
}
