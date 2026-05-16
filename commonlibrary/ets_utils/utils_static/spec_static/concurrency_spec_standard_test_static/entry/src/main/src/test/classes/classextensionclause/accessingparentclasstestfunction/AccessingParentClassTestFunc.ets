'use static'

/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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


class Base {
  protected value: boolean[];

  constructor() {
    this.value = [true, false, true];
  }
}

let check_value: boolean;

class Sub extends Base {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value = this.value[0];
  }
}

class Base1 {
  protected readonly value: boolean[];

  constructor() {
    this.value = [true, false, true];
  }
}

let check_value1: boolean;

class Sub1 extends Base1 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value1 = this.value[0];
  }
}

class User {
  name: string;

  constructor() {
    this.name = "test_name";
  }
}

class Base2 {
  protected value: User[];

  constructor() {
    this.value = [new User(), new User()];
  }
}

let check_value2: User | undefined;

class Sub2 extends Base2 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value2 = this.value[0];
  }
}

class Base3 {
  protected readonly value: User

  constructor() {
    this.value = new User();
  }
}

let check_value3: User | undefined;

class Sub3 extends Base3 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value3 = this.value;
  }
}

const date = new Date(2023, 10, 1);

class Base4 {
  protected value: Date;

  constructor() {
    this.value = date;
  }
}

let check_value4: Date | undefined;

class Sub4 extends Base4 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value4 = this.value;
  }
}

class Base5 {
  protected readonly value: Date;

  constructor() {
    this.value = date;
  }
}

let check_value5: Date | undefined;

class Sub5 extends Base5 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value5 = this.value;
  }
}

class Base6 {
  public value: int;

  constructor() {
    this.value = 1;
  }

  protected changeMembers(): void {
    this.value = 2;
  }
}

class Sub6 extends Base6 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    this.changeMembers();
  }
}

class Base7 {
  protected value: int;

  constructor() {
    this.value = 10;
  }
}

let check_value6: int;

class Sub7 extends Base7 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value6 = this.value;
  }
}

class Base8 {
  protected readonly value: int;

  constructor() {
    this.value = 10;
  }
}

let check_value7: int;

class Sub8 extends Base8 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value7 = this.value;
  }
}

class Base9 {
  protected value: null;

  constructor() {
    this.value = null;
  }
}

let check_value8: null;

class Sub9 extends Base9 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value8 = this.value;
  }
}

class Base10 {
  protected readonly value: null;

  constructor() {
    this.value = null;
  }
}

let check_value9: null;

class Sub10 extends Base10 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value9 = this.value;
  }
}

class Base11 {
  protected value: number;

  constructor() {
    this.value = 10;
  }
}

let check_value10: number;

class Sub11 extends Base11 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value10 = this.value;
  }
}

class Base12 {
  protected readonly value: number;

  constructor() {
    this.value = 10;
  }
}

let check_value11: number;

class Sub12 extends Base12 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value11 = this.value;
  }
}

class Base13 {
  protected value: string;

  constructor() {
    this.value = "hello,world";
  }
}

let check_value12: string | undefined;

class Sub13 extends Base13 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value12 = this.value;
  }
}

class Base14 {
  protected readonly value: string;

  constructor() {
    this.value = "hello,world";
  }
}

let check_value13: string | undefined;

class Sub14 extends Base14 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value13 = this.value;
  }
}

class Base15 {
  protected value: undefined;

  constructor() {
    this.value = undefined;
  }
}

let check_value14: undefined;

class Sub15 extends Base15 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value14 = this.value;
  }
}

class Base16 {
  protected readonly value: undefined;

  constructor() {
    this.value = undefined;
  }
}

let check_value15: undefined;

class Sub16 extends Base16 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value15 = this.value;
  }
}

class Base17 {
  public value: boolean[];

  constructor() {
    this.value = [true, false, true];
  }
}

let check_value16: boolean;

class Sub17 extends Base17 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value16 = this.value[0];
  }
}

class Base18 {
  public readonly value: boolean[];

  constructor() {
    this.value = [true, false, true];
  }
}

let check_value17: boolean;

class Sub18 extends Base18 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value17 = this.value[0];
  }
}

class Base19 {
  public value: User[];

  constructor() {
    this.value = [new User(), new User()];
  }
}

let check_value18: User | undefined;

class Sub19 extends Base19 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value18 = this.value[0];
  }
}

class Base20 {
  public readonly value: User[];

  constructor() {
    this.value = [new User(), new User()];
  }
}

