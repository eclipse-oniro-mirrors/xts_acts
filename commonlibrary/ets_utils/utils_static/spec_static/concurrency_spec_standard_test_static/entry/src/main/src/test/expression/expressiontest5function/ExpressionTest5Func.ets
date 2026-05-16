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


interface GeneratedTypeLiteralInterface_6 {
  enabled?: boolean;
}

interface GeneratedTypeLiteralInterface_12 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_33 {
  value: number;
  shift: number;
}

interface GeneratedTypeLiteralInterface_43 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_40 {
  score: number;
}

interface GeneratedTypeLiteralInterface_45 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_46 {
  items: string[];
}

interface GeneratedTypeLiteralInterface_48 {
  value: number;
  shift: number;
}

interface GeneratedTypeLiteralInterface_50 {
  temp: number;
}

interface GeneratedTypeLiteralInterface_52 {
  list: number[];
}

interface GeneratedTypeLiteralInterface_54 {
  a: number;
  b: number;
  result: number;
}

interface GeneratedTypeLiteralInterface_55 {
  role: string;
  accessLevel: number;
}

interface GeneratedTypeLiteralInterface_57 {
  value: number;
  mask: number;
}

interface GeneratedTypeLiteralInterface_58 {
  value: number;
  log: string;
}

interface GeneratedTypeLiteralInterface_9 {
  price: string;
  quantity: string;
}

interface GeneratedTypeLiteralInterface_10 {
  loginCount: number;
  points: number;
}

interface GeneratedTypeLiteralInterface_25 {
  seconds: number;
  interval: number;
}

interface GeneratedTypeLiteralInterface_20 {
  value: number;
}

interface GeneratedTypeLiteralInterface_32 {
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_36 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_37 {
  values: number[];
  threshold: number;
}

interface GeneratedTypeLiteralInterface_38 {
  dividend: number;
  divisor: number;
}

interface GeneratedTypeLiteralInterface_39 {
  num: number;
}

interface GeneratedTypeLiteralInterface_41 {
  arr: string[];
  x: int;
  y: int;
}

interface GeneratedTypeLiteralInterface_42 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_44 {
  value: number;
  min: number;
  max: number;
}

interface GeneratedTypeLiteralInterface_49 {
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_53 {
  values: int[];
  sum: int;
  multiplier: int;
}

interface GeneratedTypeLiteralInterface_51 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_47 {
  grade: number;
}

interface GeneratedTypeLiteralInterface_35 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_5 {
  age?: number;
}

interface GeneratedTypeLiteralInterface_13 {
  title: string;
  pages: number;
  author: string;
}

interface GeneratedTypeLiteralInterface_14 {
  wins: number;
  losses: number;
}

interface GeneratedTypeLiteralInterface_11 {
  debug?: boolean;
}

interface GeneratedTypeLiteralInterface_16 {
  balance: number;
  isActive: boolean;
  type: string;
}

interface GeneratedTypeLiteralInterface_26 {
  theme?: string;
}

interface GeneratedTypeLiteralInterface_27 {
  user: number;
  admin: number;
}

interface GeneratedTypeLiteralInterface_30 {
  base: number;
  exponent: number;
}

interface GeneratedTypeLiteralInterface_34 {
  toCelsius: (f: number) => number;
}

interface GeneratedTypeLiteralInterface_19 {
  add: (a: int, b: int) => int;
  multiply: (a: int, b: int) => int;
}

interface GeneratedTypeLiteralInterface_21 {
  quantity: number;
}

interface GeneratedTypeLiteralInterface_8 {
  name: string;
  age: number;
}

interface GeneratedTypeLiteralInterface_22 {
  score: number;
  level: number;
}

interface GeneratedTypeLiteralInterface_23 {
  price: number;
}

interface GeneratedTypeLiteralInterface_24 {
  price: number;
}

interface GeneratedTypeLiteralInterface_18 {
  speed: number;
}

interface GeneratedTypeLiteralInterface_17 {
  isAdmin: boolean;
  hasPermission: boolean;
  role: string;
}

interface GeneratedTypeLiteralInterface_15 {
  values: number[];
}

interface GeneratedTypeLiteralInterface_28 {
  values: int[];
  offset: int;
}

interface GeneratedTypeLiteralInterface_31 {
  a: number;
  b: number;
  c: number;
}

interface GeneratedTypeLiteralInterface_29 {
  maxSize?: number;
}

export function ExpressionTest0741() {
  const TAG = 'ExpressionTest0741';
  const percentage: number = 75;
  const result: boolean = percentage >= 70 && percentage < 80;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0742() {
  const TAG = 'ExpressionTest0742';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const result: number = (str.length / 2) | 0x0F;
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0743() {
  const TAG = 'ExpressionTest0743';
  const weight: number = 75;
  const height: number = 1.8;
  const bmi: number = weight / (height * height);
  const result: string = bmi > 30 ? "Obese" :
    bmi > 25 ? "Overweight" :
      bmi > 18.5 ? "Normal" : "Underweight";
  if (result !== "Normal") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Normal');
  }
}

export function ExpressionTest0744() {
  const TAG = 'ExpressionTest0744';
  let result: number = 0;
  let i: number, j: number;
  for (i = 5, j = 1; i >= 1; i--, j *= 2) {
    result += i * j;
  }
  if (result !== 5 * 1 + 4 * 2 + 3 * 4 + 2 * 8 + 1 * 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 * 1 + 4 * 2 + 3 * 4 + 2 * 8 + 1 * 16');
  }
}

export function ExpressionTest0745() {
  const TAG = 'ExpressionTest0745';
  const str: string = "Hello TypeScript";
  const substr: string = "Type";
  const result: boolean = str.substring(6, 10) === substr;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0746() {
  const TAG = 'ExpressionTest0746';
  let num: number = 6;
  const result: number = ~num * 2 + (-num);
  if (result !== -20) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -20');
  }
}

export function ExpressionTest0747() {
  const TAG = 'ExpressionTest0747';
  const value: number = 0b101101;
  const mask: number = 0b001000;
  const result: boolean = (value & mask) === 0;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0748() {
  const TAG = 'ExpressionTest0748';
  let result: string = "";
  let count: number = 0;
  do {
    result += count % 2 === 0 ? "even" : "odd";
    result += count + " ";
    count++;
  } while (count < 4);
  if (result !== "even0 odd1 even2 odd3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected even0 odd1 even2 odd3 ');
  }
}

export function ExpressionTest0749() {
  const TAG = 'ExpressionTest0749';
  const a: number = 30;
  const b: number = 17;
  const result: boolean = (a | b) < (a ^ b);
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0750() {
  const TAG = 'ExpressionTest0750';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  let result: string = "";
  let i: int, step: int;
  for (i = 0, step = 1; i < str.length; i += step, step = step < 5 ? step + 1 : 1) {
    result += str[i];
  }
  if (result !== "abdgkpqsvz") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected abdgkpqsvz');
  }
}

export function ExpressionTest0751() {
  const TAG = 'ExpressionTest0751';
  const a: number = 15;
  const b: number = 3;
  const result: string = "Result: " + (a + b) + ", " + (a - b) + ", " + (a * b) + ", " + (a / b);
  if (result !== "Result: 18, 12, 45, 5") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Result: 18, 12, 45, 5');
  }
}

export function ExpressionTest0752() {
  const TAG = 'ExpressionTest0752';
  const num: number = 7;
  const result: number = -num > -10 ? 1 : 0;
  if (result !== 1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1');
  }
}

export function ExpressionTest0753() {
  const TAG = 'ExpressionTest0753';
  const arr: int[] = [10, 20, 30, 40, 50, 60, 70];
  let result: int = 0;
  let i: int, step: int;
  for (i = 0, step = 2; i < arr.length; i += step, step = Math.min(step + 1, 3).toInt()) {
    result += arr[i];
  }
  if (result !== 100) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 100');
  }
}

export function ExpressionTest0754() {
  const TAG = 'ExpressionTest0754';
  const user: GeneratedTypeLiteralInterface_5 = { age: 25 };
  const result: boolean = !(user.age === undefined);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0755() {
  const TAG = 'ExpressionTest0755';
  const a: number = 0b1010;
  const b: number = 0b0111;
  const result: boolean = (a | b) >= 0b1111 && (a | b) <= 0b1111;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0756() {
  const TAG = 'ExpressionTest0756';
  const temperature: number = 32;
  const result: string = `${temperature}°C is ${temperature > 30 ? 'hot' : temperature > 20 ? 'warm' : 'cool'}`;
  if (result !== "32°C is hot") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 32°C is hot');
  }
}

export function ExpressionTest0757() {
  const TAG = 'ExpressionTest0757';
  const str1: string = "123";
  const str2: string = "45";
  const result: number = +Number(str1) - +Number(str2);
  if (result !== 78) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 78');
  }
}

export function ExpressionTest0758() {
  const TAG = 'ExpressionTest0758';
  const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  let result: number = 0;
  for (let i = 0; i < arr.length / 2; i++) {
    result += arr[i];
  }
  if (result !== 1 + 2 + 3 + 4 + 5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 + 2 + 3 + 4 + 5');
  }
}

export function ExpressionTest0759() {
  const TAG = 'ExpressionTest0759';
  const num: number = 17;
  const str: string = "test";
  const result: boolean = num > 10 && str.length === 4 && num % 2 === 1;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0760() {
  const TAG = 'ExpressionTest0760';
  const flag: boolean = false;
  const value: number = 5;
  const result: boolean = flag || value < 3 || value > 4;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0761() {
  const TAG = 'ExpressionTest0761';
  let value: number = 100;
  const divisor: number = 13;
  value %= divisor;
  value += 5;
  value %= divisor;
  if (value !== 1) {
    console.info(`${TAG} Task execution failed: value: ${value}`);
    throw new Error('value check failed, expected 1');
  }
}

export function ExpressionTest0762() {
  const TAG = 'ExpressionTest0762';
  const a: number = 0b1010;
  const b: number = 0b0110;
  const result: string = `${a} & ${b} = ${a & b}, ${a} | ${b} = ${a | b}, ${a} ^ ${b} = ${a ^ b}`;
  if (result !== "10 & 6 = 2, 10 | 6 = 14, 10 ^ 6 = 12") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 & 6 = 2, 10 | 6 = 14, 10 ^ 6 = 12');
  }
}

export function ExpressionTest0763() {
  const TAG = 'ExpressionTest0763';
  let num: number = 10;
  const result: number = --num * 2 + --num;
  if (result !== 26) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 26');
  }

  if (num !== 8) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 8');
  }
}

export function ExpressionTest0764() {
  const TAG = 'ExpressionTest0764';
  let num: number = 3;
  const result: number = num++ * 5 + num++;
  if (result !== 19) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 19');
  }

