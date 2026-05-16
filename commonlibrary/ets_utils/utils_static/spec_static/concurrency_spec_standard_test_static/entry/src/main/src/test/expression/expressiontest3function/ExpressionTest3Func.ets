'use static'

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


function encode(a: number, b: number): number {
  return (a << 4) | (b & 0x0F);
}

interface GeneratedTypeLiteralInterface_1 {
  a: number;
  b: number;
}

function decode(value: number): GeneratedTypeLiteralInterface_1 {
  return {
    a: value >> 4,
    b: value & 0x0F
  };
}

interface GeneratedTypeLiteralInterface_2 {
  name?: string;
}

function innerStrFunc(str: string): string {
  return "Inner: " + str;
}

function outerStrFunc(str: string): string {
  return innerStrFunc("Outer: " + str);
}

interface GeneratedTypeLiteralInterface_3 {
  text?: string;
}

function getGreeting(): string {
  return "Hello";
}

function getName(): string {
  return "Jane";
}


class BitProcessor1 {
  process(value: number): number {
    return value ^ 0x0F;
  }
}

class Flags2 {
  value: number = 0;

  setFlag(flag: number): void {
    this.value |= flag;
  }

  clearFlag(flag: number): void {
    this.value &= ~flag;
  }

  hasFlag(flag: number): boolean {
    return (this.value & flag) !== 0;
  }
}

interface Info4 {
  name?: string;
}

interface Data4 {
  info?: Info4;
}

export function ExpressionTest0321() {
  const TAG = 'ExpressionTest0321';
  const a: number = 10;
  const b: number = 2;
  const result: boolean = (a >> b) === (a / (2**b));
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0322() {
  const TAG = 'ExpressionTest0322';
  const a: number = -10;
  const b: number = 2;
  const result: boolean = (a >> b) !== (a / (2**b));
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0323() {
  const TAG = 'ExpressionTest0323';
  const a: number = 15;
  const b: number = 4;
  const result: boolean = (a & b) > (a ^ b);
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0324() {
  const TAG = 'ExpressionTest0324';
  const a: number = -15;
  const b: number = 4;
  const result: boolean = (a & b) < (a ^ b);
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0325() {
  const TAG = 'ExpressionTest0325';
  const a: number = 10;
  const b: number = 5;
  const result: boolean = (a & 1) === 0 && (b & 1) !== 0;
  // a is even (10 & 1 = 0), b is odd (5 & 1 = 1)
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0326() {
  const TAG = 'ExpressionTest0326';
  const a: number = 10;
  const b: number = 5;
  const result: boolean = (a & 8) !== 0 || (b & 8) !== 0;
  // a has 8's bit set (1010), b does not (0101)
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0327() {
  const TAG = 'ExpressionTest0327';
  const a: number = 0;
  const result: boolean = !(a | 0);
  // a | 0 is 0, which is falsy, so !0 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0328() {
  const TAG = 'ExpressionTest0328';
  const a: number = 12; // 1100
  const result: string = (a & 0x0F) === a ? "8-bit" : "More than 8 bits";
  // 12 in binary is 1100, which fits in 4 bits
  if (result !== "8-bit") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 8-bit');
  }
}

export function ExpressionTest0329() {
  const TAG = 'ExpressionTest0329';
  let result: number = 0;
  let i: number, mask: number;
  for (i = 1, mask = 1; i <= 4; i++, mask <<= 1) {
    result += i * mask;
  }
  // 1*1 + 2*2 + 3*4 + 4*8 = 1 + 4 + 12 + 32 = 49
  if (result !== 49) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 49');
  }
}

export function ExpressionTest0330() {
  const TAG = 'ExpressionTest0330';
  const a: number = 10;
  const b: number = 3;
  const result: number = +(a ^ b);
  const expected: number = 9;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0331() {
  const TAG = 'ExpressionTest0331';
  const a: number = 10;
  const b: number = 3;
  const result: number = -(a & b);
  const expected: number = -2;
  if (result !== expected) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected expected');
  }
}

export function ExpressionTest0332() {
  const TAG = 'ExpressionTest0332';
  let a: number = 5; // 101
  const result: number = ++a & 0x0F;
  // a becomes 6 (110), 6 & 15 = 6
  if (result !== 6) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 6');
  }
}

export function ExpressionTest0333() {
  const TAG = 'ExpressionTest0333';
  let a: number = 5; // 101
  const result: number = a++ & 0x0F;
  // Uses 5 before incrementing, 5 & 15 = 5
  if (result !== 5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5');
  }
}

export function ExpressionTest0334() {
  const TAG = 'ExpressionTest0334';
  let a: number = 6; // 110
  const result: number = --a | 0x10;
  // a becomes 5 (101), 5 | 16 = 21
  if (result !== 21) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 21');
  }
}

export function ExpressionTest0335() {
  const TAG = 'ExpressionTest0335';
  let a: number = 6; // 110
  const result: number = a-- | 0x10;
  // Uses 6 before decrementing, 6 | 16 = 22
  if (result !== 22) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 22');
  }
}

export function ExpressionTest0339() {
  const TAG = 'ExpressionTest0339';
  const a: number = 10;
  const b: number = 3;
  const c: number = 2;
  const result1: number = a + b & c;
  const result2: number = a + (b & c);
  if (result1 !== 0) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 0');
  }

  if (result2 !== 12) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 12');
  }
}

export function ExpressionTest0340() {
  const TAG = 'ExpressionTest0340';
  const a: number = 10;
  const b: number = 2;
  const c: number = 3;
  const result: boolean = a >> b > c;
  // 10 >> 2 = 2, 2 > 3 is false
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0341() {
  const TAG = 'ExpressionTest0341';
  let processor: BitProcessor1 | null = new BitProcessor1();
  const result1: number | undefined = processor?.process(10);
  processor = null;
  // 10 ^ 15 = 5
  if (result1 !== 5) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 5');
  }
}

