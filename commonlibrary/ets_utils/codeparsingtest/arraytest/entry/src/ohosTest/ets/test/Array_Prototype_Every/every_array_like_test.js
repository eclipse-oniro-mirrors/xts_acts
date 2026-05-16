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
export function testBasicArrayLike() {
  const arrayLike = {
    length: 3,
    0: 'a',
    1: 'b',
    2: 'c'
  };
  const result = Array.prototype.every.call(arrayLike, x => typeof x === 'string');
  return { result, expected: true };
}

export function testArgumentsObject() {
  function test() {
    return Array.prototype.every.call(arguments, x => x > 0);
  }
  const result = test(1, 2, 3);
  return { result, expected: true };
}

export function testArgumentsObjectWithNegative() {
  function test() {
    return Array.prototype.every.call(arguments, x => x > 0);
  }
  const result = test(1, -1, 3);
  return { result, expected: false };
}

export function testString() {
  const str = 'hello';
  const result = Array.prototype.every.call(str, char => typeof char === 'string');
  return { result, expected: true };
}

export function testTypedArray() {
  const typedArray = new Int32Array([1, 2, 3, 4, 5]);
  const result = Array.prototype.every.call(typedArray, x => x > 0);
  return { result, expected: true };
}