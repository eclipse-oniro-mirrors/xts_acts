/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class Test {
  constructor() {
  }

  public static new_Test(): Test {
    return new Test();
  }

  public doubleMethod(a0: double, a1: double): double {
    return a0 + a1;
  }
  public intMethod(a0: int, a1: int): int {
    return a0 + a1;
  }
  public booleanMethod(a0: int, a1: int): boolean {
    if (a0 + a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
  public voidMethod(a0: int, a1: int): void {
    this.count_ = a0  + a1;
  }
  public getCount(): int {
    return this.count_;
  }
  public longMethod(a: long, b: long): long {
    return a + b;
  }
  public charMethod(a0: char, a1: char): char {
    return a0 > a1 ? a0 : a1;
  }
  public byteMethod(a0: byte, a1: byte): byte {
    return a0 > a1 ? a0 : a1;
  }
  public shortMethod(a0: short, a1: short): short {
    return a0 > a1 ? a0 : a1;
  }
  public floatMethod(a0: float, a1: float): float {
    return a0 + a1;
  }
  public stringMethod(a0: int, a1: int): String {
    if (a0 > a1) {
      return "hello";
    } else {
      return "nihao";
    }
  }
  public booleanByNameMethod(a0: int, a1: int): boolean {
    if (a0 + a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
  public charByNameMethod(value1: char, value2: char): char {
    return value1 > value2 ? value1 : value2;
  }
  public byteByNameMethod(a0: byte, a1: byte): byte {
    return a0 + a1 as byte;
  }
  public shortByNameMethod(a0: short, a1: short): short {
    return a0 + a1 as short;
  }
  public intByNameMethod(a0: int, a1: int): int {
    return a0 + a1 as int;
  }
  static staticCharMethod(a0: char, a1: char): char {
    return a0 > a1 ? a0 : a1;
  }
  static staticByteMethod(a0: byte, a1: byte): byte {
    return a0 > a1 ? a0 : a1;
  }

  private count_: int = 0;
}

function GetFnObj(): Object {
  let x = (a : String) => { return a; }
  return x;
}
native function sum(a: int, b: int): int;
function checkSum(): boolean {
  return sum(8, 16) == 24;
}
namespace A {
  native function sumB(a: int, b: int): int;
  function checkSumB(): boolean {
    return sumB(8, 16) == 24;
  }
}

function booleanModuleFunction(value: int): boolean {
  if (value == 2) {
    return true;
  } else {
    return false;
  }
}
function charModuleFunction(value1: char, value2: char): char {
  return value1 > value2 ? value1 : value2;
}
function byteModuleFunction(value1: byte, value2: byte): byte {
  return value1 + value2 as byte;
}
function shortModuleFunction(value1: short, value2: short): short {
  return value1 + value2 as short;
}
function intModuleFunction(value1: int, value2: int): int {
  return value1 + value2 as int;
}
function longModuleFunction(value1: long, value2: long): long {
  return value1 + value2 as long;
}
function floatModuleFunction(value1: float, value2: float): float {
  return value1 + value2 as float;
}
function doubleModuleFunction(value1: double, value2: double): double {
  return value1 + value2 as double;
}
function refModuleFunction(value1: int, value2: int): string {
  if (value1 === value2) {
    return "Equality";
  } else {
    return "Inequality";
  }
}
export let intExport: int = 0;
function voidModuleFunction(value1: int, value2: int): void {
  intExport = value1 + value2;
}
function getIntExport(): int {
  return intExport;
}

async function checkReject(promise: Promise<String>, rejection: String): Promise<boolean> {
  try {
    await promise;
    return false;
  } catch (exception) {
    exception = exception as Error;
    return exception.toString() == rejection;
  }
}
async function checkResolve(promise: Promise<String>, resolution: String): Promise<boolean> {
  let value = await promise;
  return value == resolution;
}
