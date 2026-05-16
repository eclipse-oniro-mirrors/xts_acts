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
 * @file findIndex_thisArg_test.js
 * @description Test cases for Array.prototype.findIndex with thisArg parameter in JS environment
 */

/**
 * Test callback function can access thisArg
 * @returns {Object} - Test result object
 */
export function testThisArgAccess() {
  const arr = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };
  const result = arr.findIndex(function (element) {
    return element > this.threshold;
  }, context);
  return { result, expected: 3 };
}

/**
 * Test thisArg as object
 * @returns {Object} - Test result object
 */
export function testThisArgObject() {
  const arr = [{ x: 1 }, { x: 2 }, { x: 3 }];
  const config = { targetX: 2 };
  const result = arr.findIndex(function (element) {
    return element.x === this.targetX;
  }, config);
  return { result, expected: 1 };
}

/**
 * Test this in regular function
 * @returns {Object} - Test result object
 */
export function testThisInRegularFunction() {
  const arr = [1, 2, 3];
  const obj = {
    threshold: 2,
    findGreaterThanThreshold: function () {
      return arr.findIndex(function (element) {
        return element > this.threshold;
      }, this);
    }
  };
  const result = obj.findGreaterThanThreshold();
  return { result, expected: 2 };
}

/**
 * Test this in arrow function
 * @returns {Object} - Test result object
 */
export function testThisInArrowFunction() {
  const arr = [1, 2, 3];
  const obj = {
    threshold: 2,
    findGreaterThanThreshold: function () {
      return arr.findIndex((element) => element > this.threshold);
    }
  };
  const result = obj.findGreaterThanThreshold();
  return { result, expected: 2 };
}

