'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export type tst = number | object
export type AsyncCallback<T = void> = (data: T | undefined) => void;
export type U1 = ((x: int) => int) | ((x: string, y: int) => int) | ((x: int) => string)

let f1: U1 = (x) => {return x + 1};
let f2: U1 = (x) => {return x.length};
let f3: U1 = (x) => { {return "aaa"}};
let f4: U1 = (x) => {return 33};
let f5: U1 = (x, y) => {return x.length + y};

class AsyncCallbackWrapper<T = void> {
  constructor(myfunc: AsyncCallback<T>) {}
}

function foo1(a: readonly [int, string] | [int, string] | never) {
  return a[0]
}

function foo2(a: readonly number[] | number[] | never): number {
  return a[1]
}

function foo3(a: ReadonlyArray<string> | string[] | never): string {
  return a[0]
}

function testMultipleNever(a: number[] | readonly number[] | never | never | never): number {
  return a[0]
}

// ===== Classes and Types for test cases =====

// For UnionTest007
class C {
  v1: int = 0
  v2: string = ''
}
type U007 = C | Record<string, string>;

// For UnionTest008
class B {
  b: int
}
class D extends B {
  d: string | undefined
}

// For UnionTest009
class C3 {
  z: object = "1.2.string"
}
class D3 {
  z: number
}
class Z3 {
  foo(): object { return 1.1};
}

// For UnionTest010
type UT = Record<number, number> | Record<string, number>;

// For UnionTest011
interface Padding {
  top?: Length;
  right?: Length;
  bottom?: Length;
  left?: Length;
}

type Length = string | number | Resource;

interface Resource {
  bundleName: string;
  moduleName: string;
  id: number;
  type?: number;
}

interface LocalizedPadding {
  top?: LengthMetrics;
  end?: LengthMetrics;
  bottom?: LengthMetrics;
  start?: LengthMetrics;
}

class LengthMetrics {
  constructor(value: number, unit?: LengthUnit){}
  static px(value: number){}
  static vp(value: number){}
  static fp(value: number){}
  static percent(value: number){}
  static lpx(value: number){}
  static resource(value: Resource){}
  public unit: LengthUnit = LengthUnit.PX;
  public value: number = 1;
}

enum LengthUnit {
  PX = 0,
  VP = 1,
  FP = 2,
  PERCENT = 3,
  LPX = 4
}

let a_LM: LengthMetrics = new LengthMetrics(1, LengthUnit.PX);

export function UnionTest001(): void {
  let caseName: string = "UnionTest001";
  let flag = true;
  let cb = (p1: tst, p2: tst, idx: int, obj: Array<tst>): tst => { return new Object(); }
  let init: tst = 5.5
  let arr = new Array<tst>(1,2,3)
  arr.reduce(cb, init)
  if (!flag) {
    console.info(`${caseName} Task execution failed： flag should be true`);
    throw new Error("Test failed: flag is true");
  }
}

export function UnionTest002(): void {
  let caseName: string = "UnionTest002";
  let flag = true;
  new AsyncCallbackWrapper((data) => {})
  if (!flag) {
    console.info(`${caseName} Task execution failed： flag should be true`);
    throw new Error("Test failed: flag is true");
  }
}

export function UnionTest004(): void {
  let caseName: string = "UnionTest004";
  if (!(foo1([1, "2"]) === 1)) {
    console.info(`${caseName} Task execution failed： foo1([1, '2']) should equal 1`);
    throw new Error("Test failed: foo1([1, '2']) === 1");
  }
  if (!(foo2([1, 2] as number[]) === 2)) {
    console.info(`${caseName} Task execution failed： foo2([1, 2] as number[]) should equal 2`);
    throw new Error("Test failed: foo2([1, 2] as number[]) === 2");
  }
  if (!(foo3(["hello", "world"]) === "hello")) {
    console.info(`${caseName} Task execution failed： foo3(['hello', 'world']) should equal 'hello'`);
    throw new Error("Test failed: foo3(['hello', 'world']) === 'hello'");
  }
  let readonlyArr1: readonly number[] = [1, 2, 3];
  let mutableArr: number[] = [4, 5, 6];
  if (!(foo2(readonlyArr1) === 2)) {
    console.info(`${caseName} Task execution failed： foo2(readonlyArr1) should equal 2`);
    throw new Error("Test failed: foo2(readonlyArr1) === 2");
  }
  if (!(foo2(mutableArr) === 5)) {
    console.info(`${caseName} Task execution failed： foo2(mutableArr) should equal 5`);
    throw new Error("Test failed: foo2(mutableArr) === 5");
  }
  if (!(testMultipleNever(mutableArr) === 4)) {
    console.info(`${caseName} Task execution failed： testMultipleNever(mutableArr) should equal 4`);
    throw new Error("Test failed: testMultipleNever(mutableArr) === 4");
  }
}