let check_value19: User | undefined;

class Sub20 extends Base20 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value19 = this.value[0];
  }
}

class Base21 {
  public value: Date[];

  constructor() {
    this.value = [date, date];
  }
}

let check_value20: Date | undefined;

class Sub21 extends Base21 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value20 = this.value[0];
  }
}

class Base22 {
  public readonly value: Date[];

  constructor() {
    this.value = [date, date];
  }
}

let check_value21: Date | undefined;

class Sub22 extends Base22 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value21 = this.value[0];
  }
}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Base23 {
  public value: SomeInterface[];

  constructor() {
    this.value = [obj1, obj2];
  }
}

let check_value22: SomeInterface | undefined;

class Sub23 extends Base23 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value22 = this.value[0];
  }
}

class Base24 {
  public readonly value: SomeInterface[];

  constructor() {
    this.value = [obj1, obj2];
  }
}

let check_value23: SomeInterface | undefined;

class Sub24 extends Base24 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value23 = this.value[0];
  }
}

class Base25 {
  public value: number[];

  constructor() {
    this.value = [1, 2, 3];
  }
}

let check_value24: number;

class Sub25 extends Base25 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value24 = this.value[0];
  }
}

class Base26 {
  public readonly value: number[];

  constructor() {
    this.value = [1, 2, 3];
  }
}

let check_value25: number;

class Sub26 extends Base26 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value25 = this.value[0];
  }
}

class Base27 {
  public value: string[];

  constructor() {
    this.value = ["a", "b", "c"];
  }
}

let check_value26: string | undefined;

class Sub27 extends Base27 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value26 = this.value[0];
  }
}

class Base28 {
  public readonly value: string[];

  constructor() {
    this.value = ["a", "b", "c"];
  }
}

let check_value27: string | undefined;

class Sub28 extends Base28 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value27 = this.value[0];
  }
}

class Base29 {
  public value: boolean;

  constructor() {
    this.value = true;
  }
}

let check_value28: boolean;

class Sub29 extends Base29 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value28 = this.value;
  }
}

class Base30 {
  public readonly value: boolean;

  constructor() {
    this.value = true;
  }
}

let check_value29: boolean;

class Sub30 extends Base30 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value29 = this.value;
  }
}

class Base31 {
  public value: User

  constructor() {
    this.value = new User();
  }
}

let check_value30: User | undefined;

class Sub31 extends Base31 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value30 = this.value;
  }
}

class Base32 {
  public readonly value: User

  constructor() {
    this.value = new User();
  }
}

let check_value31: User | undefined;

class Sub32 extends Base32 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value31 = this.value;
  }
}

class Base33 {
  public value: Date;

  constructor() {
    this.value = date;
  }
}

let check_value32: Date | undefined;

class Sub33 extends Base33 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value32 = this.value;
  }
}

class Base34 {
  public readonly value: Date;

  constructor() {
    this.value = date;
  }
}

let check_value33: Date | undefined;

class Sub34 extends Base34 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value33 = this.value;
  }
}

class Base35 {
  public value: int;

  constructor() {
    this.value = 1;
  }

  public changeMembers(): void {
    this.value = 2;
  }
}

class Sub35 extends Base35 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    this.changeMembers();
  }
}

class Base36 {
  public readonly value: int;
  public value1: int = 2;

  constructor() {
    this.value = 1;
  }

  public changeMembers(): void {
    this.value1 = this.value;
  }
}

class Sub36 extends Base36 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    this.changeMembers();
  }
}

class Base37 {
  public value: int;

  constructor() {
    this.value = 10;
  }
}

let check_value34: int;

class Sub37 extends Base37 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value34 = this.value;
  }
}

class Base38 {
  public readonly value: int;

  constructor() {
    this.value = 10;
  }
}

let check_value35: int;

class Sub38 extends Base38 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value35 = this.value;
  }
}

class Base39 {
  public value: null;

  constructor() {
    this.value = null;
  }
}

let check_value36: null;

class Sub39 extends Base39 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value36 = this.value;
  }
}

class Base40 {
  public readonly value: null;

  constructor() {
    this.value = null;
  }
}

let check_value37: null;

class Sub40 extends Base40 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value37 = this.value;
  }
}

class Base41 {
  public value: number;

  constructor() {
    this.value = 10;
  }
}

let check_value38: number;

class Sub41 extends Base41 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value38 = this.value;
  }
}

class Base42 {
  public readonly value: number;

  constructor() {
    this.value = 10;
  }
}