export function ExpressionTest0342() {
  const TAG = 'ExpressionTest0342';
  const encoded: number = encode(5, 10);
  const decoded = decode(encoded);
  if (encoded !== 0x5A) {
    console.info(`${TAG} Task execution failed: encoded: ${encoded}`);
    throw new Error('encoded check failed, expected 0x5A');
  }

  if (decoded.a !== 5) {
    console.info(`${TAG} Task execution failed: decoded.a: ${decoded.a}`);
    throw new Error('decoded.a check failed, expected 5');
  }

  if (decoded.b !== 10) {
    console.info(`${TAG} Task execution failed: decoded.b: ${decoded.b}`);
    throw new Error('decoded.b check failed, expected 10');
  }
}

export function ExpressionTest0343() {
  const TAG = 'ExpressionTest0343';
  let checkBit: (value: number, bit: number) => boolean = (value: number, bit: number): boolean => {
    return (value & (1 << bit)) !== 0;
  };
  const num: number = 0b1010; // 10 in decimal
  if (checkBit(num, 0)) {
    console.info(`${TAG} Task execution failed: checkBit(num, 0): ${checkBit(num, 0)}`);
    throw new Error('checkBit(num, 0) is not false');
  }

  if (!checkBit(num, 1)) {
    console.info(`${TAG} Task execution failed: checkBit(num, 1): ${checkBit(num, 1)}`);
    throw new Error('checkBit(num, 1) is not true');
  }

  if (checkBit(num, 2)) {
    console.info(`${TAG} Task execution failed: checkBit(num, 2): ${checkBit(num, 2)}`);
    throw new Error('checkBit(num, 2) is not false');
  }

  if (!checkBit(num, 3)) {
    console.info(`${TAG} Task execution failed: checkBit(num, 3): ${checkBit(num, 3)}`);
    throw new Error('checkBit(num, 3) is not true');
  }
}

export function ExpressionTest0344() {
  const TAG = 'ExpressionTest0344';
  const base: number = 1;
  const mask: number[] = [
    base << 0,
    base << 1,
    base << 2,
    base << 3
  ];
  if (mask[0] !== 1) {
    console.info(`${TAG} Task execution failed: mask[0]: ${mask[0]}`);
    throw new Error('mask[0] check failed, expected 1');
  }

  if (mask[1] !== 2) {
    console.info(`${TAG} Task execution failed: mask[1]: ${mask[1]}`);
    throw new Error('mask[1] check failed, expected 2');
  }

  if (mask[2] !== 4) {
    console.info(`${TAG} Task execution failed: mask[2]: ${mask[2]}`);
    throw new Error('mask[2] check failed, expected 4');
  }

  if (mask[3] !== 8) {
    console.info(`${TAG} Task execution failed: mask[3]: ${mask[3]}`);
    throw new Error('mask[3] check failed, expected 8');
  }
}

export function ExpressionTest0345() {
  const TAG = 'ExpressionTest0345';
  const flags: Flags2 = new Flags2();
  const FLAG_A: number = 1 << 0;
  const FLAG_B: number = 1 << 1;

  flags.setFlag(FLAG_A);


  if (!flags.hasFlag(FLAG_A)) {
    console.info(`${TAG} Task execution failed: flags.hasFlag(FLAG_A): ${flags.hasFlag(FLAG_A)}`);
    throw new Error('flags.hasFlag(FLAG_A) is not true');
  }

  if (flags.hasFlag(FLAG_B)) {
    console.info(`${TAG} Task execution failed: flags.hasFlag(FLAG_B): ${flags.hasFlag(FLAG_B)}`);
    throw new Error('flags.hasFlag(FLAG_B) is not false');
  }
  flags.setFlag(FLAG_B);
  if (!flags.hasFlag(FLAG_A)) {
    console.info(`${TAG} Task execution failed: flags.hasFlag(FLAG_A): ${flags.hasFlag(FLAG_A)}`);
    throw new Error('flags.hasFlag(FLAG_A) is not true');
  }

  if (!flags.hasFlag(FLAG_B)) {
    console.info(`${TAG} Task execution failed: flags.hasFlag(FLAG_B): ${flags.hasFlag(FLAG_B)}`);
    throw new Error('flags.hasFlag(FLAG_B) is not true');
  }

  flags.clearFlag(FLAG_A);
  if (flags.hasFlag(FLAG_A)) {
    console.info(`${TAG} Task execution failed: flags.hasFlag(FLAG_A): ${flags.hasFlag(FLAG_A)}`);
    throw new Error('flags.hasFlag(FLAG_A) is not false');
  }

  if (!flags.hasFlag(FLAG_B)) {
    console.info(`${TAG} Task execution failed: flags.hasFlag(FLAG_B): ${flags.hasFlag(FLAG_B)}`);
    throw new Error('flags.hasFlag(FLAG_B) is not true');
  }
}

export function ExpressionTest0346() {
  const TAG = 'ExpressionTest0346';
  const a: number = 0b1010;
  const b: number = 0b0110;
  const c: number = 0b1001;

  // Nested bitwise operations
  const result: number = (a & b) | ~(c << 1);
  // a & b = 0b0010
  // c << 1 = 0b10010
  // ~(c << 1) = all bits except those in 0b10010 are set
  // (a & b) | ~(c << 1) = all bits set except those in 0b10000
  if (result !== ~0b10000) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected ~0b10000');
  }
}

export function ExpressionTest0347() {
  const TAG = 'ExpressionTest0347';
  const min32: int = -2147483648; // 0b10000000000000000000000000000000
  const result1: int = min32 >> 1; // Sign-preserving shift
  const result2: int = min32 << 1; // Overflow
  const result3: int = ~min32; // Bitwise NOT

  if (result1 !== -1073741824) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -1073741824');
  }

  if (result2 !== 0) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 0');
  }

  if (result3 !== 2147483647) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected 2147483647');
  }
}

export function ExpressionTest0348() {
  const TAG = 'ExpressionTest0348';
  const max32: int = 2147483647; // 0b01111111111111111111111111111111
  const result1: int = max32 >> 1;
  const result2: int = max32 << 1;
  const result3: int = ~max32;

  if (result1 !== 1073741823) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 1073741823');
  }

  if (result2 !== -2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -2');
  }

  if (result3 !== -2147483648) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected -2147483648');
  }
}

