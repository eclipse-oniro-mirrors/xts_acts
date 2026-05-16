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


interface GeneratedTypeLiteralInterface_4 {
  timeout?: number;
}

export function ExpressionTest0481() {
  const TAG = 'ExpressionTest0481';
  let result: string = "";
  for (let i = 1; i <= 5; i++) {
    result += i + (i % 2 === 0 ? " even " : " odd ");
  }
  if (result !== "1 odd 2 even 3 odd 4 even 5 odd ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 odd 2 even 3 odd 4 even 5 odd ');
  }
}

export function ExpressionTest0482() {
  const TAG = 'ExpressionTest0482';
  const num: number = 23;
  const result: string = num % 3 === 0 ? "Divisible by 3" :
    num % 3 === 1 ? "Remainder 1" : "Remainder 2";
  if (result !== "Remainder 2") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Remainder 2');
  }
}

export function ExpressionTest0483() {
  const TAG = 'ExpressionTest0483';
  const a: number = 12;
  const b: number = 5;
  const result: string = a + " & " + b + " = " + (a & b);
  if (result !== "12 & 5 = 4") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12 & 5 = 4');
  }
}

export function ExpressionTest0484() {
  const TAG = 'ExpressionTest0484';
  const num: number = 4;
  const result: boolean = ~num < -5;
  // ~4 = -5, so -5 < -5 is false
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0485() {
  const TAG = 'ExpressionTest0485';
  const a: number = 7;
  const b: number = 3;
  const c: number = 10;
  const result: string = `${a} > ${b}: ${a > b}, ${b} > ${c}: ${b > c}, both: ${a > b && b > c}`;
  if (result !== "7 > 3: true, 3 > 10: false, both: false") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 7 > 3: true, 3 > 10: false, both: false');
  }
}

export function ExpressionTest0486() {
  const TAG = 'ExpressionTest0486';
  const str: string = "Hello World";
  const result: number = str.length | 0x0F;
  // 11 | 15 = 15
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0487() {
  const TAG = 'ExpressionTest0487';
  const str: string = "abcdefghijklmno";
  const a: int = 2;
  const b: int = 4;
  const result: string = str[a + b];
  if (result !== "g") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected g');
  }
}

export function ExpressionTest0488() {
  const TAG = 'ExpressionTest0488';
  const a: int = 10;
  const b: int = 6;
  const result: string = `${a} XOR ${b} = ${a ^ b}`;
  if (result !== "10 XOR 6 = 12") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 XOR 6 = 12');
  }
}

export function ExpressionTest0489() {
  const TAG = 'ExpressionTest0489';
  const a: number = 8;
  const result: boolean = (a >> 1) === (a / 2);
  // 4 === 4 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0490() {
  const TAG = 'ExpressionTest0490';
  const str: string = "TypeScript";
  const result: string = "Checks: " +
    "Length>5=" + (str.length > 5) + ", " +
    "Starts='Type'=" + str.startsWith("Type") + ", " +
    "Ends='Script'=" + str.endsWith("Script");
  if (result !== "Checks: Length>5=true, Starts='Type'=true, Ends='Script'=true") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Checks: Length>5=true, Starts=\'Type\'=true, Ends=\'Script\'=true');
  }
}

export function ExpressionTest0491() {
  const TAG = 'ExpressionTest0491';
  const score: number = 75;
  const result: boolean = score >= 60 && score < 80;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0492() {
  const TAG = 'ExpressionTest0492';
  const str: string = "abcdef";
  const result: number = (str.length * 2) & 0x0F;
  // 12 & 15 = 12
  if (result !== 12) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12');
  }
}

export function ExpressionTest0493() {
  const TAG = 'ExpressionTest0493';
  const temp: number = 25;
  const result: string = temp > 30 ? "Hot" :
    temp > 20 ? "Warm" :
      temp > 10 ? "Cool" : "Cold";
  if (result !== "Warm") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Warm');
  }
}

export function ExpressionTest0494() {
  const TAG = 'ExpressionTest0494';
  let sumEven: number = 0;
  let sumOdd: number = 0;
  let i: number, isEven: boolean;
  for (i = 1, isEven = false; i <= 5; i++, isEven = !isEven) {
    if (isEven) {
      sumEven += i;
    } else {
      sumOdd += i;
    }
  }
  if (sumEven !== 6) {
    console.info(`${TAG} Task execution failed: sumEven: ${sumEven}`);
    throw new Error('sumEven check failed, expected 6');
  }

  if (sumOdd !== 9) {
    console.info(`${TAG} Task execution failed: sumOdd: ${sumOdd}`);
    throw new Error('sumOdd check failed, expected 9');
  }
}

export function ExpressionTest0495() {
  const TAG = 'ExpressionTest0495';
  const str1: string = "Hello";
  const str2: string = "HELLO";
  const result: boolean = str1.toLowerCase() === str2.toLowerCase();
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0496() {
  const TAG = 'ExpressionTest0496';
  let num: number = 5;
  const result: number = -num + +num * 2;
  // -5 + 5 * 2 = -5 + 10 = 5
  if (result !== 5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5');
  }
}

export function ExpressionTest0497() {
  const TAG = 'ExpressionTest0497';
  const flags: number = 0b1010;
  const result: string = (flags & 0b1000) ? "Flag A set" : "Flag A not set";
  if (result !== "Flag A set") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Flag A set');
  }
}

export function ExpressionTest0498() {
  const TAG = 'ExpressionTest0498';
  let result: string = "";
  let count: number = 0;
  while (count < 3) {
    result += "Iteration " + ++count + " ";
  }
  if (result !== "Iteration 1 Iteration 2 Iteration 3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Iteration 1 Iteration 2 Iteration 3 ');
  }
}

export function ExpressionTest0499() {
  const TAG = 'ExpressionTest0499';
  const a: number = 15;
  const b: number = 8;
  const result: boolean = (a ^ b) > (a & b);
  // 7 > 8 is false
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0500() {
  const TAG = 'ExpressionTest0500';
  let result: string = "";
  let i: number, prefix: string;
  for (i = 1, prefix = "step-"; i <= 3; i++, prefix = "step-") {
    result += prefix + i + " ";
  }
  if (result !== "step-1 step-2 step-3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected step-1 step-2 step-3 ');
  }
}

export function ExpressionTest0501() {
  const TAG = 'ExpressionTest0501';
  const str: string = "typescript";
  const result: string = str + (str.length > 5 && str.includes("type") ? " is valid" : " is invalid");
  if (result !== "typescript is valid") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected typescript is valid');
  }
}

export function ExpressionTest0502() {
  const TAG = 'ExpressionTest0502';
  let sum: number = 0;
  let value: string = "2";
  let numericValue: number = Number(value);
  for (let i = 0; i < 3; i++) {
    sum += numericValue;
    numericValue++; //
  }
  if (sum !== 9) {
    console.info(`${TAG} Task execution failed: sum: ${sum}`);
    throw new Error('sum check failed, expected 9');
  }
}

export function ExpressionTest0503() {
  const TAG = 'ExpressionTest0503';
  let result: number = 0;
  let i: number, mask: number;
  for (i = 0, mask = 1; i < 5; i++, mask = mask << 1) {
    result |= mask;
  }
  if (result !== 31) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 31');
  }
}

export function ExpressionTest0504() {
  const TAG = 'ExpressionTest0504';
  const str: string = "";
  const result: boolean = !!(str.length === 0);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0505() {
  const TAG = 'ExpressionTest0505';
  const a: number = 12;
  const b: number = 10;
  const result: boolean = (a ^ b) === 6;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0506() {
  const TAG = 'ExpressionTest0506';
  const num: number = 3;
  let result: string = "Number " + num + " is ";
  result += num > 5 ? "large" : num > 2 ? "medium" : "small";
  if (result !== "Number 3 is medium") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Number 3 is medium');
  }
}

export function ExpressionTest0507() {
  const TAG = 'ExpressionTest0507';
  const a: number = 5;
  const result: number = -(a >> 1);
  if (result !== -2) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -2');
  }
}

export function ExpressionTest0508() {
  const TAG = 'ExpressionTest0508';
  const str: string = "abcdefgh";
  let result: string = "";
  for (let i = 0; i < str.length; i += 2) {
    result += str[i];
  }
  if (result !== "aceg") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected aceg');
  }
}

