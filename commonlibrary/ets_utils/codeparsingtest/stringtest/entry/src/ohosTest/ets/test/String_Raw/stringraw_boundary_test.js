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

// Test boundary conditions that require object literals or dynamic types

export function testRawEmptyArray() {
  return String.raw({ raw: [] });
}

export function testRawLengthZero() {
  return String.raw({ raw: { length: 0 } });
}

export function testRawString() {
  return String.raw({ raw: "test" }, 0, 1, 2);
}

export function testInsufficientSubstitutions() {
  return String.raw({ raw: ['a', 'b', 'c'] }, 'x');
}

export function testRawPropertyMissing() {
  try {
    String.raw({});
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}

export function testRawPropertyNull() {
  try {
    String.raw({ raw: null });
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}

export function testRawPropertyUndefined() {
  try {
    String.raw({ raw: undefined });
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}