export function ExpressionTest0349() {
  const TAG = 'ExpressionTest0349';
  let value: number = 1; // 0b1
  let count: number = 0;
  while ((value & 0x80) === 0) { // While 8th bit is not set
    value <<= 1;
    count++;
  }
  // Should loop 7 times: 1 → 2 → 4 → 8 → 16 → 32 → 64 → 128
  if (count !== 7) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 7');
  }

  if (value !== 128) {
    console.info(`${TAG} Task execution failed: value: ${value}`);
    throw new Error('value check failed, expected 128');
  }
}

export function ExpressionTest0350() {
  const TAG = 'ExpressionTest0350';
  let result: number = 0;
  let mask: number, shift: number;
  for (mask = 1, shift = 0; mask <= 0x80; mask <<= 1, shift++) {
    if (shift % 2 === 0) { // Only use even shifts
      result |= mask;
    }
  }
  if (result !== 85) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 85');
  }
}

export function ExpressionTest0351() {
  const TAG = 'ExpressionTest0351';
  const str1: string = "Hello";
  const str2: string = " World";
  const result: string = str1 + str2;
  if (result !== "Hello World") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello World');
  }
}

export function ExpressionTest0352() {
  const TAG = 'ExpressionTest0352';
  const str1: string = "a";
  const str2: string = "b";
  const str3: string = "c";
  const result: string = str1 + str2 + str3;
  if (result !== "abc") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected abc');
  }
}

export function ExpressionTest0353() {
  const TAG = 'ExpressionTest0353';
  let str: string = "Hello";
  str += " there";
  if (str !== "Hello there") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected Hello there');
  }
}

export function ExpressionTest0354() {
  const TAG = 'ExpressionTest0354';
  const num: number = 42;
  const strNum: string = "42";
  // Convert number to string first to ensure same type operation
  const result: string = String(num) + strNum;
  if (result !== "4242") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 4242');
  }
}

export function ExpressionTest0355() {
  const TAG = 'ExpressionTest0355';
  const str: string = "hello";
  const len: number = str.length;
  const result: boolean = len > 3;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0356() {
  const TAG = 'ExpressionTest0356';
  const str1: string = "test";
  const str2: string = "test";
  const str3: string = "Test";
  if (!(str1 === str2)) {
    console.info(`${TAG} Task execution failed: str1 === str2: ${str1 === str2}`);
    throw new Error('str1 === str2 is not true');
  }

  if (str1 === str3) {
    console.info(`${TAG} Task execution failed: str1 === str3: ${str1 === str3}`);
    throw new Error('str1 === str3 is not false');
  }
}

export function ExpressionTest0357() {
  const TAG = 'ExpressionTest0357';
  const str1: string = "apple";
  const str2: string = "banana";
  const str3: string = "apple";
  if (!(str1 !== str2)) {
    console.info(`${TAG} Task execution failed: str1 !== str2: ${str1 !== str2}`);
    throw new Error('str1 !== str2 is not true');
  }

  if (str1 !== str3) {
    console.info(`${TAG} Task execution failed: str1 !== str3: ${str1 !== str3}`);
    throw new Error('str1 !== str3 is not false');
  }
}

export function ExpressionTest0358() {
  const TAG = 'ExpressionTest0358';
  const str1: string = "orange";
  const str2: string = "apple";
  const result: boolean = str1 > str2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0359() {
  const TAG = 'ExpressionTest0359';
  const str1: string = "cat";
  const str2: string = "dog";
  const result: boolean = str1 < str2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0360() {
  const TAG = 'ExpressionTest0360';
  const str1: string = "grape";
  const str2: string = "grape";
  const str3: string = "grapevines";
  if (!(str1 >= str2)) {
    console.info(`${TAG} Task execution failed: str1 >= str2: ${str1 >= str2}`);
    throw new Error('str1 >= str2 is not true');
  }

  if (!(str3 >= str1)) {
    console.info(`${TAG} Task execution failed: str3 >= str1: ${str3 >= str1}`);
    throw new Error('str3 >= str1 is not true');
  }
}

export function ExpressionTest0361() {
  const TAG = 'ExpressionTest0361';
  const str1: string = "berry";
  const str2: string = "berry";
  const str3: string = "apple";
  if (!(str1 <= str2)) {
    console.info(`${TAG} Task execution failed: str1 <= str2: ${str1 <= str2}`);
    throw new Error('str1 <= str2 is not true');
  }

  if (!(str3 <= str1)) {
    console.info(`${TAG} Task execution failed: str3 <= str1: ${str3 <= str1}`);
    throw new Error('str3 <= str1 is not true');
  }
}

export function ExpressionTest0362() {
  const TAG = 'ExpressionTest0362';
  const str: string = "hello world";
  const result: boolean = str.length > 5 && str.startsWith("hello");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0363() {
  const TAG = 'ExpressionTest0363';
  const str: string = "goodbye";
  const result: boolean = str.endsWith("hello") || str.length === 7;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0364() {
  const TAG = 'ExpressionTest0364';
  const str: string = "test";
  const result: string = str.length > 5 ? "long" : "short";
  if (result !== "short") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected short');
  }
}

export function ExpressionTest0365() {
  const TAG = 'ExpressionTest0365';
  let formatGreeting: (title: string, name: string) => string = (title: string, name: string): string => {
    return "Hello, " + title + " " + name;
  };
  const result: string = formatGreeting("Dr", "Smith");
  if (result !== "Hello, Dr Smith") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello, Dr Smith');
  }
}

export function ExpressionTest0366() {
  const TAG = 'ExpressionTest0366';
  let getStringLength: (str: string) => number = (str: string): number => {
    return str.length;
  };
  const result: number = getStringLength("example") * 2;
  if (result !== 14) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 14');
  }
}

export function ExpressionTest0367() {
  const TAG = 'ExpressionTest0367';
  const isMorning: boolean = true;
  const greeting: string = "Good " + (isMorning ? "morning" : "evening");
  if (greeting !== "Good morning") {
    console.info(`${TAG} Task execution failed: greeting: ${greeting}`);
    throw new Error('greeting check failed, expected Good morning');
  }
}

export function ExpressionTest0368() {
  const TAG = 'ExpressionTest0368';
  let result: string = "";
  let i: number, char1: string;
  for (i = 0, char1 = "a"; i < 3; i++, char1 = String.fromCharCode(char1.charCodeAt(0).toInt() + 1)) {
    result += char1;
  }
  if (result !== "abc") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected abc');
  }
}

export function ExpressionTest0369() {
  const TAG = 'ExpressionTest0369';
  const str1: string = "hello";
  const str2: string = "";
  if (typeof str1 !== "string") {
    console.info(`${TAG} Task execution failed: typeof str1: ${typeof str1}`);
    throw new Error('typeof str1 check failed, expected string');
  }

  if (typeof str2 !== "string") {
    console.info(`${TAG} Task execution failed: typeof str2: ${typeof str2}`);
    throw new Error('typeof str2 check failed, expected string');
  }
}

export function ExpressionTest0370() {
  const TAG = 'ExpressionTest0370';
  const name: string = "Alice";
  const age: number = 30;
  const result: string = `${name} is ${age} years old`;
  if (result !== "Alice is 30 years old") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Alice is 30 years old');
  }
}