export function ExpressionTest0509() {
  const TAG = 'ExpressionTest0509';
  const str: string = "hello";
  const num: number = 5;
  const result: boolean = str.length === num && num > 3;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0510() {
  const TAG = 'ExpressionTest0510';
  const str: string = "test";
  const num: number = 2;
  const result: boolean = str.length > 5 || num * 3 > 5;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0511() {
  const TAG = 'ExpressionTest0511';
  let flags: number = 0b0010;
  flags |= 0b1000; // Set bit 3
  flags |= 0b0100; // Set bit 2
  if (flags !== 0b1110) {
    console.info(`${TAG} Task execution failed: flags: ${flags}`);
    throw new Error('flags check failed, expected 0b1110');
  }
}

export function ExpressionTest0512() {
  const TAG = 'ExpressionTest0512';
  const x: number = 10;
  const y: number = 4;
  const result: string = `${x} / ${y} = ${x / y}, remainder ${x % y}`;
  if (result !== "10 / 4 = 2.5, remainder 2") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 / 4 = 2.5, remainder 2');
  }
}

export function ExpressionTest0513() {
  const TAG = 'ExpressionTest0513';
  let count: number = 3;
  const result: string = "Count: " + ++count + ", Next: " + ++count;
  if (result !== "Count: 4, Next: 5") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Count: 4, Next: 5');
  }

  if (count !== 5) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 5');
  }
}

export function ExpressionTest0514() {
  const TAG = 'ExpressionTest0514';
  let num: number = 8;
  const result: number = num-- - 2 + num--;
  // 8 - 2 + 7 = 13
  if (result !== 13) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 13');
  }

  if (num !== 6) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 6');
  }
}

export function ExpressionTest0515() {
  const TAG = 'ExpressionTest0515';
  const str: string = "abcdefgh";
  let result: string = "";
  let i: int, char1: string;
  let e: Error | undefined;
  try {
    for (i = 0, char1 = str[i]; i < str.length; i += 2, char1 = str[i]) {
      result += char1;
    }
  } catch (err) {
    e = err;
  }
  if (e && e.name !== "StringIndexOutOfBoundsError") {
    console.info(`${TAG} Task execution failed: e.name: ${e.name}`);
    throw new Error('e.name check failed, expected StringIndexOutOfBoundsError');
  }
}

export function ExpressionTest0516() {
  const TAG = 'ExpressionTest0516';
  const str1: string = "apple";
  const str2: string = "apricot";
  const result: boolean = str1 < str2 && str1.length < str2.length;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0517() {
  const TAG = 'ExpressionTest0517';
  let result: number = 0;
  for (let i = 1; i <= 10; i++) {
    if (i % 3 === 0) {
      result += i;
    }
  }
  if (result !== 3 + 6 + 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 3 + 6 + 9');
  }
}

export function ExpressionTest0518() {
  const TAG = 'ExpressionTest0518';
  const value: string | undefined = undefined;
  const fallback: string = "default";
  const result: string = "Value: " + (value ?? fallback);
  if (result !== "Value: default") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value: default');
  }
}

export function ExpressionTest0519() {
  const TAG = 'ExpressionTest0519';
  const a: number = -10;
  const b: number = -5;
  const result: boolean = (a | b) === -11;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0520() {
  const TAG = 'ExpressionTest0520';
  const str: string = "0123456789";
  let index: int = 2;
  index *= 2;
  const result: string = str[index] + str[index + 3];
  if (result !== "47") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 47');
  }
}

export function ExpressionTest0523() {
  const TAG = 'ExpressionTest0523';
  const a: number = 7;
  const result: boolean = (a << 2) === a * 4;
  // 28 === 28 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0524() {
  const TAG = 'ExpressionTest0524';
  const base: number = 5;
  const exp: number = 3;
  const result: string = base + " to the power of " + exp + " equals " + (base**exp);
  if (result !== "5 to the power of 3 equals 125") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 to the power of 3 equals 125');
  }
}

export function ExpressionTest0525() {
  const TAG = 'ExpressionTest0525';
  const a: number = 8;
  const b: number = 3;
  const c: number = 2;
  const result1: number = a / b * c;
  const result2: number = a / (b * c);
  if (Math.abs(result1 - 5.3333333) > 0.0000001) {
    console.info(`${TAG} Task execution failed: result1: ${result1}, expected: 5.3333333, delta: 0.0000001`);
    throw new Error('result1 is not close to 5.3333333 (within 0.0000001)');
  }

  if (Math.abs(result2 - 1.3333333) > 0.0000001) {
    console.info(`${TAG} Task execution failed: result2: ${result2}, expected: 1.3333333, delta: 0.0000001`);
    throw new Error('result2 is not close to 1.3333333 (within 0.0000001)');
  }
}

export function ExpressionTest0526() {
  const TAG = 'ExpressionTest0526';
  const a: number = 4;
  const b: number = 6;
  const result: string = `${a} + ${b} * 2 = ${a + b * 2}, (${a} + ${b}) * 2 = ${(a + b) * 2}`;
  if (result !== "4 + 6 * 2 = 16, (4 + 6) * 2 = 20") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 4 + 6 * 2 = 16, (4 + 6) * 2 = 20');
  }
}

export function ExpressionTest0527() {
  const TAG = 'ExpressionTest0527';
  const str: string = "abcdefghijklmno";
  const start: int = 3;
  const length: int = 5;
  const result: string = str.substring(start, start + length);
  if (result !== "defgh") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected defgh');
  }
}

export function ExpressionTest0528() {
  const TAG = 'ExpressionTest0528';
  const a: number = 10;
  const b: number = 4;
  const result: string = `-${a} + ${b} = ${-a + b}`;
  if (result !== "-10 + 4 = -6") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -10 + 4 = -6');
  }
}

export function ExpressionTest0529() {
  const TAG = 'ExpressionTest0529';
  const a: number = 6;
  const b: number = 3;
  const result: boolean = -a <= -b;
  // -6 <= -3 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0530() {
  const TAG = 'ExpressionTest0530';
  let num: number = 25;
  num %= 7; // 25 % 7 = 4
  num += 3; // 7
  num %= 5; // 2
  if (num !== 2) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 2');
  }
}

export function ExpressionTest0531() {
  const TAG = 'ExpressionTest0531';
  let result: string = "";
  for (let i = 0; i < 5; i++) {
    result += (i % 2 === 0 ? "even" : "odd") + i + " ";
  }
  if (result !== "even0 odd1 even2 odd3 even4 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected even0 odd1 even2 odd3 even4 ');
  }
}

export function ExpressionTest0532() {
  const TAG = 'ExpressionTest0532';
  const num: number = 37;
  const mod: number = 10;
  const result: string = num % mod === 0 ? "Multiple of 10" :
    "Last digit: " + (num % mod);
  if (result !== "Last digit: 7") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Last digit: 7');
  }
}

export function ExpressionTest0533() {
  const TAG = 'ExpressionTest0533';
  const a: number = 5;
  const b: number = 3;
  const result: string = a + " | " + b + " = " + (a | b);
  if (result !== "5 | 3 = 7") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 | 3 = 7');
  }
}

export function ExpressionTest0534() {
  const TAG = 'ExpressionTest0534';
  const num: number = 7;
  const result: boolean = ~num < -7;
  // ~7 = -8 < -7 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0535() {
  const TAG = 'ExpressionTest0535';
  const x: number = 5;
  const y: number = 10;
  const result: string = `${x} < ${y}: ${x < y}, ${x} * 2 >= ${y}: ${x * 2 >= y}, ${x} == ${y}: ${x === y}`;
  if (result !== "5 < 10: true, 5 * 2 >= 10: true, 5 == 10: false") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 < 10: true, 5 * 2 >= 10: true, 5 == 10: false');
  }
}

export function ExpressionTest0536() {
  const TAG = 'ExpressionTest0536';
  const str: string = "hello";
  const mask: number = 0x0F;
  const result: number = str.length ^ mask;
  // 5 ^ 15 = 10
  if (result !== 10) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10');
  }
}

export function ExpressionTest0537() {
  const TAG = 'ExpressionTest0537';
  const str: string = "0123456789abcdef";
  const shift: int = 2;
  const result: string = str[1 << shift];
  if (result !== "4") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 4');
  }
}

export function ExpressionTest0538() {
  const TAG = 'ExpressionTest0538';
  const a: number = 3;
  const b: number = 2;
  const result: string = `${a} << ${b} = ${a << b}, ${a} >> ${b} = ${a >> b}`;
  if (result !== "3 << 2 = 12, 3 >> 2 = 0") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 3 << 2 = 12, 3 >> 2 = 0');
  }
}

export function ExpressionTest0539() {
  const TAG = 'ExpressionTest0539';
  const a: number = 16;
  const b: number = 4;
  const result: boolean = (a >> 2) === b;
  // 16 >> 2 = 4
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0540() {
  const TAG = 'ExpressionTest0540';
  const temp: number = 22;
  const result: string = "Temperature " + temp + ": " +
    (temp > 30 ? "Hot" :
      temp > 20 ? "Warm" : "Cool");
  if (result !== "Temperature 22: Warm") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Temperature 22: Warm');
  }
}

