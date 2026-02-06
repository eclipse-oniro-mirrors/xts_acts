'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the License);
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an AS IS BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export function addFunction(a: number, b: number) {
  return a + b;
}
;

export function subtractFunction(a: number, b: number) {
  return a - b;
}
;

export function multiplyFunction(a: number, b: number) {
  return a * b;
}
;

export function divideFunction(a: number, b: number) {
  if (b === 0) {
    throw new Error('除数不能为零');
  }
  return a / b;
}