export function ExpressionTest0371() {
  const TAG = 'ExpressionTest0371';
  const str: string = "abcdef";
  const index: int = 2;
  const result: string = str[index + 1];
  if (result !== "d") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected d');
  }
}

export function ExpressionTest0372() {
  const TAG = 'ExpressionTest0372';
  let count: number = 1;
  const result: string = "Item " + count++ + ", Item " + count++;
  if (result !== "Item 1, Item 2") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Item 1, Item 2');
  }
}

export function ExpressionTest0373() {
  const TAG = 'ExpressionTest0373';
  const str: string = "hello world";
  const start: int = 6;
  const length: int = 5;
  const result: string = str.substring(start, start + length);
  if (result !== "world") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected world');
  }
}

export function ExpressionTest0374() {
  const TAG = 'ExpressionTest0374';
  const str1: string = "not empty";
  const str2: string = "";
  if (!str1) {
    console.info(`${TAG} Task execution failed: !str1: ${!str1}`);
    throw new Error('!str1 is not false');
  }

  if (!!str2) {
    console.info(`${TAG} Task execution failed: !str2: ${!str2}`);
    throw new Error('!str2 is not true');
  }
}

export function ExpressionTest0375() {
  const TAG = 'ExpressionTest0375';
  let result: string = "";
  const parts: string[] = ["a", "b", "c"];
  for (let i = 0; i < parts.length; i++) {
    result += parts[i];
  }
  if (result !== "abc") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected abc');
  }
}

export function ExpressionTest0376() {
  const TAG = 'ExpressionTest0376';
  const str: string = "javascript";
  const result: boolean = str.startsWith("java") && str.length > 5;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0377() {
  const TAG = 'ExpressionTest0377';
  const str1: string = "hello";
  const str2: string = "world";
  const result: number = str1.length + str2.length;
  if (result !== 10) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10');
  }
}

export function ExpressionTest0378() {
  const TAG = 'ExpressionTest0378';
  let getFirstName: () => string = (): string => {
    return "John";
  };
  let getLastName: () => string = (): string => {
    return "Doe";
  };
  const result: string = getFirstName() + " " + getLastName();
  if (result !== "John Doe") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected John Doe');
  }
}

export function ExpressionTest0379() {
  const TAG = 'ExpressionTest0379';
  const str: string = "typescript";
  const result: string = str.includes("type") ? "Type found" : "Type not found";
  if (result !== "Type found") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Type found');
  }
}

export function ExpressionTest0380() {
  const TAG = 'ExpressionTest0380';
  const name: string | null = null;
  const defaultName: string = "Guest";
  const result: string = "Hello, " + (name ?? defaultName);
  if (result !== "Hello, Guest") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello, Guest');
  }
}

export function ExpressionTest0381() {
  const TAG = 'ExpressionTest0381';
  // Convert strings to their numeric representations first
  const str1: string = "10";
  const str2: string = "20";
  const num1: number = Number(str1);
  const num2: number = Number(str2);
  const result: number = num1 & num2;
  if (result !== 0) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0');
  }
}

export function ExpressionTest0382() {
  const TAG = 'ExpressionTest0382';
  const str: string = "example";
  let index: int = str.length;
  const result: string = str[--index];
  if (result !== "e") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected e');
  }
}

export function ExpressionTest0384() {
  const TAG = 'ExpressionTest0384';
  const data: GeneratedTypeLiteralInterface_2 = {};
  const result1: string | undefined = data.name?.toUpperCase();
  data.name = "test";
  const result2: string | undefined = data.name?.toUpperCase();
  if (result1 !== undefined) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not undefined');
  }

  if (result2 !== "TEST") {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected TEST');
  }
}

export function ExpressionTest0385() {
  const TAG = 'ExpressionTest0385';
  const str: string = "abcdefgh";
  const result: number = str.length % 3;
  if (result !== 2) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 2');
  }
}

export function ExpressionTest0386() {
  const TAG = 'ExpressionTest0386';
  const base: number = 2;
  const exponent: number = 3;
  const result: string = "Result: " + String(base**exponent);
  if (result !== "Result: 8") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Result: 8');
  }
}

export function ExpressionTest0387() {
  const TAG = 'ExpressionTest0387';
  const str1: string = "apple";
  const str2: string = "app";
  const str3: string = "apricot";
  const result: boolean = str1 > str2 && str1 < str3;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0388() {
  const TAG = 'ExpressionTest0388';
  const a: string = "Hello";
  const b: string = "World";
  const c: string = "!";
  const result: string = a + " " + (b + c);
  if (result !== "Hello World!") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello World!');
  }
}

export function ExpressionTest0389() {
  const TAG = 'ExpressionTest0389';
  const str: string = "abcdefghij";
  const start: int = 2;
  const end: int = 7;
  const result: string = str.slice(start, end);
  if (result !== "cdefg") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected cdefg');
  }
}

