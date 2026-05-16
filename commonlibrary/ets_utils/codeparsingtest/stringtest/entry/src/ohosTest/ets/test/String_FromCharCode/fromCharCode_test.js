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

export function testUndefinedParam001() {
  const result = String.fromCharCode(undefined);
  return {
    length: result.length,
    charCode: result.charCodeAt(0)
  };
}

export function testUndefinedParam002() {
  const result = String.fromCharCode(undefined, 65);
  return {
    length: result.length,
    charCode0: result.charCodeAt(0),
    charCode1: result.charCodeAt(1)
  };
}

export function testPunctuation002() {
  const result = String.fromCharCode(0x201C);
  return {
    result: result,
    length: result.length,
    charCode: result.charCodeAt(0),
    charCodeAt1: result.charCodeAt(1)
  };
}

export function testPunctuation003() {
  const result = String.fromCharCode(0x201D);
  return {
    result: result,
    length: result.length,
    charCode: result.charCodeAt(0),
    charCodeAt1: result.charCodeAt(1)
  };
}
