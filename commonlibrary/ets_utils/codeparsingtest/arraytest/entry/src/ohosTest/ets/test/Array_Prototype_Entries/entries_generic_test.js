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
"use strict";

function createErrorThrowingIterator() {
    return {
        next() {
            throw new Error('iterator error');
        }
    };
}

function getErrorThrowingCustomIterator() {
    return {
        [Symbol.iterator]() {
            return createErrorThrowingIterator();
        }
    };
}

export function testArrayLikeObject() {
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const iterator = Array.prototype.entries.call(arrayLike);
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, 'a'], [1, 'b'], [2, 'c']])
    };
}

export function testArgumentsObject() {
    function test() {
        const iterator = Array.prototype.entries.call(arguments);
        return [...iterator];
    }
    const result = test('a', 'b', 'c');
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([[0, 'a'], [1, 'b'], [2, 'c']])
    };
}

export function testStringAsArrayLike() {
    const str = 'abc';
    const iterator = Array.prototype.entries.call(str);
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, 'a'], [1, 'b'], [2, 'c']])
    };
}

export function testEmptyString() {
    const str = '';
    const iterator = Array.prototype.entries.call(str);
    const result = iterator.next().done;
    return {
        result: result,
        expected: true
    };
}

export function testSpecialCharString() {
    const str = 'a\nb\tc';
    const iterator = Array.prototype.entries.call(str);
    const entries = [...iterator];
    return {
        result: JSON.stringify([entries[1], entries[3]]),
        expected: JSON.stringify([[1, '\n'], [3, '\t']])
    };
}

export function testInt8Array() {
    const typedArr = new Int8Array([1, 2, 3]);
    const iterator = Array.prototype.entries.call(typedArr);
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, 1], [1, 2], [2, 3]])
    };
}

export function testFloat32Array() {
    const floatArr = new Float32Array([1.1, 2.2, 3.3]);
    const iterator = Array.prototype.entries.call(floatArr);
    const entries = [...iterator];
    return {
        result: entries[0][1] === 1.0999999046325684,
        expected: false
    };
}

export function testObjectWithLength() {
    const obj = { length: 3 };
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: JSON.stringify([entries.length, entries[0]]),
        expected: JSON.stringify([3, [0, undefined]])
    };
}

export function testObjectWithNegativeLength() {
    const obj = { length: -1 };
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: entries.length,
        expected: 0
    };
}

export function testObjectWithNonNumericLength() {
    const obj = { length: 'abc' };
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: entries.length,
        expected: 0
    };
}

export function testObjectWithFractionalLength() {
    const obj = {
        0: 'a',
        1: 'b',
        length: 2.7
    };
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: JSON.stringify([entries.length, entries]),
        expected: JSON.stringify([2, [[0, 'a'], [1, 'b']]])
    };
}

export function testEmptyObject() {
    const obj = {};
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: entries.length,
        expected: 0
    };
}

export function testNullHandling() {
    let isError = false;
    try {
        Array.prototype.entries.call(null);
    } catch (e) {
        isError = e instanceof TypeError;
    }
    return {
        result: isError,
        expected: true
    };
}

export function testUndefinedHandling() {
    let isError = false;
    try {
        Array.prototype.entries.call(undefined);
    } catch (e) {
        isError = e instanceof TypeError;
    }
    return {
        result: isError,
        expected: true
    };
}

export function testMultipleNextCalls() {
    const arr = ['a'];
    const iterator = arr.entries();
    const first = iterator.next();
    const second = iterator.next();
    const third = iterator.next();
    const fourth = iterator.next();
    return {
        result: JSON.stringify([
            first.done,
            first.value,
            second.done,
            second.value,
            third.done,
            fourth.done
        ]),
        expected: JSON.stringify([
            false,
            [0, 'a'],
            true,
            undefined,
            true,
            true
        ])
    };
}

export function testIteratorNotReusable() {
    const arr = ['a', 'b'];
    const iterator = arr.entries();
    const first = [...iterator];
    const second = [...iterator];
    return {
        result: JSON.stringify([first.length, second.length]),
        expected: JSON.stringify([2, 0])
    };
}

