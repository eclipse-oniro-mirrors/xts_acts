/*
  * Copyright (C) 2024 HiHope Open Source Organization.
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *    http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
*/

export class DeepEquals {
  public static deepEqual<T>(obj1: T, obj2: T): boolean {
    if (obj1 === obj2) {
      return true;
    } // 如果两者引用相同，直接返回true
    if (typeof obj1 !== 'object' || obj1 === null ||
      typeof obj2 !== 'object' || obj2 === null) {
      return false;
    } // 不是对象则返回false

    const keys1 = Object.keys(obj1);
    const keys2 = Object.keys(obj2);

    if (keys1.length !== keys2.length) {
      return false;
    }

    for (let key of keys1) {
      if (!(key in obj2)) {
        return false;
      }

      if (typeof obj1[key] === 'object' && typeof obj2[key] === 'object') {
        if (!DeepEquals.deepEqual(obj1[key] as T, obj2[key] as T)) {
          return false;
        }
      } else if (obj1[key] !== obj2[key]) {
        return false;
      }
    }
    return true;
  }
}
