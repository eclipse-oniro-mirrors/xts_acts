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

// Test Symbol element throws TypeError
export function JoinSymbolTest0100() {
    const sym = Symbol('test');
    const arr = [sym];
    try {
        arr.join();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test multiple Symbol elements
export function JoinSymbolTest0200() {
    const sym1 = Symbol('desc1');
    const sym2 = Symbol('desc2');
    const arr = [sym1, sym2];
    try {
        const str = sym1 + sym2;
        return false;
    } catch (e) {
        return e instanceof TypeError && e.message.includes('Symbol');
    }
}

// Test Symbol with other types
export function JoinSymbolTest0300() {
    const sym = Symbol('test');
    const arr = [1, 'a', sym, true];
    try {
        arr.join(',');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test Symbol.toPrimitive method
export function JoinToPrimitiveTest0400() {
    const obj = {
        [Symbol.toPrimitive](hint) {
            if (hint === 'string') {
                return 'custom string';
            }
            return 42;
        }
    };
    const arr = [obj, obj];
    const result = arr.join('-');
    return result === 'custom string-custom string';
}

// Test toString method
export function JoinToStringTest0500() {
    const obj = {
        toString() {
            return 'obj-string';
        }
    };
    const arr = [obj, 'b'];
    const result = arr.join('|');
    return result === 'obj-string|b';
}

// Test valueOf method only
export function JoinValueOfTest0600() {
    const obj = {
        valueOf() {
            return 'obj-value';
        }
    };
    const arr = [obj, 'b'];
    const result = arr.join('|');
    return result === '[object Object]|b';
}

// Test toString and valueOf both exist
export function JoinToStringValueOfTest0700() {
    const obj = {
        toString() {
            return 'from-toString';
        },
        valueOf() {
            return 'from-valueOf';
        }
    };
    const arr = [obj];
    const result = arr.join();
    return result === 'from-toString';
}

// Test Symbol.toStringTag
export function JoinToStringTagTest0800() {
    const obj = {
        [Symbol.toStringTag]: 'CustomObject'
    };
    const arr = [obj];
    const result = arr.join();
    return result === '[object CustomObject]';
}

// Test toString returns non-string
export function JoinToStringNonStringTest0900() {
    const obj = {
        toString() {
            return 123;
        }
    };
    const arr = [obj];
    const result = arr.join();
    return result === '123';
}

// Test null prototype object
export function JoinNullPrototypeTest1000() {
    const obj = { name: 'test' };
    const arr = [obj];
    const result = arr.join();
    return result === '[object Object]';
}

// Test prototype chain modification
export function JoinPrototypeChainTest1100() {
    function MyClass() {}
    MyClass.prototype.toString = function() {
        return 'MyClass instance';
    };
    const obj = new MyClass();
    const arr = [obj, obj];
    const result = arr.join('-');
    return result === 'MyClass instance-MyClass instance';
}

// Test array-like object with join.call
export function JoinArrayLikeTest1200() {
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const result = Array.prototype.join.call(arrayLike, '-');
    return result === 'a-b-c';
}

// Test arguments object with join.call
export function JoinArgumentsTest1300() {
    function test() {
        return Array.prototype.join.call(arguments, '|');
    }
    const result = test(1, 2, 3);
    return result === '1|2|3';
}

// Test custom Array subclass
export function JoinCustomArrayTest1400() {
    class MyArray extends Array {
        customJoin() {
            return this.join('=>');
        }
    }
    const myArr = new MyArray(1, 2, 3);
    const result1 = myArr.join('-');
    const result2 = myArr.customJoin();
    return result1 === '1-2-3' && result2 === '1=>2=>3';
}

// Test modified Array.prototype.join
export function JoinModifiedPrototypeTest1500() {
    const originalJoin = Array.prototype.join;
    Array.prototype.join = function(separator) {
        return 'Modified: ' + originalJoin.call(this, separator);
    };
    const arr = [1, 2, 3];
    const result = arr.join();
    Array.prototype.join = originalJoin;
    return result === 'Modified: 1,2,3';
}

// Test object borrowing join method
export function JoinBorrowMethodTest1600() {
    const obj = { 0: 'x', 1: 'y', length: 2 };
    const result = Array.prototype.join.call(obj, '+');
    return result === 'x+y';
}

// Test TypedArray with join
export function JoinTypedArrayTest1700() {
    const typedArr = new Uint8Array([1, 2, 3]);
    const result = typedArr.join('-');
    return result === '1-2-3';
}

// Test string borrowing join method
export function JoinStringTest1800() {
    const str = 'hello';
    const result = Array.prototype.join.call(str, '-');
    return result === 'h-e-l-l-o';
}

// Test delete operator creates sparse array
export function JoinSparseDeleteTest1900() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    const result = arr.join(',');
    return result === '1,2,,4,5' && arr.length === 5;
}

// Test sparse array vs explicit undefined difference
export function JoinSparseVsUndefinedTest2000() {
    const sparse = new Array(3);
    const withUndefined = [undefined, undefined, undefined];
    const result1 = sparse.join('-');
    const result2 = withUndefined.join('-');
    const sparseHas0 = 0 in sparse;
    const undefHas0 = 0 in withUndefined;
    return result1 === '--' && result2 === '--' && !sparseHas0 && undefHas0;
}

// Test sparse array forEach vs join comparison
export function JoinSparseForEachTest2100() {
    const arr = [1, , 3, , 5];
    const joinResult = arr.join(',');
    let count = 0;
    arr.forEach(() => count++);
    return joinResult === '1,,3,,5' && count === 3;
}

// Test extreme sparse array
export function JoinExtremeSparseTest2200() {
    const arr = [];
    arr[0] = 'start';
    arr[10000] = 'end';
    const result = arr.join('-');
    return result.split('-').length === 10001;
}

// Test toString throws exception
export function JoinToStringErrorTest2300() {
    const obj = {
        toString() {
            throw new Error('toString error');
        }
    };
    const arr = [obj];
    try {
        arr.join();
        return false;
    } catch (e) {
        return e.message === 'toString error';
    }
}

// Test valueOf throws exception 
export function JoinValueOfErrorTest2400() {
    const obj = {
        valueOf() {
            throw new Error('valueOf error');
        }
    };
    const arr = [obj];
    const result = arr.join();
    return result === '[object Object]';
}

// Test separator object throws exception
export function JoinSeparatorErrorTest2500() {
    const separator = {
        toString() {
            throw new Error('separator error');
        }
    };
    const arr = [1, 2, 3];
    try {
        arr.join(separator);
        return false;
    } catch (e) {
        return e.message === 'separator error';
    }
}

// Test null this context
export function JoinNullContextTest2600() {
    try {
        Array.prototype.join.call(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test undefined this context
export function JoinUndefinedContextTest2700() {
    try {
        Array.prototype.join.call(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test frozen array 
export function JoinFrozenTest2800() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.join('-');
    return result === '1-2-3';
}

// Test sealed array 
export function JoinSealedTest2900() {
    const arr = Object.seal([1, 2, 3]);
    const result = arr.join('-');
    return result === '1-2-3';
}

// Test Proxy array
export function JoinProxyTest3000() {
    const arr = [1, 2, 3];
    let getCallCount = 0;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            getCallCount++;
            return target[prop];
        }
    });
    const result = proxy.join('-');
    return result === '1-2-3' && getCallCount > 0;
}

// Test non-array object calling join
export function JoinNonArrayTest3100() {
    const obj = { a: 1 };
    const result = Array.prototype.join.call(obj);
    return result === '';
}

// Test join with split reverse operation
export function JoinSplitTest3200() {
    const arr = ['a', 'b', 'c'];
    const str = arr.join('-');
    const arr2 = str.split('-');
    return JSON.stringify(arr) === JSON.stringify(arr2);
}

// Test join equals toString
export function JoinToStringEqualTest3300() {
    const arr = [1, 2, 3];
    const joinResult = arr.join();
    const toStringResult = arr.toString();
    return joinResult === '1,2,3' && joinResult === toStringResult;
}

// Test join with map combination
export function JoinMapTest3400() {
    const arr = [1, 2, 3, 4];
    const result = arr.map(x => x * 2).join('+');
    return result === '2+4+6+8';
}

// Test join with filter combination
export function JoinFilterTest3500() {
    const arr = [1, null, 2, undefined, 3];
    const result = arr.filter(x => x != null).join(',');
    return result === '1,2,3';
}

// Test join with concat combination
export function JoinConcatTest3600() {
    const arr1 = [1, 2];
    const arr2 = [3, 4];
    const result = arr1.concat(arr2).join('|');
    return result === '1|2|3|4';
}

// Test join with slice combination
export function JoinSliceTest3700() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const result = arr.slice(1, 4).join('-');
    return result === 'b-c-d';
}

// Test join with sort combination
export function JoinSortTest3800() {
    const arr = [3, 1, 4, 1, 5, 9];
    const result = [...arr].sort((a, b) => a - b).join('-');
    return result === '1-1-3-4-5-9';
}

// Test join with reverse combination
export function JoinReverseTest3900() {
    const arr = ['a', 'b', 'c'];
    const result = [...arr].reverse().join('-');
    return result === 'c-b-a';
}

// Test join with includes combination
export function JoinIncludesTest4000() {
    const arr = ['apple', 'banana', 'cherry'];
    const joined = arr.join(',');
    return joined.includes('banana') && !joined.includes('orange');
}

// Test join with template string
export function JoinTemplateTest4100() {
    const arr = ['John', 'Jane', 'Bob'];
    const message = `Users: ${arr.join(', ')}`;
    return message === 'Users: John, Jane, Bob';
}

// Test join with regex
export function JoinRegexTest4200() {
    const arr = ['123', '456', '789'];
    const joined = arr.join('-');
    const replaced = joined.replace(/-/g, ':');
    return replaced === '123:456:789';
}

// Test join vs JSON.stringify
export function JoinJsonTest4300() {
    const arr = [1, 2, 3];
    const joinResult = arr.join();
    const jsonResult = JSON.stringify(arr);
    return joinResult === '1,2,3' && jsonResult === '[1,2,3]';
}

// Test join result to number
export function JoinToNumberTest4400() {
    const arr1 = ['1', '2', '3'];
    const num = Number(arr1.join(''));
    return num === 123;
}

// Test join result to boolean 
export function JoinToBooleanTest4500() {
    const arr = [];
    const bool = Boolean(arr.join());
    return bool === false;
}

// Test join result to boolean 
export function JoinToBooleanTest4600() {
    const arr = ['a'];
    const bool = Boolean(arr.join());
    return bool === true;
}

// Test BigInt elements
export function JoinBigIntTest4700() {
    const arr = [1n, 2n, 3n];
    const result = arr.join('-');
    return result === '1-2-3';
}


// Test mixed types including null and undefined
export function JoinMixedTypesTest4800() {
    const arr = [1, 'two', true, null, undefined];
    const result = arr.join(',');
    return result === '1,two,true,,';
}

// Test join with empty array and various separators
export function JoinEmptyArrayTest4900() {
    const arr = [];
    const result1 = arr.join();
    const result2 = arr.join('-');
    const result3 = arr.join('anything');
    return result1 === '' && result2 === '' && result3 === '';
}

// Test single undefined element
export function JoinSingleUndefinedTest5000() {
    const arr = [undefined];
    const result = arr.join();
    return result === '';
}

// Test single null element
export function JoinSingleNullTest5100() {
    const arr = [null];
    const result = arr.join();
    return result === '';
}

// Test single empty string element
export function JoinSingleEmptyStringTest5200() {
    const arr = [''];
    const result1 = arr.join();
    const result2 = arr.join('-');
    return result1 === '' && result2 === '';
}

// Test single object element
export function JoinSingleObjectTest5300() {
    const obj = { key: 'value' };
    const arr = [obj];
    const result = arr.join();
    return result === '[object Object]';
}

// Test negative length 
export function JoinNegativeLengthTest5400() {
    const arr = [1, 2, 3];
    try {
        arr.length = -1;
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

// Test decimal length 
export function JoinDecimalLengthTest5500() {
    const arr = [1, 2, 3];
    arr.length = 2;
    const result = arr.join('-');
    return result === '1-2' && arr.length === 2;
}

// Test length modification to expand
export function JoinExpandLengthTest5600() {
    const arr = [1, 2, 3, 4, 5];
    arr.length = 3;
    const result1 = arr.join('-');
    arr.length = 10;
    const result2 = arr.join('-');
    return result1 === '1-2-3' && result2 === '1-2-3-------';
}

// Test join method length property
export function JoinPropertyTest5700() {
    return Array.prototype.join.length === 1;
}

// Test join method name property
export function JoinPropertyTest5800() {
    return Array.prototype.join.name === 'join';
}


// Test newline separator
export function JoinNewlineTest5900() {
    const arr = ['a', 'b', 'c'];
    const result = arr.join('\n');
    return result === 'a\nb\nc';
}

// Test tab separator
export function JoinTabTest6000() {
    const arr = ['a', 'b', 'c'];
    const result = arr.join('\t');
    return result === 'a\tb\tc';
}

// Test backslash separator
export function JoinBackslashTest6100() {
    const arr = ['a', 'b', 'c'];
    const result = arr.join('\\');
    return result === 'a\\b\\c';
}

// Test array separator 
export function JoinArraySeparatorTest6200() {
    const arr = ['a', 'b', 'c'];
    const result = arr.join(['x', 'y']);
    return result === 'ax,ybx,yc';
}

// Test object with custom toString as separator
export function JoinCustomSeparatorTest6300() {
    const arr = ['a', 'b', 'c'];
    const separator = { toString: () => '|||' };
    const result = arr.join(separator);
    return result === 'a|||b|||c';
}

// Test mixed nested arrays with different types
export function JoinNestedMixedTest6400() {
    const arr = [1, [2, 3], [[4, 5]], [[[6]]]];
    const result = arr.join('|');
    return result === '1|2,3|4,5|6';
}

// Test deeply nested empty arrays
export function JoinNestedEmptyTest6500() {
    const arr = [[1], [[]], [[], []]];
    const result = arr.join('-');
    return result === '1--,';
}

// Test array with all empty nested arrays
export function JoinAllEmptyNestedTest6600() {
    const arr = [[], [], []];
    const result = arr.join('-');
    return result === '--';
}

// Test join with Boolean separator
export function JoinBooleanSeparatorTest6700() {
    const arr = ['a', 'b', 'c'];
    const result1 = arr.join(true);
    const result2 = arr.join(false);
    return result1 === 'atruebtruec' && result2 === 'afalsebfalsec';
}

// Test join with numeric separator
export function JoinNumericSeparatorTest6800() {
    const arr = ['a', 'b', 'c'];
    const result1 = arr.join(0);
    const result2 = arr.join(123);
    return result1 === 'a0b0c' && result2 === 'a123b123c';
}

// Test join with null separator
export function JoinNullSeparatorTest6900() {
    const arr = ['a', 'b', 'c'];
    const result = arr.join(null);
    return result === 'anullbnullc';
}

// Test join with undefined separator 
export function JoinUndefinedSeparatorTest7000() {
    const arr = ['a', 'b', 'c'];
    const result = arr.join(undefined);
    return result === 'a,b,c';
}

// Test two-element array
export function JoinTwoElementsTest7100() {
    const arr = ['first', 'second'];
    const result = arr.join('-');
    return result === 'first-second';
}

// Test join with consecutive undefined and null
export function JoinConsecutiveUndefinedNullTest7200() {
    const arr = ['a', undefined, null, undefined, 'b'];
    const result = arr.join(',');
    return result === 'a,,,,b';
}

// Test join with undefined and null at different positions
export function JoinPositionUndefinedNullTest7300() {
    const arr1 = [undefined, 'a', 'b'];
    const arr2 = ['a', 'b', null];
    const arr3 = [null, 'a', undefined];
    const result1 = arr1.join('-');
    const result2 = arr2.join('-');
    const result3 = arr3.join('-');
    return result1 === '-a-b' && result2 === 'a-b-' && result3 === '-a-';
}
