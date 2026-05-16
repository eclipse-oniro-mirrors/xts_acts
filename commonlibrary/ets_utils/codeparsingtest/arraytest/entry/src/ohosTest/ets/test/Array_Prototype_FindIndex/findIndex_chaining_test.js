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
 * @file findIndex_chaining_test.js
 * @description Test cases for Array.prototype.findIndex in method chaining in JS environment
 */

/**
 * Test method chaining with findIndex
 * @returns {Object} - Test result object
 */
export function testMethodChaining() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.map((element) => element * 2).filter((element) => element > 5).findIndex((element) => element === 8);
  return { result, expected: 1 };
}