export function ExpressionTest0390() {
  const TAG = 'ExpressionTest0390';
  const num: number = 42;
  // Convert to string explicitly before concatenation
  const result: string = "Value: " + String(+num);
  if (result !== "Value: 42") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value: 42');
  }
}

export function ExpressionTest0391() {
  const TAG = 'ExpressionTest0391';
  const str: string = "5";
  const num: number = 10;
  // Convert string to number first for same-type comparison
  const result: boolean = -Number(str) > -num;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0392() {
  const TAG = 'ExpressionTest0392';
  const str: string = "hello";
  let result: number = 0;
  result += str.length;
  result *= 2;
  if (result !== 10) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10');
  }
}

export function ExpressionTest0393() {
  const TAG = 'ExpressionTest0393';
  let result: string = "";
  for (let i = 1; i <= 3; i++) {
    result += "Item " + i + " ";
  }
  if (result !== "Item 1 Item 2 Item 3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Item 1 Item 2 Item 3 ');
  }
}

export function ExpressionTest0394() {
  const TAG = 'ExpressionTest0394';
  const str: string = "abcdef";
  const result: boolean = str.length / 2 > 2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0395() {
  const TAG = 'ExpressionTest0395';
  const a: number = 10;
  const b: number = 3;
  // Convert bitwise result to string first
  const result: string = "Result: " + String(a & b);
  if (result !== "Result: 2") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Result: 2');
  }
}

export function ExpressionTest0396() {
  const TAG = 'ExpressionTest0396';
  const str: string = "8";
  const shifted: number = 2 << 2; // 8
  // Convert string to number first
  if (!(Number(str) === shifted)) {
    console.info(`${TAG} Task execution failed: Number(str) === shifted: ${Number(str) === shifted}`);
    throw new Error('Number(str) === shifted is not true');
  }
}

export function ExpressionTest0397() {
  const TAG = 'ExpressionTest0397';
  const a: boolean = true;
  const b: boolean = false;
  // Convert boolean results to strings first
  const result: string = String(a && b) + " " + String(a || b);
  if (result !== "false true") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected false true');
  }
}

export function ExpressionTest0398() {
  const TAG = 'ExpressionTest0398';
  const str: string = "test";
  const result: number = ~str.length;
  if (result !== -5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -5');
  }
}

export function ExpressionTest0399() {
  const TAG = 'ExpressionTest0399';
  const str: string = "abcdefgh";
  const result: string = str[(str.length / 2) - 1];
  if (result !== "d") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected d');
  }
}

export function ExpressionTest0400() {
  const TAG = 'ExpressionTest0400';
  const strings: string[] = ["a", "bb", "ccc", "dddd"];
  let totalLength: int = 0;
  let i: int, current: string;
  let err: Error | undefined;
  try {
    for (i = 0, current = strings[0]; i < strings.length; i++, current = strings[i]) {
      totalLength += current.length;
    }
  } catch (e) {
    err = e;
  }
  if (err && err.name !== "RangeError") {
    console.info(`${TAG} Task execution failed: err.name: ${err.name}`);
    throw new Error('err.name check failed, expected RangeError');
  }
}

export function ExpressionTest0401() {
  const TAG = 'ExpressionTest0401';
  const str1: string = "He said, \"Hello\"";
  const str2: string = "World\n";
  const result: string = str1 + " " + str2;
  if (result !== "He said, \"Hello\" World\n") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected He said, \\"Hello\\" World\\n');
  }
}

export function ExpressionTest0402() {
  const TAG = 'ExpressionTest0402';
  const str1: string = "Café";
  const str2: string = " au lait";
  const result: string = str1 + str2;
  if (result !== "Café au lait") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Café au lait');
  }
}

export function ExpressionTest0403() {
  const TAG = 'ExpressionTest0403';
  const str1: string = "apple";
  const str2: string = "äpple"; // With umlaut
  const result: boolean = str1 < str2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0404() {
  const TAG = 'ExpressionTest0404';
  const str1: string = "Hello";
  const str2: string = "";
  const str3: string = "World";
  const result: string = str1 + str2 + str3;
  if (result !== "HelloWorld") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected HelloWorld');
  }
}

export function ExpressionTest0405() {
  const TAG = 'ExpressionTest0405';
  let str: string = "Test";
  const empty: string = "";
  str += empty;
  if (str !== "Test") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected Test');
  }
}

export function ExpressionTest0406() {
  const TAG = 'ExpressionTest0406';
  const str1: string = "";
  const str2: string = "non-empty";
  if (!(str1.length === 0)) {
    console.info(`${TAG} Task execution failed: str1.length === 0: ${str1.length === 0}`);
    throw new Error('str1.length === 0 is not true');
  }

  if (str2.length === 0) {
    console.info(`${TAG} Task execution failed: str2.length === 0: ${str2.length === 0}`);
    throw new Error('str2.length === 0 is not false');
  }
}

export function ExpressionTest0407() {
  const TAG = 'ExpressionTest0407';
  const str1: string = "hello world";
  const str2: string = "hello  world"; // Extra space
  if (str1 === str2) {
    console.info(`${TAG} Task execution failed: str1 === str2: ${str1 === str2}`);
    throw new Error('str1 === str2 is not false');
  }
}

export function ExpressionTest0408() {
  const TAG = 'ExpressionTest0408';
  const str1: string = "Hello";
  const str2: string = "hello";
  if (str1 > str2) {
    console.info(`${TAG} Task execution failed: str1 > str2: ${str1 > str2}`);
    throw new Error('str1 > str2 is not false');
  }
}

export function ExpressionTest0409() {
  const TAG = 'ExpressionTest0409';
  const str: string = "moderate length";
  const result: boolean = str.length > 5 && str.length < 20;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0410() {
  const TAG = 'ExpressionTest0410';
  const str: string = "password";
  const result: boolean = str.includes("admin") || str.length < 6;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0411() {
  const TAG = 'ExpressionTest0411';
  const str: string = "short";
  const result: string = str.length > 10 ? "long" :
    str.length > 5 ? "medium" : "short";
  if (result !== "short") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected short');
  }
}

export function ExpressionTest0412() {
  const TAG = 'ExpressionTest0412';
  const result: string = outerStrFunc("content");
  if (result !== "Inner: Outer: content") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Inner: Outer: content');
  }
}