let check_value39: number;

class Sub42 extends Base42 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value39 = this.value;
  }
}

class Base43 {
  public value: string;

  constructor() {
    this.value = "hello,world";
  }
}

let check_value40: string | undefined;

class Sub43 extends Base43 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value40 = this.value;
  }
}

class Base44 {
  public readonly value: string;

  constructor() {
    this.value = "hello,world";
  }
}

let check_value41: string | undefined;

class Sub44 extends Base44 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value41 = this.value;
  }
}

class Base45 {
  public value: undefined;

  constructor() {
    this.value = undefined;
  }
}

let check_value42: undefined;

class Sub45 extends Base45 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value42 = this.value;
  }
}

class Base46 {
  public readonly value: undefined;

  constructor() {
    this.value = undefined;
  }
}

let check_value43: undefined;

class Sub46 extends Base46 {
  constructor() {
    super();
  }

  public checkAccess(): void {
    check_value43 = this.value;
  }
}

export function testAccessingParentClass0001() {
  const TAG = 'testAccessingParentClass0001';

  const instanceB = new Sub();
  instanceB.checkAccess();
  if (!check_value) {
    console.info(`${TAG} Task execution failed: check_value: ${check_value}`);
    throw new Error('check_value is not true');
  }
}

export function testAccessingParentClass0002() {
  const TAG = 'testAccessingParentClass0002';

  const instanceB = new Sub1();
  instanceB.checkAccess();
  if (!check_value1) {
    console.info(`${TAG} Task execution failed: check_value1: ${check_value1}`);
    throw new Error('check_value1 is not true');
  }
}

export function testAccessingParentClass0003() {
  const TAG = 'testAccessingParentClass0003';

  const instanceB = new Sub2();
  instanceB.checkAccess();
  if (check_value2!.name !== "test_name") {
    console.info(`${TAG} Task execution failed: check_value2!.name: ${check_value2!.name}`);
    throw new Error('check_value2!.name check failed, expected test_name');
  }
}

export function testAccessingParentClass0004() {
  const TAG = 'testAccessingParentClass0004';

  const instanceB = new Sub3();
  instanceB.checkAccess();
  if (check_value3!.name !== "test_name") {
    console.info(`${TAG} Task execution failed: check_value3!.name: ${check_value3!.name}`);
    throw new Error('check_value3!.name check failed, expected test_name');
  }
}

export function testAccessingParentClass0005() {
  const TAG = 'testAccessingParentClass0005';

  const instanceB = new Sub4();
  instanceB.checkAccess();
  if (check_value4 !== date) {
    console.info(`${TAG} Task execution failed: check_value4: ${check_value4}`);
    throw new Error('check_value4 check failed, expected date');
  }
}

export function testAccessingParentClass0006() {
  const TAG = 'testAccessingParentClass0006';

  const instanceB = new Sub5();
  instanceB.checkAccess();
  if (check_value5 !== date) {
    console.info(`${TAG} Task execution failed: check_value5: ${check_value5}`);
    throw new Error('check_value5 check failed, expected date');
  }
}

export function testAccessingParentClass0007() {
  const TAG = 'testAccessingParentClass0007';

  const instanceB = new Sub6();
  instanceB.checkAccess();
  if (instanceB.value !== 2) {
    console.info(`${TAG} Task execution failed: instanceB.value: ${instanceB.value}`);
    throw new Error('instanceB.value check failed, expected 2');
  }
}

export function testAccessingParentClass0008() {
  const TAG = 'testAccessingParentClass0008';

  const instanceB = new Sub6();
  instanceB.checkAccess();
  if (instanceB.value !== 2) {
    console.info(`${TAG} Task execution failed: instanceB.value: ${instanceB.value}`);
    throw new Error('instanceB.value check failed, expected 2');
  }
}

export function testAccessingParentClass0009() {
  const TAG = 'testAccessingParentClass0009';

  const instanceB = new Sub7();
  instanceB.checkAccess();
  if (check_value6 !== 10) {
    console.info(`${TAG} Task execution failed: check_value6: ${check_value6}`);
    throw new Error('check_value6 check failed, expected 10');
  }
}

export function testAccessingParentClass0010() {
  const TAG = 'testAccessingParentClass0010';

  const instanceB = new Sub8();
  instanceB.checkAccess();
  if (check_value7 !== 10) {
    console.info(`${TAG} Task execution failed: check_value7: ${check_value7}`);
    throw new Error('check_value7 check failed, expected 10');
  }
}

