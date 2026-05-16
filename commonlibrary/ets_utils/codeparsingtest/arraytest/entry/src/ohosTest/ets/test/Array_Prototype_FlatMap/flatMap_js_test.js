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
 * Test flatMap with Symbol elements
 * @returns {Object} Test result
 */
export function testSymbolElements() {
  const sym1 = Symbol('a');
  const sym2 = Symbol('b');
  const arr = [1, sym1, 3, sym2];
  const result = arr.flatMap(x => [x]);
  return {
    result: result.length,
    expected: 4
  };
}

/**
 * Test flatMap with callback returning Symbol
 * @returns {Object} Test result
 */
export function testCallbackReturnSymbol() {
  const arr = [1, 2, 3];
  const result = arr.flatMap(x => Symbol('sym' + x));
  return {
    result: result.length,
    expected: 3
  };
}

/**
 * Test flatMap called with call method
 * @returns {Object} Test result
 */
export function testCallMethod() {
  const obj = { 0: 1, 1: 2, length: 2 };
  const result = Array.prototype.flatMap.call(obj, x => [x * 2]);
  return {
    result: result.length,
    expected: 2
  };
}

/**
 * Test flatMap called with apply method
 * @returns {Object} Test result
 */
export function testApplyMethod() {
  const obj = { 0: 1, 1: 2, length: 2 };
  const result = Array.prototype.flatMap.apply(obj, [x => [x * 2]]);
  return {
    result: result.length,
    expected: 2
  };
}

/**
 * Test flatMap called on string
 * @returns {Object} Test result
 */
export function testStringCall() {
  const str = 'abc';
  const result = Array.prototype.flatMap.call(str, char => [char.toUpperCase()]);
  return {
    result: result.length,
    expected: 3
  };
}

/**
 * Test flatMap called on arguments
 * @returns {Object} Test result
 */
export function testArgumentsCall() {
  function test() {
    return Array.prototype.flatMap.call(arguments, x => [x * 2]);
  }
  const result = test(1, 2, 3);
  return {
    result: result.length,
    expected: 3
  };
}

/**
 * Test flatMap with array-like objects as return values
 * @returns {Object} Test result
 */
export function testArrayLikeReturn() {
  const arr = [1, 2, 3];
  const result = arr.flatMap(x => {
    return { 0: x, 1: x * 2, length: 2 };
  });
  return {
    result: result.length,
    expected: 3
  };
}

/**
 * Test flatMap with spread operator
 * @returns {Object} Test result
 */
export function testSpreadOperator() {
  const arr = [1, 2, 3];
  const result = arr.flatMap(x => [...Array(x).keys()]);
  return {
    result: result.length,
    expected: 6
  };
}