export function ExpressionTest0413() {
  const TAG = 'ExpressionTest0413';
  let getString: () => string = (): string => {
    return "comparison";
  };
  const result: boolean = getString() > "compare";
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0414() {
  const TAG = 'ExpressionTest0414';
  const a: number = 5;
  const b: number = 3;
  const result: string = `${a} + ${b} = ${a + b}`;
  if (result !== "5 + 3 = 8") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 + 3 = 8');
  }
}

export function ExpressionTest0415() {
  const TAG = 'ExpressionTest0415';
  let result: string = "";
  let i: int, currentChar: string;
  for (i = 65, currentChar = String.fromCharCode(i); i <= 67; i++, currentChar = String.fromCharCode(i)) {
    result += currentChar;
  }
  if (result !== "ABC") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected ABC');
  }
}

export function ExpressionTest0416() {
  const TAG = 'ExpressionTest0416';
  const strVar: string = "test";
  const result1: string = typeof strVar;
  const result2: string = typeof "literal";
  if (result1 !== "string") {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected string');
  }

  if (result2 !== "string") {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected string');
  }
}

export function ExpressionTest0417() {
  const TAG = 'ExpressionTest0417';
  const str: string = "abcdefghijklmno";
  const offset: int = 3;
  const step: int = 2;
  const result: string = str[offset + step * 2];
  if (result !== "h") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected h');
  }
}

export function ExpressionTest0418() {
  const TAG = 'ExpressionTest0418';
  let count: number = 5;
  const result: string = "Count: " + count++ + ", Next: " + count;
  if (result !== "Count: 5, Next: 6") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Count: 5, Next: 6');
  }
}

export function ExpressionTest0419() {
  const TAG = 'ExpressionTest0419';
  const str: string = "abcdefghij";
  const start: int = 2;
  const length: int = 4;
  const result: string = str.substr(start, length + 1);
  if (result !== "cdefg") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected cdefg');
  }
}

export function ExpressionTest0420() {
  const TAG = 'ExpressionTest0420';
  const str1: string = "hello";
  const str2: string = "world";
  if (!!str1.includes("x")) {
    console.info(`${TAG} Task execution failed: !str1.includes("x"): ${!str1.includes("x")}`);
    throw new Error('!str1.includes("x") is not true');
  }

  if (!str2.startsWith("w")) {
    console.info(`${TAG} Task execution failed: !str2.startsWith("w"): ${!str2.startsWith("w")}`);
    throw new Error('!str2.startsWith("w") is not false');
  }
}

export function ExpressionTest0421() {
  const TAG = 'ExpressionTest0421';
  let result: string = "";
  for (let i = 0; i < 3; i++) {
    result += "[" + i + "]";
  }
  if (result !== "[0][1][2]") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected [0][1][2]');
  }
}

export function ExpressionTest0422() {
  const TAG = 'ExpressionTest0422';
  const str: string = "typescript";
  const result: boolean = (str.length > 5 && str.startsWith("type")) || str.endsWith("script");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0423() {
  const TAG = 'ExpressionTest0423';
  const str1: string = "abc";
  const str2: string = "defgh";
  const result: number = str1.length * str2.length;
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0424() {
  const TAG = 'ExpressionTest0424';
  const result: string = getGreeting() + ", " + getName() + "!";
  if (result !== "Hello, Jane!") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello, Jane!');
  }
}

export function ExpressionTest0425() {
  const TAG = 'ExpressionTest0425';
  const str: string = "apple";
  const result: string = str.length > 6 ? "Very long" :
    str.length > 4 ? "Long" :
      str.length > 2 ? "Medium" : "Short";
  if (result !== "Long") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Long');
  }
}

export function ExpressionTest0426() {
  const TAG = 'ExpressionTest0426';
  const title: string | null = null;
  const defaultTitle: string = "Document";
  const result: string = `${title ?? defaultTitle} - Page 1`;
  if (result !== "Document - Page 1") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Document - Page 1');
  }
}

export function ExpressionTest0427() {
  const TAG = 'ExpressionTest0427';
  const str1: string = "12";
  const str2: string = "5";
  const num1: number = Number(str1);
  const num2: number = Number(str2);
  const result: number = num1 ^ num2;
  if (result !== 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9');
  }
}

export function ExpressionTest0428() {
  const TAG = 'ExpressionTest0428';
  const str: string = "abcdef";
  let index: int = 3;
  const result: string = str[--index] + str[index++];
  if (result !== "cc") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected cc');
  }
}

export function ExpressionTest0430() {
  const TAG = 'ExpressionTest0430';
  const data: GeneratedTypeLiteralInterface_3 = { text: "example" };
  const result1: string | undefined = data.text?.replace("example", "test");
  data.text = undefined;
  if (result1 !== "test") {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected test');
  }
}

export function ExpressionTest0431() {
  const TAG = 'ExpressionTest0431';
  const str: string = "abcdefghijkl";
  const result: number = str.length / 4;
  if (result !== 3) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 3');
  }
}

export function ExpressionTest0432() {
  const TAG = 'ExpressionTest0432';
  const base: number = 3;
  const exponent: number = 3;
  const result: string = `${base} to the power of ${exponent} is ${base**exponent}`;
  if (result !== "3 to the power of 3 is 27") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 3 to the power of 3 is 27');
  }
}

export function ExpressionTest0433() {
  const TAG = 'ExpressionTest0433';
  const str1: string = "apple";
  const str2: string = "app";
  const str3: string = "apricot";
  const result1: boolean = str1 > str2 && str1 < str3;
  const temp: string = str2 && str1;
  const result2: boolean = str1 > temp && temp < str3;
  if (!result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not true');
  }

  if (result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not false');
  }
}