export function testManualIteration() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.entries();
    let result = iterator.next();
    let count = 0;
    while (!result.done) {
        count++;
        result = iterator.next();
    }
    return {
        result: count,
        expected: 3
    };
}

export function testNestedIterators() {
    const arr = [[1, 2], [3, 4]];
    const results = [];
    for (const [outerIndex, innerArr] of arr.entries()) {
        for (const [innerIndex, value] of innerArr.entries()) {
            results.push(`[${outerIndex}][${innerIndex}] = ${value}`);
        }
    }
    return {
        result: JSON.stringify(results),
        expected: JSON.stringify(['[0][0] = 1', '[0][1] = 2', '[1][0] = 3', '[1][1] = 4'])
    };
}

export function testGeneratorCombination() {
    const arr = ['a', 'b', 'c'];
    function* processEntries(iterable) {
        for (const [index, value] of iterable) {
            yield `${index}-${value.toUpperCase()}`;
        }
    }
    const result = [...processEntries(arr.entries())];
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['0-A', '1-B', '2-C'])
    };
}

export function testMultipleIndependentIterators() {
    const arr = ['a', 'b', 'c'];
    const iter1 = arr.entries();
    const iter2 = arr.entries();
    const result1 = iter1.next().value;
    const result2 = iter2.next().value;
    const result3 = iter1.next().value;
    const result4 = iter2.next().value;
    return {
        result: JSON.stringify([result1, result2, result3, result4]),
        expected: JSON.stringify([[0, 'a'], [0, 'a'], [1, 'b'], [1, 'b']])
    };
}

export function testIndependentIteratorProgress() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const iter1 = arr.entries();
    const iter2 = arr.entries();
    iter1.next();
    iter1.next();
    const result1 = iter1.next().value;
    const result2 = iter2.next().value;
    return {
        result: JSON.stringify([result1, result2]),
        expected: JSON.stringify([[2, 'c'], [0, 'a']])
    };
}

export function testCrossIteration() {
    const arr = ['a', 'b', 'c'];
    const iter1 = arr.entries();
    const iter2 = arr.entries();
    const result = [];
    result.push(iter1.next().value);
    result.push(iter2.next().value);
    result.push(iter1.next().value);
    result.push(iter2.next().value);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([[0, 'a'], [0, 'a'], [1, 'b'], [1, 'b']])
    };
}

export function testIteratorReferenceSharing() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.entries();
    const shared = iterator;
    const result1 = iterator.next().value;
    const result2 = shared.next().value;
    const result3 = iterator.next().value;
    return {
        result: JSON.stringify([result1, result2, result3]),
        expected: JSON.stringify([[0, 'a'], [1, 'b'], [2, 'c']])
    };
}

export function testIteratorAsParameter() {
    const arr = ['a', 'b', 'c'];
    function consumeIterator(iter) {
        const result = [];
        for (const entry of iter) {
            result.push(entry);
            if (result.length === 2) break;
        }
        return result;
    }
    const iterator = arr.entries();
    const consumed = consumeIterator(iterator);
    const remaining = iterator.next().value;
    return {
        result: JSON.stringify([consumed, remaining]),
        expected: JSON.stringify([[[0, 'a'], [1, 'b']], [2, 'c']])
    };
}

export function testIteratorStateSaving() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const iterator = arr.entries();
    const saved = [];
    saved.push(iterator.next());
    saved.push(iterator.next());
    const rest = [...iterator];
    return {
        result: JSON.stringify({
            saved: saved.map(item => ({ value: item.value, done: item.done })),
            rest: rest
        }),
        expected: JSON.stringify({
            saved: [{ value: [0, 'a'], done: false }, { value: [1, 'b'], done: false }],
            rest: [[2, 'c'], [3, 'd'], [4, 'e']]
        })
    };
}