export function UnionTest007(): void {
  let caseName: string = "UnionTest007";
  let b: U007 = {v1: 0, v2: 'qqq'};
  let c: U007 = {'v2': 'zzz', 'v3': 'sss'};
  
  if (!(b instanceof C)) {
    console.info(`${caseName} Task execution failed： b should be instance of C`);
    throw new Error("Test failed: b instanceof C");
  }
  if (!(c instanceof Record)) {
    console.info(`${caseName} Task execution failed： c should be instance of Record`);
    throw new Error("Test failed: c instanceof Record");
  }
}

export function UnionTest008(): void {
  let caseName: string = "UnionTest008";
  let x: B | D = {b: 3, d: 'aa'};
  let y: B | D = {b: 4};
  
  if (!(x instanceof D)) {
    console.info(`${caseName} Task execution failed： x should be instance of D`);
    throw new Error("Test failed: x instanceof D");
  }
  if (!(y instanceof B)) {
    console.info(`${caseName} Task execution failed： y should be instance of B`);
    throw new Error("Test failed: y instanceof B");
  }
}

export function UnionTest009(): void {
  let caseName: string = "UnionTest009";
  let x: C3 | D3 = {z: new Z3().foo()};
  if (!(x instanceof C3)) {
    console.info(`${caseName} Task execution failed： x should be instance of C3`);
    throw new Error("Test failed: x instanceof C3");
  }
}

export function UnionTest010(): void {
  let caseName: string = "UnionTest010";
  let a: UT = { "1": 2 };
  let b: UT = { 1: 1 };
  let c: Record<number, number> | Record<string, number> = {"2": 2.1};
  let d: Record<number, number> | Record<string, number> = {2.1: 2.1};
  
  if (!(a["1"] === 2)) {
    console.info(`${caseName} Task execution failed： a["1"] should equal 2`);
    throw new Error("Test failed: a['1'] === 2");
  }
  if (!(b[1] === 1)) {
    console.info(`${caseName} Task execution failed： b[1] should equal 1`);
    throw new Error("Test failed: b[1] === 1");
  }
  if (!(c["2"] === 2.1)) {
    console.info(`${caseName} Task execution failed： c["2"] should equal 2.1`);
    throw new Error("Test failed: c['2'] === 2.1");
  }
  if (!(d[2.1] === 2.1)) {
    console.info(`${caseName} Task execution failed： d[2.1] should equal 2.1`);
    throw new Error("Test failed: d[2.1] === 2.1");
  }
}


function padding(value: Padding | Length | LocalizedPadding) {
  if (value instanceof number) {
    return "Length";
  }
  if (value instanceof Padding) {
    return "Padding";
  }
  if (value instanceof LocalizedPadding) {
    return "LocalizedPadding";
  }
  return "";
}

export function UnionTest011(): void {

  let caseName: string = "UnionTest011";
  let status1 = padding(1);
  if (!(status1 === "Length")) {
    console.info(`${caseName} Task execution failed： status should be 'Length'`);
    throw new Error("Test failed: status === 'Length'");
  }
  let status2 = padding({top: 1});
  if (!(status2 === "Padding")) {
    console.info(`${caseName} Task execution failed： status should be 'Padding'`);
    throw new Error("Test failed: status === 'Padding'");
  }
  let status3 = padding({top: a_LM});
  if (!(status3 === "LocalizedPadding")) {
    console.info(`${caseName} Task execution failed： status should be 'LocalizedPadding'`);
    throw new Error("Test failed: status === 'LocalizedPadding'");
  }
}

// For UnionTest012
type RecordData1 = undefined | Record<string, RecordData1> | number | (() => void);

// For UnionTest013
type RecordData2 = Record<string, RecordData2> | ((n2: number, n3: number) => number);

// For UnionTest014
type RecordData3 = Record<string, RecordData3> | ((n2: number, n3: number) => number) | number;

// For UnionTest015
type RecordData4 = Record<string, RecordData4> | ((n2: number, n3: number) => number) | number;

