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

export function testOmitParameter() {
  const result1 = "test".localeCompare();
  const result2 = "undefined".localeCompare();
  return { result1, result2 };
}

export function testUndefinedParameter() {
  const result = "test".localeCompare(undefined);
  return { result };
}

export function testNullParameter() {
  const result1 = "test".localeCompare(null);
  const result2 = "null".localeCompare(null);
  return { result1, result2 };
}

export function testNumberParameter() {
  const result1 = "123".localeCompare(123);
  const result2 = "10".localeCompare(5);
  return { result1, result2 };
}

export function testObjectParameter() {
  const result1 = "[object Object]".localeCompare({});
  const result2 = "test".localeCompare({ toString: () => "test" });
  return { result1, result2 };
}

export function testInvalidOptions() {
  const result1 = "a".localeCompare("b", "en", "invalid");
  const result3 = "a".localeCompare("b", "en", 123);
  return { result1, result3 };
}

export function testThisNull() {
  try {
    String.prototype.localeCompare.call(null, "test");
    return { hasError: false, type: null };
  } catch (e) {
    return { hasError: true, type: e.name };
  }
}

export function testThisUndefined() {
  try {
    String.prototype.localeCompare.call(undefined, "test");
    return { hasError: false, type: null };
  } catch (e) {
    return { hasError: true, type: e.name };
  }
}

export function testThisNumber() {
  const result = String.prototype.localeCompare.call(123, "123");
  return { result };
}

export function testThisObject() {
  const result = String.prototype.localeCompare.call({}, "[object Object]");
  return { result };
}

export function testThisBoolean() {
  const result = String.prototype.localeCompare.call(true, "true");
  return { result };
}
