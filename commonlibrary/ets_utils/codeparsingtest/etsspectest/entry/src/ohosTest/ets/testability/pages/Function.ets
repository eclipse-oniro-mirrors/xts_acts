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

export function condition(): boolean {
  return true
}

export function cd(): boolean {
  return false
}

export class Ob {
  private name: string;
  private age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

export class St {
  private value: string;

  constructor(value: string) {
    this.value = value;
  }
}

export class Arr<T> {
  private array: T[] = [];
}

export class Big {
  private num: bigint;

  constructor(num: bigint) {
    this.num = num;
  }
}

export class Box<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }
}

export interface Inter {
  value: string;
}

export enum Colour {
  RED,
  GREEN,
  BLUE
}
