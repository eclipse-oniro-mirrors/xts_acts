/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
// 默认导出Set类型
const defaultSet: Set<string> = new Set<string>(['apple', 'banana', 'orange']);
export default defaultSet;

// 命名导出Set类型
export const fruitSet: Set<string> = new Set<string>(['apple', 'banana', 'orange']);

// 导出数字Set
export const numberSet: Set<number> = new Set<number>([1, 2, 3, 4, 5]);

// 导出Set类型别名
export type StringSet = Set<string>;

// Set工具接口
interface ISetUtils {
  createNumberSet: (...items: number[]) => Set<number>;
  getSize: <T>(set: Set<T>) => number;
  hasValue: <T>(set: Set<T>, value: T) => boolean;
}

// 导出Set工厂函数
export function createStringSet(...items: string[]): Set<string> {
  return new Set<string>(items);
}

// 导出Set工具对象
export const setUtils: ISetUtils = {
  createNumberSet: (...items: number[]): Set<number> => {
    return new Set<number>(items);
  },
  getSize: <T>(set: Set<T>): number => {
    return set.size;
  },
  hasValue: <T>(set: Set<T>, value: T): boolean => {
    return set.has(value);
  }
};