export function ExpressionTest0434() {
  const TAG = 'ExpressionTest0434';
  const a: number = 10;
  const b: number = 20;
  const result: string = `Total: ${a + b}, Average: ${(a + b) / 2}`;
  if (result !== "Total: 30, Average: 15") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Total: 30, Average: 15');
  }
}

export function ExpressionTest0435() {
  const TAG = 'ExpressionTest0435';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const start: int = 0;
  const count: int = 5;
  const result: string = str.substring(start, start + count * 2);
  if (result !== "abcdefghij") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected abcdefghij');
  }
}

export function ExpressionTest0436() {
  const TAG = 'ExpressionTest0436';
  const num: number = 42;
  const result: string = `Value: ${-num}`;
  if (result !== "Value: -42") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value: -42');
  }
}

export function ExpressionTest0437() {
  const TAG = 'ExpressionTest0437';
  const str: string = "100";
  const num: number = 50;
  const result: boolean = Number(str) > -num;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0438() {
  const TAG = 'ExpressionTest0438';
  const str: string = "hello world";
  let result: number = 20;
  result -= str.length;
  if (result !== 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9');
  }
}

export function ExpressionTest0439() {
  const TAG = 'ExpressionTest0439';
  let result: string = "";
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < 2; j++) {
      result += `(${i},${j})`;
    }
  }
  if (result !== "(0,0)(0,1)(1,0)(1,1)") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected (0,0)(0,1)(1,0)(1,1)');
  }
}

export function ExpressionTest0440() {
  const TAG = 'ExpressionTest0440';
  const str: string = "abcdefghij";
  const result: boolean = str.length % 2 === 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0441() {
  const TAG = 'ExpressionTest0441';
  const a: number = 5;
  const result: string = `5 shifted left by 2: ${a << 2}`;
  if (result !== "5 shifted left by 2: 20") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 shifted left by 2: 20');
  }
}

export function ExpressionTest0442() {
  const TAG = 'ExpressionTest0442';
  const str: string = "3";
  const num: number = 3;
  const result: boolean = Number(str) === ~~num; // Double bitwise NOT truncates
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0443() {
  const TAG = 'ExpressionTest0443';
  const a: number = 10;
  const b: number = 20;
  const result: string = `${a} < ${b}: ${a < b}, ${a} > ${b}: ${a > b}`;
  if (result !== "10 < 20: true, 10 > 20: false") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 < 20: true, 10 > 20: false');
  }
}

export function ExpressionTest0444() {
  const TAG = 'ExpressionTest0444';
  const str: string = "hello world";
  const result: number = str.length & 1;
  if (result !== 1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1');
  }
}

export function ExpressionTest0445() {
  const TAG = 'ExpressionTest0445';
  const str: string = "abcdefghij";
  const a: int = 2;
  const b: int = 3;
  const result: string = str[a | b];
  if (result !== "d") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected d');
  }
}

export function ExpressionTest0446() {
  const TAG = 'ExpressionTest0446';
  const a: number = 12;
  const b: number = 5;
  const result: string = `${a} XOR ${b} = ${a ^ b}`;
  if (result !== "12 XOR 5 = 9") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12 XOR 5 = 9');
  }
}

export function ExpressionTest0447() {
  const TAG = 'ExpressionTest0447';
  const str: string = "16";
  const shifted: number = 4 << 2; // 16
  if (!(Number(str) === shifted)) {
    console.info(`${TAG} Task execution failed: Number(str) === shifted: ${Number(str) === shifted}`);
    throw new Error('Number(str) === shifted is not true');
  }
}

export function ExpressionTest0448() {
  const TAG = 'ExpressionTest0448';
  const a: number = 5;
  const b: number = 10;
  const c: number = 15;
  const result: string = `a < b: ${a < b}, b < c: ${b < c}, both: ${a < b && b < c}`;
  if (result !== "a < b: true, b < c: true, both: true") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected a < b: true, b < c: true, both: true');
  }
}

export function ExpressionTest0449() {
  const TAG = 'ExpressionTest0449';
  const str: string = "test";
  const result: boolean = ~str.length < -5;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0450() {
  const TAG = 'ExpressionTest0450';
  const str: string = "reverse me";
  let reversed: string = "";
  let i: int, len: int;
  for (i = str.length - 1, len = str.length; i >= 0; i--, len--) {
    reversed += str[i];
  }
  if (reversed !== "em esrever") {
    console.info(`${TAG} Task execution failed: reversed: ${reversed}`);
    throw new Error('reversed check failed, expected em esrever');
  }

  if (len !== 0) {
    console.info(`${TAG} Task execution failed: len: ${len}`);
    throw new Error('len check failed, expected 0');
  }
}

export function ExpressionTest0451() {
  const TAG = 'ExpressionTest0451';
  const str: string = "Hello";
  const result: string = str + (str.length > 4 ? " there" : "");
  if (result !== "Hello there") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello there');
  }
}

export function ExpressionTest0452() {
  const TAG = 'ExpressionTest0452';
  let num: number = 5;
  const result: string = `Value: ${+num}, Incremented: ${+num++}`;
  if (result !== "Value: 5, Incremented: 5") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value: 5, Incremented: 5');
  }

  if (num !== 6) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 6');
  }
}

export function ExpressionTest0453() {
  const TAG = 'ExpressionTest0453';
  let result: number = 0;
  let i: number, mask: number;
  for (i = 0, mask = 1; i < 4; i++, mask <<= 1) {
    result += mask;
  }
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0454() {
  const TAG = 'ExpressionTest0454';
  const str1: string = "apple";
  const str2: string = "apple";
  const result: boolean = !(str1 === str2);
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0455() {
  const TAG = 'ExpressionTest0455';
  const a: number = 10;
  const b: number = 6;
  const result: boolean = (a & b) === 2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0456() {
  const TAG = 'ExpressionTest0456';
  const score: number = 85;
  let result: string = "Score: " + score + " - ";
  result += score > 90 ? "Excellent" :
    score > 80 ? "Good" :
      score > 70 ? "Average" : "Poor";
  if (result !== "Score: 85 - Good") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Score: 85 - Good');
  }
}

export function ExpressionTest0457() {
  const TAG = 'ExpressionTest0457';
  const a: number = 10;
  const result: number = -(a << 1);
  if (result !== -20) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -20');
  }
}

export function ExpressionTest0458() {
  const TAG = 'ExpressionTest0458';
  const str: string = "looping";
  let count: number = 0;
  for (let i = 0; i < str.length / 2.0; i++) {
    count++;
  }
  if (count !== 4) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 4');
  }
}