export function ExpressionTest0541() {
  const TAG = 'ExpressionTest0541';
  const age: number = 25;
  const result: boolean = age >= 18 && age <= 30;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0542() {
  const TAG = 'ExpressionTest0542';
  const str: string = "abcdefghij";
  const result: number = (str.length + 2) & 0x0F;
  // 12 & 15 = 12
  if (result !== 12) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12');
  }
}

export function ExpressionTest0543() {
  const TAG = 'ExpressionTest0543';
  const score: number = 85;
  const result: string = score >= 90 ? "A" :
    score >= 80 ? "B" :
      score >= 70 ? "C" :
        score >= 60 ? "D" : "F";
  if (result !== "B") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected B');
  }
}

export function ExpressionTest0544() {
  const TAG = 'ExpressionTest0544';
  let sum: number = 0;
  let product: number = 1;
  let i: number, count: number;
  for (i = 1, count = 0; count < 4; i++, count++) {
    sum += i;
    product *= i;
  }
  if (sum !== 1 + 2 + 3 + 4) {
    console.info(`${TAG} Task execution failed: sum: ${sum}`);
    throw new Error('sum check failed, expected 1 + 2 + 3 + 4');
  }

  if (product !== 1 * 2 * 3 * 4) {
    console.info(`${TAG} Task execution failed: product: ${product}`);
    throw new Error('product check failed, expected 1 * 2 * 3 * 4');
  }
}

export function ExpressionTest0545() {
  const TAG = 'ExpressionTest0545';
  const str1: string = "HelloWorld";
  const str2: string = "helloworld";
  const result: boolean = str1.toUpperCase() === str2.toUpperCase();
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0546() {
  const TAG = 'ExpressionTest0546';
  let num: number = 10;
  const result: number = -num + (+num / 2);
  // -10 + 5 = -5
  if (result !== -5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -5');
  }
}

export function ExpressionTest0547() {
  const TAG = 'ExpressionTest0547';
  const flags: number = 0b1100;
  const result: string = (flags & 0b1000) ? "Flag 3 set" : "Flag 3 not set";
  if (result !== "Flag 3 set") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Flag 3 set');
  }
}

export function ExpressionTest0548() {
  const TAG = 'ExpressionTest0548';
  let result: string = "";
  let count: number = 1;
  while (count <= 3) {
    result += count++ + ". item ";
  }
  if (result !== "1. item 2. item 3. item ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1. item 2. item 3. item ');
  }
}

export function ExpressionTest0549() {
  const TAG = 'ExpressionTest0549';
  const a: number = 20;
  const b: number = 12;
  const result: boolean = (a & b) < (a ^ b);
  // 4 < 16 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0550() {
  const TAG = 'ExpressionTest0550';
  const base: string = "character_";
  let result: string = "";
  let i: int, current: string;
  for (i = 65, current = base + String.fromCharCode(i); i <= 67; i++, current = base + String.fromCharCode(i)) {
    result += current + " ";
  }
  if (result !== "character_A character_B character_C ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected character_A character_B character_C ');
  }
}

export function ExpressionTest0551() {
  const TAG = 'ExpressionTest0551';
  const str: string = "Hello";
  const num: number = 5;
  const result: string = str + (str.length === num && num > 3 ? " World" : "");
  if (result !== "Hello World") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello World');
  }
}

export function ExpressionTest0553() {
  const TAG = 'ExpressionTest0553';
  let result: number = 0;
  let i: number, value: number;
  for (i = 0, value = 1; i < 4; i++, value = value << 1 | 1) {
    result += value;
  }
  if (result !== 1 + 3 + 7 + 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 + 3 + 7 + 15');
  }
}

export function ExpressionTest0554() {
  const TAG = 'ExpressionTest0554';
  const a: number = 5;
  const b: number = 10;
  const result: boolean = !(a > b);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0555() {
  const TAG = 'ExpressionTest0555';
  const a: number = 14;
  const b: number = 7;
  const result: boolean = (a & b) === 6;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0556() {
  const TAG = 'ExpressionTest0556';
  const num: number = 17;
  let result: string = "Number " + num + " is ";
  result += num % 2 === 0 ? "even" : "odd";
  if (result !== "Number 17 is odd") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Number 17 is odd');
  }
}

export function ExpressionTest0557() {
  const TAG = 'ExpressionTest0557';
  const a: number = 5;
  const result: number = -~a;
  if (result !== 6) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 6');
  }
}

export function ExpressionTest0558() {
  const TAG = 'ExpressionTest0558';
  const str: string = "abcdefghijklmno";
  let result: string = "";
  for (let i = 0; i < str.length; i++) {
    if (i % 3 === 0) {
      result += str[i];
    }
  }
  if (result !== "adgjm") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected adgjm');
  }
}

export function ExpressionTest0559() {
  const TAG = 'ExpressionTest0559';
  const a: number = 15;
  const b: number = 20;
  const result: boolean = a > 10 && b > a && b < 25;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0560() {
  const TAG = 'ExpressionTest0560';
  const str: string = "example";
  const num: number = 3;
  const result: boolean = str.length > 10 || num > 5 || str.startsWith("ex");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0561() {
  const TAG = 'ExpressionTest0561';
  let value: number = 0b1010;
  value ^= 0b1100; // 0110
  value ^= 0b0101; // 0011
  if (value !== 0b0011) {
    console.info(`${TAG} Task execution failed: value: ${value}`);
    throw new Error('value check failed, expected 0b0011');
  }
}

export function ExpressionTest0562() {
  const TAG = 'ExpressionTest0562';
  const a: number = 10;
  const b: number = 3;
  const result: string = `${a} & ${b} = ${a & b}, ${a} | ${b} = ${a | b}`;
  if (result !== "10 & 3 = 2, 10 | 3 = 11") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 & 3 = 2, 10 | 3 = 11');
  }
}

export function ExpressionTest0563() {
  const TAG = 'ExpressionTest0563';
  let count: number = 5;
  const result: string = "Count: " + --count + ", Previous: " + --count;
  if (result !== "Count: 4, Previous: 3") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Count: 4, Previous: 3');
  }

  if (count !== 3) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 3');
  }
}

export function ExpressionTest0564() {
  const TAG = 'ExpressionTest0564';
  let num: number = 3;
  const result: number = num++ * 2 + num++;
  // 3 * 2 + 4 = 6 + 4 = 10
  if (result !== 10) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10');
  }

  if (num !== 5) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 5');
  }
}

export function ExpressionTest0565() {
  const TAG = 'ExpressionTest0565';
  const str: string = "abcdef";
  let result: string = "";
  let i: int, j: int;
  for (i = 0, j = str.length - 1; i < j; i++, j--) {
    result += str[i] + str[j];
  }
  if (result !== "afbecd") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected afbecd');
  }
}

export function ExpressionTest0566() {
  const TAG = 'ExpressionTest0566';
  const str1: string = "longer string";
  const str2: string = "short";
  const result: boolean = str1.length > str2.length && str1 > str2;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0567() {
  const TAG = 'ExpressionTest0567';
  const num: number = 37;
  const divisor: number = 5;
  const quotient: number = Math.floor(num / divisor);
  const remainder: number = num % divisor;
  const result: boolean = num === quotient * divisor + remainder;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0568() {
  const TAG = 'ExpressionTest0568';
  const value: number | null = null;
  const defaultValue: number = 42;
  const result: number = value ?? defaultValue;
  if (result !== 42) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 42');
  }
}

export function ExpressionTest0569() {
  const TAG = 'ExpressionTest0569';
  const a: number = -12;
  const b: number = -5;
  const result: number = a ^ b;
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0570() {
  const TAG = 'ExpressionTest0570';
  const str: string = "0123456789";
  let index: int = 5;
  index -= 2;
  const result: string = str[index] + str[index * 2];
  if (result !== "36") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 36');
  }
}

export function ExpressionTest0572() {
  const TAG = 'ExpressionTest0572';
  const items: string[] | null = ["first", "second", "third"];
  const result1: string | undefined = items?.[1];
  let e: Error | undefined;
  try {
    const result2: string | undefined = items?.[5];
  } catch (err) {
    e = err;
  }
  if (result1 !== "second") {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected second');
  }

  if (e && e.name !== "RangeError") {
    console.info(`${TAG} Task execution failed: e.name: ${e.name}`);
    throw new Error('e.name check failed, expected RangeError');
  }
}

export function ExpressionTest0573() {
  const TAG = 'ExpressionTest0573';
  const a: int = -16;
  const result: boolean = (a >>> 2) === 1073741820;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0574() {
  const TAG = 'ExpressionTest0574';
  const base: number = 10;
  const exp: number = 3;
  const result: string = base + " raised to " + exp + " is " + (base**exp);
  if (result !== "10 raised to 3 is 1000") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 raised to 3 is 1000');
  }
}

export function ExpressionTest0575() {
  const TAG = 'ExpressionTest0575';
  const a: number = 5;
  const b: number = 10;
  const c: number = 15;
  const result1: boolean = a < b && b < c;
  const result2: boolean = a < b && b > c;
  if (!result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not true');
  }

  if (result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not false');
  }
}

export function ExpressionTest0576() {
  const TAG = 'ExpressionTest0576';
  const x: number = 8;
  const y: number = 3;
  const result: string = `${x} > ${y}: ${x > y}, (${x} + ${y}) > 10: ${(x + y) > 10}`;
  if (result !== "8 > 3: true, (8 + 3) > 10: true") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 8 > 3: true, (8 + 3) > 10: true');
  }
}

