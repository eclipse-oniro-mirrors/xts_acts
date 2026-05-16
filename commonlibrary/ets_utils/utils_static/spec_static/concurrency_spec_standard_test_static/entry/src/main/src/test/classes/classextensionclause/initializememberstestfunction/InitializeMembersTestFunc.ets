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


class Animal {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class Dog extends Animal {
  public breed: string;

  constructor(name: string, age: number, breed: string) {
    super(name, age);
    this.breed = breed;
  }
}

class Animal1 {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class Dog1 extends Animal1 {
  constructor(value: string) {
    super(value);
  }
}

class Parent {
  public constructorPublicVar: string;

  constructor(initialValue: string) {
    this.constructorPublicVar = initialValue;
  }
}

class Child extends Parent {
  constructor() {
    super('abc');
  }
}

class Parent1 {
  public constructorPublicVar: number[];

  constructor(initialValue: number[]) {
    this.constructorPublicVar = initialValue;
  }
}

class Child1 extends Parent1 {
  constructor(childValue: number[]) {
    super(childValue);
  }
}

class Parent2 {
  public constructorPublicVar: undefined;

  constructor(initialValue: undefined) {
    this.constructorPublicVar = initialValue;
  }
}

class Child2 extends Parent2 {
  constructor(childValue: undefined) {
    super(childValue);
  }
}

class Parent3 {
  public constructorPublicVar: boolean[];

  constructor(initialValue: boolean[]) {
    this.constructorPublicVar = initialValue;
  }
}

class Child3 extends Parent3 {
  constructor(childValue: boolean[]) {
    super(childValue);
  }
}

class Parent4 {
  public value: int;

  constructor(value: int) {
    this.value = value;
  }
}

class Child4 extends Parent4 {
  constructor(value: int) {
    super(value);
  }
}

class Parent5 {
  public value: number[];

  constructor(value: number[]) {
    this.value = value;
  }
}

class Child5 extends Parent5 {
  constructor(value: number[]) {
    super(value);
  }
}

class Parent6 {
  public value: string[];

  constructor(value: string[]) {
    this.value = value;
  }
}

class Child6 extends Parent6 {
  constructor(value: string[]) {
    super(value);
  }
}

class Parent7 {
  public value: undefined;

  constructor(value: undefined) {
    this.value = value;
  }
}

class Child7 extends Parent7 {
  constructor(value: undefined) {
    super(value);
  }
}

class Parent8 {
  public value: boolean[];

  constructor(value: boolean[]) {
    this.value = value;
  }
}

class Child8 extends Parent8 {
  constructor(value: boolean[]) {
    super(value);
  }
}

class Parent9 {
  public value: null;

  constructor(value: null) {
    this.value = value;
  }
}

class Child9 extends Parent9 {
  constructor(value: null) {
    super(value);
  }
}

class Parent10 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

class Child10 extends Parent10 {
  constructor(value: number) {
    super(value);
  }
}

const date1 = new Date(2023, 10, 1);
const date2 = new Date(2023, 10, 2);

class Parent11 {
  public value: Date[];

  constructor(value: Date[]) {
    this.value = value;
  }
}

class Child11 extends Parent11 {
  constructor(value: Date[]) {
    super(value);
  }
}

class User {
  public name: string = "User";
}

class Parent12 {
  public value: User[];

  constructor(value: User[]) {
    this.value = value;
  }
}

class Child12 extends Parent12 {
  constructor(value: User[]) {
    super(value);
  }
}

interface SomeInterface {
  name: string;
}

const obj1: SomeInterface = { name: "Object1" };
const obj2: SomeInterface = { name: "Object2" };

class Parent13 {
  public value: SomeInterface[];