export function testAccessingParentClass0011() {
  const TAG = 'testAccessingParentClass0011';

  const instanceB = new Sub9();
  instanceB.checkAccess();
  if (check_value8 !== null) {
    console.info(`${TAG} Task execution failed: check_value8: ${check_value8}`);
    throw new Error('check_value8 is not null');
  }
}

export function testAccessingParentClass0012() {
  const TAG = 'testAccessingParentClass0012';

  const instanceB = new Sub10();
  instanceB.checkAccess();
  if (check_value9 !== null) {
    console.info(`${TAG} Task execution failed: check_value9: ${check_value9}`);
    throw new Error('check_value9 check failed, expected null');
  }
}

export function testAccessingParentClass0013() {
  const TAG = 'testAccessingParentClass0013';

  const instanceB = new Sub11();
  instanceB.checkAccess();
  if (check_value10 !== 10) {
    console.info(`${TAG} Task execution failed: check_value10: ${check_value10}`);
    throw new Error('check_value10 check failed, expected 10');
  }
}

export function testAccessingParentClass0014() {
  const TAG = 'testAccessingParentClass0014';

  const instanceB = new Sub12();
  instanceB.checkAccess();
  if (check_value11 !== 10) {
    console.info(`${TAG} Task execution failed: check_value11: ${check_value11}`);
    throw new Error('check_value11 check failed, expected 10');
  }
}

export function testAccessingParentClass0015() {
  const TAG = 'testAccessingParentClass0015';

  const instanceB = new Sub13();
  instanceB.checkAccess();
  if (check_value12 !== "hello,world") {
    console.info(`${TAG} Task execution failed: check_value12: ${check_value12}`);
    throw new Error('check_value12 check failed, expected hello,world');
  }
}

export function testAccessingParentClass0016() {
  const TAG = 'testAccessingParentClass0016';

  const instanceB = new Sub14();
  instanceB.checkAccess();
  if (check_value13 !== "hello,world") {
    console.info(`${TAG} Task execution failed: check_value13: ${check_value13}`);
    throw new Error('check_value13 check failed, expected hello,world');
  }
}

export function testAccessingParentClass0017() {
  const TAG = 'testAccessingParentClass0017';

  const instanceB = new Sub15();
  instanceB.checkAccess();
  if (check_value14 !== undefined) {
    console.info(`${TAG} Task execution failed: check_value14: ${check_value14}`);
    throw new Error('check_value14 check failed, expected undefined');
  }
}

export function testAccessingParentClass0018() {
  const TAG = 'testAccessingParentClass0018';

  const instanceB = new Sub16();
  instanceB.checkAccess();
  if (check_value15 !== undefined) {
    console.info(`${TAG} Task execution failed: check_value15: ${check_value15}`);
    throw new Error('check_value15 check failed, expected undefined');
  }
}

export function testAccessingParentClass0019() {
  const TAG = 'testAccessingParentClass0019';

  const instanceB = new Sub17();
  instanceB.checkAccess();
  if (!check_value16) {
    console.info(`${TAG} Task execution failed: check_value16: ${check_value16}`);
    throw new Error('check_value16 is not true');
  }
}

export function testAccessingParentClass0020() {
  const TAG = 'testAccessingParentClass0020';

  const instanceB = new Sub18();
  instanceB.checkAccess();
  if (!check_value17) {
    console.info(`${TAG} Task execution failed: check_value17: ${check_value17}`);
    throw new Error('check_value17 is not true');
  }
}

export function testAccessingParentClass0021() {
  const TAG = 'testAccessingParentClass0021';

  const instanceB = new Sub19();
  instanceB.checkAccess();
  if (check_value18!.name !== "test_name") {
    console.info(`${TAG} Task execution failed: check_value18!.name: ${check_value18!.name}`);
    throw new Error('check_value18!.name check failed, expected test_name');
  }
}

export function testAccessingParentClass0022() {
  const TAG = 'testAccessingParentClass0022';

  const instanceB = new Sub20();
  instanceB.checkAccess();
  if (check_value19!.name !== "test_name") {
    console.info(`${TAG} Task execution failed: check_value19!.name: ${check_value19!.name}`);
    throw new Error('check_value19!.name check failed, expected test_name');
  }
}

export function testAccessingParentClass0023() {
  const TAG = 'testAccessingParentClass0023';

  const instanceB = new Sub21();
  instanceB.checkAccess();
  if (check_value20 !== date) {
    console.info(`${TAG} Task execution failed: check_value20: ${check_value20}`);
    throw new Error('check_value20 check failed, expected date');
  }
}

