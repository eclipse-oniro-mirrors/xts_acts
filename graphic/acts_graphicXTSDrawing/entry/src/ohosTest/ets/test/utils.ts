/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * @param obj
 * @returns
 * In TypeScript, the keys of an enum include both the key names and the enum values,
 * so you can count the number of key names to determine the quantity.
 */
export function getEnumCount(obj: Object): number {
  let count = 0;
  Object.values(obj).forEach((v: string | number) => {
    if (typeof v === 'string') {
      count++;
    }
  });
  return count;
}

export function getRandomNumber(min: number, max: number) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}