// For UnionTest016
type RecordData5 = undefined | Record<string, RecordData5> | Array<RecordData5> | Object;
type RecordType = Record<string, RecordData5>;
class Test {}

export function UnionTest012(): void {
  let caseName: string = "UnionTest012";
  let callTrace: string = '';
  let want: RecordData1 = {
    "recursive_lambda1": () => {
      callTrace += "recursive_lambda1";
      let want_in: RecordData1 = {
        "recursive_lambda1_1": () => {callTrace += " -> recursive_lambda1_1"}
      };
      ((want_in as Record<string, RecordData1>)["recursive_lambda1_1"] as (() => void))();
    },
    "recursive_lambda2": () => {let want_in: RecordData1 = {"int": 1}},
  };
  
  ((want as Record<string, RecordData1>)["recursive_lambda1"] as (() => void))();
  if (!(callTrace === "recursive_lambda1 -> recursive_lambda1_1")) {
    console.info(`${caseName} Task execution failed： callTrace should be 'recursive_lambda1 -> recursive_lambda1_1'`);
    throw new Error("Test failed: callTrace === 'recursive_lambda1 -> recursive_lambda1_1'");
  }
}

export function UnionTest013(): void {
  let caseName: string = "UnionTest013";
  let want: RecordData2 = {
    "lambdakey": (a: number, b: number) : number => {
      return a + b;
    }
  };
  
  const add = (want as Record<string, RecordData2>)["lambdakey"] as (n2: number, n3: number) => number;
  if (!(add(5, 6) === 11)) {
    console.info(`${caseName} Task execution failed： add(5, 6) should equal 11`);
    throw new Error("Test failed: add(5, 6) === 11");
  }
}

export function UnionTest014(): void {
  let caseName: string = "UnionTest014";
  let want: RecordData3 = {
    "numberkey": 123,
    "lambdakey": (a: number, b: number) : number => {
      return a + b;
    }
  };
  
  const add = (want as Record<string, RecordData3>)["lambdakey"] as (n2: number, n3: number) => number;
  if (!(add(5, 6) === 11)) {
    console.info(`${caseName} Task execution failed： add(5, 6) should equal 11`);
    throw new Error("Test failed: add(5, 6) === 11");
  }
}

export function UnionTest015(): void {
  let caseName: string = "UnionTest015";
  let want: RecordData4 = {
    "numberkey": 123,
    "lambdakey": (a: number, b: number) : number => {
      let want_inner: RecordData4 = {
        "numberkey": 1234
      };
      return a + b;
    }
  };
  
  const add = (want as Record<string, RecordData4>)["lambdakey"] as (n2: number, n3: number) => number;
  if (!(add(5, 6) === 11)) {
    console.info(`${caseName} Task execution failed： add(5, 6) should equal 11`);
    throw new Error("Test failed: add(5, 6) === 11");
  }
}

export function UnionTest016(): void {
  let caseName: string = "UnionTest016";
  let want: RecordType = {
    "keyRecord": {
      "subKeyStr": 11
    },
    "keyString": "string***&&&",
    "keyBool": true,
    "keyInt": 11,
    "keyDouble": 3.1415,
    "keyObj": new Test(),
    "arrString": ["1s", "2s", "3s"],
    "arrBool": [true, false, true, true],
    "arrInt": [1, 2, 3],
    "arrDouble": [1.1, 1.2, 1.3],
    "arrObj": [
      new Test(),
      {
        "keyString": "string***&&&",
        "keyBool": true,
        "keyInt": 11,
        "keyDouble": 3.1415,
        "keyObj": new Test()
      },
      {
        "arrString": ["1s", "2s", "3s"],
        "arrBool": [true, false, true, true],
        "arrInt": [1, 2, 3],
        "arrDouble": [1.1, 1.2, 1.3],
      },
    ],
  };
  
  if (!(want["keyString"] === "string***&&&")) {
    console.info(`${caseName} Task execution failed： want["keyString"] should equal 'string***&&&'`);
    throw new Error("Test failed: want['keyString'] === 'string***&&&'");
  }
  if (!(want["keyInt"] === 11)) {
    console.info(`${caseName} Task execution failed： want["keyInt"] should equal 11`);
    throw new Error("Test failed: want['keyInt'] === 11");
  }
  if (!(want["keyDouble"] === 3.1415)) {
    console.info(`${caseName} Task execution failed： want["keyDouble"] should equal 3.1415`);
    throw new Error("Test failed: want['keyDouble'] === 3.1415");
  }
}
