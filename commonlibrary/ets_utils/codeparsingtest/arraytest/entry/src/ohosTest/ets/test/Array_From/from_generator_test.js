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
 * Test generator function
 * @returns {TestResult} Test result
 */
export function testGeneratorFunction() {
    function* generator() {
        yield 1;
        yield 2;
        yield 3;
    }
    const result = Array.from(generator());
    return { result: JSON.stringify(result), expected: JSON.stringify([1, 2, 3]) };
}

/**
 * Test infinite generator with mapFn
 * @returns {TestResult} Test result
 */
export function testInfiniteGenerator() {
    function* limitedGenerator() {
        for (let i = 0; i < 3; i++) {
            yield i;
        }
    }

    const result = Array.from(limitedGenerator());
    return { result: JSON.stringify(result), expected: JSON.stringify([0, 1, 2]) };
}

// Export functions
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testGeneratorFunction,
        testInfiniteGenerator
    };
}
