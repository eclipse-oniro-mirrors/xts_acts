/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

// Test functions for type conversion
export function testStringObject() {
  const strObj = new String('Mozilla');
  const result = strObj.substring(1, 4);
  return { result, expected: 'ozi' };
}

export function testNumberThis() {
  const result = String.prototype.substring.call(12345, 1, 3);
  return { result, expected: '23' };
}

export function testBooleanThis() {
  const result = String.prototype.substring.call(true, 0, 1);
  return { result, expected: 't' };
}

export function testObjectThis() {
  const result = String.prototype.substring.call({}, [0, 1]);
  return { result, expected: '[object Object]' };
}

export function testFloatThis() {
  const result = String.prototype.substring.call(99.9, 0, 1);
  return { result, expected: '9' };
}