export function ExpressionTest0577() {
  const TAG = 'ExpressionTest0577';
  const str: string = "abcdefghijklmno";
  const start: int = 2;
  const offset: int = 4;
  const result: string = str.slice(start, start + offset * 2);
  if (result !== "cdefghij") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected cdefghij');
  }
}

export function ExpressionTest0578() {
  const TAG = 'ExpressionTest0578';
  const a: number = 15;
  const b: number = 4;
  const result: string = `-${a} % ${b} = ${-a % b}`;
  if (result !== "-15 % 4 = -3") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -15 % 4 = -3');
  }
}

export function ExpressionTest0579() {
  const TAG = 'ExpressionTest0579';
  const a: number = 8;
  const b: number = 3;
  const result: boolean = +a >= -b * 3;
  // 8 >= -9 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0580() {
  const TAG = 'ExpressionTest0580';
  let num: number = 100;
  num /= 2; // 50
  num += 25; // 75
  num /= 3; // 25
  if (num !== 25) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 25');
  }
}

export function ExpressionTest0581() {
  const TAG = 'ExpressionTest0581';
  let result: string = "";
  for (let i = 1; i <= 10; i++) {
    if (i % 2 === 0 && i % 3 === 0) {
      result += i + " ";
    }
  }
  if (result !== "6 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 6 ');
  }
}

export function ExpressionTest0582() {
  const TAG = 'ExpressionTest0582';
  const num: number = 47;
  const mod: number = 10;
  const remainder: number = num % mod;
  const result: boolean = remainder >= 5;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0583() {
  const TAG = 'ExpressionTest0583';
  const a: number = 9;
  const b: number = 5;
  const result: string = a + " ^ " + b + " = " + (a ^ b);
  if (result !== "9 ^ 5 = 12") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9 ^ 5 = 12');
  }
}

export function ExpressionTest0584() {
  const TAG = 'ExpressionTest0584';
  const num: number = 10;
  const result: boolean = ~num <= -10;
  // ~10 = -11 <= -10 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0585() {
  const TAG = 'ExpressionTest0585';
  const a: number = 12;
  const b: number = 8;
  const result: string = `${a} > ${b}: ${a > b}, ${a} % 5 = ${a % 5}, ${b} * 2 = ${b * 2}`;
  if (result !== "12 > 8: true, 12 % 5 = 2, 8 * 2 = 16") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12 > 8: true, 12 % 5 = 2, 8 * 2 = 16');
  }
}

export function ExpressionTest0586() {
  const TAG = 'ExpressionTest0586';
  const str: string = "abcdefgh";
  const result: number = str.length << 1;
  // 8 << 1 = 16
  if (result !== 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 16');
  }
}

export function ExpressionTest0587() {
  const TAG = 'ExpressionTest0587';
  const str: string = "0123456789abcdef";
  const a: int = 3;
  const b: int = 1;
  const result: string = str[a << b];
  if (result !== "6") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 6');
  }
}

export function ExpressionTest0588() {
  const TAG = 'ExpressionTest0588';
  const a: number = 255;
  const b: number = 4;
  const result: string = `${a} >>> ${b} = ${a >>> b}`;
  if (result !== "255 >>> 4 = 15") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 255 >>> 4 = 15');
  }
}

export function ExpressionTest0589() {
  const TAG = 'ExpressionTest0589';
  const a: number = 24;
  const b: number = 3;
  const result: boolean = (a >> b) === 3;
  // 24 >> 3 = 3
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0590() {
  const TAG = 'ExpressionTest0590';
  const score: number = 72;
  const result: string = "Score " + score + ": " +
    (score >= 90 ? "A" :
      score >= 80 ? "B" :
        score >= 70 ? "C" : "F");
  if (result !== "Score 72: C") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Score 72: C');
  }
}

export function ExpressionTest0591() {
  const TAG = 'ExpressionTest0591';
  const value: number = 35;
  const result: boolean = value > 20 && value < 40;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0592() {
  const TAG = 'ExpressionTest0592';
  const str: string = "abcdefghijkl";
  const result: number = (str.length - 2) | 0x0F;
  // 10 | 15 = 15
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0593() {
  const TAG = 'ExpressionTest0593';
  const temperature: number = 15;
  const result: string = temperature > 25 ? "Hot" :
    temperature > 18 ? "Warm" :
      temperature > 10 ? "Cool" : "Cold";
  if (result !== "Cool") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Cool');
  }
}

export function ExpressionTest0594() {
  const TAG = 'ExpressionTest0594';
  let evenSum: number = 0;
  let oddSum: number = 0;
  let i: number, isOdd: boolean;
  for (i = 1, isOdd = true; i <= 10; i++, isOdd = !isOdd) {
    if (isOdd) {
      oddSum += i;
    } else {
      evenSum += i;
    }
  }
  if (oddSum !== 1 + 3 + 5 + 7 + 9) {
    console.info(`${TAG} Task execution failed: oddSum: ${oddSum}`);
    throw new Error('oddSum check failed, expected 1 + 3 + 5 + 7 + 9');
  }

  if (evenSum !== 2 + 4 + 6 + 8 + 10) {
    console.info(`${TAG} Task execution failed: evenSum: ${evenSum}`);
    throw new Error('evenSum check failed, expected 2 + 4 + 6 + 8 + 10');
  }
}

export function ExpressionTest0595() {
  const TAG = 'ExpressionTest0595';
  const str: string = "Hello World";
  const substr: string = "World";
  const result: boolean = str.substring(6) === substr;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0596() {
  const TAG = 'ExpressionTest0596';
  let num: number = 7;
  const result: number = ~num + (-num);
  // -8 + (-7) = -15
  if (result !== -15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -15');
  }
}

export function ExpressionTest0597() {
  const TAG = 'ExpressionTest0597';
  const value: number = 0b10110;
  const mask: number = 0b10000;
  const result: boolean = (value & mask) !== 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0598() {
  const TAG = 'ExpressionTest0598';
  let result: string = "";
  let count: number = 5;
  while (count > 2) {
    result += count-- + " ";
  }
  if (result !== "5 4 3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 4 3 ');
  }
}

export function ExpressionTest0599() {
  const TAG = 'ExpressionTest0599';
  const a: number = 18;
  const b: number = 7;
  const result: boolean = (a | b) > (a ^ b);
  // 23 > 13 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0600() {
  const TAG = 'ExpressionTest0600';
  const str: string = "HelloWorld";
  let result: string = "";
  for (let i = 0; i < str.length; i++) {
    let char1: string = str[i].toUpperCase();
    result += char1;
  }
  if (result !== "HELLOWORLD") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected HELLOWORLD');
  }
}

export function ExpressionTest0601() {
  const TAG = 'ExpressionTest0601';
  const str: string = "test";
  const result: string = str + (str.startsWith("t") || str.length > 5 ? " found" : " not found");
  if (result !== "test found") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected test found');
  }
}

export function ExpressionTest0602() {
  const TAG = 'ExpressionTest0602';
  const a: string = "5";
  const b: string = "3";
  const result: number = +parseInt(a, 10) * 2 - +parseInt(b);
  if (result !== 7) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 7');
  }
}

export function ExpressionTest0603() {
  const TAG = 'ExpressionTest0603';
  let result: number = 0;
  let i: number, mask: number;
  for (i = 0, mask = 0b1000; i < 4; i++, mask = mask >> 1) {
    result += mask;
  }
  if (result !== 8 + 4 + 2 + 1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 8 + 4 + 2 + 1');
  }
}

export function ExpressionTest0604() {
  const TAG = 'ExpressionTest0604';
  const str: string = "example";
  const result: boolean = !str.includes("xyz");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0605() {
  const TAG = 'ExpressionTest0605';
  const a: number = 5;
  const b: number = 3;
  const result: boolean = (a | b) === 7;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0606() {
  const TAG = 'ExpressionTest0606';
  const value: number = 45;
  let result: string = "Value " + value + " is ";
  result += value > 100 ? "large" :
    value > 50 ? "medium" :
      value > 20 ? "small" : "tiny";
  if (result !== "Value 45 is small") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value 45 is small');
  }
}

export function ExpressionTest0607() {
  const TAG = 'ExpressionTest0607';
  const a: number = 10;
  const b: number = 3;
  const result: number = -(a % b);
  if (result !== -1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -1');
  }
}

export function ExpressionTest0608() {
  const TAG = 'ExpressionTest0608';
  const str: string = "abcdefghijklmnop";
  let count: number = 0;
  for (let i = 0; i < str.length; i += 4) {
    count++;
  }
  if (count !== 4) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 4');
  }
}

