/*
 *  Copyright (C) 2025 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

// 1
export class MySendAbleClass {
  booleanItem: boolean
  numberItem1: Number
  stringItem: string
  bigint1: bigint
  null1: null

  constructor(booleanItem: boolean, numberItem1: Number, stringItem: string, bigint1: bigint, null1: null) {
    this.booleanItem = booleanItem
    this.numberItem1 = numberItem1
    this.stringItem = stringItem
    this.bigint1 = bigint1
    this.null1 = null1
  }

  add() {
    return this.numberItem1;
  }

  stringEdit() {
    return this.stringItem;
  }

  bigintEdit() {
    return this.bigint1;
  }

  nullEdit() {
    return this.null1;
  }

  booleanItemEdit() {
    return this.booleanItem;
  }
}

export class MyClass {
  booleanItem: boolean
  numberItem1: Number
  stringItem: string
  bigint1: bigint
  null1: null

  constructor(booleanItem: boolean, numberItem1: Number, stringItem: string, bigint1: bigint, null1: null) {
    this.booleanItem = booleanItem
    this.numberItem1 = numberItem1
    this.stringItem = stringItem
    this.bigint1 = bigint1
    this.null1 = null1
  }

  add() {
    return this.numberItem1;
  }

  stringEdit() {
    return this.stringItem;
  }

  bigintEdit() {
    return this.bigint1;
  }

  nullEdit() {
    return this.null1;
  }

  booleanItemEdit() {
    return this.booleanItem;
  }
}

export class ClassB extends MyClass {
  constructor() {
    super(true, 20, "test case", BigInt("9007199254740991"), null);
  }
}


export class SendAbleClassB extends MySendAbleClass {
  constructor() {
    super(true, 20, "test case", BigInt("9007199254740991"), null);
  }
}




// 11
export class A {
  state: Number = 0;
}

export class SendableA {
  state: Number = 0;
}

export function sendableAFunc1(sendAble: SendableA): Promise<Number> {
  sendAble.state = sendAble.state + 20;
  return new Promise<Number>((res) => {
    res(sendAble.state);
  });
}

export class MyClass2 {
  array2: Array<Number>
  constructor(array2: Array<Number>) {
    this.array2 = array2
  }
}

export class ClassB2 extends MyClass2 {
  constructor() {
    super(new Array<Number>(2));
  }
}