export function testAccessingParentClass0024() {
  const TAG = 'testAccessingParentClass0024';

  const instanceB = new Sub22();
  instanceB.checkAccess();
  if (check_value21 !== date) {
    console.info(`${TAG} Task execution failed: check_value21: ${check_value21}`);
    throw new Error('check_value21 check failed, expected date');
  }
}

export function testAccessingParentClass0025() {
  const TAG = 'testAccessingParentClass0025';

  const instanceB = new Sub23();
  instanceB.checkAccess();
  if (check_value22!.name !== "Object1") {
    console.info(`${TAG} Task execution failed: check_value22!.name: ${check_value22!.name}`);
    throw new Error('check_value22!.name check failed, expected Object1');
  }
}

export function testAccessingParentClass0026() {
  const TAG = 'testAccessingParentClass0026';

  const instanceB = new Sub24();
  instanceB.checkAccess();
  if (check_value23!.name !== "Object1") {
    console.info(`${TAG} Task execution failed: check_value23!.name: ${check_value23!.name}`);
    throw new Error('check_value23!.name check failed, expected Object1');
  }
}

export function testAccessingParentClass0027() {
  const TAG = 'testAccessingParentClass0027';

  const instanceB = new Sub25();
  instanceB.checkAccess();
  if (check_value24 !== 1) {
    console.info(`${TAG} Task execution failed: check_value24: ${check_value24}`);
    throw new Error('check_value24 check failed, expected 1');
  }
}

export function testAccessingParentClass0028() {
  const TAG = 'testAccessingParentClass0028';

  const instanceB = new Sub26();
  instanceB.checkAccess();
  if (check_value25 !== 1) {
    console.info(`${TAG} Task execution failed: check_value25: ${check_value25}`);
    throw new Error('check_value25 check failed, expected 1');
  }
}

export function testAccessingParentClass0029() {
  const TAG = 'testAccessingParentClass0029';

  const instanceB = new Sub27();
  instanceB.checkAccess();
  if (check_value26 !== "a") {
    console.info(`${TAG} Task execution failed: check_value26: ${check_value26}`);
    throw new Error('check_value26 check failed, expected a');
  }
}

export function testAccessingParentClass0030() {
  const TAG = 'testAccessingParentClass0030';

  const instanceB = new Sub28();
  instanceB.checkAccess();
  if (check_value27 !== "a") {
    console.info(`${TAG} Task execution failed: check_value27: ${check_value27}`);
    throw new Error('check_value27 check failed, expected a');
  }
}

export function testAccessingParentClass0031() {
  const TAG = 'testAccessingParentClass0031';

  const instanceB = new Sub29();
  instanceB.checkAccess();
  if (!check_value28) {
    console.info(`${TAG} Task execution failed: check_value28: ${check_value28}`);
    throw new Error('check_value28 is not true');
  }
}

export function testAccessingParentClass0032() {
  const TAG = 'testAccessingParentClass0032';

  const instanceB = new Sub30();
  instanceB.checkAccess();
  if (!check_value29) {
    console.info(`${TAG} Task execution failed: check_value29: ${check_value29}`);
    throw new Error('check_value29 is not true');
  }
}

export function testAccessingParentClass0033() {
  const TAG = 'testAccessingParentClass0033';

  const instanceB = new Sub31();
  instanceB.checkAccess();
  if (check_value30!.name !== "test_name") {
    console.info(`${TAG} Task execution failed: check_value30!.name: ${check_value30!.name}`);
    throw new Error('check_value30!.name check failed, expected test_name');
  }
}

export function testAccessingParentClass0034() {
  const TAG = 'testAccessingParentClass0034';

  const instanceB = new Sub32();
  instanceB.checkAccess();
  if (check_value31!.name !== "test_name") {
    console.info(`${TAG} Task execution failed: check_value31!.name: ${check_value31!.name}`);
    throw new Error('check_value31!.name check failed, expected test_name');
  }
}

export function testAccessingParentClass0035() {
  const TAG = 'testAccessingParentClass0035';

  const instanceB = new Sub33();
  instanceB.checkAccess();
  if (check_value32 !== date) {
    console.info(`${TAG} Task execution failed: check_value32: ${check_value32}`);
    throw new Error('check_value32 check failed, expected date');
  }
}