export function ExpressionTest0459() {
  const TAG = 'ExpressionTest0459';
  const num: number = 42;
  const result: boolean = num > 10 && num < 50;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0460() {
  const TAG = 'ExpressionTest0460';
  const str: string = "example";
  const result: boolean = str.startsWith("test") || str.endsWith("ple");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0461() {
  const TAG = 'ExpressionTest0461';
  let num: number = 10;
  num &= 15; // 1010 & 1111 = 1010 (10)
  num |= 4; // 1010 | 0100 = 1110 (14)
  num ^= 3; // 1110 ^ 0011 = 1101 (13)
  if (num !== 13) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 13');
  }
}

export function ExpressionTest0462() {
  const TAG = 'ExpressionTest0462';
  const a: number = 5;
  const b: number = 10;
  const result: string = `${a} is ${a > b ? 'greater than' : 'less than'} ${b}`;
  if (result !== "5 is less than 10") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 is less than 10');
  }
}

export function ExpressionTest0463() {
  const TAG = 'ExpressionTest0463';
  let count: number = 0;
  const result: string = "Count: " + ++count + ", Next: " + count++;
  if (result !== "Count: 1, Next: 1") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Count: 1, Next: 1');
  }

  if (count !== 2) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 2');
  }
}

export function ExpressionTest0464() {
  const TAG = 'ExpressionTest0464';
  let num: number = 5;
  const result: number = num-- * 2 + --num;
  // (5 * 2) + 3 = 10 + 3 = 13
  if (result !== 13) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 13');
  }

  if (num !== 3) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 3');
  }
}

export function ExpressionTest0465() {
  const TAG = 'ExpressionTest0465';
  const base: string = "item";
  let result: string = "";
  let i: number, current: string;
  for (i = 1, current = base + i; i <= 3; i++, current = base + i) {
    result += current + " ";
  }
  if (result !== "item1 item2 item3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected item1 item2 item3 ');
  }
}

export function ExpressionTest0466() {
  const TAG = 'ExpressionTest0466';
  const str1: string = "apple";
  const str2: string = "app";
  const result: boolean = str1.length > str2.length && str1 > str2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0467() {
  const TAG = 'ExpressionTest0467';
  const num: number = 15;
  let result: string = "";
  if (num % 2 === 0) {
    result = "Even";
  } else {
    result = "Odd";
  }
  if (result !== "Odd") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Odd');
  }
}

export function ExpressionTest0468() {
  const TAG = 'ExpressionTest0468';
  const name: string | null = null;
  const defaultName: string = "User";
  const result: string = "Hello, " + (name ?? defaultName);
  if (result !== "Hello, User") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello, User');
  }
}

export function ExpressionTest0469() {
  const TAG = 'ExpressionTest0469';
  const a: number = -5;
  const b: number = -3;
  const result: boolean = (a & b) === -7;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0470() {
  const TAG = 'ExpressionTest0470';
  const str: string = "abcdefghij";
  const index: int = 3;
  const result: string = str[index] + str[index + 2];
  if (result !== "df") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected df');
  }
}

export function ExpressionTest0472() {
  const TAG = 'ExpressionTest0472';
  const data: Data4 = { info: { name: "Test" } };
  const result1: string | undefined = data.info?.name?.toUpperCase();
  data.info = undefined;
  const info = data.info as Info4 | undefined;
  const result2: string | undefined = info?.name?.toUpperCase();
  if (result1 !== "TEST") {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected TEST');
  }

  if (result2 !== undefined) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not undefined');
  }
}

export function ExpressionTest0473() {
  const TAG = 'ExpressionTest0473';
  const a: number = 5;
  const result: boolean = (a << 1) > (a * 1.5);
  // 10 > 7.5 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0474() {
  const TAG = 'ExpressionTest0474';
  const base: number = 2;
  const exp: number = 3;
  const result: string = base + "^" + exp + " = " + (base**exp);
  if (result !== "2^3 = 8") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 2^3 = 8');
  }
}

export function ExpressionTest0475() {
  const TAG = 'ExpressionTest0475';
  const a: number = 10;
  const b: number = 3;
  const c: number = 2;
  const result1: number = a + b * c;
  const result2: number = (a + b) * c;
  if (result1 !== 16) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 16');
  }

  if (result2 !== 26) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 26');
  }
}

export function ExpressionTest0476() {
  const TAG = 'ExpressionTest0476';
  const x: number = 5;
  const y: number = 3;
  const result: string = `${x} + ${y} = ${x + y}, ${x} * ${y} = ${x * y}`;
  if (result !== "5 + 3 = 8, 5 * 3 = 15") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 + 3 = 8, 5 * 3 = 15');
  }
}

export function ExpressionTest0477() {
  const TAG = 'ExpressionTest0477';
  const str: string = "abcdefghij";
  const start: int = 2;
  const length: int = 4;
  const result: string = str.substr(start, length);
  if (result !== "cdef") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected cdef');
  }
}

export function ExpressionTest0478() {
  const TAG = 'ExpressionTest0478';
  const num: number = 15;
  const result: string = `Negative: ${-num}, Absolute: ${-(-num)}`;
  if (result !== "Negative: -15, Absolute: 15") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Negative: -15, Absolute: 15');
  }
}

export function ExpressionTest0479() {
  const TAG = 'ExpressionTest0479';
  const a: number = 10;
  const b: number = 5;
  const result: boolean = -a < -b;
  // -10 < -5 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0480() {
  const TAG = 'ExpressionTest0480';
  let num: number = 10;
  num += 5; // 15
  num *= 2; // 30
  num -= 8; // 22
  num /= 2; // 11
  if (num !== 11) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 11');
  }
}
