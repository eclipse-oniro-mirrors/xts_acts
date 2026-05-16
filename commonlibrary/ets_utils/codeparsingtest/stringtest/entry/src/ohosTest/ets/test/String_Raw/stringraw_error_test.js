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

// Test error handling scenarios

export function testNullParameter() {
  try {
    String.raw(null);
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}

export function testUndefinedParameter() {
  try {
    String.raw(undefined);
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}

export function testNumberParameter() {
  try {
    String.raw(123);
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}

export function testStringParameter() {
  try {
    String.raw("test");
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}

export function testEmptyObjectParameter() {
  try {
    String.raw({});
    return { error: false };
  } catch (e) {
    return { error: true, name: e.name };
  }
}