  if (num !== 5) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 5');
  }
}

export function ExpressionTest0765() {
  const TAG = 'ExpressionTest0765';
  let result: number = 0;
  let i: number, j: number;
  for (i = 1, j = 10; i <= 5; i++, j -= 2) {
    result += i * j;
  }
  if (result !== 1 * 10 + 2 * 8 + 3 * 6 + 4 * 4 + 5 * 2) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 * 10 + 2 * 8 + 3 * 6 + 4 * 4 + 5 * 2');
  }
}

export function ExpressionTest0766() {
  const TAG = 'ExpressionTest0766';
  const str1: string = "Hello";
  const str2: string = "HELLO";
  const result: boolean = str1.toLowerCase() === str2.toLowerCase();
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0767() {
  const TAG = 'ExpressionTest0767';
  const arr: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  let result: number = 0;
  for (let i = 0; i < arr.length; i++) {
    if (i % 3 === 0) {
      result += arr[i];
    }
  }
  if (result !== 10 + 40 + 70 + 100) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 + 40 + 70 + 100');
  }
}

export function ExpressionTest0768() {
  const TAG = 'ExpressionTest0768';
  const config: GeneratedTypeLiteralInterface_6 = { enabled: false };
  const defaultValue: boolean = true;
  const result: boolean = config.enabled ?? defaultValue;
  if (result !== false) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected false');
  }
}

export function ExpressionTest0769() {
  const TAG = 'ExpressionTest0769';
  const a: number = 15;
  const b: number = -7;
  const result: number = a & b;
  if (result !== 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9');
  }
}

export function ExpressionTest0770() {
  const TAG = 'ExpressionTest0770';
  const arr: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
  let index: int = 2;
  index = index * 2 + 1;
  const result: string = arr[index];
  if (result !== "f") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected f');
  }
}

export function ExpressionTest0773() {
  const TAG = 'ExpressionTest0773';
  const a: number = 64;
  const b: number = 3;
  const result: boolean = (a >> b) === 8;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0774() {
  const TAG = 'ExpressionTest0774';
  const dividend: number = 25;
  const divisor: number = 7;
  const result: string = dividend + " divided by " + divisor +
    " is " + Math.floor(dividend / divisor) +
    " with remainder " + (dividend % divisor);
  if (result !== "25 divided by 7 is 3 with remainder 4") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 25 divided by 7 is 3 with remainder 4');
  }
}

export function ExpressionTest0775() {
  const TAG = 'ExpressionTest0775';
  const a: number = 10;
  const b: number = 3;
  const c: number = 2;
  const result1: number = a % b + c;
  const result2: number = a % (b + c);
  if (result1 !== 1 + 2) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 1 + 2');
  }

  if (result2 !== 0) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 0');
  }
}

export function ExpressionTest0776() {
  const TAG = 'ExpressionTest0776';
  const arr: number[] = [5, 8, 3, 12, 6];
  const index1: int = 1;
  const index2: int = 3;
  const result: string = `arr[${index1}] + arr[${index2}] = ${arr[index1] + arr[index2]}, ` +
    `arr[${index1}] * arr[${index2}] = ${arr[index1] * arr[index2]}`;
  if (result !== "arr[1] + arr[3] = 20, arr[1] * arr[3] = 96") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected arr[1] + arr[3] = 20, arr[1] * arr[3] = 96');
  }
}

export function ExpressionTest0777() {
  const TAG = 'ExpressionTest0777';
  const arr: int[] = [10, 20, 30, 40, 50, 60, 70, 80];
  const start: int = 2;
  const count: int = 2;
  const result: int[] = arr.slice(start, start + count * 2);
  if (JSON.stringify(result) !== JSON.stringify([30, 40, 50, 60])) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not deeply equal [30, 40, 50, 60]');
  }
}

export function ExpressionTest0778() {
  const TAG = 'ExpressionTest0778';
  const str1: string = "15";
  const str2: string = "7";
  const result: string = `+${str1} + +${str2} = ${+Number(str1) + +Number(str2)}`;
  if (result !== "+15 + +7 = 22") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected +15 + +7 = 22');
  }
}

export function ExpressionTest0779() {
  const TAG = 'ExpressionTest0779';
  const a: number = 12;
  const b: number = 5;
  const result: boolean = ~a < ~b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0780() {
  const TAG = 'ExpressionTest0780';
  let num: number = 100;
  num /= 4;
  num += 5;
  num /= 3;
  if (num !== 10) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 10');
  }
}

export function ExpressionTest0781() {
  const TAG = 'ExpressionTest0781';
  const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result: number[] = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] % 2 === 0 && arr[i] > 5) {
      result.push(arr[i]);
    }
  }
  const target: number[] = [6, 8, 10]
  if (JSON.stringify(result) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not deeply equal target');
  }
}

