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
// flat_typedarray_test.js
"use strict";

/**
 * @description Test flat() with TypedArray
 */
export function testTypedArray() {
  const typed = new Int32Array([1, 2, 3]);
  const arr = [typed, [4, 5]];
  const result = arr.flat();
  return {
    result: result.length,
    expected: 3,
    isView: ArrayBuffer.isView(result[0]),
    expectedIsView: true
  };
}

/**
 * @description Test flat() with arguments object
 */
export function testArgumentsObject() {
  function test() {
    const arr = [arguments, [1, 2]];
    const result = arr.flat();
    return {
      result: result.length,
      expected: 3,
      isArray: Array.isArray(result[0]),
      expectedIsArray: false
    };
  }
  return test('a', 'b');
}
