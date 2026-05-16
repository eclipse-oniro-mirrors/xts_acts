'use static'
/*
* Copyright (C) 2024-2026 HiHope Open Source Organization.
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

import { animal, MyObjects, Person, task, update } from '../../pages/Utils';
import Utils from '../../Util.test';

export function builtinsStatementForTest_1000() {
  const TAG = 'builtinsStatementForTest_1000';
  const Tag: string = 'builtinsStatementForTest_1000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let i = 0
  let count: number = 0
  for (i; i < 10; i++) {
    count++
  }
  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }
}

export function builtinsStatementForTest_1100() {
  const TAG = 'builtinsStatementForTest_1100';
  const Tag: string = 'builtinsStatementForTest_1100'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0
  for (let i = 0; i < 10; i++) {
    count++
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }
}

export function builtinsStatementForTest_1200() {
  const TAG = 'builtinsStatementForTest_1200';
  const Tag: string = 'builtinsStatementForTest_1200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0
  for (let i: number = 0; i < 10; i++) {
    count++
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }
}

export function builtinsStatementForTest_1300() {
  const TAG = 'builtinsStatementForTest_1300';
  const Tag: string = 'builtinsStatementForTest_1300'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  for (let i = 0, j = 0; i < 10 && j < 15; i++, j++) { // 初始化并递增两个变量
    count++;
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }
}

export function builtinsStatementForTest_1400() {
  const TAG = 'builtinsStatementForTest_1400';
  const Tag: string = 'builtinsStatementForTest_1400'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (; i < 10; ) { // 没有初始化部分
    count++;
    i++; // 在循环体内递增
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }
}

export function builtinsStatementForTest_1500() {
  const TAG = 'builtinsStatementForTest_1500';
  const Tag: string = 'builtinsStatementForTest_1500'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; 0; i++) { // 没有初始化部分
    count++;
    ; // 在循环体内递增
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_1600() {
  const TAG = 'builtinsStatementForTest_1600';
  const Tag: string = 'builtinsStatementForTest_1600'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; NaN; i++) { // 没有初始化部分
    count++;
    ; // 在循环体内递增
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_1700() {
  const TAG = 'builtinsStatementForTest_1700';
  const Tag: string = 'builtinsStatementForTest_1700'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; ''; i++) { // 没有初始化部分
    count++;
    ; // 在循环体内递增
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_1800() {
  const TAG = 'builtinsStatementForTest_1800';
  const Tag: string = 'builtinsStatementForTest_1800'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; null; i++) { // 没有初始化部分
    count++;
    ; // 在循环体内递增
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_1900() {
  const TAG = 'builtinsStatementForTest_1900';
  const Tag: string = 'builtinsStatementForTest_1900'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; undefined; i++) { // 没有初始化部分
    count++;
    ; // 在循环体内递增
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_2000() {
  const TAG = 'builtinsStatementForTest_2000';
  const Tag: string = 'builtinsStatementForTest_2000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i;!'s'; i++) { // 没有初始化部分
    count++;
    ; // 在循环体内递增
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_2100() {
  const TAG = 'builtinsStatementForTest_2100';
  const Tag: string = 'builtinsStatementForTest_2100'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i;!0; i++) { // 没有初始化部分
    count++; // 在循环体内递增
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_2200() {
  const TAG = 'builtinsStatementForTest_2200';
  const Tag: string = 'builtinsStatementForTest_2200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; true; i++) { // 没有初始化部分
    count++; // 在循环体内递增
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_2300() {
  const TAG = 'builtinsStatementForTest_2300';
  const Tag: string = 'builtinsStatementForTest_2300'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0; // 在循环外初始化
  for (i; false; i++) { // 没有初始化部分
    count++; // 在循环体内递增
    break
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_2400() {
  const TAG = 'builtinsStatementForTest_2400';
  const Tag: string = 'builtinsStatementForTest_2400'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let i = 0;
  const getFlag = () => {
    return i < 10;
  }
  let count: number = 0;
  for (i; getFlag(); i++) {
    count++;
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_2500() {
  const TAG = 'builtinsStatementForTest_2500';
  const Tag: string = 'builtinsStatementForTest_2500'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let j = 0; // 在循环外初始化
  for (i = 0, j = 0; i < 10 && j < 5; i++, j++) {
    count++
  }
  if (5 !== count) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count');
  }

  if (5 !== i) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected i');
  }

  if (5 !== j) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected j');
  }
}

export function builtinsStatementForTest_2600() {
  const TAG = 'builtinsStatementForTest_2600';
  const Tag: string = 'builtinsStatementForTest_2600'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let j = 0; // 在循环外初始化
  for (i = 0, j = 0; i < 10 || j < 5; i++, j++) {
    count++
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (10 !== j) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected j');
  }
}

export function builtinsStatementForTest_2700() {
  const TAG = 'builtinsStatementForTest_2700';
  const Tag: string = 'builtinsStatementForTest_2700'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; i < 10; i++) {
    if (i < 5) {
      count++
    }
  }
  if (5 !== count) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_2800() {
  const TAG = 'builtinsStatementForTest_2800';
  const Tag: string = 'builtinsStatementForTest_2800'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0;; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_2900() {
  const TAG = 'builtinsStatementForTest_2900';
  const Tag: string = 'builtinsStatementForTest_2900'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; 2; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_3000() {
  const TAG = 'builtinsStatementForTest_3000';
  const Tag: string = 'builtinsStatementForTest_3000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; [1]; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_3100() {
  const TAG = 'builtinsStatementForTest_3100';
  const Tag: string = 'builtinsStatementForTest_3100'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; 'string'; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_3200() {
  const TAG = 'builtinsStatementForTest_3200';
  const Tag: string = 'builtinsStatementForTest_3200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let s: MyObjects = {
    a: 1
  }
  let i = 0;
  for (i = 0; s; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_3700() {
  const TAG = 'builtinsStatementForTest_3700';
  const Tag: string = 'builtinsStatementForTest_3700'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; task(); i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_3800() {
  const TAG = 'builtinsStatementForTest_3800';
  const Tag: string = 'builtinsStatementForTest_3800'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let direction: "up" | "down" | "left" | "right" = "right"
  let i = 0;
  for (i = 0; direction; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_3900() {
  const TAG = 'builtinsStatementForTest_3900';
  const Tag: string = 'builtinsStatementForTest_3900'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let direction: [string, number, null] = ['hello', 1, null]
  let i = 0;
  for (i = 0; direction; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4000() {
  const TAG = 'builtinsStatementForTest_4000';
  const Tag: string = 'builtinsStatementForTest_4000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let direction: string | number = 0
  let i = 0;
  for (i = 0; direction; i++) {
    count++
    break
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4200() {
  const TAG = 'builtinsStatementForTest_4200';
  const Tag: string = 'builtinsStatementForTest_4200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let direction = animal<string>('mysd')
  let i = 0;
  for (i = 0; direction; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4300() {
  const TAG = 'builtinsStatementForTest_4300';
  const Tag: string = 'builtinsStatementForTest_4300'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; 0; i++) {
    count++
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4400() {
  const TAG = 'builtinsStatementForTest_4400';
  const Tag: string = 'builtinsStatementForTest_4400'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; +0.0; i++) {
    count++
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4500() {
  const TAG = 'builtinsStatementForTest_4500';
  const Tag: string = 'builtinsStatementForTest_4500'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; false; i++) {
    count++
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4600() {
  const TAG = 'builtinsStatementForTest_4600';
  const Tag: string = 'builtinsStatementForTest_4600'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let def: string = 'hello world'
  let objectStr = new String(def)
  for (i = 0; objectStr; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4700() {
  const TAG = 'builtinsStatementForTest_4700';
  const Tag: string = 'builtinsStatementForTest_4700'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let def: number = 0
  let objectStr = new Number(def)
  for (i = 0; objectStr; i++) {
    count++
    break
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4800() {
  const TAG = 'builtinsStatementForTest_4800';
  const Tag: string = 'builtinsStatementForTest_4800'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let def: string = 'hello world'
  let objectStr = Boolean(def)
  for (i = 0; objectStr; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_4900() {
  const TAG = 'builtinsStatementForTest_4900';
  const Tag: string = 'builtinsStatementForTest_4900'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let def: number = 1
  let objectStr = BigInt(def)
  for (i = 0; objectStr; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_5000() {
  const TAG = 'builtinsStatementForTest_5000';
  const Tag: string = 'builtinsStatementForTest_5000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; 0 && false; i++) {
    count++
    break
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_5100() {
  const TAG = 'builtinsStatementForTest_5100';
  const Tag: string = 'builtinsStatementForTest_5100'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  for (i = 0; 0 || false; i++) {
    count++
    break
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_5200() {
  const TAG = 'builtinsStatementForTest_5200';
  const Tag: string = 'builtinsStatementForTest_5200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  let def: number = 1
  let objectStr = BigInt(def)
  for (i = 0;!objectStr; i++) {
    count++
    break
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_5400() {
  const TAG = 'builtinsStatementForTest_5400';
  const Tag: string = 'builtinsStatementForTest_5400'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  //不带括号异常场景
  for (i = 0; task; i++) {
    count++
    break
  }
  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }

  if (0 !== i) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected i');
  }
}

export function builtinsStatementForTest_5500() {
  const TAG = 'builtinsStatementForTest_5500';
  const Tag: string = 'builtinsStatementForTest_5500'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  //forUpDate正常场景i++
  for (i = 0; i < 15; i++) {
    count++
  }
  if (15 !== count) {
    console.info(`${TAG} Task execution failed: 15: ${15}`);
    throw new Error('15 check failed, expected count');
  }

  if (15 !== i) {
    console.info(`${TAG} Task execution failed: 15: ${15}`);
    throw new Error('15 check failed, expected i');
  }
}

export function builtinsStatementForTest_5600() {
  const TAG = 'builtinsStatementForTest_5600';
  const Tag: string = 'builtinsStatementForTest_5600'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 15;
  //forUpDate正常场景i--
  for (i = 15; i > 10; i--) {
    count++
  }
  if (5 !== count) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_5700() {
  const TAG = 'builtinsStatementForTest_5700';
  const Tag: string = 'builtinsStatementForTest_5700'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  //forUpDate正常场景i+=2
  for (i = 0; i < 10; i += 2) {
    count++
  }
  if (5 !== count) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_5800() {
  const TAG = 'builtinsStatementForTest_5800';
  const Tag: string = 'builtinsStatementForTest_5800'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 20;
  //forUpDate正常场景i-=2
  for (i = 20; i > 10; i -= 2) {
    count++
  }
  if (5 !== count) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_5900() {
  const TAG = 'builtinsStatementForTest_5900';
  const Tag: string = 'builtinsStatementForTest_5900'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  //forUpDate正常场景i-=2
  for (i = 0; i < 10; i = i * 2 + 1) {
    count++
  }
  if (4 !== count) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected count');
  }

  if (15 !== i) {
    console.info(`${TAG} Task execution failed: 15: ${15}`);
    throw new Error('15 check failed, expected i');
  }
}

export function builtinsStatementForTest_6000() {
  const TAG = 'builtinsStatementForTest_6000';
  const Tag: string = 'builtinsStatementForTest_6000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  //forUpDate正常场景i=函数返回值
  for (i = 0; i < 10; i = update(i).toInt()) {
    count++
  }
  if (2 !== count) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_6100() {
  const TAG = 'builtinsStatementForTest_6100';
  const Tag: string = 'builtinsStatementForTest_6100'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 0;
  //forUpDate正常场景缺省forUpDate
  for (i = 0; i < 10; ) {
    count++
    i++
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_6200() {
  const TAG = 'builtinsStatementForTest_6200';
  const Tag: string = 'builtinsStatementForTest_6200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  //forUpDate正常场景多个参数
  let i = 0, j = 0
  for (i = 0, j = 10; i < 10; i++, j--) {
    count++
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (0 !== j) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected j');
  }
}

export function builtinsStatementForTest_6300() {
  const TAG = 'builtinsStatementForTest_6300';
  const Tag: string = 'builtinsStatementForTest_6300'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  //forUpDate正常场景多个参数
  let i = 0, j = 0, k = 0, l = 0, z = 0
  for (i = 0, j = 10, k = 10, l = 10, z = 10; i < 10; i++, j--, k--, l--, z--) {
    count++
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (0 !== j) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected j');
  }

  if (0 !== k) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected k');
  }

  if (0 !== l) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected l');
  }

  if (0 !== z) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected z');
  }
}

export async function builtinsStatementForTest_6400() {
  const TAG = 'builtinsStatementForTest_6400';
  const Tag: string = 'builtinsStatementForTest_6400'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  //forUpDate正常场景多个参数
  let i = 0, j = 0, k = 0, l = 0, z = 0, h = 0, g = 0, f = 0, d = 0, a = 0
  for (i = 0, j = 10, k = 10, l = 10, z = 10, h = 10, g = 10, f = 10, d = 10, a = 10; i < 10;
    j--, k--, l--, z--, h--, g--, f--, d--, a--, i++) {
    count++
  }
  while (i < 10) {
    await Utils.msSleep(100)
  }
  if (10 !== count) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (0 !== j) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected j');
  }

  if (0 !== k) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected k');
  }

  if (0 !== l) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected l');
  }

  if (0 !== z) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected z');
  }

  if (0 !== h) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected h');
  }

  if (0 !== g) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected g');
  }

  if (0 !== f) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected f');
  }

  if (0 !== d) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected d');
  }

  if (0 !== a) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected a');
  }
}

export async function builtinsStatementForTest_6500() {
  const TAG = 'builtinsStatementForTest_6500';
  const Tag: string = 'builtinsStatementForTest_6500'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  //作用域，测试外部定义变量，for内部赋值，能否拿到
  let i = 0
  for (i = 10; i < 10; ) {
    count++
  }
  while (i < 10) {
    await Utils.msSleep(100)
  }
  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }

  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }
}

export function builtinsStatementForTest_6600() {
  const TAG = 'builtinsStatementForTest_6600';
  const Tag: string = 'builtinsStatementForTest_6600'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  //作用域，循环体的变量只有局部可用
  for (let i = 1; i < 10; ) {
    count++
    if (1 !== i) {
      console.info(`${TAG} Task execution failed: 1: ${1}`);
      throw new Error('1 check failed, expected i');
    }
    break
  }


  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }
}

export function builtinsStatementForTest_6700() {
  const TAG = 'builtinsStatementForTest_6700';
  const Tag: string = 'builtinsStatementForTest_6700'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //无标签break
  for (i = 1; i < 10; i++) {
    count++
    break
  }
  if (1 !== i) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected i');
  }

  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }
}

export function builtinsStatementForTest_6800() {
  const TAG = 'builtinsStatementForTest_6800';
  const Tag: string = 'builtinsStatementForTest_6800'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //无标签continue
  for (i = 1; i < 10; i++) {
    continue
    count++
  }
  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (0 !== count) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected count');
  }
}

export function builtinsStatementForTest_6900() {
  const TAG = 'builtinsStatementForTest_6900';
  const Tag: string = 'builtinsStatementForTest_6900'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //无标签break
  for (i = 1; i < 10; i++) {
    count++
    break
  }
  if (1 !== i) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected i');
  }

  if (1 !== count) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count');
  }
}

export function builtinsStatementForTest_7000() {
  const TAG = 'builtinsStatementForTest_7000';
  const Tag: string = 'builtinsStatementForTest_7000'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //无标签嵌套循环continue
  for (i = 1; i < 10; i++) {
    if (i == 5) {
      continue
    }
    count++
  }
  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (8 !== count) {
    console.info(`${TAG} Task execution failed: 8: ${8}`);
    throw new Error('8 check failed, expected count');
  }
}

export function builtinsStatementForTest_7100() {
  const TAG = 'builtinsStatementForTest_7100';
  const Tag: string = 'builtinsStatementForTest_7100'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //无标签嵌套循环break
  for (i = 1; i < 10; i++) {
    if (i == 5) {
      break
    }
    count++
  }
  if (5 !== i) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected i');
  }

  if (4 !== count) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected count');
  }
}

export function builtinsStatementForTest_7200() {
  const TAG = 'builtinsStatementForTest_7200';
  const Tag: string = 'builtinsStatementForTest_7200'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //有标签嵌套循环break
  outerLoop: for (i = 1; i < 10; i++) {
    if (i == 5) {
      break outerLoop
    }
    count++
  }
  if (5 !== i) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected i');
  }

  if (4 !== count) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected count');
  }
}

export function builtinsStatementForTest_7300() {
  const TAG = 'builtinsStatementForTest_7300';
  const Tag = 'builtinsStatementForTest_7300';
  console.info(`${Tag}`, '%{public}s', 'Test begin');
  let outerLoopCounter = 0;
  let innerLoopCounter = 0;
  let shouldBreakAtIEquals1JEquals1 = false; //带标签指定外部循环
  outerLoop: for (let i = 0; i < 5; i++) {
    outerLoopCounter++;
    for (let j = 0; j < 5; j++) {
      innerLoopCounter++;
      if (i === 1 && j === 1) {
        // 当i等于1且j等于1时，使用break语句加上标签跳出整个外部循环
        shouldBreakAtIEquals1JEquals1 = true;
        break outerLoop;
      }
    }
  }
  // 验证是否在预期的位置（i=1,j=1）中断了循环
  if (true !== shouldBreakAtIEquals1JEquals1) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected shouldBreakAtIEquals1JEquals1');
  }

  if (2 !== outerLoopCounter) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected outerLoopCounter');
  }

  if (7 !== innerLoopCounter) {
    console.info(`${TAG} Task execution failed: 7: ${7}`);
    throw new Error('7 check failed, expected innerLoopCounter');
  }
}

export function builtinsStatementForTest_7400() {
  const TAG = 'builtinsStatementForTest_7400';
  const Tag: string = 'builtinsStatementForTest_7400'
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count: number = 0;
  let i = 1
  //有标签嵌套循环break
  outerLoop: for (i = 1; i < 10; i++) {
    if (i == 5) {
      continue outerLoop
    }
    count++
  }
  if (10 !== i) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected i');
  }

  if (8 !== count) {
    console.info(`${TAG} Task execution failed: 8: ${8}`);
    throw new Error('8 check failed, expected count');
  }
}

export function builtinsStatementForTest_7500() {
  const TAG = 'builtinsStatementForTest_7500';
  const Tag = 'builtinsStatementForTest_7500';
  console.info(`${Tag}`, '%{public}s', 'Test begin');
  let outerLoopCounter = 0;
  let innerLoopCounter = 0;
  let shouldBreakAtIEquals1JEquals1 = false; //多层循环中使用标签，是否跳到标签层
  outerLoop: for (let i = 0; i < 5; i++) {
    outerLoopCounter++;
    for (let j = 0; j < 5; j++) {
      innerLoopCounter++;
      shouldBreakAtIEquals1JEquals1 = true;
      break
    }
  }
  // 验证是否在预期的位置（i=1,j=1）中断了循环
  if (true !== shouldBreakAtIEquals1JEquals1) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected shouldBreakAtIEquals1JEquals1');
  }

  if (5 !== outerLoopCounter) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected outerLoopCounter');
  }

  if (5 !== innerLoopCounter) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected innerLoopCounter');
  }
}

export function builtinsStatementForTest_7600() {
  const TAG = 'builtinsStatementForTest_7600';
  // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
  console.info('testTag', '%{public}s', 'it begin');
  let total = 0;
  outerLoop: for (let i = 0; i < 3; i++) {
    middleLoop: for (let j = 0; j < 3; j++) {
      innerLoop: for (let k = 0; k < 3; k++) {
        if (i === 1 && j === 1 && k === 1) {
          continue innerLoop;
        }
        if (i === 1 && j === 1) {
          continue middleLoop;
        }
        if (i === 1) {
          continue outerLoop;
        }
        total += i + j + k;
      }
    }
  }
  if (total !== 54) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 54');
  }
}

export function builtinsStatementForTest_7700() {
  const TAG = 'builtinsStatementForTest_7700';
  const Tag = 'builtinsStatementForTest_7700';
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let outerCount = 0;
  let middleCount = 0;
  let innerCount = 0;
  for (let i = 1; i <= 3; i++) {
    outerCount++;
    for (let j = 1; j <= 3; j++) {
      middleCount++;
      for (let k = 1; k <= 3; k++) {
        innerCount++;
      }
    }
  }
  if (3 !== outerCount) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected outerCount');
  }

  if (9 !== middleCount) {
    console.info(`${TAG} Task execution failed: 9: ${9}`);
    throw new Error('9 check failed, expected middleCount');
  }

  if (27 !== innerCount) {
    console.info(`${TAG} Task execution failed: 27: ${27}`);
    throw new Error('27 check failed, expected innerCount');
  }
}

export function builtinsStatementForTest_7800() {
  const TAG = 'builtinsStatementForTest_7800';
  const Tag = 'builtinsStatementForTest_7800';
  console.info(`${Tag}`, '%{public}s', 'it begin');
  let count1 = 0;
  let count2 = 0;
  let count3 = 0;
  let count4 = 0;
  let count5 = 0;
  for (let i = 1; i <= 3; i++) {
    count1++;
    for (let j = 1; j <= 3; j++) {
      count2++;
      for (let k = 1; k <= 3; k++) {
        count3++;
        for (let l = 1; l <= 3; l++) {
          count4++;
          for (let m = 1; m <= 3; m++) {
            count5++;
          }
        }
      }
    }
  }
  if (count1 !== 3) {
    console.info(`${TAG} Task execution failed: count1: ${count1}`);
    throw new Error('count1 check failed, expected 3');
  }

  if (count2 !== 9) {
    console.info(`${TAG} Task execution failed: count2: ${count2}`);
    throw new Error('count2 check failed, expected 9');
  }

  if (count3 !== 27) {
    console.info(`${TAG} Task execution failed: count3: ${count3}`);
    throw new Error('count3 check failed, expected 27');
  }

  if (count4 !== 81) {
    console.info(`${TAG} Task execution failed: count4: ${count4}`);
    throw new Error('count4 check failed, expected 81');
  }

  if (count5 !== 243) {
    console.info(`${TAG} Task execution failed: count5: ${count5}`);
    throw new Error('count5 check failed, expected 243');
  }
}
