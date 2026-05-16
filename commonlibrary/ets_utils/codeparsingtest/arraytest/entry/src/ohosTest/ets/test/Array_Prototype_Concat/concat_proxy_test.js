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
export function testProxyArray() {
  const arr1 = [1, 2];
  const arr2 = new Proxy([3, 4], {
    get(target, prop) {
      return target[prop];
    }
  });
  const result = arr1.concat(arr2);
  return {
    result: result.length,
    expected: 4
  };
}

export function testProxyObject() {
  const arr1 = [1, 2];
  const obj = new Proxy({ id: 1 }, {});
  const result = arr1.concat(obj);
  return {
    result: result.length,
    expected: 3
  };
}