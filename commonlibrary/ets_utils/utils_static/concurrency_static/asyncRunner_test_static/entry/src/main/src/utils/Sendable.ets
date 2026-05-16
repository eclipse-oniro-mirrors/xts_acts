/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

// import { collections, lang } from '@kit.ArkTS'
'use shared'

// @Sendable
export class SendableClass {
  public num: number;
  public para: undefined;
  constructor(num: number) {
    this.num = num;
  }
  GetNum() {
    return this.num;
  }
}

// @Sendable
export class SimpleSendable{
  public digit: number;

  constructor(value: number) {
    this.digit = value;
  }
}

// @Sendable
class SendableArrayClass {
  public arr: Array<number> = new Array<number>(100);
}

// @Sendable
function sendableArrayFunc() : number {
  let arr: number[] = new Array<number>(100);
  return arr[0];
}

// @Sendable
export async function sendableAsyncFunc() : Promise<number> {
  return (100 as number);
}

// @Sendable
type FuncType = () => number;

// @Sendable
export class SendableClassTest {
  constructor(func: FuncType) {
    this.func = func;
  }
  public func: FuncType;
  foo() {
    let num : number = sendableArrayFunc();
    return num;
  }
}

// @Sendable
function sendableFunctionTop() {
  let num = 100;
  return num;
}

// @Sendable
class SendableClassTop {
  public num :number = 200;
  say() {
    return this.num;
  }
}

