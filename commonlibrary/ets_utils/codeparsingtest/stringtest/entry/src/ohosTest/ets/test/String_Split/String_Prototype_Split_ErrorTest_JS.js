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

// Test split with invalid regex
export function testInvalidRegex() {
  try {
    // Note: Using an incomplete regex pattern that will fail
    const result = "test".split(new RegExp("[/invalid"));
    return { thrown: false, errorType: null };
  } catch (e) {
    return { thrown: true, errorType: e.name };
  }
}

// Test Symbol.split returning non-array
export function testSymbolSplitNonArray() {
  const badSplitter = {
    [Symbol.split](str) {
      return { not: "an array" };
    }
  };
  try {
    const result = "test".split(badSplitter);
    return { thrown: false, errorType: null };
  } catch (e) {
    return { thrown: true, errorType: e.name };
  }
}

// Test Symbol.split throwing custom error
export function testSymbolSplitThrowsError() {
  const throwingSplitter = {
    [Symbol.split](str) {
      throw new Error("Custom error");
    }
  };
  try {
    const result = "test".split(throwingSplitter);
    return { thrown: false, errorType: null, errorMessage: null };
  } catch (e) {
    return { thrown: true, errorType: e.name, errorMessage: e.message };
  }
}
