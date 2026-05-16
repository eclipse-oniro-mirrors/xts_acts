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

import hilog from '@ohos.hilog'

class A {
  value!: string;
  constructor(cond: boolean) {
    if (cond) {
      this.value = "init";
    }
  }
}

class ClosureDemo {
  captured!: string;
  constructor() {
    const fn = () => this.captured.length;
    this.captured = "value";
    fn();
  }
}

class ClosureError {
  captured!: string;
  constructor() {
    const fn = () => this.captured.length;
    fn();
  }
}

class Node {
  next!: Node;
}

class Base {
  f!: string
}

class Derived extends Base { }

class Base1 {
  f!: string
  constructor(name: string) {
    this.f = name
  }
}

class Base2 {
  g!: string
}

class EmptyClass { }

class Generic<T extends Object> {
  genericField!: T;
}

class UnionDemo {
  value!: string | number;
}

class C {
  prop!: string;
  getProp() {
    return this.prop;
  }
}

class AsyncDemo {
  payload!: string;
  constructor() {
    setTimeout(() => { this.payload = "done"; }, 100);
  }
}

class Static3 {
  data!: Object[];
  init() { this.data = []; }
}

class Parent {
  parentId!: string;
}

class Child extends Parent {
  childId!: number;
  constructor() {
    super();
    this.childId = 1;
  }
}

interface I {
  f: string
}

class Class_I implements I {
  f!: string
}

export async function ClassLateInitizationTest001(): Promise<void> {
  const caseName = 'ClassLateInitizationTest001';
  try {
    const obj = new A(false);
    hilog.info(0x0000, 'ClassLateInitizationTest001', '%{public}s', `${obj.value}`);
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest002(): Promise<void> {
  const caseName = 'ClassLateInitizationTest002';
  try {
    new ClosureDemo();
    new ClosureError();
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest003(): Promise<void> {
  const caseName = 'ClassLateInitizationTest003';
  try {
    const node = new Node();
    node.next = new Node();
    node.next.next;
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest004(): Promise<void> {
  const caseName = 'ClassLateInitizationTest004';
  try {
    let a: Base = new Derived();
    if (a.f !== "aa") {
      console.info(`${caseName} Test failed: a.f = ${a.f}`);
      throw new Error('Test failed');
    }
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest005(): Promise<void> {
  const caseName = 'ClassLateInitizationTest005';
  let a: Base = new Derived();
  a.f = "aa";
  if (a.f !== "aa") {
    console.info(`${caseName} Test failed: a.f = ${a.f}`);
    throw new Error('Test failed');
  }
}

export async function ClassLateInitizationTest006(): Promise<void> {
  const caseName = 'ClassLateInitizationTest006';
  let a = new Base1("aa");
  if (a.f !== "aa") {
    console.info(`${caseName} Test failed: a.f = ${a.f}`);
    throw new Error('Test failed');
  }
  try {
    let b = new Base2();
    if (b.g !== "aa") {
      console.info(`${caseName} Test failed: b.g = ${b.g}`);
      throw new Error('Test failed');
    }
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest007(): Promise<void> {
  const caseName = 'ClassLateInitizationTest007';
  try {
    const gen = new Generic<string>();
    hilog.info(0x0000, 'ClassLateInitizationTest007', '%{public}s', '${gen.genericField}');
  } catch (e) {
    if (!(e instanceof ClassCastError)) {
      console.info(`${caseName} Test failed: expected ClassCastError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest008(): Promise<void> {
  const caseName = 'ClassLateInitizationTest008';
  const gen = new Generic<string | EmptyClass>();
  try {
    hilog.info(0x0000, 'ClassLateInitizationTest008', '%{public}s', '${gen.genericField}');
  } catch (e) {
    if (!(e instanceof ClassCastError)) {
      console.info(`${caseName} Test failed: expected ClassCastError`);
      throw new Error('Test failed');
    }
  }
  gen.genericField = "1"
  if (gen.genericField !== "1") {
    console.info(`${caseName} Test failed: gen.genericField = ${gen.genericField}`);
    throw new Error('Test failed');
  }
  gen.genericField = new EmptyClass()
  if (!(gen.genericField instanceof EmptyClass)) {
    console.info(`${caseName} Test failed: gen.genericField is not EmptyClass`);
    throw new Error('Test failed');
  }
}

export async function ClassLateInitizationTest009(): Promise<void> {
  const caseName = 'ClassLateInitizationTest009';
  try {
    let a: Base2 = new Base2();
    if (a.g !== "aa") {
      console.info(`${caseName} Test failed: a.g = ${a.g}`);
      throw new Error('Test failed');
    }
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest010(): Promise<void> {
  const caseName = 'ClassLateInitizationTest010';
  let a: Base2 = { g: "aa" };
  if (a.g !== "aa") {
    console.info(`${caseName} Test failed: a.g = ${a.g}`);
    throw new Error('Test failed');
  }
}

export async function ClassLateInitizationTest011(): Promise<void> {
  const caseName = 'ClassLateInitizationTest011';
  try {
    const ud = new UnionDemo();
    ud.value.toString();
    console.info(`${caseName} Test failed: expected NullPointerError`);
    throw new Error('Test failed');
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
  const ud2 = new UnionDemo();
  ud2.value = 10;
  if (ud2.value !== 10) {
    console.info(`${caseName} Test failed: ud2.value = ${ud2.value}`);
    throw new Error('Test failed');
  }
}

export async function ClassLateInitizationTest012(): Promise<void> {
  const caseName = 'ClassLateInitizationTest012';
  try {
    new C().getProp();
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest013(): Promise<void> {
  const caseName = 'ClassLateInitizationTest013';
  let y = new Base();
  y.f = "ab"
  if (y.f !== "ab") {
    console.info(`${caseName} Test failed: y.f = ${y.f}`);
    throw new Error('Test failed');
  }

  let x = new Base2();
  x.g = '5'
  if (x.g !== "5") {
    console.info(`${caseName} Test failed: x.g = ${x.g}`);
    throw new Error('Test failed');
  }
}

export async function ClassLateInitizationTest014(): Promise<void> {
  const caseName = 'ClassLateInitizationTest014';
  try {
    const ad = new AsyncDemo();
    ad.payload;
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest015(): Promise<void> {
  const caseName = 'ClassLateInitizationTest015';
  try {
    const obj = new Static3();
    console.log(obj.data);
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest016(): Promise<void> {
  const caseName = 'ClassLateInitizationTest016';
  try {
    const child = new Child();
    child.parentId;
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
}

export async function ClassLateInitizationTest018(): Promise<void> {
  const caseName = 'ClassLateInitizationTest018';
  let a = new Class_I()
  try {
    console.log(a.f);
  } catch (e) {
    if (!(e instanceof NullPointerError)) {
      console.info(`${caseName} Test failed: expected NullPointerError`);
      throw new Error('Test failed');
    }
  }
  a.f = "1"
  if (a.f !== "1") {
    console.info(`${caseName} Test failed: a.f = ${a.f}`);
    throw new Error('Test failed');
  }
}
