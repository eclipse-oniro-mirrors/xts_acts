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
 * @file findIndex_arrayLike_test.js
 * @description Test cases for Array.prototype.findIndex on array-like objects in JS environment
 */

/**
 * Test findIndex on array-like object
 * @returns {Object} - Test result object
 */
export function testArrayLikeObject() {
  const arrayLike = {
    length: 3,
    0: 2,
    1: 7.3,
    2: 4
  };
  const result = Array.prototype.findIndex.call(arrayLike, (x) => !Number.isInteger(x));
  return { result, expected: 1 };
}

/**
 * Test array-like object length determines traversal range
 * @returns {Object} - Test result object
 */
export function testArrayLikeLength() {
  const arrayLike = {
    length: 2,
    0: 1,
    1: 2,
    2: 3,
    3: 4
  };
  const result = Array.prototype.findIndex.call(arrayLike, (x) => x > 2);
  return { result, expected: -1 };
}

