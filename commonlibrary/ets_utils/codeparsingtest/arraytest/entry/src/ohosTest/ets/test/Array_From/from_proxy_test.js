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
 * Test Proxy array
 * @returns {TestResult} Test result
 */
export function testProxyArray() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {});
    const result = Array.from(proxy);
    return { result: JSON.stringify(result), expected: JSON.stringify([1, 2, 3]) };
}

/**
 * Test Proxy array-like object
 * @returns {TestResult} Test result
 */
export function testProxyArrayLike() {
    const arrayLike = {
        0: "a",
        1: "b",
        length: 2
    };
    const proxy = new Proxy(arrayLike, {});
    const result = Array.from(proxy);
    return { result: JSON.stringify(result), expected: JSON.stringify(["a", "b"]) };
}

// Export functions
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        testProxyArray,
        testProxyArrayLike
    };
}
