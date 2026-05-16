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
"use strict";

export function testIteratorReturn() {
  const arr = ['a', 'b', 'c'];
  const iterator = arr.entries();
  iterator.next();

  if (iterator.return) {
    const returnResult = iterator.return();
    const nextResult = iterator.next();
    return {
      result: returnResult.done && nextResult.done,
      expected: true
    };
  }
  return { result: 'return() not supported', expected: 'return() not supported' };
}

export function testIteratorThrow() {
  const arr = ['a', 'b'];
  const iterator = arr.entries();

  if (iterator.throw) {
    try {
      iterator.throw(new Error('test'));
      return { result: false, expected: true };
    } catch (e) {
      return { result: e.message, expected: 'test' };
    }
  }
  return { result: 'throw() not supported', expected: 'throw() not supported' };
}