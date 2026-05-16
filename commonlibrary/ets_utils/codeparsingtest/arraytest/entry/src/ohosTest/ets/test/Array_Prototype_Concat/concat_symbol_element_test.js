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
export function testSymbolElement() {
  const sym1 = Symbol('a');
  const sym2 = Symbol('b');
  const arr1 = [sym1];
  const arr2 = [sym2];
  const result = arr1.concat(arr2);
  return {
    result: result.length,
    expected: 2
  };
}