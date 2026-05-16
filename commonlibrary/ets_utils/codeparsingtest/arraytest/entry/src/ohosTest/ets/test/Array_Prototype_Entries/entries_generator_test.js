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

export function testGeneratorWrapper() {
  const arr = ['a', 'b', 'c'];

  function* wrapper() {
    yield* arr.entries();
  }

  const gen = wrapper();
  const first = gen.next();
  const second = gen.next();

  return {
    result: JSON.stringify([first, second]),
    expected: JSON.stringify([
      { value: [0, 'a'], done: false },
      { value: [1, 'b'], done: false }
    ])
  };
}