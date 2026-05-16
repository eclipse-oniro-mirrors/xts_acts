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
export function testModifyVisitedElement() {
  const arr = [1, 2, 3, 4];
  let iterations = [];
  arr.every((element, index) => {
    iterations.push(element);
    arr[index] = element * 10;
    return element < 3;
  });
  return { result: JSON.stringify(iterations), expected: JSON.stringify([1, 2, 3]), iterations, expectedIterations: [1, 2, 3], modifiedArray: arr };
}

export function testModifyUnvisitedElement() {
  const arr = [1, 2, 3, 4];
  let iterations = [];
  arr.every((element, index) => {
    iterations.push(element);
    if (index === 0) {
      arr[2] = 100;
    }
    return true;
  });
  return { result: JSON.stringify(iterations), expected: JSON.stringify([1, 2, 100, 4]), iterations, expectedIterations: [1, 2, 100, 4] };
}

export function testAddElements() {
  const arr = [1, 2, 3];
  let iterations = 0;
  arr.every((element) => {
    iterations++;
    arr.push(element * 10);
    return true;
  });
  return { result: iterations, expected: 3, iterations, expectedIterations: 3, finalArray: arr };
}

export function testDeleteElements() {
  const arr = [1, 2, 3, 4, 5];
  let iterations = [];
  arr.every((element, index) => {
    iterations.push(element);
    arr.pop();
    return true;
  });
  return { result: JSON.stringify(iterations), expected: JSON.stringify([1, 2, 3]), iterations, expectedIterations: [1, 2, 3], finalArray: arr };
}