export function ExpressionTest0782() {
  const TAG = 'ExpressionTest0782';
  const num: number = 37;
  const result: boolean = num % 3 === 1 && num % 4 === 1 && num % 5 === 2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0783() {
  const TAG = 'ExpressionTest0783';
  const fruits: string[] = ["apple", "banana", "cherry"];
  const index: int = 1;
  const result: string = "I like " + fruits[index] + "s, they have " + fruits[index].length + " letters";
  if (result !== "I like bananas, they have 6 letters") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected I like bananas, they have 6 letters');
  }
}

export function ExpressionTest0784() {
  const TAG = 'ExpressionTest0784';
  const base: number = 3;
  const exp: number = 4;
  const result: boolean = base**exp === 81;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0785() {
  const TAG = 'ExpressionTest0785';
  const numbers: number[] = [4, 7, 2, 9, 5];
  const result: string = `Max: ${Math.max(...numbers)}, Sum: ${numbers[0] + numbers[1] + numbers[2]}`;
  if (result !== "Max: 9, Sum: 13") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Max: 9, Sum: 13');
  }
}

export function ExpressionTest0786() {
  const TAG = 'ExpressionTest0786';
  const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result: number = arr.length << 1;
  if (result !== 20) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 20');
  }
}

export function ExpressionTest0787() {
  const TAG = 'ExpressionTest0787';
  const arr: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
  const a: int = 5;
  const b: int = 2;
  const result: string = arr[a ^ b];
  if (result !== "seven") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected seven');
  }
}

export function ExpressionTest0788() {
  const TAG = 'ExpressionTest0788';
  const values: number[] = [10, 20, 30, 40, 50];
  const index: int = 2;
  const result: string = `values[${index}] = ${values[index]}, values[${index}] * 2 = ${values[index] * 2}`;
  if (result !== "values[2] = 30, values[2] * 2 = 60") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected values[2] = 30, values[2] * 2 = 60');
  }
}

export function ExpressionTest0789() {
  const TAG = 'ExpressionTest0789';
  const arr: number[] = [1, 2, 3, 4, 5];
  const threshold: number = 4;
  const result: boolean = arr.length > threshold;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0790() {
  const TAG = 'ExpressionTest0790';
  const numbers: number[] = [1, 2, 3, 4, 5];
  const filter: number = 3;
  let result: string = "Numbers ";
  result += numbers.filter(n => n > filter).join(", ") + " are greater than " + filter;
  if (result !== "Numbers 4, 5 are greater than 3") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Numbers 4, 5 are greater than 3');
  }
}

export function ExpressionTest0791() {
  const TAG = 'ExpressionTest0791';
  const value: number = 17;
  const min: number = 10;
  const max: number = 20;
  const result: boolean = value >= min && value <= max;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0792() {
  const TAG = 'ExpressionTest0792';
  const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
  const result: number = (arr.length * 2) & 0x0F;
  if (result !== 0) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0');
  }
}

export function ExpressionTest0794() {
  const TAG = 'ExpressionTest0794';
  const arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result: int[] = [];
  let i: int, multiplier: int;
  for (i = 0, multiplier = 1; i < arr.length; i += 2, multiplier *= 2) {
    result.push(arr[i] * multiplier);
  }
  if (JSON.stringify(result) !== JSON.stringify([1 * 1, 3 * 2, 5 * 4, 7 * 8, 9 * 16])) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not deeply equal [1 * 1, 3 * 2, 5 * 4, 7 * 8, 9 * 16]');
  }
}

export function ExpressionTest0795() {
  const TAG = 'ExpressionTest0795';
  const words: string[] = ["apple", "banana", "cherry", "date"];
  const target: string = "cherry";
  let result: boolean = false;
  for (let i = 0; i < words.length; i++) {
    if (words[i] === target) {
      result = true;
      break;
    }
  }
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0796() {
  const TAG = 'ExpressionTest0796';
  const arr: number[] = [5, 3, 8, 2];
  let num: number = arr[0];
  const result: number = ~num + (-arr[1]) * arr[2];
  if (result !== -30) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -30');
  }
}

export function ExpressionTest0797() {
  const TAG = 'ExpressionTest0797';
  const flags: number[] = [0b1010, 0b0110, 0b1100];
  const mask: number = 0b1000;
  let result: number = 0;
  for (let i = 0; i < flags.length; i++) {
    if ((flags[i] & mask) !== 0) {
      result++;
    }
  }
  if (result !== 2) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 2');
  }
}