  constructor(value: SomeInterface[]) {
    this.value = value;
  }
}

class Child13 extends Parent13 {
  constructor(value: SomeInterface[]) {
    super(value);
  }
}

export function testInitializeMembers0001() {
  const TAG = 'testInitializeMembers0001';

  const myDog = new Dog("Buddy", 5, "Golden Retriever");
  if (myDog.name !== "Buddy") {
    console.info(`${TAG} Task execution failed: myDog.name: ${myDog.name}`);
    throw new Error('myDog.name check failed, expected Buddy');
  }

  if (myDog.age !== 5) {
    console.info(`${TAG} Task execution failed: myDog.age: ${myDog.age}`);
    throw new Error('myDog.age check failed, expected 5');
  }

  if (myDog.breed !== "Golden Retriever") {
    console.info(`${TAG} Task execution failed: myDog.breed: ${myDog.breed}`);
    throw new Error('myDog.breed check failed, expected Golden Retriever');
  }
}

export function testInitializeMembers0002() {
  const TAG = 'testInitializeMembers0002';

  const myAnimal = new Animal1('def');
  const myDog = new Dog1('abc');
  if (myAnimal.value !== 'def') {
    console.info(`${TAG} Task execution failed: myAnimal.value: ${myAnimal.value}`);
    throw new Error('myAnimal.value check failed, expected def');
  }

  if (myDog.value !== 'abc') {
    console.info(`${TAG} Task execution failed: myDog.value: ${myDog.value}`);
    throw new Error('myDog.value check failed, expected abc');
  }
}

export function testInitializeMembers0003() {
  const TAG = 'testInitializeMembers0003';

  let child = new Child();
  let x: string = child.constructorPublicVar;
  if (x !== 'abc') {
    console.info(`${TAG} Task execution failed: x: ${x}`);
    throw new Error('x check failed, expected abc');
  }
}

export function testInitializeMembers0004() {
  const TAG = 'testInitializeMembers0004';

  const y: number[] = [1, 2, 3];
  let child = new Child1(y);
  let x: number[] = child.constructorPublicVar;
  if (x[0] !== 1) {
    console.info(`${TAG} Task execution failed: x[0]: ${x[0]}`);
    throw new Error('x[0] check failed, expected 1');
  }
}

export function testInitializeMembers0005() {
  const TAG = 'testInitializeMembers0005';

  let child = new Child2(undefined);
  let x: undefined = child.constructorPublicVar;
  if (x !== undefined) {
    console.info(`${TAG} Task execution failed: x: ${x}`);
    throw new Error('x check failed, expected undefined');
  }
}

export function testInitializeMembers0006() {
  const TAG = 'testInitializeMembers0006';

  const y: boolean[] = [true, false, true];
  let child = new Child3(y);
  let x: boolean[] = child.constructorPublicVar;
  if (x[0] !== true) {
    console.info(`${TAG} Task execution failed: x[0]: ${x[0]}`);
    throw new Error('x[0] check failed, expected true');
  }
}

export function testInitializeMembers0007() {
  const TAG = 'testInitializeMembers0007';

  const myChild = new Child4(1);
  if (myChild.value !== 1) {
    console.info(`${TAG} Task execution failed: myChild.value: ${myChild.value}`);
    throw new Error('myChild.value check failed, expected 1');
  }
}

export function testInitializeMembers0008() {
  const TAG = 'testInitializeMembers0008';

  const myChild = new Child5([1, 2, 3]);
  if (myChild.value[0] !== 1) {
    console.info(`${TAG} Task execution failed: myChild.value[0]: ${myChild.value[0]}`);
    throw new Error('myChild.value[0] check failed, expected 1');
  }

  if (myChild.value[1] !== 2) {
    console.info(`${TAG} Task execution failed: myChild.value[1]: ${myChild.value[1]}`);
    throw new Error('myChild.value[1] check failed, expected 2');
  }

  if (myChild.value[2] !== 3) {
    console.info(`${TAG} Task execution failed: myChild.value[2]: ${myChild.value[2]}`);
    throw new Error('myChild.value[2] check failed, expected 3');
  }
}

export function testInitializeMembers0009() {
  const TAG = 'testInitializeMembers0009';

  const myChild = new Child6(['a', 'b', 'c']);
  if (myChild.value[0] !== 'a') {
    console.info(`${TAG} Task execution failed: myChild.value[0]: ${myChild.value[0]}`);
    throw new Error('myChild.value[0] check failed, expected a');
  }

  if (myChild.value[1] !== 'b') {
    console.info(`${TAG} Task execution failed: myChild.value[1]: ${myChild.value[1]}`);
    throw new Error('myChild.value[1] check failed, expected b');
  }

  if (myChild.value[2] !== 'c') {
    console.info(`${TAG} Task execution failed: myChild.value[2]: ${myChild.value[2]}`);
    throw new Error('myChild.value[2] check failed, expected c');
  }
}

export function testInitializeMembers0010() {
  const TAG = 'testInitializeMembers0010';

  const myChild = new Child7(undefined);
  if (myChild.value !== undefined) {
    console.info(`${TAG} Task execution failed: myChild.value: ${myChild.value}`);
    throw new Error('myChild.value check failed, expected undefined');
  }
}

export function testInitializeMembers0011() {
  const TAG = 'testInitializeMembers0011';

  const myChild = new Child8([true, false, true]);
  if (myChild.value[0] !== true) {
    console.info(`${TAG} Task execution failed: myChild.value[0]: ${myChild.value[0]}`);
    throw new Error('myChild.value[0] check failed, expected true');
  }

  if (myChild.value[1] !== false) {
    console.info(`${TAG} Task execution failed: myChild.value[1]: ${myChild.value[1]}`);
    throw new Error('myChild.value[1] check failed, expected false');
  }

  if (myChild.value[2] !== true) {
    console.info(`${TAG} Task execution failed: myChild.value[2]: ${myChild.value[2]}`);
    throw new Error('myChild.value[2] check failed, expected true');
  }
}

export function testInitializeMembers0012() {
  const TAG = 'testInitializeMembers0012';

  const myChild = new Child9(null);
  if (myChild.value !== null) {
    console.info(`${TAG} Task execution failed: myChild.value: ${myChild.value}`);
    throw new Error('myChild.value check failed, expected null');
  }
}

export function testInitializeMembers0013() {
  const TAG = 'testInitializeMembers0013';

  const myChild = new Child10(3.14);
  if (myChild.value !== 3.14) {
    console.info(`${TAG} Task execution failed: myChild.value: ${myChild.value}`);
    throw new Error('myChild.value check failed, expected 3.14');
  }
}

export function testInitializeMembers0014() {
  const TAG = 'testInitializeMembers0014';

  const myChild = new Child11([date1, date2]);
  if (myChild.value[0] !== date1) {
    console.info(`${TAG} Task execution failed: myChild.value[0]: ${myChild.value[0]}`);
    throw new Error('myChild.value[0] check failed, expected date1');
  }

  if (myChild.value[1] !== date2) {
    console.info(`${TAG} Task execution failed: myChild.value[1]: ${myChild.value[1]}`);
    throw new Error('myChild.value[1] check failed, expected date2');
  }
}

export function testInitializeMembers0015() {
  const TAG = 'testInitializeMembers0015';

  const users: User[] = [new User(), new User()];
  const myChild = new Child12(users);
  if (myChild.value[0].name !== "User") {
    console.info(`${TAG} Task execution failed: myChild.value[0].name: ${myChild.value[0].name}`);
    throw new Error('myChild.value[0].name check failed, expected User');
  }

  if (myChild.value[1].name !== "User") {
    console.info(`${TAG} Task execution failed: myChild.value[1].name: ${myChild.value[1].name}`);
    throw new Error('myChild.value[1].name check failed, expected User');
  }
}

export function testInitializeMembers0016() {
  const TAG = 'testInitializeMembers0016';

  const interface1: SomeInterface[] = [obj1, obj2];
  const myChild = new Child13(interface1);
  if (myChild.value[0].name !== "Object1") {
    console.info(`${TAG} Task execution failed: myChild.value[0].name: ${myChild.value[0].name}`);
    throw new Error('myChild.value[0].name check failed, expected Object1');
  }

  if (myChild.value[1].name !== "Object2") {
    console.info(`${TAG} Task execution failed: myChild.value[1].name: ${myChild.value[1].name}`);
    throw new Error('myChild.value[1].name check failed, expected Object2');
  }
}