export function testIteratorPauseAndResume() {
    const arr = ['a', 'b', 'c', 'd'];
    const iterator = arr.entries();
    function* pauseableIterator(iter) {
        let count = 0;
        for (const entry of iter) {
            yield entry;
            count++;
            if (count % 2 === 0) {
                yield 'PAUSE';
            }
        }
    }
    const gen = pauseableIterator(iterator);
    const result1 = gen.next();
    const result2 = gen.next();
    const result3 = gen.next();
    const result4 = gen.next();
    return {
        result: JSON.stringify([
            { value: result1.value, done: result1.done },
            { value: result2.value, done: result2.done },
            { value: result3.value, done: result3.done },
            { value: result4.value, done: result4.done }
        ]),
        expected: JSON.stringify([
            { value: [0, 'a'], done: false },
            { value: [1, 'b'], done: false },
            { value: 'PAUSE', done: false },
            { value: [2, 'c'], done: false }
        ])
    };
}

export function testThisAsPrimitive() {
    let result = [];
    try {
        Array.prototype.entries.call(42);
        result.push('false');
    } catch (e) {
        result.push('true');
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['false'])
    };
}

export function testThisAsBoolean() {
    let result = [];
    try {
        Array.prototype.entries.call(true);
        result.push('false');
    } catch (e) {
        result.push('true');
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['false'])
    };
}

export function testThisAsSymbol() {
    let result = [];
    try {
        Array.prototype.entries.call(Symbol('test'));
        result.push('false');
    } catch (e) {
        result.push('true');
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['false'])
    };
}

export function testLengthAsInfinity() {
    let result = [];
    const obj = { length: Infinity, 0: 'a' };
    try {
        const iterator = Array.prototype.entries.call(obj);
        result.push('Created iterator');
    } catch (e) {
        result.push('RangeError');
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['Created iterator'])
    };
}

export function testLengthAsNegativeInfinity() {
    const obj = { length: -Infinity };
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries.length),
        expected: JSON.stringify(0)
    };
}

export function testLengthAsNaN() {
    const obj = { length: NaN };
    const iterator = Array.prototype.entries.call(obj);
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries.length),
        expected: JSON.stringify(0)
    };
}

export function testGetterThrowsError() {
    let result = [];
    const obj = {
        0: 'a',
        1: 'b',
        get length() {
            throw new Error('length error');
        }
    };
    try {
        const iterator = Array.prototype.entries.call(obj);
        [...iterator];
    } catch (e) {
        result.push(e.message);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['length error'])
    };
}

export function testIndexGetterThrowsError() {
    let result = [];
    const obj = {
        length: 2,
        0: 'a',
        get 1() {
            throw new Error('index error');
        }
    };
    try {
        const iterator = Array.prototype.entries.call(obj);
        result.push(iterator.next().value);
        iterator.next();
    } catch (e) {
        result.push(e.message);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([[0, 'a'], 'index error'])
    };
}

export function testCustomIteratorThrowsError() {
    let result = [];
    try {
        const customIterator = getErrorThrowingCustomIterator();
        const entries = [...customIterator];
    } catch (e) {
        result.push(e.message);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['iterator error'])
    };
}

export function testNextReturnsInvalidValue() {
    const arr = ['a', 'b'];
    const iterator = arr.entries();
    const result = iterator.next();
    return {
        result: JSON.stringify({ value: result.value, done: result.done }),
        expected: JSON.stringify({ value: [0, 'a'], done: false })
    };
}

export function testSymbolElements() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = [sym1, sym2];
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify([
            entries[0][1] === sym1,
            entries[1][1] === sym2
        ]),
        expected: JSON.stringify([true, true])
    };
}

export function testSymbolAsPropertyKey() {
    const sym = Symbol('key');
    const arr = [];
    arr[sym] = 'value';
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries.length),
        expected: JSON.stringify(0)
    };
}

export function testGetters() {
    const arr = [];
    Object.defineProperty(arr, 0, {
        get() {
            return 'dynamic';
        }
    });
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries[0]),
        expected: JSON.stringify([0, 'dynamic'])
    };
}

