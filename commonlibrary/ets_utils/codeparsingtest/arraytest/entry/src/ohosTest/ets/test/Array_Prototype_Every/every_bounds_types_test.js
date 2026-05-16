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
export function testNumericBounds() {
  const arr = [1, 2, 3, 100, 1000];
  const result = arr.every(x => x > 0);
  return { result, expected: true };
}

export function testStringTypes() {
  const arr = ['a', 'ab', 'abc'];
  const result = arr.every(x => x.length > 0);
  return { result, expected: true };
}

export function testBooleanTypes() {
  const arr = [true, true, true];
  const result = arr.every(x => x === true);
  return { result, expected: true };
}

export function testNullUndefined() {
  const arr = [null, null, null];
  const result = arr.every(x => x === null);
  return { result, expected: true };
}

export function testObjectTypes() {
  const arr = [{a: 1}, {b: 2}, {c: 3}];
  const result = arr.every(x => typeof x === 'object');
  return { result, expected: true };
}

export function testSymbolTypes() {
  const arr = [Symbol('a'), Symbol('b')];
  const result = arr.every(x => typeof x === 'symbol');
  return { result, expected: true };
}

export function testBigIntTypes() {
  const arr = [1n, 2n, 3n];
  const result = arr.every(x => typeof x === 'bigint');
  return { result, expected: true };
}