export function ExpressionTest0798() {
  const TAG = 'ExpressionTest0798';
  const arr: number[] = [];
  let count: number = 1;
  while (count <= 5) {
    arr.push(count * 3);
    count++;
  }
  const target: number[] = [3, 6, 9, 12, 15];
  if (JSON.stringify(arr) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: arr: ${arr}`);
    throw new Error('arr does not deeply equal target');
  }
}

export function ExpressionTest0799() {
  const TAG = 'ExpressionTest0799';
  const a: number[] = [12, 5];
  const b: number[] = [3, 8];
  const result: boolean = (a[0] / a[1]) > (b[0] * b[1]);
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0800() {
  const TAG = 'ExpressionTest0800';
  const arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  const result: int[] = [];
  let i: int, threshold: int;
  for (i = 0, threshold = 4; i < arr.length; i++, threshold = 4) {
    if (arr[i] > threshold) {
      result.push(arr[i]);
    }
  }
  if (JSON.stringify(result) !== JSON.stringify([5, 6, 7, 8, 9, 10, 11, 12])) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result does not deeply equal [5, 6, 7, 8, 9, 10, 11, 12]');
  }
}

export function ExpressionTest0801() {
  const TAG = 'ExpressionTest0801';
  const person: GeneratedTypeLiteralInterface_8 = { name: "Alice", age: 30 };
  const result: string = person.name + " is " + person.age + " years old";
  if (result !== "Alice is 30 years old") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Alice is 30 years old');
  }
}

export function ExpressionTest0802() {
  const TAG = 'ExpressionTest0802';
  const product: GeneratedTypeLiteralInterface_9 = { price: "19.99", quantity: "3" };
  const total: number = +Number(product.price) * +Number(product.quantity);
  if (Math.abs(total - 59.97) > 0.001) {
    console.info(`${TAG} Task execution failed: total: ${total}, expected: 59.97, delta: 0.001`);
    throw new Error('total is not close to 59.97 (within 0.001)');
  }
}

export function ExpressionTest0803() {
  const TAG = 'ExpressionTest0803';
  const user: GeneratedTypeLiteralInterface_10 = { loginCount: 0, points: 100 };
  let result: string = "";
  let i: number, multiplier: number;
  for (i = 0, multiplier = 1; i < 5; i++, user.loginCount++, multiplier *= 2) {
    user.points += 5 * multiplier;
    result += `Login ${user.loginCount}: ${user.points}, `;
  }
  if (result !== "Login 0: 105, Login 1: 115, Login 2: 135, Login 3: 175, Login 4: 255, ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Login 0: 105, Login 1: 115, Login 2: 135, Login 3: 175, Login 4: 255, ');
  }
}

export function ExpressionTest0804() {
  const TAG = 'ExpressionTest0804';
  const config: GeneratedTypeLiteralInterface_11 = { debug: false };
  const result: boolean = !config.debug;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0805() {
  const TAG = 'ExpressionTest0805';
  const flags: GeneratedTypeLiteralInterface_12 = { a: 0b1010, b: 0b0111 };
  const result: number = flags.a ^ flags.b;
  if (result !== 0b1101) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0b1101');
  }
}

export function ExpressionTest0806() {
  const TAG = 'ExpressionTest0806';
  const book: GeneratedTypeLiteralInterface_13 = {
    title: "The Hobbit",
    pages: 310,
    author: "J.R.R. Tolkien"
  };
  const result: string = `${book.title} by ${book.author} has ${book.pages} pages`;
  if (result !== "The Hobbit by J.R.R. Tolkien has 310 pages") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected The Hobbit by J.R.R. Tolkien has 310 pages');
  }
}

export function ExpressionTest0807() {
  const TAG = 'ExpressionTest0807';
  const stats: GeneratedTypeLiteralInterface_14 = { wins: 15, losses: 5 };
  const result: number = -(stats.wins - stats.losses) / 2;
  if (result !== -5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -5');
  }
}

export function ExpressionTest0808() {
  const TAG = 'ExpressionTest0808';
  const data: GeneratedTypeLiteralInterface_15 = { values: [10, 20, 30, 40, 50] };
  let result: number = 0;
  for (let i = 0; i < data.values.length; i++) {
    result += data.values[i] * (i + 1);
  }
  if (result !== 10 * 1 + 20 * 2 + 30 * 3 + 40 * 4 + 50 * 5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 * 1 + 20 * 2 + 30 * 3 + 40 * 4 + 50 * 5');
  }
}

export function ExpressionTest0809() {
  const TAG = 'ExpressionTest0809';
  const account: GeneratedTypeLiteralInterface_16 = {
    balance: 500,
    isActive: true,
    type: "premium"
  };
  const result: boolean = account.isActive && account.balance > 100 && account.type === "premium";
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0810() {
  const TAG = 'ExpressionTest0810';
  const user: GeneratedTypeLiteralInterface_17 = {
    isAdmin: false,
    hasPermission: false,
    role: "editor"
  };
  const result: boolean = user.isAdmin || user.hasPermission || user.role === "editor";
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0811() {
  const TAG = 'ExpressionTest0811';
  const car: GeneratedTypeLiteralInterface_18 = { speed: 50 };
  car.speed += 20;
  car.speed *= 1.1;
  car.speed -= 5;
  if (car.speed !== 72) {
    console.info(`${TAG} Task execution failed: car.speed: ${car.speed}`);
    throw new Error('car.speed check failed, expected 72');
  }
}

export function ExpressionTest0812() {
  const TAG = 'ExpressionTest0812';
  const calculator: GeneratedTypeLiteralInterface_19 = {
    add: (a: int, b: int) => a + b,
    multiply: (a: int, b: int) => a * b
  };
  const a: int = 5;
  const b: int = 3;
  const result: string = `${a} + ${b} = ${calculator.add(a, b)}, ${a} * ${b} = ${calculator.multiply(a, b)}`;
  if (result !== "5 + 3 = 8, 5 * 3 = 15") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 + 3 = 8, 5 * 3 = 15');
  }
}

export function ExpressionTest0813() {
  const TAG = 'ExpressionTest0813';
  const counter: GeneratedTypeLiteralInterface_20 = { value: 4 };
  const result: number = ++counter.value * 2 + ++counter.value;
  if (result !== 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 16');
  }

  if (counter.value !== 6) {
    console.info(`${TAG} Task execution failed: counter.value: ${counter.value}`);
    throw new Error('counter.value check failed, expected 6');
  }
}

export function ExpressionTest0814() {
  const TAG = 'ExpressionTest0814';
  const stock: GeneratedTypeLiteralInterface_21 = { quantity: 10 };
  const result: number = stock.quantity-- * 2 + stock.quantity--;
  if (result !== 29) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 29');
  }

  if (stock.quantity !== 8) {
    console.info(`${TAG} Task execution failed: stock.quantity: ${stock.quantity}`);
    throw new Error('stock.quantity check failed, expected 8');
  }
}

export function ExpressionTest0815() {
  const TAG = 'ExpressionTest0815';
  const stats: GeneratedTypeLiteralInterface_22 = { score: 0, level: 1 };
  let i: number, multiplier: number;
  for (i = 0, multiplier = 10; i < 5; i++, stats.level++, multiplier += 5) {
    stats.score += stats.level * multiplier;
  }
  if (stats.score !== 1 * 10 + 2 * 15 + 3 * 20 + 4 * 25 + 5 * 30) {
    console.info(`${TAG} Task execution failed: stats.score: ${stats.score}`);
    throw new Error('stats.score check failed, expected 1 * 10 + 2 * 15 + 3 * 20 + 4 * 25 + 5 * 30');
  }
}

export function ExpressionTest0816() {
  const TAG = 'ExpressionTest0816';
  const productA: GeneratedTypeLiteralInterface_23 = { price: 19.99 };
  const productB: GeneratedTypeLiteralInterface_24 = { price: 24.99 };
  const result: boolean = productA.price < productB.price;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0817() {
  const TAG = 'ExpressionTest0817';
  const timer: GeneratedTypeLiteralInterface_25 = { seconds: 0, interval: 3 };
  let result: string = "";
  while (timer.seconds < 15) {
    timer.seconds++;
    if (timer.seconds % timer.interval === 0) {
      result += timer.seconds + " ";
    }
  }
  if (result !== "3 6 9 12 15 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 3 6 9 12 15 ');
  }
}

export function ExpressionTest0818() {
  const TAG = 'ExpressionTest0818';
  const settings: GeneratedTypeLiteralInterface_26 = {};
  const defaultTheme: string = "light";
  const result: string = settings.theme ?? defaultTheme;
  if (result !== "light") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected light');
  }
}

export function ExpressionTest0819() {
  const TAG = 'ExpressionTest0819';
  const permissions: GeneratedTypeLiteralInterface_27 = { user: 0b0011, admin: 0b1100 };
  const result: number = permissions.user | permissions.admin;
  if (result !== 0b1111) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0b1111');
  }
}

export function ExpressionTest0820() {
  const TAG = 'ExpressionTest0820';
  const data: GeneratedTypeLiteralInterface_28 = { values: [10, 20, 30, 40, 50], offset: 1 };
  const index: int = 2;
  const result: int = data.values[index + data.offset];
  if (result !== 40) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 40');
  }
}

export function ExpressionTest0823() {
  const TAG = 'ExpressionTest0823';
  const metrics: GeneratedTypeLiteralInterface_33 = { value: 16, shift: 3 };
  const result: boolean = (metrics.value >> metrics.shift) === 2;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0824() {
  const TAG = 'ExpressionTest0824';
  const math: GeneratedTypeLiteralInterface_30 = { base: 2, exponent: 10 };
  const result: string = math.base + " to the power of " + math.exponent + " is " + (math.base**math.exponent);
  if (result !== "2 to the power of 10 is 1024") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 2 to the power of 10 is 1024');
  }
}

export function ExpressionTest0825() {
  const TAG = 'ExpressionTest0825';
  const calc: GeneratedTypeLiteralInterface_31 = { a: 20, b: 4, c: 2 };
  const result1: number = calc.a / calc.b + calc.c;
  const result2: number = calc.a / (calc.b + calc.c);
  if (result1 !== 5 + 2) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 5 + 2');
  }

  if (result2 !== 3.3333333333333335) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 3.3333333333333335');
  }
}

export function ExpressionTest0826() {
  const TAG = 'ExpressionTest0826';
  const obj: GeneratedTypeLiteralInterface_32 = { x: 6, y: 4 };
  const result: string =
    `${obj.x} + ${obj.y} * 2 = ${obj.x + obj.y * 2}, (${obj.x} + ${obj.y}) * 2 = ${(obj.x + obj.y) * 2}`;
  if (result !== "6 + 4 * 2 = 14, (6 + 4) * 2 = 20") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 6 + 4 * 2 = 14, (6 + 4) * 2 = 20');
  }
}

export function ExpressionTest0827() {
  const TAG = 'ExpressionTest0827';
  const converter: GeneratedTypeLiteralInterface_34 = {
    toCelsius: (f: number) => (f - 32) * 5 / 9
  };
  const fahrenheit: number = 98.6;
  const result: number = converter.toCelsius(fahrenheit);
  if (Math.abs(result - 37) > 0.1) {
    console.info(`${TAG} Task execution failed: result: ${result}, expected: 37, delta: 0.1`);
    throw new Error('result is not close to 37 (within 0.1)');
  }
}

export function ExpressionTest0828() {
  const TAG = 'ExpressionTest0828';
  const values: GeneratedTypeLiteralInterface_35 = { a: 15, b: 7 };
  const result: string = `-${values.a} + ${values.b} = ${-values.a + values.b}`;
  if (result !== "-15 + 7 = -8") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -15 + 7 = -8');
  }
}

export function ExpressionTest0829() {
  const TAG = 'ExpressionTest0829';
  const nums: GeneratedTypeLiteralInterface_36 = { a: 8, b: 5 };
  const result: boolean = ~nums.a < -nums.b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0830() {
  const TAG = 'ExpressionTest0830';
  const game: GeneratedTypeLiteralInterface_40 = { score: 50 };
  game.score += 25;
  game.score *= 2;
  game.score -= 30;
  if (game.score !== 120) {
    console.info(`${TAG} Task execution failed: game.score: ${game.score}`);
    throw new Error('game.score check failed, expected 120');
  }
}

export function ExpressionTest0831() {
  const TAG = 'ExpressionTest0831';
  const data: GeneratedTypeLiteralInterface_37 = {
    values: [10, 25, 15, 30, 5, 35, 20],
    threshold: 20
  };
  let count: number = 0;
  for (let i = 0; i < data.values.length; i++) {
    if (data.values[i] > data.threshold) {
      count++;
    }
  }
  if (count !== 3) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 3');
  }
}

export function ExpressionTest0832() {
  const TAG = 'ExpressionTest0832';
  const numbers: GeneratedTypeLiteralInterface_38 = { dividend: 47, divisor: 11 };
  const remainder: number = numbers.dividend % numbers.divisor;
  const result: boolean = remainder > 2 && remainder < 6;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0833() {
  const TAG = 'ExpressionTest0833';
  const bits: GeneratedTypeLiteralInterface_43 = { a: 23, b: 12 };
  const result: string = bits.a + " & " + bits.b + " = " + (bits.a & bits.b);
  if (result !== "23 & 12 = 4") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 23 & 12 = 4');
  }
}

export function ExpressionTest0834() {
  const TAG = 'ExpressionTest0834';
  const obj: GeneratedTypeLiteralInterface_39 = { num: 7 };
  const result: boolean = ~obj.num === -8;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0835() {
  const TAG = 'ExpressionTest0835';
  const obj: GeneratedTypeLiteralInterface_45 = { a: 10, b: 3 };
  const result: string = `${obj.a} > ${obj.b}: ${obj.a > obj.b}, ${obj.a} % ${obj.b} = ${obj.a % obj.b}`;
  if (result !== "10 > 3: true, 10 % 3 = 1") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 > 3: true, 10 % 3 = 1');
  }
}

export function ExpressionTest0836() {
  const TAG = 'ExpressionTest0836';
  const container: GeneratedTypeLiteralInterface_46 = { items: ["a", "b", "c", "d", "e", "f", "g"] };
  const result: number = container.items.length | 0x08;
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0837() {
  const TAG = 'ExpressionTest0837';
  const data: GeneratedTypeLiteralInterface_41 = {
    arr: ["zero", "one", "two", "three", "four", "five", "six"],
    x: 5,
    y: 3
  };
  const result: string = data.arr[data.x & data.y];
  if (result !== "one") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected one');
  }
}

export function ExpressionTest0838() {
  const TAG = 'ExpressionTest0838';
  const bits: GeneratedTypeLiteralInterface_48 = { value: 48, shift: 4 };
  const result: string = `${bits.value} >> ${bits.shift} = ${bits.value >> bits.shift}`;
  if (result !== "48 >> 4 = 3") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 48 >> 4 = 3');
  }
}

export function ExpressionTest0839() {
  const TAG = 'ExpressionTest0839';
  const obj: GeneratedTypeLiteralInterface_42 = { a: 32, b: 5 };
  const result: boolean = (obj.a >> obj.b) === 0;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0840() {
  const TAG = 'ExpressionTest0840';
  const weather: GeneratedTypeLiteralInterface_50 = { temp: 22 };
  const result: string = "Temperature " + weather.temp + "°C is " +
    (weather.temp > 25 ? "hot" :
      weather.temp > 18 ? "warm" :
        weather.temp > 10 ? "cool" : "cold");
  if (result !== "Temperature 22°C is warm") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Temperature 22°C is warm');
  }
}

export function ExpressionTest0841() {
  const TAG = 'ExpressionTest0841';
  const test: GeneratedTypeLiteralInterface_44 = { value: 45, min: 40, max: 50 };
  const result: boolean = test.value >= test.min && test.value <= test.max;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0842() {
  const TAG = 'ExpressionTest0842';
  const wrapper: GeneratedTypeLiteralInterface_52 = { list: [1, 2, 3, 4, 5, 6] };
  const result: number = (wrapper.list.length * 3) ^ 0x0F;
  if (result !== 29) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 29');
  }
}

export function ExpressionTest0843() {
  const TAG = 'ExpressionTest0843';
  const student: GeneratedTypeLiteralInterface_47 = { grade: 82 };
  const result: string = student.grade >= 90 ? "A" :
    student.grade >= 80 ? "B" :
      student.grade >= 70 ? "C" :
        student.grade >= 60 ? "D" : "F";
  if (result !== "B") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected B');
  }
}

export function ExpressionTest0844() {
  const TAG = 'ExpressionTest0844';
  const obj: GeneratedTypeLiteralInterface_54 = { a: 1, b: 10, result: 0 };
  let i: number, step: number;
  for (i = 0, step = 1; i < 5; i++, obj.a += step, obj.b -= step, step++) {
    obj.result += obj.a * obj.b;
  }
  if (obj.result !== 1 * 10 + 2 * 9 + 4 * 7 + 7 * 4 + 11 * 0) {
    console.info(`${TAG} Task execution failed: obj.result: ${obj.result}`);
    throw new Error('obj.result check failed, expected 1 * 10 + 2 * 9 + 4 * 7 + 7 * 4 + 11 * 0');
  }
}

export function ExpressionTest0845() {
  const TAG = 'ExpressionTest0845';
  const user: GeneratedTypeLiteralInterface_55 = { role: "moderator", accessLevel: 5 };
  const adminRole: string = "admin";
  const result: boolean = user.role === adminRole || user.accessLevel > 4;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0846() {
  const TAG = 'ExpressionTest0846';
  const data: GeneratedTypeLiteralInterface_49 = { x: 5, y: 3 };
  const result: number = ~data.x + (-data.y) * 2;
  if (result !== -12) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -12');
  }
}

export function ExpressionTest0847() {
  const TAG = 'ExpressionTest0847';
  const flags: GeneratedTypeLiteralInterface_57 = { value: 0b101101, mask: 0b001000 };
  const result: boolean = (flags.value & flags.mask) !== 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0848() {
  const TAG = 'ExpressionTest0848';
  const counter: GeneratedTypeLiteralInterface_58 = { value: 0, log: "" };
  do {
    counter.value++;
    counter.log += `Count: ${counter.value}, `;
  } while (counter.value < 3);
  if (counter.log !== "Count: 1, Count: 2, Count: 3, ") {
    console.info(`${TAG} Task execution failed: counter.log: ${counter.log}`);
    throw new Error('counter.log check failed, expected Count: 1, Count: 2, Count: 3, ');
  }
}

export function ExpressionTest0849() {
  const TAG = 'ExpressionTest0849';
  const obj: GeneratedTypeLiteralInterface_51 = { a: 28, b: 15 };
  const result: boolean = (obj.a | obj.b) > (obj.a ^ obj.b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0850() {
  const TAG = 'ExpressionTest0850';
  const obj: GeneratedTypeLiteralInterface_53 = {
    values: [1, 2, 3, 4, 5],
    sum: 0,
    multiplier: 1
  };
  let i: int, step: int;
  for (i = 0, step = 1; i < obj.values.length; i++, step++, obj.multiplier *= step) {
    obj.sum += obj.values[i] * obj.multiplier;
  }
  if (obj.sum !== 719) {
    console.info(`${TAG} Task execution failed: obj.sum: ${obj.sum}`);
    throw new Error('obj.sum check failed, expected 719');
  }
}

export function ExpressionTest0851() {
  const TAG = 'ExpressionTest0851';
  let numVar: number;
  let strArray: string[] = [];
  strArray = ["42", "15", "7"];
  numVar = 0;
  for (let i = 0; i < strArray.length; i++) {
    numVar += +Number(strArray[i]);
  }
  if (numVar !== 64) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 64');
  }
}

export function ExpressionTest0852() {
  const TAG = 'ExpressionTest0852';
  let numVar: int;
  let numArray: int[] = [];
  numArray = [10, 20, 30, 40, 50, 60, 70];
  numVar = 0;
  let i: int, step: int;
  for (i = 0, step = 2; i < numArray.length; i += step, step = step < 4 ? step + 1 : 1) {
    numVar += numArray[i];
  }
  if (numVar !== 100) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 100');
  }
}

export function ExpressionTest0853() {
  const TAG = 'ExpressionTest0853';
  let boolVar: boolean;
  let numArray: number[] = [];
  numArray = [];
  boolVar = !numArray.length;
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
  numArray.push(1);
  boolVar = !numArray.length;
  if (boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not false');
  }
}

export function ExpressionTest0854() {
  const TAG = 'ExpressionTest0854';
  let numVar: number = 0;
  for (let i = 0; i < 16; i++) {
    if ((i & 0x0F) === i) {
      numVar++;
    }
  }
  if (numVar !== 16) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 16');
  }
}

export function ExpressionTest0855() {
  const TAG = 'ExpressionTest0855';
  let numVar: int;
  let strVar: string;
  let strArray: string[] = [];
  strArray = ["first", "second", "third", "fourth"];
  numVar = 1;
  strVar = strArray[numVar] + " item is at index " + numVar +
    ", length: " + strArray[numVar].length;
  if (strVar !== "second item is at index 1, length: 6") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected second item is at index 1, length: 6');
  }
}

export function ExpressionTest0856() {
  const TAG = 'ExpressionTest0856';
  let strVar: string = "";
  ;
  let numArray: number[] = [5, -3, 8, -2, 1];
  for (let i = 0; i < numArray.length; i++) {
    strVar += -numArray[i] > 0 ? "positive " : "non-positive ";
  }
  if (strVar !== "non-positive positive non-positive positive non-positive ") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected non-positive positive non-positive positive non-positive ');
  }
}

export function ExpressionTest0857() {
  const TAG = 'ExpressionTest0857';
  let numVar: number;
  let numArray: number[] = [];
  numArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  numVar = 0;
  for (let i = 0; i < numArray.length / 3; i++) {
    numVar += numArray[i * 3];
  }
  if (numVar !== 1 + 4 + 7 + 10) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 1 + 4 + 7 + 10');
  }
}

export function ExpressionTest0858() {
  const TAG = 'ExpressionTest0858';
  let numVar: number = 0;
  let numArray: number[] = [12, 5, 18, 7, 21];
  for (let i = 0; i < numArray.length; i++) {
    if (numArray[i] > 10 && numArray[i] % 3 === 0) {
      numVar++;
    }
  }
  if (numVar !== 3) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 3');
  }
}

export function ExpressionTest0859() {
  const TAG = 'ExpressionTest0859';
  let boolVar: boolean;
  let numArray: number[] = [];
  numArray = [3, 14, 7, 22, 5];
  boolVar = false;
  for (let i = 0; i < numArray.length; i++) {
    boolVar = boolVar || numArray[i] < 5 || numArray[i] > 20;
  }
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0860() {
  const TAG = 'ExpressionTest0860';
  let numVar: number = 100;
  for (let i = 2; i <= 5; i++) {
    numVar %= i;
  }
  if (numVar !== 0) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 0');
  }
}

export function ExpressionTest0861() {
  const TAG = 'ExpressionTest0861';
  let strVar: string;
  let numArray: number[] = [0b1100, 0b0110];
  strVar = `${numArray[0]} | ${numArray[1]} = ${numArray[0] |
  numArray[1]}, ${numArray[0]} ^ ${numArray[1]} = ${numArray[0] ^ numArray[1]}`;
  if (strVar !== "12 | 6 = 14, 12 ^ 6 = 10") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected 12 | 6 = 14, 12 ^ 6 = 10');
  }
}

export function ExpressionTest0862() {
  const TAG = 'ExpressionTest0862';
  let numVar: int = 3;
  let numArray: int[] = [10, 20, 30, 40, 50];
  const result: int = numArray[--numVar] + numArray[--numVar];
  if (result !== 50) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 50');
  }
}

export function ExpressionTest0863() {
  const TAG = 'ExpressionTest0863';
  let numVar: int = 1;
  let numArray: int[] = [2, 4, 6, 8];
  const result: int = numArray[numVar++] * 2 + numArray[numVar++];
  if (result !== 14) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 14');
  }

  if (numVar !== 3) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 3');
  }
}

export function ExpressionTest0864() {
  const TAG = 'ExpressionTest0864';
  let numVar: int = 0;
  let numArray: int[] = [1, 2, 3, 4, 5, 6, 7, 8];
  let i: int, j: int;
  for (i = 0, j = numArray.length - 1; i < j; i++, j--) {
    numVar += numArray[i] * numArray[j];
  }
  if (numVar !== 1 * 8 + 2 * 7 + 3 * 6 + 4 * 5) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 1 * 8 + 2 * 7 + 3 * 6 + 4 * 5');
  }
}

export function ExpressionTest0865() {
  const TAG = 'ExpressionTest0865';
  let boolVar: boolean = false;
  let strArray: string[] = ["Apple", "Banana", "apple", "Cherry"];
  const target: string = "apple";
  for (let i = 0; i < strArray.length; i++) {
    if (strArray[i].toLowerCase() === target) {
      boolVar = true;
      break;
    }
  }
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0866() {
  const TAG = 'ExpressionTest0866';
  let numVar: number = 0;
  let numArray: number[] = [10, 20, 30, 40, 50, 60, 70, 80];
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < numArray.length; j++) {
      if (j % (i + 2) === 0) {
        numVar += numArray[j];
      }
    }
  }
  if (numVar !== (10 + 30 + 50 + 70) + (10 + 40 + 70)) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected (10 + 30 + 50 + 70) + (10 + 40 + 70)');
  }
}

export function ExpressionTest0867() {
  const TAG = 'ExpressionTest0867';
  let numVar: number = 0;
  let mixedArray: (number | string | boolean)[] = [0, "", 5];
  const defaultValue: number = 10;
  let e: Error | undefined;
  try {
    for (let i = 0; i < mixedArray.length; i++) {
      numVar += (mixedArray[i] as number) ?? defaultValue;
    }
  } catch (err) {
    e = err;
  }
  if (e && e.name !== "ClassCastError") {
    console.info(`${TAG} Task execution failed: e.name: ${e.name}`);
    throw new Error('e.name check failed, expected ClassCastError');
  }
}

export function ExpressionTest0868() {
  const TAG = 'ExpressionTest0868';
  let numVar: number = 0;
  let numArray: number[] = [25, -10, 15, -5];
  for (let i = 0; i < numArray.length; i += 2) {
    numVar += numArray[i] & numArray[i + 1];
  }
  if (numVar !== (25 & -10) + (15 & -5)) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected (25 & -10) + (15 & -5)');
  }
}

export function ExpressionTest0869() {
  const TAG = 'ExpressionTest0869';
  let numVar: int = 3;
  let strVar: string;
  let strArray: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
  const index: int = (numVar * 2) - 1;
  strVar = strArray[index];
  if (strVar !== "f") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected f');
  }
}

export function ExpressionTest0871() {
  const TAG = 'ExpressionTest0871';
  let numVar: int = 32;
  let numArray: int[] = [10, 20, 30, 40, 50, 60, 70, 80];
  const result: int = numArray[numVar >> 3];
  if (result !== 50) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 50');
  }
}

export function ExpressionTest0872() {
  const TAG = 'ExpressionTest0872';
  let strVar: string = "";
  let numArray: number[] = [17, 5, 23, 7, 31, 3];
  for (let i = 0; i < numArray.length; i += 2) {
    strVar += numArray[i] + " mod " + numArray[i + 1] + " = " + (numArray[i] % numArray[i + 1]) + ", ";
  }
  if (strVar !== "17 mod 5 = 2, 23 mod 7 = 2, 31 mod 3 = 1, ") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected 17 mod 5 = 2, 23 mod 7 = 2, 31 mod 3 = 1, ');
  }
}

export function ExpressionTest0873() {
  const TAG = 'ExpressionTest0873';
  let numArray: number[] = [15, 4, 3];
  const result1: number = numArray[0] / numArray[1] + numArray[2];
  const result2: number = numArray[0] / (numArray[1] + numArray[2]);
  if (result1 !== 3.75 + 3) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 3.75 + 3');
  }

  if (result2 !== 15.0 / 7.0) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 15.0 / 7.0');
  }
}

export function ExpressionTest0874() {
  const TAG = 'ExpressionTest0874';
  let strVar: string;
  let numArray: int[] = [8, 3, 5, 2];
  const i: int = 0;
  const j: int = 2;
  strVar =
    `arr[${i}] + arr[${j}] = ${numArray[i] + numArray[j]}, (arr[${i}] - arr[1]) * arr[${j}] = ${(numArray[i] -
    numArray[1]) * numArray[j]}`;
  if (strVar !== "arr[0] + arr[2] = 13, (arr[0] - arr[1]) * arr[2] = 25") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected arr[0] + arr[2] = 13, (arr[0] - arr[1]) * arr[2] = 25');
  }
}

export function ExpressionTest0875() {
  const TAG = 'ExpressionTest0875';
  let numVar: int;
  let numArray: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const start: int = 1;
  const count: int = 2;
  const subArray: int[] = numArray.slice(start, start + count * 2);
  numVar = 0;
  for (let i = 0; i < subArray.length; i++) {
    numVar += subArray[i];
  }
  if (numVar !== 2 + 3 + 4 + 5) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2 + 3 + 4 + 5');
  }
}

export function ExpressionTest0876() {
  const TAG = 'ExpressionTest0876';
  let strVar: string;
  let strArray: string[] = ["23", "17"];
  strVar = `+${strArray[0]} - +${strArray[1]} = ${+Number(strArray[0]) - +Number(strArray[1])}`;
  if (strVar !== "+23 - +17 = 6") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected +23 - +17 = 6');
  }
}

export function ExpressionTest0877() {
  const TAG = 'ExpressionTest0877';
  let boolVar: boolean;
  let numArray: number[] = [9, 4];
  boolVar = ~numArray[0] < ~numArray[1];
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0878() {
  const TAG = 'ExpressionTest0878';
  let numVar: number;
  numVar = 240;
  numVar /= 2;
  numVar += 30;
  numVar /= 5;
  numVar *= 3;
  if (numVar !== 90) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 90');
  }
}

export function ExpressionTest0879() {
  const TAG = 'ExpressionTest0879';
  let numArray: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  let filtered: int[] = [];
  for (let i: int = 0; i < numArray.length; i++) {
    if ((numArray[i] % 2 === 0 || numArray[i] > 10) && numArray[i] % 3 !== 0) {
      filtered.push(numArray[i]);
    }
  }
  if (JSON.stringify(filtered) !== JSON.stringify([2, 4, 8, 10, 11, 13, 14])) {
    console.info(`${TAG} Task execution failed: filtered: ${filtered}`);
    throw new Error('filtered does not deeply equal [2, 4, 8, 10, 11, 13, 14]');
  }
}

export function ExpressionTest0880() {
  const TAG = 'ExpressionTest0880';
  let numArray: int[] = [29, 37, 43, 53];
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] % 4 === 1 && numArray[i] % 5 === 2) {
      numVar = numArray[i];
      break;
    }
  }
  if (numVar !== 37) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 37');
  }
}

export function ExpressionTest0881() {
  const TAG = 'ExpressionTest0881';
  let strArray: string[] = ["elephant", "cat", "giraffe", "dog"];
  let numVar: int = 0;
  let strVar: string = "";
  while (numVar < strArray.length) {
    strVar += strArray[numVar] + " has " + strArray[numVar].length + " letters, ";
    numVar++;
  }
  if (strVar !== "elephant has 8 letters, cat has 3 letters, giraffe has 7 letters, dog has 3 letters, ") {
    throw new Error('strVar check failed');
  }

}

export function ExpressionTest0882() {
  const TAG = 'ExpressionTest0882';
  let numArray: number[] = [5, 3, 125];
  let boolVar: boolean = numArray[0]**numArray[1] === numArray[2];
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0883() {
  const TAG = 'ExpressionTest0883';
  let numArray: number[] = [3.14, 2.71, 1.618, 0.577];
  let strVar: string = `Max: ${Math.max(...numArray)}, Floor of first: ${Math.floor(numArray[0])}`;
  if (strVar !== "Max: 3.14, Floor of first: 3") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Max: 3.14, Floor of first: 3');
  }
}

export function ExpressionTest0884() {
  const TAG = 'ExpressionTest0884';
  let numArray: number[] = [1, 2, 3, 4, 5];
  let boolVar: boolean = (numArray.length & 1) === 1;

  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
  numArray.push(6);
  boolVar = (numArray.length & 1) === 1;
  if (boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not false');
  }
}

export function ExpressionTest0885() {
  const TAG = 'ExpressionTest0885';
  let strArray: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
  let numVar: int = 6 ^ 3;
  let strVar: string = strArray[numVar];
  if (strVar !== "five") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected five');
  }
}

export function ExpressionTest0886() {
  const TAG = 'ExpressionTest0886';
  let numArray: number[] = [4, 8, 12, 16, 20];
  let numVar: int = 2;
  let strVar: string = `arr[${numVar}] = ${numArray[numVar]}, arr[${numVar}] / 2 = ${numArray[numVar] / 2}`;
  if (strVar !== "arr[2] = 12, arr[2] / 2 = 6") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected arr[2] = 12, arr[2] / 2 = 6');
  }
}

export function ExpressionTest0887() {
  const TAG = 'ExpressionTest0887';
  let numArray: number[] = [10, 20, 30, 40];
  let numVar: number = 3;
  let boolVar: boolean = numArray.length > numVar * 2;
  if (boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not false');
  }
}

export function ExpressionTest0888() {
  const TAG = 'ExpressionTest0888';
  let numArray: int[] = [5, 15, 25, 35, 45, 55];
  let numVar: int = 30;
  let strVar: string = "Numbers greater than " + numVar + ": ";
  let first: boolean = true;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] > numVar) {
      strVar += (first ? "" : ", ") + numArray[i];
      first = false;
    }
  }
  if (strVar !== "Numbers greater than 30: 35, 45, 55") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Numbers greater than 30: 35, 45, 55');
  }
}

export function ExpressionTest0889() {
  const TAG = 'ExpressionTest0889';
  let numArray: int[] = [12, 22, 32, 42];
  let numVar: int = 0;
  const min: int = 15;
  const max: int = 40;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] >= min && numArray[i] <= max) {
      numVar++;
    }
  }
  if (numVar !== 2) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2');
  }
}

export function ExpressionTest0890() {
  const TAG = 'ExpressionTest0890';
  let numArray: number[] = [1, 2, 3, 4, 5, 6];
  let numVar: number = (numArray.length + 2) | 0x0F;
  if (numVar !== 15) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 15');
  }
}

export function ExpressionTest0891() {
  const TAG = 'ExpressionTest0891';
  let numArray: int[] = [75, 85, 95, 65, 55];
  let strVar: string = "";
  for (let i: int = 0; i < numArray.length; i++) {
    strVar += numArray[i] >= 90 ? "A " :
      numArray[i] >= 80 ? "B " :
        numArray[i] >= 70 ? "C " :
          numArray[i] >= 60 ? "D " : "F ";
  }
  if (strVar !== "C B A D F ") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected C B A D F ');
  }
}

export function ExpressionTest0892() {
  const TAG = 'ExpressionTest0892';
  let numArray: int[] = [1, 2, 3, 4, 5];
  let transformed: int[] = [];
  let i: int, factor: int;
  for (i = 0, factor = 1; i < numArray.length; i++, factor *= 2) {
    transformed.push(numArray[i] * factor);
  }
  if (JSON.stringify(transformed) !== JSON.stringify([1 * 1, 2 * 2, 3 * 4, 4 * 8, 5 * 16])) {
    console.info(`${TAG} Task execution failed: transformed: ${transformed}`);
    throw new Error('transformed does not deeply equal [1 * 1, 2 * 2, 3 * 4, 4 * 8, 5 * 16]');
  }
}

export function ExpressionTest0893() {
  const TAG = 'ExpressionTest0893';
  let strArray: string[] = ["apple", "banana", "cherry", "date"];
  let strVar: string = "cherry";
  let boolVar: boolean = false;
  for (let i: int = 0; i < strArray.length; i++) {
    if (strArray[i] === strVar && strArray[i].length === strVar.length) {
      boolVar = true;
      break;
    }
  }
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0894() {
  const TAG = 'ExpressionTest0894';
  let numArray: number[] = [6, 4, 9, 3];
  let numVar: number = ~numArray[0] + (-numArray[1]) * numArray[2] - +numArray[3];
  if (numVar !== -46) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected -46');
  }
}

export function ExpressionTest0895() {
  const TAG = 'ExpressionTest0895';
  let numArray: int[] = [0b1010, 0b0110, 0b1100, 0b0011];
  let mask: int = 0b1000;
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    if ((numArray[i] & mask) !== 0) {
      numVar += numArray[i] >> 3;
    }
  }
  if (numVar !== 2) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2');
  }
}

export function ExpressionTest0896() {
  const TAG = 'ExpressionTest0896';
  let numArray: number[] = [];
  let numVar: number = 1;
  while (numVar <= 5) {
    numArray.push(numVar * numVar);
    numVar++;
  }
  const target: number[] = [1, 4, 9, 16, 25];
  if (JSON.stringify(numArray) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: numArray: ${numArray}`);
    throw new Error('numArray does not deeply equal target');
  }
}