export function testSettersAndGetters() {
    const arr = [];
    Object.defineProperty(arr, 0, {
        get() {
            return this._value;
        },
        set(value) {
            this._value = value;
        }
    });
    arr[0] = 'test';
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries[0]),
        expected: JSON.stringify([0, 'test'])
    };
}

export function testBigIntElements() {
    const arr = [1, 2, 3];
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify([entries[0], entries[1]]),
        expected: JSON.stringify([[0, 1], [1, 2]])
    };
}

export function testDateElements() {
    const arr = [new Date('2024-01-01'), new Date('2024-12-31')];
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify([
            entries[0][1] instanceof Date,
            entries[1][1] instanceof Date
        ]),
        expected: JSON.stringify([true, true])
    };
}

export function testRegExpElements() {
    const arr = [/abc/, /def/];
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify([
            entries[0][1] instanceof RegExp,
            entries[1][1] instanceof RegExp
        ]),
        expected: JSON.stringify([true, true])
    };
}

export function testMaxSafeIntegerLength() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.entries();
    const first = iterator.next();
    return {
        result: JSON.stringify(first.done),
        expected: JSON.stringify(false)
    };
}

export function testNegativeIndex() {
    const arr = ['a', 'b', 'c'];
    arr[-1] = 'negative';
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries.length),
        expected: JSON.stringify(3)
    };
}

export function testNonIntegerIndex() {
    const arr = ['a', 'b', 'c'];
    arr[1.5] = 'float';
    const iterator = arr.entries();
    const entries = [...iterator];
    return {
        result: JSON.stringify(entries.length),
        expected: JSON.stringify(3)
    };
}

export function testLargeIndex() {
    const arr = [];
    arr[999] = 'large';
    const iterator = arr.entries();
    let count = 0;
    let lastEntry = null;
    for (const entry of iterator) {
        count++;
        lastEntry = entry;
    }
    return {
        result: JSON.stringify({ count, lastEntry: lastEntry ? lastEntry[1] : null }),
        expected: JSON.stringify({ count: 1000, lastEntry: 'large' })
    };
}

export function testBasicDestructuring() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.entries();
    const [first, second] = iterator;
    return {
        result: JSON.stringify([first, second]),
        expected: JSON.stringify([[0, 'a'], [1, 'b']])
    };
}

export function testIgnoreIndex() {
    const arr = ['x', 'y', 'z'];
    const result = [];
    for (const [, value] of arr.entries()) {
        result.push(value);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['x', 'y', 'z'])
    };
}

export function testIgnoreValue() {
    const arr = ['a', 'b', 'c'];
    const result = [];
    for (const [index] of arr.entries()) {
        result.push(index);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([0, 1, 2])
    };
}

export function testFromIterator() {
    const arr = ['a', 'b', 'c'];
    const iterator = arr.entries();
    const newArray = Array.from(iterator);
    return {
        result: JSON.stringify(newArray),
        expected: JSON.stringify([[0, 'a'], [1, 'b'], [2, 'c']])
    };
}

export function testDataMapping() {
    const arr = ['a', 'b', 'c'];
    const result = Array.from(arr.entries(), ([index, value]) => `${index}:${value}`);
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['0:a', '1:b', '2:c'])
    };
}

export function testSymbolArray() {
    const arr = [Symbol('a'), Symbol('b')];
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify(entries.length),
        expected: JSON.stringify(2)
    };
}

export function testCreateLookup() {
    const arr = ['apple', 'banana', 'cherry'];
    const lookup = Object.fromEntries(arr.entries());
    return {
        result: JSON.stringify(lookup[1]),
        expected: JSON.stringify('banana')
    };
}

export function testIndexedMapping() {
    const arr = ['x', 'y', 'z'];
    const mapped = Array.from(arr.entries(), ([i, v]) => ({ index: i, value: v }));
    return {
        result: JSON.stringify(mapped),
        expected: JSON.stringify([{ index: 0, value: 'x' }, { index: 1, value: 'y' }, { index: 2, value: 'z' }])
    };
}
