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
 * Test concat() with array-like objects
 * @returns {Object} test result
 */
export function testArrayLikeObjects() {
  const arr1 = [1, 2];
  const arrayLike = { 0: 'a', 1: 'b', length: 2 };
  const result = arr1.concat(arrayLike);
  
  return {
    result: result.length === 3 && result[0] === 1 && result[1] === 2,
    expected: true
  };
}

/**
 * Test concat() with plain objects
 * @returns {Object} test result
 */
export function testPlainObjects() {
  const arr1 = [1, 2];
  const obj = { name: 'test' };
  const result = arr1.concat(obj);
  
  return {
    result: result.length === 3 && result[0] === 1 && result[1] === 2,
    expected: true
  };
}

/**
 * Test concat() with dynamic modification during connection
 * @returns {Object} test result
 */
export function testDynamicModification() {
  const arr1 = [1, 2, 3];
  let counter = 0;
  const obj = {
    get 0() {
      counter++;
      return counter;
    },
    length: 1
  };
  const result = arr1.concat(obj);
  
  return {
    result: result.length === 4 && result[3] === 1,
    expected: true
  };
}

/**
 * Test concat() with mixed array and objects
 * @returns {Object} test result
 */
export function testMixedArrayAndObjects() {
  const arr1 = [1];
  const obj1 = { id: 1 };
  const obj2 = { id: 2 };
  const result = arr1.concat(obj1, [2, 3], obj2);
  
  return {
    result: result.length === 5 && result[0] === 1 && result[1].id === 1 && result[2] === 2 && result[3] === 3 && result[4].id === 2,
    expected: true
  };
}

/**
 * Test concat() with array-like object with large length
 * @returns {Object} test result
 */
export function testArrayLikeLargeLength() {
  const arr1 = [1, 2];
  const arrLike = { length: 2, 0: 'a', 1: 'b' };
  const result = arr1.concat(arrLike);
  
  return {
    result: result.length === 3 && result[0] === 1 && result[1] === 2,
    expected: true
  };
}

/**
 * Test concat() with array-like object with negative length
 * @returns {Object} test result
 */
export function testArrayLikeNegativeLength() {
  const arr1 = [1, 2];
  const arrLike = { length: -1, 0: 'a', 1: 'b' };
  const result = arr1.concat(arrLike);
  
  return {
    result: result.length === 3 && result[0] === 1 && result[1] === 2,
    expected: true
  };
}

/**
 * Test concat() with array-like object with string length
 * @returns {Object} test result
 */
export function testArrayLikeStringLength() {
  const arr1 = [1, 2];
  const arrLike = { length: '2', 0: 'a', 1: 'b' };
  const result = arr1.concat(arrLike);
  
  return {
    result: result.length === 3 && result[0] === 1 && result[1] === 2,
    expected: true
  };
}

/**
 * Test concat() with array-like object with NaN length
 * @returns {Object} test result
 */
export function testArrayLikeNaNLength() {
  const arr1 = [1, 2];
  const arrLike = { length: NaN, 0: 'a', 1: 'b' };
  const result = arr1.concat(arrLike);
  
  return {
    result: result.length === 3 && result[0] === 1 && result[1] === 2,
    expected: true
  };
}