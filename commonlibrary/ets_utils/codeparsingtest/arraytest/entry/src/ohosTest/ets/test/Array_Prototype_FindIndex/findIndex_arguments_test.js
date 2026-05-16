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
 * @file findIndex_arguments_test.js
 * @description Test cases for Array.prototype.findIndex on arguments object in JS environment
 */

/**
 * Test findIndex on arguments object
 * @returns {Object} - Test result object
 */
export function testArgumentsObject() {
  function testArguments() {
    const result = Array.prototype.findIndex.call(arguments, (arg) => arg > 2);
    return result;
  }
  const result = testArguments(1, 2, 3, 4, 5);
  return { result, expected: 2 };
}

