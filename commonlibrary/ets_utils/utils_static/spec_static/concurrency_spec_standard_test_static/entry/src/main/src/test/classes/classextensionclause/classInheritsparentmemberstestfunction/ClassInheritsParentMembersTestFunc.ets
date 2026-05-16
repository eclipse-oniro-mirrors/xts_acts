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


class User {
  public name: string = "User";
}

class Base {
  public value: User[] = [new User(), new User()];
}

class Derived extends Base {
}

class Base1 {
  protected value: number[];

  constructor() {
    this.value = [1, 2, 3];
  }
}

class Derived1 extends Base1 {
  public value1: number[];

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base2 {
  protected value: number;

  constructor() {
    this.value = 10;
  }
}

class Derived2 extends Base2 {
  public value1: number;

  constructor() {
    super();
    this.value1 = this.value
  }
}

class Base3 {
  protected value: undefined;

  constructor() {
    this.value = undefined;
  }
}

class Derived3 extends Base3 {
  public value1: undefined;

  constructor() {
    super();
    this.value1 = undefined;
  }
}

class Base4 {
  protected value: null;

  constructor() {
    this.value = null;
  }
}

class Derived4 extends Base4 {
  public value1: null;

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base5 {
  protected value: number;

  constructor() {
    this.value = 3.14;
  }
}

class Derived5 extends Base5 {
  public value1: number;

  constructor() {
    super();
    this.value1 = this.value;
  }
}

const date = new Date(2023, 10, 1);

class Base6 {
  public value: Date = date;
}

class Derived6 extends Base6 {
}

class Base7 {
  public value: string = "Hello";
}

class Derived7 extends Base7 {
}

class Base8 {
  protected value: string;

  constructor() {
    this.value = "Hello";
  }
}

class Derived8 extends Base8 {
  public value1: string;

  constructor() {
    super();
    this.value1 = String(this.value);
  }
}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Base9 {
  protected value: SomeInterface[];

  constructor() {
    this.value = [obj1, obj2];
  }
}

class Derived9 extends Base9 {
  public value1: SomeInterface[];

  constructor() {
    super();
    this.value1 = this.value;
  }
}

const date1 = new Date(2023, 10, 1);
const date2 = new Date(2023, 10, 2);

class Base10 {
  protected value: Date[];

  constructor() {
    this.value = [date1, date2];
  }
}

class Derived10 extends Base10 {
  public value1: Date[];

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base11 {
  public value: string[] = ["a", "b", "c"];
}

class Derived11 extends Base11 {
}

class Base12 {
  protected value: string[];

  constructor() {
    this.value = ["a", "b", "c"];
  }
}

class Derived12 extends Base12 {
  public value1: string[]

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base13 {
  public value: number = 10;
}

class Derived13 extends Base13 {
}

class UserClass {
  public name: string = "User";
}

class Base14 {
  public value: UserClass = new UserClass();
}

class Derived14 extends Base14 {
}

class Base15 {
  public value: number[] = [1, 2, 3];
}

class Derived15 extends Base15 {
}

class Base16 {
  public value: Date[] = [date1, date2];
}

class Derived16 extends Base16 {
}

class Base17 {
  protected value: Date;

  constructor() {
    this.value = date;
  }
}

class Derived17 extends Base17 {
  public value1: Date;

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base18 {
  public value: SomeInterface[] = [obj1, obj2];
}

class Derived18 extends Base18 {
}

class Base19 {
  protected value: UserClass;

  constructor() {
    this.value = new UserClass();
  }
}

class Derived19 extends Base19 {
  public value1: UserClass;

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base20 {
  public value: boolean[] = [true, false, true];
}

class Derived20 extends Base20 {
}

class Base21 {
  protected value: boolean[];

  constructor() {
    this.value = [true, false, true];
  }
}

class Derived21 extends Base21 {
  public value1: boolean[];

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base22 {
  protected value: boolean;

  constructor() {
    this.value = true;
  }
}

class Derived22 extends Base22 {
  public value1: boolean;

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base23 {
  public value: number = 3.14;
}

class Derived23 extends Base23 {
}

class Base24 {
  public value: boolean = true;
}

class Derived24 extends Base24 {
}

class Base25 {
  protected value: User[];