export function ExpressionTest0897() {
  const TAG = 'ExpressionTest0897';
  let numArray: number[] = [18, 4, 6, 12];
  let boolVar: boolean = (numArray[0] / numArray[1]) > (numArray[2] * 2);
  if (boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not false');
  }
}

export function ExpressionTest0898() {
  const TAG = 'ExpressionTest0898';
  let numArray: int[] = [3, 6, 9, 12, 15, 18, 21, 24];
  let filtered: int[] = [];
  let i: int, divisor: int;
  for (i = 0, divisor = 2; i < numArray.length; i++, divisor++) {
    if (numArray[i] % divisor === 0) {
      filtered.push(numArray[i]);
    }
  }
  if (JSON.stringify(filtered) !== JSON.stringify([6])) {
    console.info(`${TAG} Task execution failed: filtered: ${filtered}`);
    throw new Error('filtered does not deeply equal [6]');
  }
}

export function ExpressionTest0899() {
  const TAG = 'ExpressionTest0899';
  let strArray: string[] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
  let numVar: int = 2;
  let strVar: string = strArray[numVar] + " comes after " + strArray[numVar - 1] +
    " and before " + strArray[numVar + 1];
  if (strVar !== "Mar comes after Feb and before Apr") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Mar comes after Feb and before Apr');
  }
}

