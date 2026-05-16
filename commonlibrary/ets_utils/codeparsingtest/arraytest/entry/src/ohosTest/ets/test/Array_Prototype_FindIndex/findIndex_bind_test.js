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
 * @file findIndex_bind_test.js
 * @description Test cases for Array.prototype.findIndex with bound functions in JS environment
 */

/**
 * Test bound function as callback
 * @returns {Object} - Test result object
 */
export function testBoundFunction() {
  const arr = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };
  function checkGreaterThan(element) {
    return element > this.threshold;
  }
  const boundCheck = checkGreaterThan.bind(context);
  const result = arr.findIndex(boundCheck);
  return { result, expected: 3 };
}

/**
 * Test bind with partial parameters
 * @returns {Object} - Test result object
 */
export function testBindPartialParameters() {
  const arr = [1, 2, 3, 4, 5];
  function checkEquals(element, target) {
    return element === target;
  }
  const checkEqualsThree = checkEquals.bind(null, undefined, 3);
  const result = arr.findIndex(checkEqualsThree);
  return { result, expected: 2 };
}