export function testAccessingParentClass0036() {
  const TAG = 'testAccessingParentClass0036';

  const instanceB = new Sub34();
  instanceB.checkAccess();
  if (check_value33 !== date) {
    console.info(`${TAG} Task execution failed: check_value33: ${check_value33}`);
    throw new Error('check_value33 check failed, expected date');
  }
}

export function testAccessingParentClass0037() {
  const TAG = 'testAccessingParentClass0037';

  const instanceB = new Sub35();
  instanceB.checkAccess();
  if (instanceB.value !== 2) {
    console.info(`${TAG} Task execution failed: instanceB.value: ${instanceB.value}`);
    throw new Error('instanceB.value check failed, expected 2');
  }
}

export function testAccessingParentClass0038() {
  const TAG = 'testAccessingParentClass0038';

  const instanceB = new Sub36();
  instanceB.checkAccess();
  if (instanceB.value1 !== 1) {
    console.info(`${TAG} Task execution failed: instanceB.value1: ${instanceB.value1}`);
    throw new Error('instanceB.value1 check failed, expected 1');
  }
}

export function testAccessingParentClass0039() {
  const TAG = 'testAccessingParentClass0039';

  const instanceB = new Sub37();
  instanceB.checkAccess();
  if (check_value34 !== 10) {
    console.info(`${TAG} Task execution failed: check_value34: ${check_value34}`);
    throw new Error('check_value34 check failed, expected 10');
  }
}

export function testAccessingParentClass0040() {
  const TAG = 'testAccessingParentClass0040';

  const instanceB = new Sub38();
  instanceB.checkAccess();
  if (check_value35 !== 10) {
    console.info(`${TAG} Task execution failed: check_value35: ${check_value35}`);
    throw new Error('check_value35 check failed, expected 10');
  }
}

export function testAccessingParentClass0041() {
  const TAG = 'testAccessingParentClass0041';

  const instanceB = new Sub39();
  instanceB.checkAccess();
  if (check_value36 !== null) {
    console.info(`${TAG} Task execution failed: check_value36: ${check_value36}`);
    throw new Error('check_value36 check failed, expected null');
  }
}

export function testAccessingParentClass0042() {
  const TAG = 'testAccessingParentClass0042';

  const instanceB = new Sub40();
  instanceB.checkAccess();
  if (check_value37 !== null) {
    console.info(`${TAG} Task execution failed: check_value37: ${check_value37}`);
    throw new Error('check_value37 check failed, expected null');
  }
}

export function testAccessingParentClass0043() {
  const TAG = 'testAccessingParentClass0043';

  const instanceB = new Sub41();
  instanceB.checkAccess();
  if (check_value38 !== 10) {
    console.info(`${TAG} Task execution failed: check_value38: ${check_value38}`);
    throw new Error('check_value38 check failed, expected 10');
  }
}

export function testAccessingParentClass0044() {
  const TAG = 'testAccessingParentClass0044';

  const instanceB = new Sub42();
  instanceB.checkAccess();
  if (check_value39 !== 10) {
    console.info(`${TAG} Task execution failed: check_value39: ${check_value39}`);
    throw new Error('check_value39 check failed, expected 10');
  }
}

export function testAccessingParentClass0045() {
  const TAG = 'testAccessingParentClass0045';

  const instanceB = new Sub43();
  instanceB.checkAccess();
  if (check_value40 !== "hello,world") {
    console.info(`${TAG} Task execution failed: check_value40: ${check_value40}`);
    throw new Error('check_value40 check failed, expected hello,world');
  }
}

export function testAccessingParentClass0046() {
  const TAG = 'testAccessingParentClass0046';

  const instanceB = new Sub44();
  instanceB.checkAccess();
  if (check_value41 !== "hello,world") {
    console.info(`${TAG} Task execution failed: check_value41: ${check_value41}`);
    throw new Error('check_value41 check failed, expected hello,world');
  }
}

export function testAccessingParentClass0047() {
  const TAG = 'testAccessingParentClass0047';

  const instanceB = new Sub45();
  instanceB.checkAccess();
  if (check_value42 !== undefined) {
    console.info(`${TAG} Task execution failed: check_value42: ${check_value42}`);
    throw new Error('check_value42 check failed, expected undefined');
  }
}

export function testAccessingParentClass0048() {
  const TAG = 'testAccessingParentClass0048';

  const instanceB = new Sub46();
  instanceB.checkAccess();
  if (check_value43 !== undefined) {
    console.info(`${TAG} Task execution failed: check_value43: ${check_value43}`);
    throw new Error('check_value43 check failed, expected undefined');
  }
}