  constructor() {
    this.value = [new User(), new User()];
  }
}

class Derived25 extends Base25 {
  public value1: User[];

  constructor() {
    super();
    this.value1 = this.value;
  }
}

class Base26 {
  public value: null = null;
}

class Derived26 extends Base26 {
}

class Base27 {
  public value: undefined = undefined;
}

class Derived27 extends Base27 {
}

export function testClassInheritsParentMembers0001() {
  const TAG = 'testClassInheritsParentMembers0001';

  let instance = new Derived();
  if (instance.value[0].name !== "User") {
    console.info(`${TAG} Task execution failed: instance.value[0].name: ${instance.value[0].name}`);
    throw new Error('instance.value[0].name check failed, expected User');
  }

  if (instance.value[1].name !== "User") {
    console.info(`${TAG} Task execution failed: instance.value[1].name: ${instance.value[1].name}`);
    throw new Error('instance.value[1].name check failed, expected User');
  }
}

export function testClassInheritsParentMembers0002() {
  const TAG = 'testClassInheritsParentMembers0002';

  let instance = new Derived1();
  if (instance.value1[0] !== 1) {
    console.info(`${TAG} Task execution failed: instance.value1[0]: ${instance.value1[0]}`);
    throw new Error('instance.value1[0] check failed, expected 1');
  }

  if (instance.value1[1] !== 2) {
    console.info(`${TAG} Task execution failed: instance.value1[1]: ${instance.value1[1]}`);
    throw new Error('instance.value1[1] check failed, expected 2');
  }

  if (instance.value1[2] !== 3) {
    console.info(`${TAG} Task execution failed: instance.value1[2]: ${instance.value1[2]}`);
    throw new Error('instance.value1[2] check failed, expected 3');
  }
}

export function testClassInheritsParentMembers0003() {
  const TAG = 'testClassInheritsParentMembers0003';

  let instance = new Derived2();
  if (instance.value1 !== 10) {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected 10');
  }
}

export function testClassInheritsParentMembers0004() {
  const TAG = 'testClassInheritsParentMembers0004';

  let instance = new Derived3();
  if (instance.value1 !== undefined) {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected undefined');
  }
}

export function testClassInheritsParentMembers0005() {
  const TAG = 'testClassInheritsParentMembers0005';

  let instance = new Derived4();
  if (instance.value1 !== null) {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected null');
  }
}

export function testClassInheritsParentMembers0006() {
  const TAG = 'testClassInheritsParentMembers0006';

  let instance = new Derived5();
  if (instance.value1 !== 3.14) {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected 3.14');
  }
}

export function testClassInheritsParentMembers0007() {
  const TAG = 'testClassInheritsParentMembers0007';

  let instance = new Derived6();
  if (instance.value !== date) {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected date');
  }
}

export function testClassInheritsParentMembers0008() {
  const TAG = 'testClassInheritsParentMembers0008';

  let instance = new Derived7();
  if (instance.value !== "Hello") {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected Hello');
  }
}

export function testClassInheritsParentMembers0009() {
  const TAG = 'testClassInheritsParentMembers0009';

  let instance = new Derived8();
  if (instance.value1 !== "Hello") {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected Hello');
  }
}

export function testClassInheritsParentMembers0010() {
  const TAG = 'testClassInheritsParentMembers0010';

  let instance = new Derived9();
  if (instance.value1[0].name !== "Object1") {
    console.info(`${TAG} Task execution failed: instance.value1[0].name: ${instance.value1[0].name}`);
    throw new Error('instance.value1[0].name check failed, expected Object1');
  }

  if (instance.value1[1].name !== "Object2") {
    console.info(`${TAG} Task execution failed: instance.value1[1].name: ${instance.value1[1].name}`);
    throw new Error('instance.value1[1].name check failed, expected Object2');
  }
}

export function testClassInheritsParentMembers0011() {
  const TAG = 'testClassInheritsParentMembers0011';

  let instance = new Derived10();
  if (instance.value1[0] !== date1) {
    console.info(`${TAG} Task execution failed: instance.value1[0]: ${instance.value1[0]}`);
    throw new Error('instance.value1[0] check failed, expected date1');
  }

  if (instance.value1[1] !== date2) {
    console.info(`${TAG} Task execution failed: instance.value1[1]: ${instance.value1[1]}`);
    throw new Error('instance.value1[1] check failed, expected date2');
  }
}

export function testClassInheritsParentMembers0012() {
  const TAG = 'testClassInheritsParentMembers0012';

  let instance = new Derived11();
  if (instance.value[0] !== "a") {
    console.info(`${TAG} Task execution failed: instance.value[0]: ${instance.value[0]}`);
    throw new Error('instance.value[0] check failed, expected a');
  }

  if (instance.value[1] !== "b") {
    console.info(`${TAG} Task execution failed: instance.value[1]: ${instance.value[1]}`);
    throw new Error('instance.value[1] check failed, expected b');
  }

  if (instance.value[2] !== "c") {
    console.info(`${TAG} Task execution failed: instance.value[2]: ${instance.value[2]}`);
    throw new Error('instance.value[2] check failed, expected c');
  }
}

export function testClassInheritsParentMembers0013() {
  const TAG = 'testClassInheritsParentMembers0013';

  let instance = new Derived12();
  if (instance.value1[0] !== "a") {
    console.info(`${TAG} Task execution failed: instance.value1[0]: ${instance.value1[0]}`);
    throw new Error('instance.value1[0] check failed, expected a');
  }

  if (instance.value1[1] !== "b") {
    console.info(`${TAG} Task execution failed: instance.value1[1]: ${instance.value1[1]}`);
    throw new Error('instance.value1[1] check failed, expected b');
  }

  if (instance.value1[2] !== "c") {
    console.info(`${TAG} Task execution failed: instance.value1[2]: ${instance.value1[2]}`);
    throw new Error('instance.value1[2] check failed, expected c');
  }
}

export function testClassInheritsParentMembers0014() {
  const TAG = 'testClassInheritsParentMembers0014';

  let instance = new Derived13();
  if (instance.value !== 10) {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected 10');
  }
}

export function testClassInheritsParentMembers0015() {
  const TAG = 'testClassInheritsParentMembers0015';

  let instance = new Derived14();
  if (instance.value.name !== "User") {
    console.info(`${TAG} Task execution failed: instance.value.name: ${instance.value.name}`);
    throw new Error('instance.value.name check failed, expected User');
  }
}

export function testClassInheritsParentMembers0016() {
  const TAG = 'testClassInheritsParentMembers0016';

  let instance = new Derived15();
  if (instance.value[0] !== 1) {
    console.info(`${TAG} Task execution failed: instance.value[0]: ${instance.value[0]}`);
    throw new Error('instance.value[0] check failed, expected 1');
  }

  if (instance.value[1] !== 2) {
    console.info(`${TAG} Task execution failed: instance.value[1]: ${instance.value[1]}`);
    throw new Error('instance.value[1] check failed, expected 2');
  }

  if (instance.value[2] !== 3) {
    console.info(`${TAG} Task execution failed: instance.value[2]: ${instance.value[2]}`);
    throw new Error('instance.value[2] check failed, expected 3');
  }
}

export function testClassInheritsParentMembers0017() {
  const TAG = 'testClassInheritsParentMembers0017';

  let instance = new Derived16();
  if (instance.value[0] !== date1) {
    console.info(`${TAG} Task execution failed: instance.value[0]: ${instance.value[0]}`);
    throw new Error('instance.value[0] check failed, expected date1');
  }

  if (instance.value[1] !== date2) {
    console.info(`${TAG} Task execution failed: instance.value[1]: ${instance.value[1]}`);
    throw new Error('instance.value[1] check failed, expected date2');
  }
}

export function testClassInheritsParentMembers0018() {
  const TAG = 'testClassInheritsParentMembers0018';

  let instance = new Derived17();
  if (instance.value1 !== date) {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected date');
  }
}

export function testClassInheritsParentMembers0019() {
  const TAG = 'testClassInheritsParentMembers0019';

  let instance = new Derived18();
  if (instance.value[0].name !== "Object1") {
    console.info(`${TAG} Task execution failed: instance.value[0].name: ${instance.value[0].name}`);
    throw new Error('instance.value[0].name check failed, expected Object1');
  }

  if (instance.value[1].name !== "Object2") {
    console.info(`${TAG} Task execution failed: instance.value[1].name: ${instance.value[1].name}`);
    throw new Error('instance.value[1].name check failed, expected Object2');
  }
}

export function testClassInheritsParentMembers0020() {
  const TAG = 'testClassInheritsParentMembers0020';

  let instance = new Derived19();
  if (instance.value1.name !== "User") {
    console.info(`${TAG} Task execution failed: instance.value1.name: ${instance.value1.name}`);
    throw new Error('instance.value1.name check failed, expected User');
  }
}

export function testClassInheritsParentMembers0021() {
  const TAG = 'testClassInheritsParentMembers0021';

  let instance = new Derived20();
  if (instance.value[0] !== true) {
    console.info(`${TAG} Task execution failed: instance.value[0]: ${instance.value[0]}`);
    throw new Error('instance.value[0] check failed, expected true');
  }

  if (instance.value[1] !== false) {
    console.info(`${TAG} Task execution failed: instance.value[1]: ${instance.value[1]}`);
    throw new Error('instance.value[1] check failed, expected false');
  }

  if (instance.value[2] !== true) {
    console.info(`${TAG} Task execution failed: instance.value[2]: ${instance.value[2]}`);
    throw new Error('instance.value[2] check failed, expected true');
  }
}

export function testClassInheritsParentMembers0022() {
  const TAG = 'testClassInheritsParentMembers0022';

  let instance = new Derived21();
  if (instance.value1[0] !== true) {
    console.info(`${TAG} Task execution failed: instance.value1[0]: ${instance.value1[0]}`);
    throw new Error('instance.value1[0] check failed, expected true');
  }

  if (instance.value1[1] !== false) {
    console.info(`${TAG} Task execution failed: instance.value1[1]: ${instance.value1[1]}`);
    throw new Error('instance.value1[1] check failed, expected false');
  }

  if (instance.value1[2] !== true) {
    console.info(`${TAG} Task execution failed: instance.value1[2]: ${instance.value1[2]}`);
    throw new Error('instance.value1[2] check failed, expected true');
  }
}

export function testClassInheritsParentMembers0023() {
  const TAG = 'testClassInheritsParentMembers0023';

  let instance = new Derived22();
  if (instance.value1 !== true) {
    console.info(`${TAG} Task execution failed: instance.value1: ${instance.value1}`);
    throw new Error('instance.value1 check failed, expected true');
  }
}

export function testClassInheritsParentMembers0024() {
  const TAG = 'testClassInheritsParentMembers0024';

  let instance = new Derived23();
  if (instance.value !== 3.14) {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected 3.14');
  }
}

export function testClassInheritsParentMembers0025() {
  const TAG = 'testClassInheritsParentMembers0025';

  let instance = new Derived24();
  if (instance.value !== true) {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected true');
  }
}

export function testClassInheritsParentMembers0026() {
  const TAG = 'testClassInheritsParentMembers0026';

  let instance = new Derived25();
  if (instance.value1[0].name !== "User") {
    console.info(`${TAG} Task execution failed: instance.value1[0].name: ${instance.value1[0].name}`);
    throw new Error('instance.value1[0].name check failed, expected User');
  }

  if (instance.value1[1].name !== "User") {
    console.info(`${TAG} Task execution failed: instance.value1[1].name: ${instance.value1[1].name}`);
    throw new Error('instance.value1[1].name check failed, expected User');
  }
}

export function testClassInheritsParentMembers0027() {
  const TAG = 'testClassInheritsParentMembers0027';

  let instance = new Derived26();
  if (instance.value !== null) {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected null');
  }
}

export function testClassInheritsParentMembers0028() {
  const TAG = 'testClassInheritsParentMembers0028';

  let instance = new Derived27();
  if (instance.value !== undefined) {
    console.info(`${TAG} Task execution failed: instance.value: ${instance.value}`);
    throw new Error('instance.value check failed, expected undefined');
  }
}
