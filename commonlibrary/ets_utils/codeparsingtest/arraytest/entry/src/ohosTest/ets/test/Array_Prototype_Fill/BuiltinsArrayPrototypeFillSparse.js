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
export function builtinsArrayFillSparseArray0500() {
  let arr = [];
  arr[2] = 3;
  arr[5] = 6;
  
  let result = arr.fill(0);
  
  return result.length === 6 &&
         result[0] === 0 &&
         result[1] === 0 &&
         result[2] === 0 &&
         result[3] === 0 &&
         result[4] === 0 &&
         result[5] === 0;
}

export function builtinsArrayFillSparseWithStart0501() {
  let arr = [];
  arr[1] = 2;
  arr[3] = 4;
  arr[5] = 6;
  
  let result = arr.fill(9, 2);
  
  return result.length === 6 &&
         result[0] === undefined &&
         result[1] === 2 &&
         result[2] === 9 &&
         result[3] === 9 &&
         result[4] === 9 &&
         result[5] === 9;
}

export function builtinsArrayFillSparseWithRange0502() {
  let arr = [];
  arr[0] = 1;
  arr[3] = 4;
  arr[6] = 7;
  
  let result = arr.fill(5, 2, 5);
  
  return result.length === 7 &&
         result[0] === 1 &&
         result[1] === undefined &&
         result[2] === 5 &&
         result[3] === 5 &&
         result[4] === 5 &&
         result[5] === undefined &&
         result[6] === 7;
}
