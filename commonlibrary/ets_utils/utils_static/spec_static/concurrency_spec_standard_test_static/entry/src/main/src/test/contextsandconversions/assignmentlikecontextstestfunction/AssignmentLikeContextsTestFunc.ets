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


class A {
  public fld_1: boolean;
  public fld_2: boolean;

  public constructor(p1: boolean, p2: boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }

  public foo(p1: boolean, p2: boolean): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}

enum Color {
  Red,
  Green,
  Blue
}
class A1 {
  public fld_1: byte;
  public fld_2: byte;
  public fld_3: byte;
  public constructor(p1: byte, p2: byte, p3: byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: byte, p2: byte, p3: byte): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A2 {
  public fld_1: char;
  public fld_2: char;
  public fld_3: char;
  public constructor(p1: char, p2: char, p3: char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: char, p2: char, p3: char): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A3 {
  public fld_1: short;
  public fld_2: short;
  public constructor(p1: short, p2: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: short, p2: short): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A4 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A5 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A6 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A7 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A8 {
  public fld_1: short;
  public fld_2: short;
  public fld_3: short;
  public constructor(p1: short, p2: short, p3: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: short, p2: short, p3: short): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A9 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A10 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A11 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A12 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A13 {
  public fld_1: int;
  public fld_2: int;
  public constructor(p1: int, p2: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: int, p2: int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A14 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A15 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A16 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A17 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A18 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A19 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A20 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A21 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A22 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A23 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A24 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A25 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A26 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A27 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A28 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A29 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A30 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A31 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A32 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A33 {
  public fld_1: Integral;
  public fld_2: Integral;
  public fld_3: Integral;
  public constructor(p1: Integral, p2: Integral, p3: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Integral, p2: Integral, p3: Integral): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A34 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A35 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A36 {
  public fld_1: Boolean;
  public fld_2: Boolean;
  public constructor(p1: Boolean, p2: Boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Boolean, p2: Boolean): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A37 {
  public fld_1: Byte;
  public fld_2: Byte;
  public fld_3: Byte;
  public constructor(p1: Byte, p2: Byte, p3: Byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Byte, p2: Byte, p3: Byte): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A38 {
  public fld_1: Char;
  public fld_2: Char;
  public fld_3: Char;
  public constructor(p1: Char, p2: Char, p3: Char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Char, p2: Char, p3: Char): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A39 {
  public fld_1: Short;
  public fld_2: Short;
  public constructor(p1: Short, p2: Short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Short, p2: Short): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A40 {
  public fld_1: Int;
  public fld_2: Int;
  public fld_3: Int;
  public constructor(p1: Int, p2: Int, p3: Int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Int, p2: Int, p3: Int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A41 {
  public fld_1: Long;
  public fld_2: Long;
  public constructor(p1: Long, p2: Long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Long, p2: Long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A42 {
  public fld_1: Float;
  public fld_2: Float;
  public constructor(p1: Float, p2: Float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Float, p2: Float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A43 {
  public fld_1: Double;
  public fld_2: Double;
  public constructor(p1: Double, p2: Double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Double, p2: Double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
interface I {}
class A44 implements I {}
class A45 {}
class B<A45> {}
class B1<T extends A45> {}
type Barfunc = (a: Object) => Object;
function bar(a: Object): Object {
  return new Object();
}

class A46 {
  public fld_1: boolean;
  public fld_2: byte;
  public fld_3: short;
  public fld_4: int;
  public fld_5: long;
  public fld_6: float;
  public fld_7: double;
  public fld_8: char;
  public fld_9: Boolean|null;
  public fld_10: Byte|null;
  public fld_11: Char|null;
  public fld_12: Error|null;
  public fld_13: Barfunc|null;
  public fld_14: Barfunc[]|null;

  public constructor(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
    this.fld_4 = p4;
    this.fld_5 = p5;
    this.fld_6 = p6;
    this.fld_7 = p7;
    this.fld_8 = p8;
    this.fld_9 = p9;
    this.fld_10 = p10;
    this.fld_11 = p11;
    this.fld_12 = p12;
    this.fld_13 = p13;
    this.fld_14 = p14;
  }

  public foo(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
    if(this.fld_4 !== p4){
          console.info(`Task execution failed: this.fld_4: ${this.fld_4}`);
          throw new Error('this.fld_4 check failed, expected p4');
        }
    if(this.fld_5 !== p5){
          console.info(`Task execution failed: this.fld_5: ${this.fld_5}`);
          throw new Error('this.fld_5 check failed, expected p5');
        }
    if(this.fld_6 !== p6){
          console.info(`Task execution failed: this.fld_6: ${this.fld_6}`);
          throw new Error('this.fld_6 check failed, expected p6');
        }
    if(this.fld_7 !== p7){
          console.info(`Task execution failed: this.fld_7: ${this.fld_7}`);
          throw new Error('this.fld_7 check failed, expected p7');
        }
    if(this.fld_8 !== p8){
          console.info(`Task execution failed: this.fld_8: ${this.fld_8}`);
          throw new Error('this.fld_8 check failed, expected p8');
        }
    if(this.fld_9 !== p9){
          console.info(`Task execution failed: this.fld_9: ${this.fld_9}`);
          throw new Error('this.fld_9 check failed, expected p9');
        }
    if(this.fld_10 !== p10){
          console.info(`Task execution failed: this.fld_10: ${this.fld_10}`);
          throw new Error('this.fld_10 check failed, expected p10');
        }
    if(this.fld_11 !== p11){
          console.info(`Task execution failed: this.fld_11: ${this.fld_11}`);
          throw new Error('this.fld_11 check failed, expected p11');
        }
    if(this.fld_12 !== p12){
          console.info(`Task execution failed: this.fld_12: ${this.fld_12}`);
          throw new Error('this.fld_12 check failed, expected p12');
        }
    if(this.fld_13 !== p13){
          console.info(`Task execution failed: this.fld_13: ${this.fld_13}`);
          throw new Error('this.fld_13 check failed, expected p13');
        }
    if(this.fld_14 !== p14){
          console.info(`Task execution failed: this.fld_14: ${this.fld_14}`);
          throw new Error('this.fld_14 check failed, expected p14');
        }
  }
}
class B2<T> {}
class C<T> extends B2<T> {}
class C1<T> extends B<B<T>> {}
interface J {}
type Func = (a: int, b: string) => Boolean|null;
class C3<T> extends B2<A45> {}
class C4<T> {}
function foo<T extends Byte>(p: T): byte {
  let src: T = p;
  let dst: byte = src;
  return dst;
}
function foo1<T extends Short>(p: T): short {
  let src: T = p;
  let dst: short = src;
  return dst;
}
function foo2<T extends Int>(p: T): int {
  let src: T = p;
  let dst: int = src;
  return dst;
}
function foo3<T extends Long>(p: T): long {
  let src: T = p;
  let dst: long = src;
  return dst;
}
class A47 {
  public fld: short;
  constructor(p: Short) {
    this.fld = p;
  }
  public foo(p: Short): void {
    this.fld = p;
  }
}
class A48 {
  public fld: int;
  constructor(p: Int) {
    this.fld = p;
  }
  public foo(p: Int): void {
    this.fld = p;
  }
}
class A49 {
  public fld: long;
  constructor(p: Long) {
    this.fld = p;
  }
  public foo(p: Long): void {
    this.fld = p;
  }
}
function foo5(p: Object): void {
  if(p === null){
        console.info(`Task execution failed: p: ${p}`);
        throw new Error('p should not be null');
      }
}

export function testAssignmentLikeContexts0001(){
  const TAG = 'testAssignmentLikeContexts0001';
  let src_1: Boolean = new Boolean(true);
        let dst_1: boolean = src_1;

        let src_2: Boolean = new Boolean(false);
        let dst_2: boolean = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0002(){
  const TAG = 'testAssignmentLikeContexts0002';
  let v1: Boolean = new Boolean(true);
        let v2: Boolean = new Boolean(false);
        let c: A = new A(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0003(){
  const TAG = 'testAssignmentLikeContexts0003';
  let src_1: boolean = true;
        let dst_1: Boolean = new Boolean(src_1);

        let src_2: boolean = false;
        let dst_2: Boolean = new Boolean(src_2);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0004(){
  const TAG = 'testAssignmentLikeContexts0004';
  let src_1: boolean = true;
        let dst_1: Object = src_1 as Object;

        let src_2: boolean = false;
        let dst_2: Object = src_2 as Object;
  if(dst_1 === undefined){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be undefined');
      }

  if(dst_2 === undefined){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be undefined');
      }
}

export function testAssignmentLikeContexts0005(){
  const TAG = 'testAssignmentLikeContexts0005';
  let src: Object[] = [];
        let dst: Object = src as Object;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0006(){
  const TAG = 'testAssignmentLikeContexts0006';
  let src: Object[][] = [[], []];
        let dst: Object = src as Object;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0007(){
  const TAG = 'testAssignmentLikeContexts0007';
  let src_1: boolean = true;
        let dst_1: Object = src_1 as Object;

        let src_2: boolean = false;
        let dst_2: Object = src_2 as Object;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0008(){
  const TAG = 'testAssignmentLikeContexts0008';
  let src_1: string = '\u0000';
        let dst_1: Object = src_1 as Object;

        let src_2: string = 'X';
        let dst_2: Object = src_2 as Object;

        let src_3: string = '\uffff';
        let dst_3: Object = src_3 as Object;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }

  if(dst_3 === null){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 should not be null');
      }
}

export function testAssignmentLikeContexts0009(){
  const TAG = 'testAssignmentLikeContexts0009';
  let src: Color = Color.Red;
        let dst: Color = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0010(){
  const TAG = 'testAssignmentLikeContexts0010';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Short = new Short(src_1.toShort());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Short = new Short(src_2.toShort());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Short = new Short(src_3.toShort());
  if(dst_1 !== src_1.toShort()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toShort()');
      }

  if(dst_2 !== src_2.toShort()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toShort()');
      }

  if(dst_3 !== src_3.toShort()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toShort()');
      }
}

export function testAssignmentLikeContexts0011(){
  const TAG = 'testAssignmentLikeContexts0011';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Int = new Int(src_1.toInt());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Int = new Int(src_2.toInt());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Int = new Int(src_3.toInt());
  if(dst_1 !== src_1.toInt()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toInt()');
      }

  if(dst_2 !== src_2.toInt()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toInt()');
      }

  if(dst_3 !== src_3.toInt()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toInt()');
      }
}

export function testAssignmentLikeContexts0012(){
  const TAG = 'testAssignmentLikeContexts0012';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0013(){
  const TAG = 'testAssignmentLikeContexts0013';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0014(){
  const TAG = 'testAssignmentLikeContexts0014';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Double = new Double(src_2.toDouble());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Double = new Double(src_3.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }

  if(dst_3 !== src_3.toDouble()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toDouble()');
      }
}

export function testAssignmentLikeContexts0015(){
  const TAG = 'testAssignmentLikeContexts0015';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Int = new Int(src_1.toInt());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Int = new Int(src_2.toInt());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Int = new Int(src_3.toInt());
  if(dst_1 !== src_1.toInt()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toInt()');
      }

  if(dst_2 !== src_2.toInt()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toInt()');
      }

  if(dst_3 !== src_3.toInt()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toInt()');
      }
}

export function testAssignmentLikeContexts0016(){
  const TAG = 'testAssignmentLikeContexts0016';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0017(){
  const TAG = 'testAssignmentLikeContexts0017';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0018(){
  const TAG = 'testAssignmentLikeContexts0018';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Double = new Double(src_2.toDouble());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Double = new Double(src_3.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }

  if(dst_3 !== src_3.toDouble()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toDouble()');
      }
}

export function testAssignmentLikeContexts0019(){
  const TAG = 'testAssignmentLikeContexts0019';
  let src_1: Int = new Int(127);
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Int = new Int(32767);
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Int = new Int(2147483647);
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0020(){
  const TAG = 'testAssignmentLikeContexts0020';
  let src_1: Int = new Int(127);
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Int = new Int(32767);
        let dst_2: Float = new Float(src_2.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }
}

export function testAssignmentLikeContexts0021(){
  const TAG = 'testAssignmentLikeContexts0021';
  let src_1: Int = new Int(127);
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Int = new Int(32768);
        let dst_2: Double = new Double(src_2.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }
}

export function testAssignmentLikeContexts0022(){
  const TAG = 'testAssignmentLikeContexts0022';
  let src_1: Long = new Long((-1).toLong());
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Long = new Long((0).toLong());
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Long = new Long((1).toLong());
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0023(){
  const TAG = 'testAssignmentLikeContexts0023';
  let src_1: Long = new Long((-128).toLong());
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Long = new Long((127).toLong());
        let dst_2: Double = new Double(src_2.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }
}

export function testAssignmentLikeContexts0024(){
  const TAG = 'testAssignmentLikeContexts0024';
  let src_1: Float = new Float(1.4e-10f);
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Float = new Float(0.0000001f);
        let dst_2: Double = new Double(src_2.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }
}

export function testAssignmentLikeContexts0025(){
  const TAG = 'testAssignmentLikeContexts0025';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: byte = src_1;

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: byte = src_2;

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: byte = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0026(){
  const TAG = 'testAssignmentLikeContexts0026';
  let src_1: Char = new Char(c'\u0000');
        let dst_1: char = src_1;

        let src_2: Char = new Char(c'X');
        let dst_2: char = src_2;

        let src_3: Char = new Char(c'\uffff');
        let dst_3: char = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0027(){
  const TAG = 'testAssignmentLikeContexts0027';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: short = src_1;

        let src_2: Short = new Short((-128).toShort());
        let dst_2: short = src_2;

        let src_3: Short = new Short((0).toShort());
        let dst_3: short = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0028(){
  const TAG = 'testAssignmentLikeContexts0028';
  let src_1: Int = new Int(127);
        let dst_1: int = src_1;

        let src_2: Int = new Int(32767);
        let dst_2: int = src_2;

        let src_3: Int = new Int(2147483647);
        let dst_3: int = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0029(){
  const TAG = 'testAssignmentLikeContexts0029';
  let src_1: Long = new Long((-9223372036854775808).toLong());
        let dst_1: long = src_1;

        let src_2: Long = new Long((9223372036854775807).toLong());
        let dst_2: long = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0030(){
  const TAG = 'testAssignmentLikeContexts0030';
  let src_1: Float = new Float(1.401298464324817e-45f);
        let dst_1: float = src_1;

        let src_2: Float = new Float(0.00000001f);
        let dst_2: float = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0031(){
  const TAG = 'testAssignmentLikeContexts0031';
  let src_1: Double = new Double(-1.401298464324817e-45);
        let dst_1: double = src_1;

        let src_2: Double = new Double(1.000000000000001);
        let dst_2: double = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0032(){
  const TAG = 'testAssignmentLikeContexts0032';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A1 = new A1(v1, v2, v3);
        c.foo(v1, v2, v3);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }

  if(c.fld_3 !== v3){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3');
      }
}

export function testAssignmentLikeContexts0033(){
  const TAG = 'testAssignmentLikeContexts0033';
  let v1: Char = new Char(c'\u0000');
        let v2: Char = new Char(c'X');
        let v3: Char = new Char(c'\uffff');
        let c: A2 = new A2(v1, v2, v3);
        c.foo(v1, v2, v3);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }

  if(c.fld_3 !== v3){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3');
      }
}

export function testAssignmentLikeContexts0034(){
  const TAG = 'testAssignmentLikeContexts0034';
  let v1: Short = new Short(Short.MIN_VALUE);
        let v2: Short = new Short((255).toShort());
        let c: A3 = new A3(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0035(){
  const TAG = 'testAssignmentLikeContexts0035';
  let v1: Int = new Int(127);
        let v2: Int = new Int(32767);
        let v3: Int = new Int(Int.MAX_VALUE);
        let c: A4 = new A4(v1, v2, v3);
        c.foo(v1, v2, v3);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }

  if(c.fld_3 !== v3){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3');
      }
}

export function testAssignmentLikeContexts0036(){
  const TAG = 'testAssignmentLikeContexts0036';
  let v1: Long = new Long(Long.MIN_VALUE);
        let v2: Long = new Long((9223372036854775807).toLong());
        let c: A5 = new A5(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0037(){
  const TAG = 'testAssignmentLikeContexts0037';
  let v1: Float = new Float(1.401298464324817e-45f);
        let v2: Float = new Float(Float.MAX_VALUE);
        let c: A6 = new A6(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0038(){
  const TAG = 'testAssignmentLikeContexts0038';
  let v1: Double = new Double(-1.401298464324817e-45);
        let v2: Double = new Double(Double.MAX_VALUE);
        let c: A7 = new A7(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0039(){
  const TAG = 'testAssignmentLikeContexts0039';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A8 = new A8(v1.toShort(), v2.toShort(), v3.toShort());
        c.foo(v1.toShort(), v2.toShort(), v3.toShort());
  if(c.fld_1 !== v1.toShort()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toShort()');
      }

  if(c.fld_2 !== v2.toShort()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toShort()');
      }

  if(c.fld_3 !== v3.toShort()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toShort()');
      }
}

export function testAssignmentLikeContexts0040(){
  const TAG = 'testAssignmentLikeContexts0040';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A9 = new A9(v1.toInt(), v2.toInt(), v3.toInt());
        c.foo(v1.toInt(), v2.toInt(), v3.toInt());
  if(c.fld_1 !== v1.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toInt()');
      }

  if(c.fld_2 !== v2.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toInt()');
      }

  if(c.fld_3 !== v3.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toInt()');
      }
}

export function testAssignmentLikeContexts0041(){
  const TAG = 'testAssignmentLikeContexts0041';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A10 = new A10(v1.toLong(), v2.toLong(), v3.toLong());
        c.foo(v1.toLong(), v2.toLong(), v3.toLong());
  if(c.fld_1 !== v1.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toLong()');
      }

  if(c.fld_2 !== v2.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toLong()');
      }

  if(c.fld_3 !== v3.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toLong()');
      }
}

export function testAssignmentLikeContexts0042(){
  const TAG = 'testAssignmentLikeContexts0042';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A11 = new A11(v1.toFloat(), v2.toFloat(), v3.toFloat());
        c.foo(v1.toFloat(), v2.toFloat(), v3.toFloat());
  if(c.fld_1 !== v1.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toFloat()');
      }

  if(c.fld_2 !== v2.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toFloat()');
      }

  if(c.fld_3 !== v3.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toFloat()');
      }
}

export function testAssignmentLikeContexts0043(){
  const TAG = 'testAssignmentLikeContexts0043';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A12 = new A12(v1.toDouble(), v2.toDouble(), v3.toDouble());
        c.foo(v1.toDouble(), v2.toDouble(), v3.toDouble());
  if(c.fld_1 !== v1.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toDouble()');
      }

  if(c.fld_2 !== v2.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toDouble()');
      }

  if(c.fld_3 !== v3.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toDouble()');
      }
}

export function testAssignmentLikeContexts0044(){
  const TAG = 'testAssignmentLikeContexts0044';
  let v1: Short = new Short(Short.MIN_VALUE);
        let v2: Short = new Short((255).toShort());
        let c: A13 = new A13(v1.toInt(), v2.toInt());
        c.foo(v1.toInt(), v2.toInt());
  if(c.fld_1 !== v1.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toInt()');
      }

  if(c.fld_2 !== v2.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toInt()');
      }
}

export function testAssignmentLikeContexts0045(){
  const TAG = 'testAssignmentLikeContexts0045';
  let v1: Short = new Short(Short.MIN_VALUE);
        let v2: Short = new Short((255).toShort());
        let c: A14 = new A14(v1.toLong(), v2.toLong());
        c.foo(v1.toLong(), v2.toLong());
  if(c.fld_1 !== v1.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toLong()');
      }

  if(c.fld_2 !== v2.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toLong()');
      }
}

export function testAssignmentLikeContexts0046(){
  const TAG = 'testAssignmentLikeContexts0046';
  let v1: Short = new Short(Short.MIN_VALUE);
        let v2: Short = new Short((255).toShort());
        let c: A15 = new A15(v1.toFloat(), v2.toFloat());
        c.foo(v1.toFloat(), v2.toFloat());
  if(c.fld_1 !== v1.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toFloat()');
      }

  if(c.fld_2 !== v2.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toFloat()');
      }
}

export function testAssignmentLikeContexts0047(){
  const TAG = 'testAssignmentLikeContexts0047';
  let v1: Short = new Short(Short.MIN_VALUE);
        let v2: Short = new Short((255).toShort());
        let c: A16 = new A16(v1.toDouble(), v2.toDouble());
        c.foo(v1.toDouble(), v2.toDouble());
  if(c.fld_1 !== v1.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toDouble()');
      }

  if(c.fld_2 !== v2.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toDouble()');
      }
}

export function testAssignmentLikeContexts0048(){
  const TAG = 'testAssignmentLikeContexts0048';
  let v1: Int = new Int(127);
        let v2: Int = new Int(32767);
        let v3: Int = new Int(Int.MAX_VALUE);
        let c: A17 = new A17(v1.toLong(), v2.toLong(), v3.toLong());
        c.foo(v1.toLong(), v2.toLong(), v3.toLong());
  if(c.fld_1 !== v1.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toLong()');
      }

  if(c.fld_2 !== v2.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toLong()');
      }

  if(c.fld_3 !== v3.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toLong()');
      }
}

export function testAssignmentLikeContexts0049(){
  const TAG = 'testAssignmentLikeContexts0049';
  let v1: Int = new Int(127);
        let v2: Int = new Int(32767);
        let v3: Int = new Int(Int.MAX_VALUE);
        let c: A18 = new A18(v1.toFloat(), v2.toFloat(), v3.toFloat());
        c.foo(v1.toFloat(), v2.toFloat(), v3.toFloat());
  if(c.fld_1 !== v1.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toFloat()');
      }

  if(c.fld_2 !== v2.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toFloat()');
      }

  if(c.fld_3 !== v3.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toFloat()');
      }
}

export function testAssignmentLikeContexts0050(){
  const TAG = 'testAssignmentLikeContexts0050';
  let v1: Int = new Int(127);
        let v2: Int = new Int(32767);
        let v3: Int = new Int(Int.MAX_VALUE);
        let c: A19 = new A19(v1.toDouble(), v2.toDouble(), v3.toDouble());
        c.foo(v1.toDouble(), v2.toDouble(), v3.toDouble());
  if(c.fld_1 !== v1.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toDouble()');
      }

  if(c.fld_2 !== v2.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toDouble()');
      }

  if(c.fld_3 !== v3.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toDouble()');
      }
}

export function testAssignmentLikeContexts0051(){
  const TAG = 'testAssignmentLikeContexts0051';
  let v1: Long = new Long(Long.MIN_VALUE);
        let v2: Long = new Long((9223372036854775807).toLong());
        let c: A20 = new A20(v1.toFloat(), v2.toFloat());
        c.foo(v1.toFloat(), v2.toFloat());
  if(c.fld_1 !== v1.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toFloat()');
      }

  if(c.fld_2 !== v2.toFloat()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toFloat()');
      }
}

export function testAssignmentLikeContexts0052(){
  const TAG = 'testAssignmentLikeContexts0052';
  let v1: Long = new Long(Long.MIN_VALUE);
        let v2: Long = new Long((9223372036854775807).toLong());
        let c: A21 = new A21(v1.toDouble(), v2.toDouble());
        c.foo(v1.toDouble(), v2.toDouble());
  if(c.fld_1 !== v1.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toDouble()');
      }

  if(c.fld_2 !== v2.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toDouble()');
      }
}

export function testAssignmentLikeContexts0053(){
  const TAG = 'testAssignmentLikeContexts0053';
  let v1: Float = new Float(1.401298464324817e-45f);
        let v2: Float = new Float(Float.MAX_VALUE);
        let c: A22 = new A22(v1.toDouble(), v2.toDouble());
        c.foo(v1.toDouble(), v2.toDouble());
  if(c.fld_1 !== v1.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toDouble()');
      }

  if(c.fld_2 !== v2.toDouble()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toDouble()');
      }
}

export function testAssignmentLikeContexts0054(){
  const TAG = 'testAssignmentLikeContexts0054';
  let src_1: Char = new Char(c'\u0000');
        let dst_1: Int = new Int(src_1.toInt());

        let src_2: Char = new Char(c'X');
        let dst_2: Int = new Int(src_2.toInt());

        let src_3: Char = new Char(c'\uffff');
        let dst_3: Int = new Int(src_3.toInt());
  if(dst_1 !== src_1.toInt()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toInt()');
      }

  if(dst_2 !== src_2.toInt()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toInt()');
      }

  if(dst_3 !== src_3.toInt()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toInt()');
      }
}

export function testAssignmentLikeContexts0055(){
  const TAG = 'testAssignmentLikeContexts0055';
  let src_1: Char = new Char(c'\u0000');
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Char = new Char(c'X');
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Char = new Char(c'\uffff');
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0056(){
  const TAG = 'testAssignmentLikeContexts0056';
  let src_1: Char = new Char(c'\u0000');
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Char = new Char(c'X');
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Char = new Char(c'\uffff');
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0057(){
  const TAG = 'testAssignmentLikeContexts0057';
  let src_1: Char = new Char(c'\u0000');
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Char = new Char(c'X');
        let dst_2: Double = new Double(src_2.toDouble());

        let src_3: Char = new Char(c'\uffff');
        let dst_3: Double = new Double(src_3.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }

  if(dst_3 !== src_3.toDouble()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toDouble()');
      }
}

export function testAssignmentLikeContexts0059(){
  const TAG = 'testAssignmentLikeContexts0059';
  let src_1: FixedArray<Boolean> = new FixedArray<Boolean>(1);
        let dst_1: FixedArray<boolean> = new FixedArray<boolean>(1);
        // 预期编译阶段校验类型兼容性
        dst_1 = src_1 as FixedArray<boolean>;
  if(dst_1.length !== src_1.length){
        console.info(`${TAG} Task execution failed: dst_1.length: ${dst_1.length}`);
        throw new Error('dst_1.length check failed, expected src_1.length');
      }
}

export function testAssignmentLikeContexts0060(){
  const TAG = 'testAssignmentLikeContexts0060';
  let src_2: FixedArray<Byte> = new FixedArray<Byte>(1);
        let dst_2: FixedArray<byte> = new FixedArray<byte>(1);
        dst_2 = src_2 as FixedArray<byte>;
  if(dst_2.length !== src_2.length){
        console.info(`${TAG} Task execution failed: dst_2.length: ${dst_2.length}`);
        throw new Error('dst_2.length check failed, expected src_2.length');
      }
}

export function testAssignmentLikeContexts0061(){
  const TAG = 'testAssignmentLikeContexts0061';
  let src_11: FixedArray<char> = new FixedArray<char>(1);
        let dst_11: FixedArray<Char> = new FixedArray<Char>(1);
        dst_11 = src_11 as FixedArray<Char>;
  if(dst_11.length !== src_11.length){
        console.info(`${TAG} Task execution failed: dst_11.length: ${dst_11.length}`);
        throw new Error('dst_11.length check failed, expected src_11.length');
      }
}

export function testAssignmentLikeContexts0062(){
  const TAG = 'testAssignmentLikeContexts0062';
  let src_12: FixedArray<short> = new FixedArray<short>(1);
        let dst_12: FixedArray<Short> = new FixedArray<Short>(1);
        dst_12 = src_12 as FixedArray<Short>;
  if(dst_12.length !== src_12.length){
        console.info(`${TAG} Task execution failed: dst_12.length: ${dst_12.length}`);
        throw new Error('dst_12.length check failed, expected src_12.length');
      }
}

export function testAssignmentLikeContexts0063(){
  const TAG = 'testAssignmentLikeContexts0063';
  let src_13: FixedArray<int> = new FixedArray<int>(1);
        let dst_13: FixedArray<Int> = new FixedArray<Int>(1);
        dst_13 = src_13 as FixedArray<Int>;
  if(dst_13.length !== src_13.length){
        console.info(`${TAG} Task execution failed: dst_13.length: ${dst_13.length}`);
        throw new Error('dst_13.length check failed, expected src_13.length');
      }
}

export function testAssignmentLikeContexts0064(){
  const TAG = 'testAssignmentLikeContexts0064';
  let src_14: FixedArray<long> = new FixedArray<long>(1);
        let dst_14: FixedArray<Long> = new FixedArray<Long>(1);
        dst_14 = src_14 as FixedArray<Long>;
  if(dst_14.length !== src_14.length){
        console.info(`${TAG} Task execution failed: dst_14.length: ${dst_14.length}`);
        throw new Error('dst_14.length check failed, expected src_14.length');
      }
}

export function testAssignmentLikeContexts0065(){
  const TAG = 'testAssignmentLikeContexts0065';
  let src_15: FixedArray<float> = new FixedArray<float>(1);
        let dst_15: FixedArray<Float> = new FixedArray<Float>(1);
        dst_15 = src_15 as FixedArray<Float>;
  if(dst_15.length !== src_15.length){
        console.info(`${TAG} Task execution failed: dst_15.length: ${dst_15.length}`);
        throw new Error('dst_15.length check failed, expected src_15.length');
      }
}

export function testAssignmentLikeContexts0066(){
  const TAG = 'testAssignmentLikeContexts0066';
  let src_16: FixedArray<double> = new FixedArray<double>(1);
        let dst_16: FixedArray<Double> = new FixedArray<Double>(1);
        dst_16 = src_16 as FixedArray<Double>;
  if(dst_16.length !== src_16.length){
        console.info(`${TAG} Task execution failed: dst_16.length: ${dst_16.length}`);
        throw new Error('dst_16.length check failed, expected src_16.length');
      }
}

export function testAssignmentLikeContexts0067(){
  const TAG = 'testAssignmentLikeContexts0067';
  let src_3: FixedArray<Char> = new FixedArray<Char>(1);
        let dst_3: FixedArray<char> = new FixedArray<char>(1);
        dst_3 = src_3 as FixedArray<char>;
  if(dst_3.length !== src_3.length){
        console.info(`${TAG} Task execution failed: dst_3.length: ${dst_3.length}`);
        throw new Error('dst_3.length check failed, expected src_3.length');
      }
}

export function testAssignmentLikeContexts0068(){
  const TAG = 'testAssignmentLikeContexts0068';
  let src_4: FixedArray<Short> = new FixedArray<Short>(1);
        let dst_4: FixedArray<short> = new FixedArray<short>(1);
        dst_4 = src_4 as FixedArray<short>;
  if(dst_4.length !== src_4.length){
        console.info(`${TAG} Task execution failed: dst_4.length: ${dst_4.length}`);
        throw new Error('dst_4.length check failed, expected src_4.length');
      }
}

export function testAssignmentLikeContexts0069(){
  const TAG = 'testAssignmentLikeContexts0069';
  let src_5: FixedArray<Int> = new FixedArray<Int>(1);
        let dst_5: FixedArray<int> = new FixedArray<int>(1);
        dst_5 = src_5 as FixedArray<int>;
  if(dst_5.length !== src_5.length){
        console.info(`${TAG} Task execution failed: dst_5.length: ${dst_5.length}`);
        throw new Error('dst_5.length check failed, expected src_5.length');
      }
}

export function testAssignmentLikeContexts0070(){
  const TAG = 'testAssignmentLikeContexts0070';
  let src_6: FixedArray<Long> = new FixedArray<Long>(1);
        let dst_6: FixedArray<long> = new FixedArray<long>(1);
        dst_6 = src_6 as FixedArray<long>;
  if(dst_6.length !== src_6.length){
        console.info(`${TAG} Task execution failed: dst_6.length: ${dst_6.length}`);
        throw new Error('dst_6.length check failed, expected src_6.length');
      }
}

export function testAssignmentLikeContexts0071(){
  const TAG = 'testAssignmentLikeContexts0071';
  let src_7: FixedArray<Float> = new FixedArray<Float>(1);
        let dst_7: FixedArray<float> = new FixedArray<float>(1);
        dst_7 = src_7 as FixedArray<float>;
  if(dst_7.length !== src_7.length){
        console.info(`${TAG} Task execution failed: dst_7.length: ${dst_7.length}`);
        throw new Error('dst_7.length check failed, expected src_7.length');
      }
}

export function testAssignmentLikeContexts0072(){
  const TAG = 'testAssignmentLikeContexts0072';
  let src_8: FixedArray<Double> = new FixedArray<Double>(1);
        let dst_8: FixedArray<double> = new FixedArray<double>(1);
        dst_8 = src_8 as FixedArray<double>;
  if(dst_8.length !== src_8.length){
        console.info(`${TAG} Task execution failed: dst_8.length: ${dst_8.length}`);
        throw new Error('dst_8.length check failed, expected src_8.length');
      }
}

export function testAssignmentLikeContexts0073(){
  const TAG = 'testAssignmentLikeContexts0073';
  let src_9: FixedArray<boolean> = new FixedArray<boolean>(1);
        let dst_9: FixedArray<Boolean> = new FixedArray<Boolean>(1);
        dst_9 = src_9 as FixedArray<Boolean>;
  if(dst_9.length !== src_9.length){
        console.info(`${TAG} Task execution failed: dst_9.length: ${dst_9.length}`);
        throw new Error('dst_9.length check failed, expected src_9.length');
      }
}

export function testAssignmentLikeContexts0074(){
  const TAG = 'testAssignmentLikeContexts0074';
  let src_10: FixedArray<byte> = new FixedArray<byte>(1);
        let dst_10: FixedArray<Byte> = new FixedArray<Byte>(1);
        dst_10 = src_10 as FixedArray<Byte>;
  if(dst_10.length !== src_10.length){
        console.info(`${TAG} Task execution failed: dst_10.length: ${dst_10.length}`);
        throw new Error('dst_10.length check failed, expected src_10.length');
      }
}

export function testAssignmentLikeContexts0075(){
  const TAG = 'testAssignmentLikeContexts0075';
  let src_1: byte = -128 as byte;
        let dst_1: Byte = new Byte(src_1);

        let src_2: byte = 0 as byte;
        let dst_2: Byte = new Byte(src_2);

        let src_3: byte = 127 as byte;
        let dst_3: Byte = new Byte(src_3);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0076(){
  const TAG = 'testAssignmentLikeContexts0076';
  let src_1: char = c'\u0000';
        let dst_1: Char = new Char(src_1);

        let src_2: char = c'X';
        let dst_2: Char = new Char(src_2);

        let src_3: char = c'\uffff';
        let dst_3: Char = new Char(src_3);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0077(){
  const TAG = 'testAssignmentLikeContexts0077';
  let src_1: short = Short.MIN_VALUE;
        let dst_1: Short = new Short(src_1);

        let src_2: short = (255).toShort();
        let dst_2: Short = new Short(src_2);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0078(){
  const TAG = 'testAssignmentLikeContexts0078';
  let src_1: int = 127;
        let dst_1: Int = new Int(src_1);

        let src_2: int = 32767;
        let dst_2: Int = new Int(src_2);

        let src_3: int = Int.MAX_VALUE;
        let dst_3: Int = new Int(src_3);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0079(){
  const TAG = 'testAssignmentLikeContexts0079';
  let src_1: long = Long.MIN_VALUE;
        let dst_1: Long = new Long(src_1);

        let src_2: long = (9223372036854775807).toLong();
        let dst_2: Long = new Long(src_2);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0080(){
  const TAG = 'testAssignmentLikeContexts0080';
  let src_1: float = 1.401298464324817e-45f;
        let dst_1: Float = new Float(src_1);

        let src_2: float = Float.MAX_VALUE;
        let dst_2: Float = new Float(src_2);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0081(){
  const TAG = 'testAssignmentLikeContexts0081';
  let src_1: double = -1.401298464324817e-45;
        let dst_1: Double = new Double(src_1);

        let src_2: double = Double.MAX_VALUE;
        let dst_2: Double = new Double(src_2);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0082(){
  const TAG = 'testAssignmentLikeContexts0082';
  let v1: boolean = true;
        let v2: boolean = false;
        let c: A23 = new A23(new Boolean(v1), new Boolean(v2));
        c.foo(new Boolean(v1), new Boolean(v2));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0083(){
  const TAG = 'testAssignmentLikeContexts0083';
  let v1: byte = -128 as byte;
        let v2: byte = 0 as byte;
        let v3: byte = 127 as byte;
        let c: A24 = new A24(new Byte(v1), new Byte(v2), new Byte(v3));
        c.foo(new Byte(v1), new Byte(v2), new Byte(v3));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }

  if(c.fld_3 === null){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 should not be null');
      }
}

export function testAssignmentLikeContexts0084(){
  const TAG = 'testAssignmentLikeContexts0084';
  let v1: float = 1.401298464324817e-45f;
        let v2: float = Float.MAX_VALUE;
        let c: A25 = new A25(new Float(v1), new Float(v2));
        c.foo(new Float(v1), new Float(v2));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0085(){
  const TAG = 'testAssignmentLikeContexts0085';
  let v1: float = 1.401298464324817e-45f;
        let v2: float = Float.MAX_VALUE;
        let c: A26 = new A26(new Float(v1) as Floating, new Float(v2) as Floating);
        c.foo(new Float(v1) as Floating, new Float(v2) as Floating);
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0086(){
  const TAG = 'testAssignmentLikeContexts0086';
  let v1: double = -1.401298464324817e-45;
        let v2: double = Double.MAX_VALUE;
        let c: A27 = new A27(new Double(v1), new Double(v2));
        c.foo(new Double(v1), new Double(v2));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0087(){
  const TAG = 'testAssignmentLikeContexts0087';
  let v1: double = -1.401298464324817e-45;
        let v2: double = Double.MAX_VALUE;
        let c: A28 = new A28(new Double(v1) as Floating, new Double(v2) as Floating);
        c.foo(new Double(v1) as Floating, new Double(v2) as Floating);
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0088(){
  const TAG = 'testAssignmentLikeContexts0088';
  let v1: char = c'\u0000';
        let v2: char = c'X';
        let v3: char = c'\uffff';
        let c: A29 = new A29(new Char(v1), new Char(v2), new Char(v3));
        c.foo(new Char(v1), new Char(v2), new Char(v3));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }

  if(c.fld_3 === null){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 should not be null');
      }
}

export function testAssignmentLikeContexts0089(){
  const TAG = 'testAssignmentLikeContexts0089';
  let v1: short = Short.MIN_VALUE;
        let v2: short = (255).toShort();
        let c: A30 = new A30(new Short(v1), new Short(v2));
        c.foo(new Short(v1), new Short(v2));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0090(){
  const TAG = 'testAssignmentLikeContexts0090';
  let v1: short = Short.MIN_VALUE;
        let v2: short = (255).toShort();
        let c: A31 = new A31(new Short(v1) as Integral, new Short(v2) as Integral);
        c.foo(new Short(v1) as Integral, new Short(v2) as Integral);
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0091(){
  const TAG = 'testAssignmentLikeContexts0091';
  let v1: int = 127;
        let v2: int = 32767;
        let v3: int = Int.MAX_VALUE;
        let c: A32 = new A32(new Int(v1), new Int(v2), new Int(v3));
        c.foo(new Int(v1), new Int(v2), new Int(v3));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }

  if(c.fld_3 === null){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 should not be null');
      }
}

export function testAssignmentLikeContexts0092(){
  const TAG = 'testAssignmentLikeContexts0092';
  let v1: int = 127;
        let v2: int = 32767;
        let v3: int = Int.MAX_VALUE;
        let c: A33 = new A33(new Int(v1) as Integral, new Int(v2) as Integral, new Int(v3) as Integral);
        c.foo(new Int(v1) as Integral, new Int(v2) as Integral, new Int(v3) as Integral);
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }

  if(c.fld_3 === null){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 should not be null');
      }
}

export function testAssignmentLikeContexts0093(){
  const TAG = 'testAssignmentLikeContexts0093';
  let v1: long = Long.MIN_VALUE;
        let v2: long = (9223372036854775807).toLong();
        let c: A34 = new A34(new Long(v1), new Long(v2));
        c.foo(new Long(v1), new Long(v2));
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0094(){
  const TAG = 'testAssignmentLikeContexts0094';
  let v1: long = Long.MIN_VALUE;
        let v2: long = (9223372036854775807).toLong();
        let c: A35 = new A35(new Long(v1) as Integral, new Long(v2) as Integral);
        c.foo(new Long(v1) as Integral, new Long(v2) as Integral);
  if(c.fld_1 === null){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 should not be null');
      }

  if(c.fld_2 === null){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 should not be null');
      }
}

export function testAssignmentLikeContexts0095(){
  const TAG = 'testAssignmentLikeContexts0095';
  let v1: boolean = true;
        let v2: boolean = false;
        let c: A36 = new A36(new Boolean(v1), new Boolean(v2));
        c.foo(new Boolean(v1), new Boolean(v2));
  if(c.fld_1 !== new Boolean(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Boolean(v1)');
      }

  if(c.fld_2 !== new Boolean(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Boolean(v2)');
      }
}

export function testAssignmentLikeContexts0096(){
  const TAG = 'testAssignmentLikeContexts0096';
  let v1: byte = -128 as byte;
        let v2: byte = 0 as byte;
        let v3: byte = 127 as byte;
        let c: A37 = new A37(new Byte(v1), new Byte(v2), new Byte(v3));
        c.foo(new Byte(v1), new Byte(v2), new Byte(v3));
  if(c.fld_1 !== new Byte(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Byte(v1)');
      }

  if(c.fld_2 !== new Byte(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Byte(v2)');
      }

  if(c.fld_3 !== new Byte(v3)){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected new Byte(v3)');
      }
}

export function testAssignmentLikeContexts0097(){
  const TAG = 'testAssignmentLikeContexts0097';
  let v1: char = c'\u0000';
        let v2: char = c'X';
        let v3: char = c'\uffff';
        let c: A38 = new A38(new Char(v1), new Char(v2), new Char(v3));
        c.foo(new Char(v1), new Char(v2), new Char(v3));
  if(c.fld_1 !== new Char(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Char(v1)');
      }

  if(c.fld_2 !== new Char(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Char(v2)');
      }

  if(c.fld_3 !== new Char(v3)){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected new Char(v3)');
      }
}

export function testAssignmentLikeContexts0098(){
  const TAG = 'testAssignmentLikeContexts0098';
  let v1: short = Short.MIN_VALUE;
        let v2: short = (255).toShort();
        let c: A39 = new A39(new Short(v1), new Short(v2));
        c.foo(new Short(v1), new Short(v2));
  if(c.fld_1 !== new Short(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Short(v1)');
      }

  if(c.fld_2 !== new Short(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Short(v2)');
      }
}

export function testAssignmentLikeContexts0099(){
  const TAG = 'testAssignmentLikeContexts0099';
  let v1: int = 127;
        let v2: int = 32767;
        let v3: int = Int.MAX_VALUE;
        let c: A40 = new A40(new Int(v1), new Int(v2), new Int(v3));
        c.foo(new Int(v1), new Int(v2), new Int(v3));
  if(c.fld_1 !== new Int(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Int(v1)');
      }

  if(c.fld_2 !== new Int(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Int(v2)');
      }

  if(c.fld_3 !== new Int(v3)){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected new Int(v3)');
      }
}

export function testAssignmentLikeContexts0100(){
  const TAG = 'testAssignmentLikeContexts0100';
  let v1: long = Long.MIN_VALUE;
        let v2: long = (9223372036854775807).toLong();
        let c: A41 = new A41(new Long(v1), new Long(v2));
        c.foo(new Long(v1), new Long(v2));
  if(c.fld_1 !== new Long(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Long(v1)');
      }

  if(c.fld_2 !== new Long(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Long(v2)');
      }
}

export function testAssignmentLikeContexts0101(){
  const TAG = 'testAssignmentLikeContexts0101';
  let v1: float = 1.401298464324817e-45f;
        let v2: float = Float.MAX_VALUE;
        let c: A42 = new A42(new Float(v1), new Float(v2));
        c.foo(new Float(v1), new Float(v2));
  if(c.fld_1 !== new Float(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Float(v1)');
      }

  if(c.fld_2 !== new Float(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Float(v2)');
      }
}

export function testAssignmentLikeContexts0102(){
  const TAG = 'testAssignmentLikeContexts0102';
  let v1: double = -1.401298464324817e-45;
        let v2: double = Double.MAX_VALUE;
        let c: A43 = new A43(new Double(v1), new Double(v2));
        c.foo(new Double(v1), new Double(v2));
  if(c.fld_1 !== new Double(v1)){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected new Double(v1)');
      }

  if(c.fld_2 !== new Double(v2)){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected new Double(v2)');
      }
}

export function testAssignmentLikeContexts0103(){
  const TAG = 'testAssignmentLikeContexts0103';
  // 基本类型身份转换
        let src_1: boolean = false;
        let dst_1: boolean = src_1;

        let src_2: byte = 127;
        let dst_2: byte = src_2;

        let src_3: short = 32767;
        let dst_3: short = src_3;

        let src_4: int = 2147483647;
        let dst_4: int = src_4;

        let src_5: long = 9223372036854775807;
        let dst_5: long = src_5;

        let src_6: float = 3.40282346e38f;
        let dst_6: float = src_6;

        let src_7: double = 1.7976931348623157e308;
        let dst_7: double = src_7;

        let src_8: char = c'A';
        let dst_8: char = src_8;

        // 包装类型身份转换
        let src_9: Boolean = new Boolean(false);
        let dst_9: Boolean = src_9;

        let src_10: Byte = new Byte(new Int(1).toByte());
        let dst_10: Byte = src_10;

        let src_11: Char = new Char(c'A');
        let dst_11: Char = src_11;

        // 引用类型身份转换
        let src_12: Error = new Error("msg");
        let dst_12: Error = src_12;

        let src_13: char[] = [c'A', c'B'];
        let dst_13: char[] = src_13;
  if(src_1 !== dst_1){
        console.info(`${TAG} Task execution failed: src_1: ${src_1}`);
        throw new Error('src_1 check failed, expected dst_1');
      }

  if(src_2 !== dst_2){
        console.info(`${TAG} Task execution failed: src_2: ${src_2}`);
        throw new Error('src_2 check failed, expected dst_2');
      }

  if(src_3 !== dst_3){
        console.info(`${TAG} Task execution failed: src_3: ${src_3}`);
        throw new Error('src_3 check failed, expected dst_3');
      }

  if(src_4 !== dst_4){
        console.info(`${TAG} Task execution failed: src_4: ${src_4}`);
        throw new Error('src_4 check failed, expected dst_4');
      }

  if(src_5 !== dst_5){
        console.info(`${TAG} Task execution failed: src_5: ${src_5}`);
        throw new Error('src_5 check failed, expected dst_5');
      }

  if(src_6 !== dst_6){
        console.info(`${TAG} Task execution failed: src_6: ${src_6}`);
        throw new Error('src_6 check failed, expected dst_6');
      }

  if(src_7 !== dst_7){
        console.info(`${TAG} Task execution failed: src_7: ${src_7}`);
        throw new Error('src_7 check failed, expected dst_7');
      }

  if(src_8 !== dst_8){
        console.info(`${TAG} Task execution failed: src_8: ${src_8}`);
        throw new Error('src_8 check failed, expected dst_8');
      }

  if(src_9 !== dst_9){
        console.info(`${TAG} Task execution failed: src_9: ${src_9}`);
        throw new Error('src_9 check failed, expected dst_9');
      }

  if(src_10 !== dst_10){
        console.info(`${TAG} Task execution failed: src_10: ${src_10}`);
        throw new Error('src_10 check failed, expected dst_10');
      }

  if(src_11 !== dst_11){
        console.info(`${TAG} Task execution failed: src_11: ${src_11}`);
        throw new Error('src_11 check failed, expected dst_11');
      }

  if(src_12 !== dst_12){
        console.info(`${TAG} Task execution failed: src_12: ${src_12}`);
        throw new Error('src_12 check failed, expected dst_12');
      }

  if(src_13 !== dst_13){
        console.info(`${TAG} Task execution failed: src_13: ${src_13}`);
        throw new Error('src_13 check failed, expected dst_13');
      }
}

export function testAssignmentLikeContexts0104(){
  const TAG = 'testAssignmentLikeContexts0104';
  // 数值类型身份转换
        let src_1: long = Long.MAX_VALUE;
        let dst_1: long = src_1;

        let src_2: float = Float.POSITIVE_INFINITY;
        let dst_2: float = src_2;

        // 函数类型身份转换
        let src_3: (a: Boolean) => Object[] = (a: Boolean): Object[] => { return [a]; };
        let dst_3: (a: Boolean) => Object[] = src_3;

        // 可空类型身份转换
        let src_4: String|null = null;
        let dst_4: String|null = src_4;

        let src_5: ((a: Object) => Object)[]|null = [];
        let dst_5: ((a: Object) => Object)[]|null = src_5;

        // 多维数组身份转换
        let src_6: (double|null)[][] = [[1.0, 2.0, null]];
        let dst_6: (double|null)[][] = src_6;

        // 接口类型身份转换

        let src_7: I = new A44();
        let dst_7: I = src_7;

        // 枚举类型身份转换
        let src_8: Color = Color.Red;
        let dst_8: Color = src_8;
  if(src_1 !== dst_1){
        console.info(`${TAG} Task execution failed: src_1: ${src_1}`);
        throw new Error('src_1 check failed, expected dst_1');
      }

  if(src_2 !== dst_2){
        console.info(`${TAG} Task execution failed: src_2: ${src_2}`);
        throw new Error('src_2 check failed, expected dst_2');
      }

  if(src_3 !== dst_3){
        console.info(`${TAG} Task execution failed: src_3: ${src_3}`);
        throw new Error('src_3 check failed, expected dst_3');
      }

  if(src_4 !== dst_4){
        console.info(`${TAG} Task execution failed: src_4: ${src_4}`);
        throw new Error('src_4 check failed, expected dst_4');
      }

  if(src_5 !== dst_5){
        console.info(`${TAG} Task execution failed: src_5: ${src_5}`);
        throw new Error('src_5 check failed, expected dst_5');
      }

  if(src_6 !== dst_6){
        console.info(`${TAG} Task execution failed: src_6: ${src_6}`);
        throw new Error('src_6 check failed, expected dst_6');
      }

  if(src_7 !== dst_7){
        console.info(`${TAG} Task execution failed: src_7: ${src_7}`);
        throw new Error('src_7 check failed, expected dst_7');
      }

  if(src_8 !== dst_8){
        console.info(`${TAG} Task execution failed: src_8: ${src_8}`);
        throw new Error('src_8 check failed, expected dst_8');
      }
}

export function testAssignmentLikeContexts0105(){
  const TAG = 'testAssignmentLikeContexts0105';
  let src: B<A45> = new B<A45>();
        let dst: B<A45> = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0106(){
  const TAG = 'testAssignmentLikeContexts0106';
  let src: B1<A45> = new B1<A45>();
        let dst: B1<A45> = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0107(){
  const TAG = 'testAssignmentLikeContexts0107';
  let c: A46 = new A46(
          false,
          127 as byte,
          (32767).toShort(),
          2147483647,
          (9223372036854775807).toLong(),
          3.40282346e38f,
        1.7976931348623157e308,
        c'A',
        new Boolean(false),
        new Byte(new Int(1).toByte()),
        new Char(c'A'),
        new Error("msg"),
        bar,
        [bar]
        );
        c.foo(
          c.fld_1,
          c.fld_2,
          c.fld_3,
          c.fld_4,
          c.fld_5,
          c.fld_6,
          c.fld_7,
          c.fld_8,
          c.fld_9,
          c.fld_10,
          c.fld_11,
          c.fld_12,
          c.fld_13,
          c.fld_14
        );
  if(c.fld_1 !== false){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected false');
      }
}

export function testAssignmentLikeContexts0108(){
  const TAG = 'testAssignmentLikeContexts0108';
  // 包装类型及数组、函数类型的 null 赋值
        let v_Boolean: Boolean|null = null;
        let a_Boolean: (Boolean[])|null = null;
        let f_Boolean: ((p: Boolean) => Boolean)|null = null;

        let v_Byte: Byte|null = null;
        let a_Byte: (Byte[])|null = null;
        let f_Byte: ((p: Byte) => Byte)|null = null;

        let v_Char: Char|null = null;
        let a_Char: (Char[])|null = null;
        let f_Char: ((p: Char) => Char)|null = null;

        let v_Double: Double|null = null;
        let a_Double: (Double[])|null = null;
        let f_Double: ((p: Double) => Double)|null = null;

        let v_Float: Float|null = null;
        let a_Float: (Float[])|null = null;
        let f_Float: ((p: Float) => Float)|null = null;

        let v_Int: Int|null = null;
        let a_Int: (Int[])|null = null;
        let f_Int: ((p: Int) => Int)|null = null;

        let v_Long: Long|null = null;
        let a_Long: (Long[])|null = null;
        let f_Long: ((p: Long) => Long)|null = null;

        let v_Short: Short|null = null;
        let a_Short: (Short[])|null = null;
        let f_Short: ((p: Short) => Short)|null = null;
  if(v_Boolean !== null){
        console.info(`${TAG} Task execution failed: v_Boolean: ${v_Boolean}`);
        throw new Error('v_Boolean check failed, expected null');
      }

  if(a_Boolean !== null){
        console.info(`${TAG} Task execution failed: a_Boolean: ${a_Boolean}`);
        throw new Error('a_Boolean check failed, expected null');
      }

  if(f_Boolean !== null){
        console.info(`${TAG} Task execution failed: f_Boolean: ${f_Boolean}`);
        throw new Error('f_Boolean check failed, expected null');
      }

  if(v_Byte !== null){
        console.info(`${TAG} Task execution failed: v_Byte: ${v_Byte}`);
        throw new Error('v_Byte check failed, expected null');
      }

  if(a_Byte !== null){
        console.info(`${TAG} Task execution failed: a_Byte: ${a_Byte}`);
        throw new Error('a_Byte check failed, expected null');
      }

  if(f_Byte !== null){
        console.info(`${TAG} Task execution failed: f_Byte: ${f_Byte}`);
        throw new Error('f_Byte check failed, expected null');
      }

  if(v_Char !== null){
        console.info(`${TAG} Task execution failed: v_Char: ${v_Char}`);
        throw new Error('v_Char check failed, expected null');
      }

  if(a_Char !== null){
        console.info(`${TAG} Task execution failed: a_Char: ${a_Char}`);
        throw new Error('a_Char check failed, expected null');
      }

  if(f_Char !== null){
        console.info(`${TAG} Task execution failed: f_Char: ${f_Char}`);
        throw new Error('f_Char check failed, expected null');
      }

  if(v_Double !== null){
        console.info(`${TAG} Task execution failed: v_Double: ${v_Double}`);
        throw new Error('v_Double check failed, expected null');
      }

  if(a_Double !== null){
        console.info(`${TAG} Task execution failed: a_Double: ${a_Double}`);
        throw new Error('a_Double check failed, expected null');
      }

  if(f_Double !== null){
        console.info(`${TAG} Task execution failed: f_Double: ${f_Double}`);
        throw new Error('f_Double check failed, expected null');
      }

  if(v_Float !== null){
        console.info(`${TAG} Task execution failed: v_Float: ${v_Float}`);
        throw new Error('v_Float check failed, expected null');
      }

  if(a_Float !== null){
        console.info(`${TAG} Task execution failed: a_Float: ${a_Float}`);
        throw new Error('a_Float check failed, expected null');
      }

  if(f_Float !== null){
        console.info(`${TAG} Task execution failed: f_Float: ${f_Float}`);
        throw new Error('f_Float check failed, expected null');
      }

  if(v_Int !== null){
        console.info(`${TAG} Task execution failed: v_Int: ${v_Int}`);
        throw new Error('v_Int check failed, expected null');
      }

  if(a_Int !== null){
        console.info(`${TAG} Task execution failed: a_Int: ${a_Int}`);
        throw new Error('a_Int check failed, expected null');
      }

  if(f_Int !== null){
        console.info(`${TAG} Task execution failed: f_Int: ${f_Int}`);
        throw new Error('f_Int check failed, expected null');
      }

  if(v_Long !== null){
        console.info(`${TAG} Task execution failed: v_Long: ${v_Long}`);
        throw new Error('v_Long check failed, expected null');
      }

  if(a_Long !== null){
        console.info(`${TAG} Task execution failed: a_Long: ${a_Long}`);
        throw new Error('a_Long check failed, expected null');
      }

  if(f_Long !== null){
        console.info(`${TAG} Task execution failed: f_Long: ${f_Long}`);
        throw new Error('f_Long check failed, expected null');
      }

  if(v_Short !== null){
        console.info(`${TAG} Task execution failed: v_Short: ${v_Short}`);
        throw new Error('v_Short check failed, expected null');
      }

  if(a_Short !== null){
        console.info(`${TAG} Task execution failed: a_Short: ${a_Short}`);
        throw new Error('a_Short check failed, expected null');
      }

  if(f_Short !== null){
        console.info(`${TAG} Task execution failed: f_Short: ${f_Short}`);
        throw new Error('f_Short check failed, expected null');
      }
}

export function testAssignmentLikeContexts0109(){
  const TAG = 'testAssignmentLikeContexts0109';
  let v_Console: Console|null = null;
        let a_Console: (Console[])|null = null;
        let f_Console: ((p: Console) => Console)|null = null;

        let v_Floating: Floating|null = null;
        let a_Floating: (Floating[])|null = null;
        let f_Floating: ((p: Floating) => Floating)|null = null;

        let v_Integral: Integral|null = null;
        let a_Integral: (Integral[])|null = null;
        let f_Integral: ((p: Integral) => Integral)|null = null;

        let v_OutOfMemoryError: OutOfMemoryError|null = null;
        let a_OutOfMemoryError: (OutOfMemoryError[])|null = null;
        let f_OutOfMemoryError: ((p: OutOfMemoryError) => OutOfMemoryError)|null = null;

        let v_AssertionError: AssertionError|null = null;
        let a_AssertionError: (AssertionError[])|null = null;
        let f_AssertionError: ((p: AssertionError) => AssertionError)|null = null;

        let v_DivideByZeroError: DivideByZeroError|null = null;
        let a_DivideByZeroError: (DivideByZeroError[])|null = null;
        let f_DivideByZeroError: ((p: DivideByZeroError) => DivideByZeroError)|null = null;

        let v_NullPointerError: NullPointerError|null = null;
        let a_NullPointerError: (NullPointerError[])|null = null;
        let f_NullPointerError: ((p: NullPointerError) => NullPointerError)|null = null;

        let v_Error: Error|null = null;
        let a_Error: (Error[])|null = null;
        let f_Error: ((p: Error) => Error)|null = null;
  if(v_Console !== null){
        console.info(`${TAG} Task execution failed: v_Console: ${v_Console}`);
        throw new Error('v_Console check failed, expected null');
      }

  if(a_Console !== null){
        console.info(`${TAG} Task execution failed: a_Console: ${a_Console}`);
        throw new Error('a_Console check failed, expected null');
      }

  if(f_Console !== null){
        console.info(`${TAG} Task execution failed: f_Console: ${f_Console}`);
        throw new Error('f_Console check failed, expected null');
      }

  if(v_Floating !== null){
        console.info(`${TAG} Task execution failed: v_Floating: ${v_Floating}`);
        throw new Error('v_Floating check failed, expected null');
      }

  if(a_Floating !== null){
        console.info(`${TAG} Task execution failed: a_Floating: ${a_Floating}`);
        throw new Error('a_Floating check failed, expected null');
      }

  if(f_Floating !== null){
        console.info(`${TAG} Task execution failed: f_Floating: ${f_Floating}`);
        throw new Error('f_Floating check failed, expected null');
      }

  if(v_Integral !== null){
        console.info(`${TAG} Task execution failed: v_Integral: ${v_Integral}`);
        throw new Error('v_Integral check failed, expected null');
      }

  if(a_Integral !== null){
        console.info(`${TAG} Task execution failed: a_Integral: ${a_Integral}`);
        throw new Error('a_Integral check failed, expected null');
      }

  if(f_Integral !== null){
        console.info(`${TAG} Task execution failed: f_Integral: ${f_Integral}`);
        throw new Error('f_Integral check failed, expected null');
      }

  if(v_OutOfMemoryError !== null){
        console.info(`${TAG} Task execution failed: v_OutOfMemoryError: ${v_OutOfMemoryError}`);
        throw new Error('v_OutOfMemoryError check failed, expected null');
      }

  if(a_OutOfMemoryError !== null){
        console.info(`${TAG} Task execution failed: a_OutOfMemoryError: ${a_OutOfMemoryError}`);
        throw new Error('a_OutOfMemoryError check failed, expected null');
      }

  if(f_OutOfMemoryError !== null){
        console.info(`${TAG} Task execution failed: f_OutOfMemoryError: ${f_OutOfMemoryError}`);
        throw new Error('f_OutOfMemoryError check failed, expected null');
      }

  if(v_AssertionError !== null){
        console.info(`${TAG} Task execution failed: v_AssertionError: ${v_AssertionError}`);
        throw new Error('v_AssertionError check failed, expected null');
      }

  if(a_AssertionError !== null){
        console.info(`${TAG} Task execution failed: a_AssertionError: ${a_AssertionError}`);
        throw new Error('a_AssertionError check failed, expected null');
      }

  if(f_AssertionError !== null){
        console.info(`${TAG} Task execution failed: f_AssertionError: ${f_AssertionError}`);
        throw new Error('f_AssertionError check failed, expected null');
      }

  if(v_DivideByZeroError !== null){
        console.info(`${TAG} Task execution failed: v_DivideByZeroError: ${v_DivideByZeroError}`);
        throw new Error('v_DivideByZeroError check failed, expected null');
      }

  if(a_DivideByZeroError !== null){
        console.info(`${TAG} Task execution failed: a_DivideByZeroError: ${a_DivideByZeroError}`);
        throw new Error('a_DivideByZeroError check failed, expected null');
      }

  if(f_DivideByZeroError !== null){
        console.info(`${TAG} Task execution failed: f_DivideByZeroError: ${f_DivideByZeroError}`);
        throw new Error('f_DivideByZeroError check failed, expected null');
      }

  if(v_NullPointerError !== null){
        console.info(`${TAG} Task execution failed: v_NullPointerError: ${v_NullPointerError}`);
        throw new Error('v_NullPointerError check failed, expected null');
      }

  if(a_NullPointerError !== null){
        console.info(`${TAG} Task execution failed: a_NullPointerError: ${a_NullPointerError}`);
        throw new Error('a_NullPointerError check failed, expected null');
      }

  if(f_NullPointerError !== null){
        console.info(`${TAG} Task execution failed: f_NullPointerError: ${f_NullPointerError}`);
        throw new Error('f_NullPointerError check failed, expected null');
      }

  if(v_Error !== null){
        console.info(`${TAG} Task execution failed: v_Error: ${v_Error}`);
        throw new Error('v_Error check failed, expected null');
      }

  if(a_Error !== null){
        console.info(`${TAG} Task execution failed: a_Error: ${a_Error}`);
        throw new Error('a_Error check failed, expected null');
      }

  if(f_Error !== null){
        console.info(`${TAG} Task execution failed: f_Error: ${f_Error}`);
        throw new Error('f_Error check failed, expected null');
      }
}

export function testAssignmentLikeContexts0110(){
  const TAG = 'testAssignmentLikeContexts0110';
  let v_String: String|null = null;
        let a_String: (String[])|null = null;
        let f_String: ((p: String) => String)|null = null;

        let v_StringBuilder: StringBuilder|null = null;
        let a_StringBuilder: (StringBuilder[])|null = null;
        let f_StringBuilder: ((p: StringBuilder) => StringBuilder)|null = null;

        let v_Type: Type|null = null;
        let a_Type: (Type[])|null = null;
        let f_Type: ((p: Type) => Type)|null = null;

        let v_Date: Date|null = null;
        let a_Date: (Date[])|null = null;
        let f_Date: ((p: Date) => Date)|null = null;
  if(v_String !== null){
        console.info(`${TAG} Task execution failed: v_String: ${v_String}`);
        throw new Error('v_String check failed, expected null');
      }

  if(a_String !== null){
        console.info(`${TAG} Task execution failed: a_String: ${a_String}`);
        throw new Error('a_String check failed, expected null');
      }

  if(f_String !== null){
        console.info(`${TAG} Task execution failed: f_String: ${f_String}`);
        throw new Error('f_String check failed, expected null');
      }

  if(v_StringBuilder !== null){
        console.info(`${TAG} Task execution failed: v_StringBuilder: ${v_StringBuilder}`);
        throw new Error('v_StringBuilder check failed, expected null');
      }

  if(a_StringBuilder !== null){
        console.info(`${TAG} Task execution failed: a_StringBuilder: ${a_StringBuilder}`);
        throw new Error('a_StringBuilder check failed, expected null');
      }

  if(f_StringBuilder !== null){
        console.info(`${TAG} Task execution failed: f_StringBuilder: ${f_StringBuilder}`);
        throw new Error('f_StringBuilder check failed, expected null');
      }

  if(v_Type !== null){
        console.info(`${TAG} Task execution failed: v_Type: ${v_Type}`);
        throw new Error('v_Type check failed, expected null');
      }

  if(a_Type !== null){
        console.info(`${TAG} Task execution failed: a_Type: ${a_Type}`);
        throw new Error('a_Type check failed, expected null');
      }

  if(f_Type !== null){
        console.info(`${TAG} Task execution failed: f_Type: ${f_Type}`);
        throw new Error('f_Type check failed, expected null');
      }

  if(v_Date !== null){
        console.info(`${TAG} Task execution failed: v_Date: ${v_Date}`);
        throw new Error('v_Date check failed, expected null');
      }

  if(a_Date !== null){
        console.info(`${TAG} Task execution failed: a_Date: ${a_Date}`);
        throw new Error('a_Date check failed, expected null');
      }

  if(f_Date !== null){
        console.info(`${TAG} Task execution failed: f_Date: ${f_Date}`);
        throw new Error('f_Date check failed, expected null');
      }
}

export function testAssignmentLikeContexts0111(){
  const TAG = 'testAssignmentLikeContexts0111';
  let origin: byte = 0 as byte;
        let xshort: short = origin;
        let xint: int = origin;
        let xlong: long = origin;
        let xfloat: float = origin;
        let xdouble: double = origin;

  if(xshort !== origin){
        console.info(`${TAG} Task execution failed: xshort: ${xshort}`);
        throw new Error('xshort check failed, expected origin');
      }

  if(xint !== origin){
        console.info(`${TAG} Task execution failed: xint: ${xint}`);
        throw new Error('xint check failed, expected origin');
      }

  if(xlong !== origin){
        console.info(`${TAG} Task execution failed: xlong: ${xlong}`);
        throw new Error('xlong check failed, expected origin');
      }

  if(xfloat !== origin){
        console.info(`${TAG} Task execution failed: xfloat: ${xfloat}`);
        throw new Error('xfloat check failed, expected origin');
      }

  if(xdouble !== origin){
        console.info(`${TAG} Task execution failed: xdouble: ${xdouble}`);
        throw new Error('xdouble check failed, expected origin');
      }
}

export function testAssignmentLikeContexts0112(){
  const TAG = 'testAssignmentLikeContexts0112';
  let origin: short = 0 as short;
        let xint: int = origin;
        let xlong: long = origin;
        let xfloat: float = origin;
        let xdouble: double = origin;

  if(xint !== origin){
        console.info(`${TAG} Task execution failed: xint: ${xint}`);
        throw new Error('xint check failed, expected origin');
      }

  if(xlong !== origin){
        console.info(`${TAG} Task execution failed: xlong: ${xlong}`);
        throw new Error('xlong check failed, expected origin');
      }

  if(xfloat !== origin){
        console.info(`${TAG} Task execution failed: xfloat: ${xfloat}`);
        throw new Error('xfloat check failed, expected origin');
      }

  if(xdouble !== origin){
        console.info(`${TAG} Task execution failed: xdouble: ${xdouble}`);
        throw new Error('xdouble check failed, expected origin');
      }
}

export function testAssignmentLikeContexts0113(){
  const TAG = 'testAssignmentLikeContexts0113';
  let origin: int = 0;
        let xlong: long = origin;
        let xfloat: float = origin;
        let xdouble: double = origin;

  if(xlong !== origin){
        console.info(`${TAG} Task execution failed: xlong: ${xlong}`);
        throw new Error('xlong check failed, expected origin');
      }

  if(xfloat !== origin){
        console.info(`${TAG} Task execution failed: xfloat: ${xfloat}`);
        throw new Error('xfloat check failed, expected origin');
      }

  if(xdouble !== origin){
        console.info(`${TAG} Task execution failed: xdouble: ${xdouble}`);
        throw new Error('xdouble check failed, expected origin');
      }
}

export function testAssignmentLikeContexts0114(){
  const TAG = 'testAssignmentLikeContexts0114';
  let origin: long = 0 as long;
        let xfloat: float = origin;
        let xdouble: double = origin;

  if(xfloat !== origin){
        console.info(`${TAG} Task execution failed: xfloat: ${xfloat}`);
        throw new Error('xfloat check failed, expected origin');
      }

  if(xdouble !== origin){
        console.info(`${TAG} Task execution failed: xdouble: ${xdouble}`);
        throw new Error('xdouble check failed, expected origin');
      }
}

export function testAssignmentLikeContexts0115(){
  const TAG = 'testAssignmentLikeContexts0115';
  let origin: float = 0.0f;
        let xdouble: double = origin;

  if(xdouble !== origin){
        console.info(`${TAG} Task execution failed: xdouble: ${xdouble}`);
        throw new Error('xdouble check failed, expected origin');
      }
}


export function testAssignmentLikeContexts0119(){
  const TAG = 'testAssignmentLikeContexts0119';
  // 到 Object 的拓宽转换
        let src_Double: Double = new Double();
        let dst_Object: Object = src_Double as Object;

        // 到 Integral 的拓宽转换

        let src_Byte: Byte = new Byte();
        let dst_Integral_Byte: Integral = src_Byte as Integral;

        let src_Short: Short = new Short();
        let dst_Integral_Short: Integral = src_Short as Integral;

        let src_Int: Int = new Int();
        let dst_Integral_Int: Integral = src_Int as Integral;

        let src_Long: Long = new Long();
        let dst_Integral_Long: Integral = src_Long as Integral;

        // 到 Floating 的拓宽转换

        let src_Float: Float = new Float();
        let dst_Floating_Float: Floating = src_Float as Floating;

        let src_Double2: Double = new Double();
        let dst_Floating_Double: Floating = src_Double2 as Floating;

        // 到 Comparable 的拓宽转换
        let src_Byte_Comp: Byte = new Byte();
        let dst_Comp_Byte: Comparable<Byte> = src_Byte_Comp as Comparable<Byte>;

        let src_Char_Comp: Char = new Char();
        let dst_Comp_Char: Comparable<Char> = src_Char_Comp as Comparable<Char>;
  if(src_Double !== dst_Object){
        console.info(`${TAG} Task execution failed: src_Double: ${src_Double}`);
        throw new Error('src_Double check failed, expected dst_Object');
      }

  if(src_Byte !== dst_Integral_Byte as Byte){
        console.info(`${TAG} Task execution failed: src_Byte: ${src_Byte}`);
        throw new Error('src_Byte check failed, expected dst_Integral_Byte as Byte');
      }

  if(src_Short !== dst_Integral_Short as Short){
        console.info(`${TAG} Task execution failed: src_Short: ${src_Short}`);
        throw new Error('src_Short check failed, expected dst_Integral_Short as Short');
      }

  if(src_Int !== dst_Integral_Int as Int){
        console.info(`${TAG} Task execution failed: src_Int: ${src_Int}`);
        throw new Error('src_Int check failed, expected dst_Integral_Int as Int');
      }

  if(src_Long !== dst_Integral_Long as Long){
        console.info(`${TAG} Task execution failed: src_Long: ${src_Long}`);
        throw new Error('src_Long check failed, expected dst_Integral_Long as Long');
      }

  if(src_Float !== dst_Floating_Float as Float){
        console.info(`${TAG} Task execution failed: src_Float: ${src_Float}`);
        throw new Error('src_Float check failed, expected dst_Floating_Float as Float');
      }

  if(src_Double2 !== dst_Floating_Double as Double){
        console.info(`${TAG} Task execution failed: src_Double2: ${src_Double2}`);
        throw new Error('src_Double2 check failed, expected dst_Floating_Double as Double');
      }

  if(src_Byte_Comp !== dst_Comp_Byte as Byte){
        console.info(`${TAG} Task execution failed: src_Byte_Comp: ${src_Byte_Comp}`);
        throw new Error('src_Byte_Comp check failed, expected dst_Comp_Byte as Byte');
      }

  if(src_Char_Comp !== dst_Comp_Char as Char){
        console.info(`${TAG} Task execution failed: src_Char_Comp: ${src_Char_Comp}`);
        throw new Error('src_Char_Comp check failed, expected dst_Comp_Char as Char');
      }
}

export function testAssignmentLikeContexts0120(){
  const TAG = 'testAssignmentLikeContexts0120';
  let src_Func: () => void = () => { return; };
        let dst_Func_Object: Object = src_Func as Object;

        let src_FuncArray: (() => void)[] = [];
        let dst_FuncArray_Object: Object = src_FuncArray as Object;
  if(src_Func !== dst_Func_Object){
        console.info(`${TAG} Task execution failed: src_Func: ${src_Func}`);
        throw new Error('src_Func check failed, expected dst_Func_Object');
      }

  if(src_FuncArray !== dst_FuncArray_Object){
        console.info(`${TAG} Task execution failed: src_FuncArray: ${src_FuncArray}`);
        throw new Error('src_FuncArray check failed, expected dst_FuncArray_Object');
      }
}

export function testAssignmentLikeContexts0121(){
  const TAG = 'testAssignmentLikeContexts0121';
  let src_Enum: Color = Color.Red;
        let dst_Enum_Object: Object = src_Enum as Object;

        let src_EnumArray: Color[] = [Color.Red, Color.Blue];
        let dst_EnumArray_Object: Object = src_EnumArray as Object;
  if(src_Enum !== dst_Enum_Object){
        console.info(`${TAG} Task execution failed: src_Enum: ${src_Enum}`);
        throw new Error('src_Enum check failed, expected dst_Enum_Object');
      }

  if(src_EnumArray !== dst_EnumArray_Object){
        console.info(`${TAG} Task execution failed: src_EnumArray: ${src_EnumArray}`);
        throw new Error('src_EnumArray check failed, expected dst_EnumArray_Object');
      }
}

export function testAssignmentLikeContexts0122(){
  const TAG = 'testAssignmentLikeContexts0122';
  let src_Interface: I = new A44();
        let dst_Interface_Object: Object = src_Interface as Object;
  if(src_Interface !== dst_Interface_Object){
        console.info(`${TAG} Task execution failed: src_Interface: ${src_Interface}`);
        throw new Error('src_Interface check failed, expected dst_Interface_Object');
      }
}

export function testAssignmentLikeContexts0123(){
  const TAG = 'testAssignmentLikeContexts0123';
  let src: ((a: Double) => double)[][]|null = null;
        let dst: Object[]|null = src as Object[]|null;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0124(){
  const TAG = 'testAssignmentLikeContexts0124';
  let src: C<I> = new C<I>();
        let dst: B2<I> = src as B2<I>;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0125(){
  const TAG = 'testAssignmentLikeContexts0125';
  let src: C1<A> = new C1<A>();
        let dst: C1<A> = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0126(){
  const TAG = 'testAssignmentLikeContexts0126';
  let src: Func|null = (x: int, y: string) => new Boolean(x > 0);
        let dst: Func|null = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0127(){
  const TAG = 'testAssignmentLikeContexts0127';
  let src: C3<A45> = new C3<A45>();
        let dst: B2<A45> = src as B2<A45>;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0128(){
  const TAG = 'testAssignmentLikeContexts0128';
  let src: B2<A45>[] = [new B2<A45>(), new B2<A45>()];
        let dst: B2<A45>[] = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }

  if(src.length !== dst.length){
        console.info(`${TAG} Task execution failed: src.length: ${src.length}`);
        throw new Error('src.length check failed, expected dst.length');
      }

  if(src[0] !== dst[0]){
        console.info(`${TAG} Task execution failed: src[0]: ${src[0]}`);
        throw new Error('src[0] check failed, expected dst[0]');
      }
}

export function testAssignmentLikeContexts0129(){
  const TAG = 'testAssignmentLikeContexts0129';
  let res1: byte = foo<Byte>(new Byte(1 as byte));

        let res2: byte = foo<Byte>(new Byte(-128 as byte));
  if(res1 !== 1){
        console.info(`${TAG} Task execution failed: res1: ${res1}`);
        throw new Error('res1 check failed, expected 1');
      }

  if(res2 !== -128){
        console.info(`${TAG} Task execution failed: res2: ${res2}`);
        throw new Error('res2 check failed, expected -128');
      }
}

export function testAssignmentLikeContexts0130(){
  const TAG = 'testAssignmentLikeContexts0130';
  let res1: short = foo1<Short>(new Short(1));

        let res2: short = foo1<Short>(new Short(Short.MAX_VALUE));
  if(res1 !== 1){
        console.info(`${TAG} Task execution failed: res1: ${res1}`);
        throw new Error('res1 check failed, expected 1');
      }

  if(res2 !== 32767){
        console.info(`${TAG} Task execution failed: res2: ${res2}`);
        throw new Error('res2 check failed, expected 32767');
      }
}

export function testAssignmentLikeContexts0131(){
  const TAG = 'testAssignmentLikeContexts0131';
  let res1: int = foo2<Int>(new Int(-1));

        let res2: int = foo2<Int>(new Int(Int.MAX_VALUE));
  if(res1 !== -1){
        console.info(`${TAG} Task execution failed: res1: ${res1}`);
        throw new Error('res1 check failed, expected -1');
      }

  if(res2 !== Int.MAX_VALUE){
        console.info(`${TAG} Task execution failed: res2: ${res2}`);
        throw new Error('res2 check failed, expected Int.MAX_VALUE');
      }
}

export function testAssignmentLikeContexts0132(){
  const TAG = 'testAssignmentLikeContexts0132';
  let res1: long = foo3<Long>(new Long(Long.MIN_VALUE));

        let res2: long = foo3<Long>(new Long(Long.MAX_VALUE));
  if(res1 !== Long.MIN_VALUE){
        console.info(`${TAG} Task execution failed: res1: ${res1}`);
        throw new Error('res1 check failed, expected Long.MIN_VALUE');
      }

  if(res2 !== Long.MAX_VALUE){
        console.info(`${TAG} Task execution failed: res2: ${res2}`);
        throw new Error('res2 check failed, expected Long.MAX_VALUE');
      }
}

export function testAssignmentLikeContexts0133(){
  const TAG = 'testAssignmentLikeContexts0133';
  let src_1: boolean = true;
        let dst_1: Object = src_1;

        let src_2: boolean = false;
        let dst_2: Object = src_2;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0134(){
  const TAG = 'testAssignmentLikeContexts0134';
  let src_1: byte = -128 as byte;
        let dst_1: Integral = src_1 as Integral;

        let src_2: byte = 0 as byte;
        let dst_2: Integral = src_2 as Integral;

        let src_3: byte = 127 as byte;
        let dst_3: Integral = src_3 as Integral;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }

  if(dst_3 === null){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 should not be null');
      }
}

export function testAssignmentLikeContexts0135(){
  const TAG = 'testAssignmentLikeContexts0135';
  let src_1: char = c'\u0000';
        let dst_1: Object = src_1;

        let src_2: char = c'X';
        let dst_2: Object = src_2;

        let src_3: char = c'\uffff';
        let dst_3: Object = src_3;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }

  if(dst_3 === null){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 should not be null');
      }
}

export function testAssignmentLikeContexts0136(){
  const TAG = 'testAssignmentLikeContexts0136';
  let src_1: short = Short.MIN_VALUE;
        let dst_1: Object = src_1;

        let src_2: short = (255).toShort();
        let dst_2: Object = src_2;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0137(){
  const TAG = 'testAssignmentLikeContexts0137';
  let src_1: int = 127;
        let dst_1: Integral = src_1 as Integral;

        let src_2: int = 32767;
        let dst_2: Integral = src_2 as Integral;

        let src_3: int = Int.MAX_VALUE;
        let dst_3: Integral = src_3 as Integral;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }

  if(dst_3 === null){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 should not be null');
      }
}

export function testAssignmentLikeContexts0138(){
  const TAG = 'testAssignmentLikeContexts0138';
  let src_1: long = Long.MIN_VALUE;
        let dst_1: Object = src_1;

        let src_2: long = (9223372036854775807).toLong();
        let dst_2: Object = src_2;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0139(){
  const TAG = 'testAssignmentLikeContexts0139';
  let src_1: float = 1.401298464324817e-45f;
        let dst_1: Object = src_1;

        let src_2: float = Float.MAX_VALUE;
        let dst_2: Object = src_2;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0140(){
  const TAG = 'testAssignmentLikeContexts0140';
  let src_1: double = -1.401298464324817e-45;
        let dst_1: Object = src_1;

        let src_2: double = Double.MAX_VALUE;
        let dst_2: Object = src_2;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0141(){
  const TAG = 'testAssignmentLikeContexts0141';
  let param: Short = new Short(32767);
        let obj: A47 = new A47(param);
        obj.foo(param);
  if(obj.fld !== 32767){
        console.info(`${TAG} Task execution failed: obj.fld: ${obj.fld}`);
        throw new Error('obj.fld check failed, expected 32767');
      }
}

export function testAssignmentLikeContexts0142(){
  const TAG = 'testAssignmentLikeContexts0142';
  let param: Int = new Int(Int.MAX_VALUE);
        let obj: A48 = new A48(param);
        obj.foo(param);
  if(obj.fld !== Int.MAX_VALUE){
        console.info(`${TAG} Task execution failed: obj.fld: ${obj.fld}`);
        throw new Error('obj.fld check failed, expected Int.MAX_VALUE');
      }
}

export function testAssignmentLikeContexts0143(){
  const TAG = 'testAssignmentLikeContexts0143';
  let param: Long = new Long(Long.MAX_VALUE);
        let obj: A49 = new A49(param);
        obj.foo(param);
  if(obj.fld !== Long.MAX_VALUE){
        console.info(`${TAG} Task execution failed: obj.fld: ${obj.fld}`);
        throw new Error('obj.fld check failed, expected Long.MAX_VALUE');
      }
}

export function testAssignmentLikeContexts0144(){
  const TAG = 'testAssignmentLikeContexts0144';
  let src_1: float = 0.0f;
        let dst_1: Floating = src_1 as Floating;

        let src_2: float = Float.MIN_VALUE;
        let dst_2: Floating = src_2 as Floating;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0145(){
  const TAG = 'testAssignmentLikeContexts0145';
  let src_1: double = 0.0;
        let dst_1: Floating = src_1 as Floating;

        let src_2: double = Double.MAX_VALUE;
        let dst_2: Floating = src_2 as Floating;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0146(){
  const TAG = 'testAssignmentLikeContexts0146';
  let param: byte = 64 as byte;
  if(param as Integral === null){
        console.info(`${TAG} Task execution failed: param as Integral: ${param as Integral}`);
        throw new Error('param as Integral should not be null');
      }
}

export function testAssignmentLikeContexts0147(){
  const TAG = 'testAssignmentLikeContexts0147';
  let param: char = c'\u767D'; // 字符 '白'
        foo5(param);
  if(param === null){
        console.info(`${TAG} Task execution failed: param: ${param}`);
        throw new Error('param should not be null');
      }
}

export function testAssignmentLikeContexts0148(){
  const TAG = 'testAssignmentLikeContexts0148';
  let src: int = 300;
        let dst: byte = src.toByte();
  if(dst !== 44){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected 44');
      }
}
