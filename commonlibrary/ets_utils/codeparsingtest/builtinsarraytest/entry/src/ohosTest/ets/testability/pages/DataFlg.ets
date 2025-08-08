/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
export class Count1 {
  public static count: number = 0
}

export class Count2 {
  public static count: number = 0
}

export interface PropParam {
  prop: string;
}

export interface TestA {
  a: number;
}

export interface TestB {
  b: number;
}

export interface TestC {
  c: number;
}

export interface Except {
  param: number,
  expected: Object[]
}

export interface FlatObj {
  name: string;
  age: number;
  like: Array<number>
}

export interface Empty {}

export interface ToStringNumber {
  input: readonly number[];
  expected: Object;
}

export interface ToStringString {
  input: readonly (string | undefined | null)[];
  expected: Object;
}



export interface FlatParams {
  depth: number | undefined;
  expected: (number | (number | (number | number[])[])[])[] | (number | (number | number[])[])[];
}

export interface Multiply {
  value: number;
}

// 定义类型接口
export interface SpliceString {
  start: number;
  deleteCount: number;
  items: (string | undefined | null)[];
  expected: (Object | undefined | null)[];
  description?: string;
}

// 定义类型接口
export interface SpliceNumber {
  start: number;
  deleteCount: number;
  items: (number | undefined | null)[];
  expected: (Object | undefined | null)[];
  description?: string;
}

// 定义类型接口
export interface SpliceBoolean {
  start: number;
  deleteCount: number;
  items: (boolean | undefined | null)[];
  expected: (Object | undefined | null)[];
  description?: string;
}

// 定义类型接口
export interface SpliceObj {
  start: number;
  deleteCount: number;
  items: (Object | undefined | null)[];
  expected: (Object | undefined | null)[];
  description?: string;
}