export function ExpressionTest0900() {
  const TAG = 'ExpressionTest0900';
  let strArray: string[] = ["12.5", "3.2", "4.7"];
  let numVar: number = +Number(strArray[0]) * +Number(strArray[1]) - +Number(strArray[2]);
  if (Math.abs(numVar - (12.5 * 3.2) + 4.7) > 0.001) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}, expected: 12.5 * 3.2 - 4.7, delta: 0.001`);
    throw new Error('numVar is not close to 12.5 * 3.2 - 4.7 (within 0.001)');
  }
}

export function ExpressionTest0901() {
  const TAG = 'ExpressionTest0901';
  let numArray: int[] = [10, 20, 30, 40, 50];
  let numVar: int = 0;
  let i: int, addend: int;
  for (i = 0, addend = 1; i < numArray.length; i++, addend *= 2) {
    numVar += numArray[i] + addend;
  }
  if (numVar !== (10 + 1) + (20 + 2) + (30 + 4) + (40 + 8) + (50 + 16)) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected (10 + 1) + (20 + 2) + (30 + 4) + (40 + 8) + (50 + 16)');
  }
}

export function ExpressionTest0902() {
  const TAG = 'ExpressionTest0902';
  let numArray: int[] = [0, 1, -1, 0, 5];
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    if (!numArray[i]) {
      numVar++;
    }
  }
  if (numVar !== 2) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2');
  }
}

export function ExpressionTest0903() {
  const TAG = 'ExpressionTest0903';
  let numArray: int[] = [0b0011, 0b0101, 0b1001];
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    numVar |= numArray[i];
  }
  if (numVar !== 0b1111) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 0b1111');
  }
}

export function ExpressionTest0904() {
  const TAG = 'ExpressionTest0904';
  let numArray: number[] = [21, 13];
  let strVar: string = numArray[0] + " in binary is " + numArray[0].toString(2) +
    ", after XOR with " + numArray[1] + ": " + (numArray[0] ^ numArray[1]).toString(2);
  if (strVar !== "21 in binary is 10101, after XOR with 13: 11000") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected 21 in binary is 10101, after XOR with 13: 11000');
  }
}

export function ExpressionTest0905() {
  const TAG = 'ExpressionTest0905';
  let numArray: int[] = [5, -3, 0, 8, -2];
  let strVar: string = "";
  for (let i: int = 0; i < numArray.length; i++) {
    strVar += -numArray[i] > 0 ? "positive " : "non-positive ";
  }
  if (strVar !== "non-positive positive non-positive non-positive positive ") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected non-positive positive non-positive non-positive positive ');
  }
}