export function ExpressionTest0609() {
  const TAG = 'ExpressionTest0609';
  const str: string = "Hello";
  const num: number = 5;
  const result: boolean = str.length === num && num % 2 === 1;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0610() {
  const TAG = 'ExpressionTest0610';
  const str: string = "example.com";
  const result: boolean = str.endsWith(".org") || str.includes(".com");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0611() {
  const TAG = 'ExpressionTest0611';
  let value: number = 0b1111;
  value &= 0b1010; // 0b1010
  value &= 0b1100; // 0b1000
  if (value !== 0b1000) {
    console.info(`${TAG} Task execution failed: value: ${value}`);
    throw new Error('value check failed, expected 0b1000');
  }
}

export function ExpressionTest0612() {
  const TAG = 'ExpressionTest0612';
  const a: number = 17;
  const b: number = 5;
  const result: string = `${a} divided by ${b} is ${Math.floor(a / b)} with remainder ${a % b}`;
  if (result !== "17 divided by 5 is 3 with remainder 2") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 17 divided by 5 is 3 with remainder 2');
  }
}

export function ExpressionTest0613() {
  const TAG = 'ExpressionTest0613';
  let num: number = 4;
  const result: number = ++num * 2 + ++num;
  // 5 * 2 + 6 = 10 + 6 = 16
  if (result !== 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 16');
  }

  if (num !== 6) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 6');
  }
}

export function ExpressionTest0614() {
  const TAG = 'ExpressionTest0614';
  let num: number = 9;
  const result: number = num-- - 3 + num--;
  // 9 - 3 + 8 = 14
  if (result !== 14) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 14');
  }

  if (num !== 7) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 7');
  }
}

export function ExpressionTest0615() {
  const TAG = 'ExpressionTest0615';
  const str: string = "abcdefghij";
  let result: string = "";
  let i: int, step: int;
  for (i = 0, step = 1; i < str.length; i += step, step++) {
    result += str[i];
  }
  if (result !== "abdg") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected abdg');
  }
}

export function ExpressionTest0616() {
  const TAG = 'ExpressionTest0616';
  const str1: string = "Apple";
  const str2: string = "apple";
  const result: boolean = str1 === str2;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0617() {
  const TAG = 'ExpressionTest0617';
  let result: string = "";
  for (let i = 1; i <= 7; i++) {
    result += i % 3 === 0 ? "Fizz" : i + " ";
  }
  if (result !== "1 2 Fizz4 5 Fizz7 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 2 Fizz4 5 Fizz7 ');
  }
}

export function ExpressionTest0618() {
  const TAG = 'ExpressionTest0618';
  const name: string | undefined = undefined;
  const defaultName: string = "Guest";
  const result: string = name ?? defaultName;
  if (result !== "Guest") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Guest');
  }
}

export function ExpressionTest0619() {
  const TAG = 'ExpressionTest0619';
  const a: number = -7;
  const b: number = -3;
  const result: number = a & b;
  if (result !== (-7 & -3)) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -7 & -3');
  }
}

export function ExpressionTest0620() {
  const TAG = 'ExpressionTest0620';
  const str: string = "0123456789abcdef";
  let index: int = 2;
  index = index * 2 + 1;
  const result: string = str[index];
  if (result !== "5") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5');
  }
}

export function ExpressionTest0622() {
  const TAG = 'ExpressionTest0622';
  const str: string | null = "Hello";
  const result1: int | undefined = str?.length;
  const result2: string | undefined = str?.toUpperCase();
  if (result1 !== 5) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 5');
  }

  if (result2 !== "HELLO") {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected HELLO');
  }
}

export function ExpressionTest0623() {
  const TAG = 'ExpressionTest0623';
  const a: number = 5;
  const result: boolean = (a << 2) === 20;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0624() {
  const TAG = 'ExpressionTest0624';
  const base: number = 2;
  const exp: number = 10;
  const result: string = base + "^" + exp + " = " + (base**exp);
  if (result !== "2^10 = 1024") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 2^10 = 1024');
  }
}

export function ExpressionTest0625() {
  const TAG = 'ExpressionTest0625';
  const a: number = 10;
  const b: number = 2;
  const c: number = 3;
  const result1: number = a / b + c;
  const result2: number = a / (b + c);
  if (result1 !== 8) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 8');
  }

  if (result2 !== 2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 2');
  }
}

export function ExpressionTest0626() {
  const TAG = 'ExpressionTest0626';
  const x: number = 6;
  const y: number = 4;
  const result: string = `${x} - ${y} = ${x - y}, ${x} - ${y / 2} = ${x - y / 2}`;
  if (result !== "6 - 4 = 2, 6 - 2 = 4") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 6 - 4 = 2, 6 - 2 = 4');
  }
}

export function ExpressionTest0627() {
  const TAG = 'ExpressionTest0627';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const position: int = 3;
  const result: char = str.charAt(position + 5);
  const expectedChar: char = c'i';
  if (result !== expectedChar) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected i');
  }
}

export function ExpressionTest0628() {
  const TAG = 'ExpressionTest0628';
  const a: number = 3;
  const b: number = 2;
  const result: string = `-${a}^${b} = ${-(a**b)}`;
  if (result !== "-3^2 = -9") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -3^2 = -9');
  }
}

export function ExpressionTest0629() {
  const TAG = 'ExpressionTest0629';
  const a: number = 5;
  const b: number = 10;
  const result: boolean = -a > -b;
  // -5 > -10 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0630() {
  const TAG = 'ExpressionTest0630';
  let num: number = 3;
  num *= 2; // 6
  num += 4; // 10
  num *= 3; // 30
  if (num !== 30) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 30');
  }
}

export function ExpressionTest0631() {
  const TAG = 'ExpressionTest0631';
  let result: string = "";
  const str: string = "abcdefghij";
  for (let i = 0; i < str.length; i++) {
    if (i % 2 === 0 || i > 7) {
      result += str[i];
    }
  }
  if (result !== "acegij") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected acegij');
  }
}

export function ExpressionTest0632() {
  const TAG = 'ExpressionTest0632';
  const num: number = 27;
  const mod: number = 4;
  let result: string = "";
  if (num % mod === 0) {
    result = "Divisible";
  } else {
    result = "Remainder: " + (num % mod);
  }
  if (result !== "Remainder: 3") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Remainder: 3');
  }
}

export function ExpressionTest0633() {
  const TAG = 'ExpressionTest0633';
  const a: number = 14;
  const b: number = 5;
  const result: string = a + " | " + b + " = " + (a | b);
  if (result !== "14 | 5 = 15") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 14 | 5 = 15');
  }
}

export function ExpressionTest0634() {
  const TAG = 'ExpressionTest0634';
  const num: number = 3;
  const result: boolean = ~num === -4;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0635() {
  const TAG = 'ExpressionTest0635';
  const a: number = 7;
  const b: number = 9;
  const result: string = `${a} < ${b}: ${a < b}, ${a} * 2 > ${b}: ${a * 2 > b}, ${a} + ${b} = ${a + b}`;
  if (result !== "7 < 9: true, 7 * 2 > 9: true, 7 + 9 = 16") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 7 < 9: true, 7 * 2 > 9: true, 7 + 9 = 16');
  }
}

export function ExpressionTest0636() {
  const TAG = 'ExpressionTest0636';
  const str: string = "abcdef";
  const result: number = str.length ^ 0x0F;
  // 6 ^ 15 = 9
  if (result !== 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9');
  }
}

export function ExpressionTest0637() {
  const TAG = 'ExpressionTest0637';
  const str: string = "0123456789";
  const a: int = 5;
  const b: int = 3;
  const result: string = str[a & b];
  if (result !== "1") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1');
  }
}

export function ExpressionTest0638() {
  const TAG = 'ExpressionTest0638';
  const a: number = 12;
  const b: number = 5;
  const result: string = `${a} & ${b} = ${a & b}, ${a} ^ ${b} = ${a ^ b}`;
  if (result !== "12 & 5 = 4, 12 ^ 5 = 9") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12 & 5 = 4, 12 ^ 5 = 9');
  }
}

export function ExpressionTest0639() {
  const TAG = 'ExpressionTest0639';
  const a: number = 18;
  const b: number = 2;
  const result: boolean = (a >> b) === 4;
  // 18 >> 2 = 4
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0640() {
  const TAG = 'ExpressionTest0640';
  const value: number = 0;
  const result: string = "Value " + value + ": " +
    (value > 0 ? "Positive" :
      value < 0 ? "Negative" : "Zero");
  if (result !== "Value 0: Zero") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value 0: Zero');
  }
}

