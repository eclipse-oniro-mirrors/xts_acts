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
export function testCallbackError() {
  const arr = [1, 2, 3];
  let errorCaught = false;
  let errorName;
  try {
    arr.every();
  } catch (e) {
    errorCaught = true;
    errorName = e.name;
  }
  return { result: errorCaught, expected: true, errorCaught, expectedErrorCaught: true, errorName, expectedErrorName: 'TypeError' };
}

export function testCallbackInternalError() {
  const arr = [1, 2, 3, 4, 5];
  let count = 0;
  let errorCaught = false;
  let errorName;
  let errorMessage;
  try {
    arr.every(x => {
      count++;
      if (x === 3) throw new Error('Test error');
      return true;
    });
  } catch (e) {
    errorCaught = true;
    errorName = e.name;
    errorMessage = e.message;
  }
  return { result: errorCaught, expected: true, errorCaught, expectedErrorCaught: true, errorName, expectedErrorName: 'Error', errorMessage, expectedErrorMessage: 'Test error', count, expectedCount: 3 };
}