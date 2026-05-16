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
 * Test result interface
 * @typedef {Object} TestResult
 * @property {boolean|string} result - Test result value
 * @property {boolean|string|undefined} expected - Expected value
 */

/**
 * Test Symbol as array element
 * @returns {TestResult} Test result
 */
export function testSymbolAsElement() {
    const sym = Symbol("test");
    const result = Array.from([sym, 1, 2]);
    return { result: result[0] === sym, expected: true };
}

/**
 * Create iterator next function
 * @param {number} stepCount - Step count
 * @returns {Object} Iterator result
 */
function createNextResult(stepCount) {
    if (stepCount <= 3) {
        return { value: stepCount, done: false };
    }
    return { done: true };
}

/**
 * Create iterator
 * @returns {Object} Iterator object
 */
function createIterator() {
    let step = 0;
    return {
        next: () => {
            step++;
            return createNextResult(step);
        }
    };
}

/**
 * Test Symbol.iterator with custom iterable
 * @returns {TestResult} Test result
 */
export function testSymbolIterator() {
    const iterable = {
        [Symbol.iterator]: createIterator
    };
    const result = Array.from(iterable);
    return { result: JSON.stringify(result), expected: JSON.stringify([1, 2, 3]) };
}

/**
 * Test Symbol.species
 * @returns {TestResult} Test result
 */
export function testSymbolSpecies() {
    if (typeof Symbol === 'undefined' || !Symbol.species) {
        return { result: 'Symbol.species not supported', expected: 'Symbol.species not supported' };
    }

    class MyArray extends Array {
        static get [Symbol.species]() {
            return Array;
        }
    }
    const result = MyArray.from([1, 2, 3]);
    return {
        result: result instanceof Array && !(result instanceof MyArray),
        expected: true
    };
}

// Export functions
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testSymbolAsElement,
        testSymbolIterator,
        testSymbolSpecies
    };
}