export function ExpressionTest0641() {
  const TAG = 'ExpressionTest0641';
  const score: number = 55;
  const result: boolean = score >= 50 && score < 60;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0642() {
  const TAG = 'ExpressionTest0642';
  const str: string = "abcdefghijklmnop";
  const result: number = (str.length / 2) << 1;
  // 8 << 1 = 16
  if (result !== 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 16');
  }
}

export function ExpressionTest0643() {
  const TAG = 'ExpressionTest0643';
  const hour: number = 14;
  const result: string = hour < 12 ? "Morning" :
    hour < 18 ? "Afternoon" :
      hour < 22 ? "Evening" : "Night";
  if (result !== "Afternoon") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Afternoon');
  }
}

export function ExpressionTest0644() {
  const TAG = 'ExpressionTest0644';
  let result: string = "";
  let i: number, j: number;
  for (i = 1, j = 10; i <= 3; i++, j -= 3) {
    result += i * j + " ";
  }
  if (result !== "10 14 12 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10 14 12 ');
  }
}

export function ExpressionTest0645() {
  const TAG = 'ExpressionTest0645';
  const str: string = "Hello World";
  const result: boolean = str.substring(0, 5) === "Hello";
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0646() {
  const TAG = 'ExpressionTest0646';
  let num: number = 6;
  const result: number = ~num + (-num);
  // -7 + (-6) = -13
  if (result !== -13) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -13');
  }
}

export function ExpressionTest0647() {
  const TAG = 'ExpressionTest0647';
  const value: number = 0b1010;
  const mask: number = 0b0101;
  const result: boolean = (value & mask) === 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0648() {
  const TAG = 'ExpressionTest0648';
  let result: string = "";
  let count: number = 0;
  do {
    result += count++ + " ";
  } while (count < 4);
  if (result !== "0 1 2 3 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0 1 2 3 ');
  }
}

export function ExpressionTest0649() {
  const TAG = 'ExpressionTest0649';
  const a: number = 9;
  const b: number = 12;
  const result: boolean = (a & b) < (a | b);
  // 8 < 13 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0650() {
  const TAG = 'ExpressionTest0650';
  const str: string = "abcdefgh";
  let result: string = "";
  let i: int, chunk: string;
  for (i = 0, chunk = str.substring(i, i + 2); i < str.length; i += 2, chunk = str.substring(i, i + 2)) {
    result += chunk + "|";
  }
  if (result !== "ab|cd|ef|gh|") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected ab|cd|ef|gh|');
  }
}

export function ExpressionTest0651() {
  const TAG = 'ExpressionTest0651';
  const str: string = "TypeScript";
  const result: string = str + (str.startsWith("Type") && str.length > 5 ? " is valid" : " is invalid");
  if (result !== "TypeScript is valid") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected TypeScript is valid');
  }
}

export function ExpressionTest0652() {
  const TAG = 'ExpressionTest0652';
  const a: string = "15";
  const b: string = "7";
  const result: number = +Number(a) - +Number(b) * 2;
  if (result !== 1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1');
  }
}

export function ExpressionTest0653() {
  const TAG = 'ExpressionTest0653';
  let result: number = 0;
  let i: number, value: number;
  for (i = 0, value = 1; i < 5; i++, value = value << 1) {
    result += value;
  }
  if (result !== 1 + 2 + 4 + 8 + 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 + 2 + 4 + 8 + 16');
  }
}

export function ExpressionTest0654() {
  const TAG = 'ExpressionTest0654';
  const str: string = "test";
  const result: boolean = !(str.length > 5);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0655() {
  const TAG = 'ExpressionTest0655';
  const a: number = 13;
  const b: number = 7;
  const result: boolean = (a ^ b) === 10;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0656() {
  const TAG = 'ExpressionTest0656';
  const value: number = 23;
  let result: string = "Value " + value + " is ";
  result += value > 50 ? "large" : value > 20 ? "medium" : "small";
  if (result !== "Value 23 is medium") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value 23 is medium');
  }
}

export function ExpressionTest0657() {
  const TAG = 'ExpressionTest0657';
  const a: number = 8;
  const result: number = -(a >> 1);
  if (result !== -4) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -4');
  }
}

export function ExpressionTest0658() {
  const TAG = 'ExpressionTest0658';
  const str: string = "abcdefghijklmno";
  let count: number = 0;
  for (let i = 0; i < str.length; i++) {
    if (i % 4 === 0) {
      count++;
    }
  }
  if (count !== 4) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 4');
  }
}

export function ExpressionTest0659() {
  const TAG = 'ExpressionTest0659';
  const a: number = 12;
  const b: number = 8;
  const result: boolean = a > 10 && b < 10 && a > b;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0660() {
  const TAG = 'ExpressionTest0660';
  const str: string = "example";
  const num: number = 4;
  const result: boolean = str.length > 8 || num > 5 || str.endsWith("ple");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0661() {
  const TAG = 'ExpressionTest0661';
  let value: number = 0b0010;
  value |= 0b0100; // 0b0110
  value |= 0b1000; // 0b1110
  if (value !== 0b1110) {
    console.info(`${TAG} Task execution failed: value: ${value}`);
    throw new Error('value check failed, expected 0b1110');
  }
}

export function ExpressionTest0662() {
  const TAG = 'ExpressionTest0662';
  const a: number = 25;
  const b: number = 4;
  const result: string = `${a} / ${b} = ${a / b}, floor = ${Math.floor(a / b)}`;
  if (result !== "25 / 4 = 6.25, floor = 6") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 25 / 4 = 6.25, floor = 6');
  }
}

export function ExpressionTest0663() {
  const TAG = 'ExpressionTest0663';
  let num: number = 3;
  const result: number = ++num * 3 - ++num;
  // 4 * 3 - 5 = 12 - 5 = 7
  if (result !== 7) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 7');
  }

  if (num !== 5) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 5');
  }
}

export function ExpressionTest0664() {
  const TAG = 'ExpressionTest0664';
  let num: number = 10;
  const firstPart: number = (num--) / 2;
  const secondPart: number = num--;
  const result: number = firstPart + secondPart;
  if (result !== 14) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 14');
  }

  if (num !== 8) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 8');
  }
}

export function ExpressionTest0665() {
  const TAG = 'ExpressionTest0665';
  const str: string = "0123456789";
  let result: string = "";
  let i: int, step: int;
  for (i = 0, step = 2; i < str.length; i += step, step = step < 4 ? step + 1 : 2) {
    result += str[i];
  }
  if (result !== "0259") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0259');
  }
}

export function ExpressionTest0666() {
  const TAG = 'ExpressionTest0666';
  const str1: string = "Hello";
  const str2: string = "HELLO";
  const result: boolean = str1.toLowerCase() === str2.toLowerCase();
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0667() {
  const TAG = 'ExpressionTest0667';
  let result: number = 0;
  for (let i = 1; i <= 15; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      result += i;
    }
  }
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0668() {
  const TAG = 'ExpressionTest0668';
  const configValue: number | null = null;
  const defaultValue: number = 100;
  const result: number = configValue ?? defaultValue;
  if (result !== 100) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 100');
  }
}

export function ExpressionTest0669() {
  const TAG = 'ExpressionTest0669';
  const a: number = -15;
  const b: number = -7;
  const result: number = a | b;
  if (result !== -7) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -7');
  }
}

export function ExpressionTest0670() {
  const TAG = 'ExpressionTest0670';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  let index: int = 2;
  index = index * 3 + 1;
  const result: string = str[index];
  if (result !== "h") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected h');
  }
}

export function ExpressionTest0673() {
  const TAG = 'ExpressionTest0673';
  const a: number = 7;
  const result: boolean = (a << 3) === 56;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0674() {
  const TAG = 'ExpressionTest0674';
  const base: number = 5;
  const exp: number = 3;
  const result: string = base + " to the power of " + exp + " is " + (base**exp);
  if (result !== "5 to the power of 3 is 125") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5 to the power of 3 is 125');
  }
}

export function ExpressionTest0675() {
  const TAG = 'ExpressionTest0675';
  const a: number = 10;
  const b: number = 3;
  const c: number = 2;
  const result1: number = a - b * c;
  const result2: number = (a - b) * c;
  if (result1 !== 4) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 4');
  }

  if (result2 !== 14) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 14');
  }
}

export function ExpressionTest0676() {
  const TAG = 'ExpressionTest0676';
  const x: number = 9;
  const y: number = 4;
  const result: string = `${x} + ${y} * 2 = ${x + y * 2}, (${x} + ${y}) * 2 = ${(x + y) * 2}`;
  if (result !== "9 + 4 * 2 = 17, (9 + 4) * 2 = 26") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9 + 4 * 2 = 17, (9 + 4) * 2 = 26');
  }
}

