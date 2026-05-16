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
// flat_commented_test.js
"use strict";

/**
 * @description Test flat() with array-like objects
 */
export function testArrayLikeObjects() {
  const arrLike = { 0: 1, 1: 2, length: 2 };
  const arr = [arrLike, [3, 4], 5];
  const result = arr.flat();
  return {
    result: result.length,
    expected: 4,
    isArray: Array.isArray(result[0]),
    expectedIsArray: false
  };
}

/**
 * @description Test flat() with array self-reference
 */
export function testArraySelfReference() {
  const arr = [1, 2];
  arr.push(arr);
  const result = arr.flat(1);
  return {
    result: result.length,
    expected: 5
  };
}

/**
 * @description Test flat() with circular references
 */
export function testCircularReferences() {
  const arr1 = [1];
  const arr2 = [2, arr1];
  arr1.push(arr2);
  const result = arr1.flat(1);
  return {
    result: result.length,
    expected: 3
  };
}

/**
 * @description Test flat() with extremely deep nested array
 */
export function testExtremelyDeepNestedArray() {
  let arr = [1];
  for (let i = 0; i < 100; i++) {
    arr = [arr];
  }
  const result = arr.flat(Infinity);
  return {
    result: result.length,
    expected: 1,
    isEqual: JSON.stringify(result) === JSON.stringify([1])
  };
}

/**
 * @description Test flat() removes empty slots in one-dimensional array
 */
export function testEmptySlotsInOneDimensionalArray() {
  const arr = [1, , 3, , , 6];
  const result = arr.flat();
  return {
    result: result.length,
    expected: 3,
    isEqual: JSON.stringify(result) === JSON.stringify([1, 3, 6])
  };
}

/**
 * @description Test flat() removes empty slots in nested arrays
 */
export function testEmptySlotsInNestedArrays() {
  const arr = [[1, , 3], [4, , , 7]];
  const result = arr.flat();
  return {
    result: result.length,
    expected: 4,
    isEqual: JSON.stringify(result) === JSON.stringify([1, 3, 4, 7])
  };
}

/**
 * @description Test depth=1 removes outer empty slots only
 */
export function testDepthOneRemovesOuterEmptySlots() {
  const arr = [1, , [2, , 4], , [5]];
  const result = arr.flat();
  return {
    result: result.length,
    expected: 4,
    isEqual: JSON.stringify(result) === JSON.stringify([1, 2, , 4, 5])
  };
}

/**
 * @description Test Infinity depth removes all empty slots
 */
export function testInfinityDepthRemovesAllEmptySlots() {
  const arr = [1, , [2, , [3, , 5]], , 6];
  const result = arr.flat(Infinity);
  return {
    result: result.length,
    expected: 5,
    isEqual: JSON.stringify(result) === JSON.stringify([1, 2, 3, 5, 6])
  };
}

/**
 * @description Test flat() on array with only empty slots
 */
export function testArrayWithOnlyEmptySlots() {
  const arr = [, , ,];
  const result = arr.flat();
  return {
    result: result.length,
    expected: 0,
    isEqual: JSON.stringify(result) === JSON.stringify([])
  };
}

/**
 * @description Test flat() removes empty slots but keeps explicit undefined
 */
export function testEmptySlotsVsUndefined() {
  const arr1 = [1, , 3];
  const arr2 = [1, undefined, 3];
  const result1 = arr1.flat();
  const result2 = arr2.flat();
  return {
    result1Length: result1.length,
    expectedResult1Length: 2,
    result2Length: result2.length,
    expectedResult2Length: 3,
    result1Equal: JSON.stringify(result1) === JSON.stringify([1, 3]),
    result2Equal: JSON.stringify(result2) === JSON.stringify([1, undefined, 3])
  };
}

/**
 * @description Test flat handles string number as depth
 */
export function testStringNumberAsDepth() {
  const arr = [1, [2, [3]]];
  const result = arr.flat('2');
  return {
    result: result.length,
    expected: 3,
    isEqual: JSON.stringify(result) === JSON.stringify([1, 2, 3])
  };
}

/**
 * @description Test flat handles object as depth
 */
export function testObjectAsDepth() {
  const arr = [1, [2, 3]];
  const result = arr.flat({});
  return {
    result: result.length,
    expected: 2,
    isEqual: JSON.stringify(result) === JSON.stringify([1, [2, 3]])
  };
}

/**
 * @description Test flat handles boolean as depth
 */
export function testBooleanAsDepth() {
  const arr = [1, [2, [3]]];
  const result1 = arr.flat(true);
  const result2 = arr.flat(false);
  return {
    result1Length: result1.length,
    expectedResult1Length: 3,
    result2Length: result2.length,
    expectedResult2Length: 3,
    result1Equal: JSON.stringify(result1) === JSON.stringify([1, 2, [3]]),
    result2Equal: JSON.stringify(result2) === JSON.stringify([1, [2, [3]]])
  };
}
