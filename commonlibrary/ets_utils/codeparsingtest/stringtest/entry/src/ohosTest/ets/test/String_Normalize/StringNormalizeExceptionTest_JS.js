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

export function test001() {
  let str = 'test';
  let isRangeError = false;
  try {
    str.normalize('INVALID');
  } catch (e) {
    isRangeError = e instanceof RangeError;
  }
  return { isRangeError };
}

export function test002() {
  let str = 'test';
  let hasValidMessage = false;
  try {
    str.normalize('BAD');
  } catch (e) {
    hasValidMessage = e.message.includes('form') || e.message.includes('normalize');
  }
  return { hasValidMessage };
}

export function test003() {
  let isTypeError = false;
  try {
    String.prototype.normalize.call(123);
  } catch (e) {
    isTypeError = e instanceof TypeError;
  }
  return { isTypeError };
}

export function test004() {
  let isTypeError = false;
  try {
    String.prototype.normalize.call(null);
  } catch (e) {
    isTypeError = e instanceof TypeError;
  }
  return { isTypeError };
}

export function test005() {
  let isTypeError = false;
  try {
    String.prototype.normalize.call(undefined);
  } catch (e) {
    isTypeError = e instanceof TypeError;
  }
  return { isTypeError };
}