export function ExpressionTest0677() {
  const TAG = 'ExpressionTest0677';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const start: int = 5;
  const length: int = 3;
  const result: string = str.substr(start, length * 2);
  if (result !== "fghijk") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected fghijk');
  }
}

export function ExpressionTest0678() {
  const TAG = 'ExpressionTest0678';
  const a: number = 12;
  const b: number = 5;
  const result: string = `-${a} + ${b} = ${-a + b}`;
  if (result !== "-12 + 5 = -7") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -12 + 5 = -7');
  }
}

export function ExpressionTest0679() {
  const TAG = 'ExpressionTest0679';
  const a: number = 6;
  const b: number = 4;
  const result: boolean = +a > -b * 2;
  // 6 > -8 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0680() {
  const TAG = 'ExpressionTest0680';
  let num: number = 5;
  num += 3; // 8
  num *= 2; // 16
  num -= 4; // 12
  if (num !== 12) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 12');
  }
}

export function ExpressionTest0681() {
  const TAG = 'ExpressionTest0681';
  let result: string = "";
  const str: string = "abcdefghijklmno";
  for (let i = 0; i < str.length; i++) {
    if (i > 5 && i < 10) {
      result += str[i];
    }
  }
  if (result !== "ghij") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected ghij');
  }
}

export function ExpressionTest0682() {
  const TAG = 'ExpressionTest0682';
  const num: number = 38;
  const mod: number = 7;
  const remainder: number = num % mod;
  const result: boolean = remainder >= 3 && remainder <= 5;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0683() {
  const TAG = 'ExpressionTest0683';
  const a: number = 11;
  const b: number = 5;
  const result: string = a + " & " + b + " = " + (a & b);
  if (result !== "11 & 5 = 1") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 11 & 5 = 1');
  }
}

export function ExpressionTest0684() {
  const TAG = 'ExpressionTest0684';
  const num: number = 5;
  const result: boolean = ~num === -6;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0685() {
  const TAG = 'ExpressionTest0685';
  const a: number = 8;
  const b: number = 3;
  const result: string = `${a} > ${b}: ${a > b}, ${a} / ${b} = ${a / b}, ${a} % ${b} = ${a % b}`;
  if (result !== "8 > 3: true, 8 / 3 = 2.6666666666666665, 8 % 3 = 2") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 8 > 3: true, 8 / 3 = 2.6666666666666665, 8 % 3 = 2');
  }
}

export function ExpressionTest0686() {
  const TAG = 'ExpressionTest0686';
  const str: string = "abcdefghij";
  const result: number = str.length | 0x0F;
  // 10 | 15 = 15
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0687() {
  const TAG = 'ExpressionTest0687';
  const str: string = "0123456789abcdef";
  const a: int = 7;
  const b: int = 3;
  const result: string = str[a ^ b];
  if (result !== "4") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 4');
  }
}

export function ExpressionTest0688() {
  const TAG = 'ExpressionTest0688';
  const a: number = 15;
  const b: number = 4;
  const result: string = `${a} >> ${b} = ${a >> b}, ${a} >>> ${b} = ${a >>> b}`;
  if (result !== "15 >> 4 = 0, 15 >>> 4 = 0") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15 >> 4 = 0, 15 >>> 4 = 0');
  }
}

export function ExpressionTest0689() {
  const TAG = 'ExpressionTest0689';
  const a: number = 32;
  const b: number = 3;
  const result: boolean = (a >> b) === 4;
  // 32 >> 3 = 4
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0690() {
  const TAG = 'ExpressionTest0690';
  const count: number = 7;
  const result: string = "Count " + count + ": " +
    (count > 10 ? "many" :
      count > 5 ? "several" :
        count > 1 ? "a few" : "one");
  if (result !== "Count 7: several") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Count 7: several');
  }
}

export function ExpressionTest0691() {
  const TAG = 'ExpressionTest0691';
  const temperature: number = 98.6;
  const result: boolean = temperature >= 97 && temperature <= 99;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0692() {
  const TAG = 'ExpressionTest0692';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const result: number = (str.length - 6) & 0x1F;
  // 20 & 31 = 20
  if (result !== 20) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 20');
  }
}

export function ExpressionTest0693() {
  const TAG = 'ExpressionTest0693';
  const score: number = 89;
  const result: string = score >= 95 ? "A+" :
    score >= 90 ? "A" :
      score >= 85 ? "A-" :
        score >= 80 ? "B+" : "B";
  if (result !== "A-") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected A-');
  }
}

export function ExpressionTest0694() {
  const TAG = 'ExpressionTest0694';
  let result: number = 0;
  let i: number, j: number;
  for (i = 1, j = 1; i <= 5; i++, j *= 2) {
    result += i * j;
  }
  if (result !== 1 * 1 + 2 * 2 + 3 * 4 + 4 * 8 + 5 * 16) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 * 1 + 2 * 2 + 3 * 4 + 4 * 8 + 5 * 16');
  }
}

export function ExpressionTest0695() {
  const TAG = 'ExpressionTest0695';
  const str: string = "Hello World";
  const substr: string = "lo W";
  const result: boolean = str.substring(3, 7) === substr;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0696() {
  const TAG = 'ExpressionTest0696';
  let num: number = 4;
  const result: number = ~num + (-num) * 2;
  // -5 + (-4) * 2 = -5 - 8 = -13
  if (result !== -13) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -13');
  }
}

export function ExpressionTest0697() {
  const TAG = 'ExpressionTest0697';
  const value: number = 0b1101;
  const mask: number = 0b1000;
  const result: boolean = (value & mask) !== 0;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0698() {
  const TAG = 'ExpressionTest0698';
  let result: string = "";
  let count: number = 1;
  while (count <= 5) {
    result += (count % 2 === 0 ? "even" : "odd") + count + " ";
    count++;
  }
  if (result !== "odd1 even2 odd3 even4 odd5 ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected odd1 even2 odd3 even4 odd5 ');
  }
}

export function ExpressionTest0699() {
  const TAG = 'ExpressionTest0699';
  const a: number = 22;
  const b: number = 15;
  const result: boolean = (a ^ b) > (a & b);
  // 27 > 14 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0700() {
  const TAG = 'ExpressionTest0700';
  const str: string = "abcdefghijklmnop";
  let result: string = "";
  let i: int, chunkSize: int;
  for (i = 0, chunkSize = 1; i < str.length; i += chunkSize, chunkSize = Math.min(chunkSize + 1, 4).toInt()) {
    result += str.substr(i, chunkSize) + "|";
  }
  if (result !== "a|bc|def|ghij|klmn|op|") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected a|bc|def|ghij|klmn|op|');
  }
}

export function ExpressionTest0701() {
  const TAG = 'ExpressionTest0701';
  const str: string = "Hello";
  const result: string = str + (str.length > 3 || str.startsWith("X") ? " is valid" : " is invalid");
  if (result !== "Hello is valid") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Hello is valid');
  }
}

export function ExpressionTest0702() {
  const TAG = 'ExpressionTest0702';
  const a: string = "25";
  const b: string = "7";
  const result: number = (+Number(a) % +Number(b)) * 2;
  if (result !== 8) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 8');
  }
}

export function ExpressionTest0703() {
  const TAG = 'ExpressionTest0703';
  let result: number = 0;
  let i: number, mask: number;
  for (i = 0, mask = 1; i < 8; i++, mask <<= 1) {
    if (i % 2 === 0) {
      result |= mask;
    }
  }
  if (result !== 1 + 4 + 16 + 64) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 + 4 + 16 + 64');
  }
}

export function ExpressionTest0704() {
  const TAG = 'ExpressionTest0704';
  const num: number = 7;
  const result: boolean = !(num % 2 === 0);
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0705() {
  const TAG = 'ExpressionTest0705';
  const a: number = 22;
  const b: number = 15;
  const result: boolean = (a & b) === 14;
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0706() {
  const TAG = 'ExpressionTest0706';
  const value: number = 3.7;
  let result: string = "Value " + value + " is ";
  result += value > 5 ? "high" : value > 3 ? "medium" : "low";
  if (result !== "Value 3.7 is medium") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value 3.7 is medium');
  }
}

export function ExpressionTest0707() {
  const TAG = 'ExpressionTest0707';
  const a: number = 15;
  const result: number = -(a >>> 2);
  if (result !== -3) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -3');
  }
}

export function ExpressionTest0708() {
  const TAG = 'ExpressionTest0708';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  let result: string = "";
  for (let i = 0; i < str.length; i += Math.floor(str.length / 5)) {
    result += str[i];
  }
  if (result !== "afkpuz") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected afkpuz');
  }
}

