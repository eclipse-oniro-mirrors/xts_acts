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

export function testMiddleEmptySlot() {
    const arr = ['a', , 'c'];
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, 'a'], [1, undefined], [2, 'c']])
    };
}

export function testLeadingEmptySlots() {
    const arr = [, , 'a'];
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, undefined], [1, undefined], [2, 'a']])
    };
}

export function testTrailingEmptySlots() {
    const arr = ['a', ,];
    const entries = [...arr.entries()];
    return {
        result: entries.length,
        expected: 2
    };
}

export function testAllEmptySlots() {
    const arr = new Array(5);
    const entries = [...arr.entries()];
    const allUndefined = entries.every(entry => entry[1] === undefined);
    return {
        result: entries.length === 5 && allUndefined,
        expected: true
    };
}

export function testAlternatingEmptySlots() {
    const arr = [1, , 3, , 5];
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify([entries[1][1], entries[2][1], entries[3][1]]),
        expected: JSON.stringify([undefined, 3, undefined])
    };
}

export function testLongIntervalEmptySlots() {
    const arr = ['a'];
    arr[100] = 'b';
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify([entries.length, entries[50][1], entries[100][1]]),
        expected: JSON.stringify([101, undefined, 'b'])
    };
}

export function testEmptySlotVsUndefined() {
    const arr1 = [,];
    const arr2 = [undefined];
    const entries1 = [...arr1.entries()];
    const entries2 = [...arr2.entries()];
    return {
        result: JSON.stringify([0 in arr1, 0 in arr2]),
        expected: JSON.stringify([false, true])
    };
}

export function testMixedEmptySlotsAndUndefined() {
    const arr = [, undefined, , null];
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, undefined], [1, undefined], [2, undefined], [3, null]])
    };
}

export function testIteratorThrow() {
    const arr = ['a', 'b'];
    const iterator = arr.entries();

    if (iterator.throw) {
        try {
            iterator.throw(new Error('test'));
            return { result: false, expected: true };
        } catch (e) {
            return { result: e.message, expected: 'test' };
        }
    }
    return { result: 'throw() not supported', expected: 'throw() not supported' };
}