export function ExpressionTest0709() {
  const TAG = 'ExpressionTest0709';
  const a: number = 18;
  const b: number = 12;
  const result: boolean = a > 15 && b < 15 && a - b > 5;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0710() {
  const TAG = 'ExpressionTest0710';
  const str: string = "typescript";
  const num: number = 5;
  const result: boolean = str.length < 5 || num < 3 || str.includes("script");
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0711() {
  const TAG = 'ExpressionTest0711';
  let value: number = 0b1100;
  value ^= 0b0101; // 0b1001
  value ^= 0b1110; // 0b0111
  if (value !== 0b0111) {
    console.info(`${TAG} Task execution failed: value: ${value}`);
    throw new Error('value check failed, expected 0b0111');
  }
}

export function ExpressionTest0712() {
  const TAG = 'ExpressionTest0712';
  const a: number = 3;
  const b: number = 4;
  const c: number = 5;
  const result: string = `${a}^2 + ${b}^2 = ${c}^2: ${a**2 + b**2 === c**2}`;
  if (result !== "3^2 + 4^2 = 5^2: true") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 3^2 + 4^2 = 5^2: true');
  }
}

export function ExpressionTest0713() {
  const TAG = 'ExpressionTest0713';
  let num: number = 2;
  const result: number = ++num * 2 + ++num * 3;
  // 3 * 2 + 4 * 3 = 6 + 12 = 18
  if (result !== 18) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 18');
  }

  if (num !== 4) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 4');
  }
}

export function ExpressionTest0714() {
  const TAG = 'ExpressionTest0714';
  let num: number = 15;
  const result: number = num--
  / 3 + num-- * 2;
  // 15 / 3 + 14 * 2 = 5 + 28 = 33
  if (result !== 33) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 33');
  }

  if (num !== 13) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 13');
  }
}

export function ExpressionTest0715() {
  const TAG = 'ExpressionTest0715';
  const str: string = "0123456789abcdefghijklmnopqrstuvwxyz";
  let result: string = "";
  let i: int, step: int;
  for (i = 0, step = 3; i < str.length; i += step, step = step < 5 ? step + 1 : 3) {
    result += str[i];
  }
  if (result !== "037cfjorv") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 037cfjorv');
  }
}

export function ExpressionTest0716() {
  const TAG = 'ExpressionTest0716';
  const str1: string = "Hello World";
  const str2: string = "hello world";
  const result: boolean = str1.toUpperCase() === str2.toUpperCase();
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0717() {
  const TAG = 'ExpressionTest0717';
  let result: string = "";
  for (let i = 1; i <= 20; i++) {
    if (i % 3 === 0) {
      result += "Fizz";
    }
    if (i % 5 === 0) {
      result += "Buzz";
    }
    if (i % 3 !== 0 && i % 5 !== 0) {
      result += i;
    }
    result += " ";
  }
  if (result !== "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz ") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz ');
  }
}

export function ExpressionTest0718() {
  const TAG = 'ExpressionTest0718';
  const config: GeneratedTypeLiteralInterface_4 = {};
  const defaultTimeout: number = 5000;
  const result: number = config.timeout ?? defaultTimeout;
  if (result !== 5000) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5000');
  }
}

export function ExpressionTest0719() {
  const TAG = 'ExpressionTest0719';
  const a: number = -12;
  const b: number = -8;
  const result: number = a ^ b;
  if (result !== 12) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12');
  }
}

export function ExpressionTest0720() {
  const TAG = 'ExpressionTest0720';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  let index: int = 1;
  index = index * 5 + 3;
  const result: string = str[index];
  if (result !== "i") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected i');
  }
}

export function ExpressionTest0723() {
  const TAG = 'ExpressionTest0723';
  const a: number = 9;
  const result: boolean = (a << 2) === 36;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0724() {
  const TAG = 'ExpressionTest0724';
  const base: number = 4;
  const exp: number = 3;
  const result: string = base + " raised to " + exp + " is " + (base**exp);
  if (result !== "4 raised to 3 is 64") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 4 raised to 3 is 64');
  }
}

export function ExpressionTest0725() {
  const TAG = 'ExpressionTest0725';
  const a: number = 15;
  const b: number = 5;
  const c: number = 2;
  const result1: number = a / b + c;
  const result2: number = a / (b + c);
  if (result1 !== 5) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 5');
  }

  if (Math.abs(result2 - 2.1428571) > 0.0000001) {
    console.info(`${TAG} Task execution failed: result2: ${result2}, expected: 2.1428571, delta: 0.0000001`);
    throw new Error('result2 is not close to 2.1428571 (within 0.0000001)');
  }
}

export function ExpressionTest0726() {
  const TAG = 'ExpressionTest0726';
  const x: number = 7;
  const y: number = 3;
  const result: string = `${x} * ${y} + 5 = ${x * y + 5}, ${x} * (${y} + 5) = ${x * (y + 5)}`;
  if (result !== "7 * 3 + 5 = 26, 7 * (3 + 5) = 56") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 7 * 3 + 5 = 26, 7 * (3 + 5) = 56');
  }
}

export function ExpressionTest0727() {
  const TAG = 'ExpressionTest0727';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const position: int = 4;
  const result: string = str.slice(position, position + 6);
  if (result !== "efghij") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected efghij');
  }
}

export function ExpressionTest0728() {
  const TAG = 'ExpressionTest0728';
  const a: number = 18;
  const b: number = 7;
  const result: string = `-${a} / ${b} = ${-a / b}`;
  if (result !== "-18 / 7 = -2.5714285714285716") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -18 / 7 = -2.5714285714285716');
  }
}

export function ExpressionTest0729() {
  const TAG = 'ExpressionTest0729';
  const a: number = 9;
  const b: number = 5;
  const result: boolean = ~a < -b;
  // -10 < -5 is true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0730() {
  const TAG = 'ExpressionTest0730';
  let num: number = 30;
  num -= 5; // 25
  num /= 5; // 5
  num += 8; // 13
  if (num !== 13) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 13');
  }
}

export function ExpressionTest0731() {
  const TAG = 'ExpressionTest0731';
  let result: string = "";
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  for (let i = 0; i < str.length; i++) {
    if (i === 5 || i === 10 || i === 15 || i === 20) {
      result += str[i];
    }
  }
  if (result !== "fkpu") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected fkpu');
  }
}

export function ExpressionTest0732() {
  const TAG = 'ExpressionTest0732';
  const num: number = 47;
  const mod: number = 9;
  const remainder: number = num % mod;
  const result: boolean = remainder < 3 || remainder > 7;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0733() {
  const TAG = 'ExpressionTest0733';
  const a: number = 21;
  const b: number = 13;
  const result: string = a + " | " + b + " = " + (a | b);
  if (result !== "21 | 13 = 29") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 21 | 13 = 29');
  }
}

export function ExpressionTest0734() {
  const TAG = 'ExpressionTest0734';
  const num: number = 8;
  const result: boolean = ~num === -9;
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0735() {
  const TAG = 'ExpressionTest0735';
  const a: number = 12;
  const b: number = 5;
  const result: string = `${a} > ${b}: ${a > b}, ${a} * 2 = ${a * 2}, ${b} + ${a} = ${b + a}`;
  if (result !== "12 > 5: true, 12 * 2 = 24, 5 + 12 = 17") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 12 > 5: true, 12 * 2 = 24, 5 + 12 = 17');
  }
}

export function ExpressionTest0736() {
  const TAG = 'ExpressionTest0736';
  const str: string = "abcdefghijklmnopqrstuvwxyz";
  const result: number = str.length ^ 0x1F;
  // 26 ^ 31 = 5
  if (result !== 5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 5');
  }
}

export function ExpressionTest0737() {
  const TAG = 'ExpressionTest0737';
  const str: string = "0123456789abcdefghijklmnopqrstuvwxyz";
  const a: int = 10;
  const b: int = 3;
  const result: string = str[a >> b];
  if (result !== "1") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 1');
  }
}

export function ExpressionTest0738() {
  const TAG = 'ExpressionTest0738';
  const a: number = 25;
  const b: number = 3;
  const result: string = `${a} << ${b} = ${a << b}, ${a} >> ${b} = ${a >> b}`;
  if (result !== "25 << 3 = 200, 25 >> 3 = 3") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 25 << 3 = 200, 25 >> 3 = 3');
  }
}

export function ExpressionTest0739() {
  const TAG = 'ExpressionTest0739';
  const a: number = 48;
  const b: number = 4;
  const result: boolean = (a >> b) === 3;
  // 48 >> 4 = 3
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0740() {
  const TAG = 'ExpressionTest0740';
  const value: number = 0.75;
  const result: string = "Value " + value + ": " +
    (value > 0.8 ? "high" :
      value > 0.5 ? "medium" :
        value > 0.2 ? "low" : "very low");
  if (result !== "Value 0.75: medium") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Value 0.75: medium');
  }
}
