/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { collections } from "@kit.ArkTS";
import { User } from "../ConcurrentUtils/ConcurrentUtils";

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
export function testCollectionsMap0001(): string {
  try {
    const testMap = new collections.Map<number, number>(
      [[1, 1],
        [2, 2],
        [3, 3],
        [4, 4],
        [5, 5],
        [6, 6],
        [7, 7],
        [8, 8],
        [9, 9],
        [10, 10]
      ]);
    let tempNum: number = 0;
    for (let entry of testMap.entries()) {
      tempNum++;
      if (entry[0] !== tempNum || entry[1] !== tempNum) {
        return 'fail';
      }
    }
    return 'success';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0002(): string {
  try {
    const testMap = new collections.Map<number, number>();
    testMap.set(0, 1);
    testMap.set(1, 2);
    let tempNum: number = 0;
    for (let entry of testMap.entries()) {
      tempNum++;
      if (entry[0] !== tempNum - 1 || entry[1] !== tempNum) {
        return 'fail';
      }
    }
    return 'success';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0003(): string {
  try {
    const userMap = new collections.Map<number, User>();
    const user1 = new User();
    userMap.set(1, user1);
    let tempNum: number = 0;
    for (let entry of userMap.entries()) {
      tempNum++;
    }
    return tempNum === 1 ? 'success' : 'fail';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0004(): string {
  try {
    const testMap = new collections.Map<number, string>();
    let tempNum: number = 0;
    for (let entry of testMap.entries()) {
      tempNum++;
    }
    return tempNum === 0 ? 'success' : 'fail';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0005(): string {
  try {
    const testMap = new collections.Map<number, string>();
    testMap.set(0, '0');
    testMap.set(1, '1');
    let tempNum: number = 0;
    for (let entry of testMap.entries()) {
      tempNum++;
    }
    return tempNum === 2 ? 'success' : 'fail';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0006(): string {
  try {
    const testMap = new collections.Map<number, string>();
    testMap.set(0, '0');
    testMap.set(1, '1');
    testMap.delete(0);
    let tempNum: number = 0;
    for (let entry of testMap.entries()) {
      if (entry[1] !== '1') {
        return 'fail';
      }
      tempNum++;
    }
    return tempNum === 1 ? 'success' : 'fail';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0007(): string {
  try {
    const testMap = new collections.Map<number, string>();
    testMap.set(0, '0');
    testMap.set(1, '1');
    testMap.clear();
    let tempNum: number = 0;
    for (let entry of testMap.entries()) {
      tempNum++;
    }
    return tempNum === 0 ? 'success' : 'fail';
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0008(): boolean {
  const testMap = new collections.Map<number, string>();
  const iterator = testMap.keys();
  return iterator.next().done === true;
}

@Concurrent
export function testCollectionsMap0009(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(0, '0');
  testMap.set(1, '1');
  const iterator = testMap.keys();
  return iterator.next().value === 0 && iterator.next().value === 1;
}

@Concurrent
export function testCollectionsMap0010(): boolean {
  const testMap = new collections.Map<number, string>();
  const iterator = testMap.values();
  return iterator.next().done === true;
}

@Concurrent
export function testCollectionsMap0011(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(0, '0');
  testMap.set(1, '1');
  const iterator = testMap.values();
  return iterator.next().value === '0' && iterator.next().value === '1';
}

@Concurrent
export function testCollectionsMap0012(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(0, '0');
  let iterator = testMap.values();
  if (iterator.next().value !== '0') {
    return false;
  }
  testMap.set(1, 'test');
  iterator = testMap.values();
  return iterator.next().value === '0' && iterator.next().value === 'test';
}

@Concurrent
export function testCollectionsMap0013(): boolean {
  const testMap = new collections.Map<number, string>()
  testMap.set(0, '0');
  const iterator = testMap.values();
  let rst = iterator.next().value == '0';
  testMap.set(1, 'test');
  testMap.delete(1);
  const iterator1 = testMap.values();
  let rst1 = iterator1.next().value == '0';
  return rst && rst1;
}

@Concurrent
export function testCollectionsMap0014(): boolean | undefined {
  const testMap = new collections.Map<number, string>();
  testMap.set(0, '0');
  let iterator = testMap.values();
  if (iterator.next().value !== '0') {
    return false;
  }
  testMap.set(1, 'test');
  testMap.clear();
  iterator = testMap.values();
  return iterator.next().done;
}

@Concurrent
export function testCollectionsMap0015(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.clear();
  return testMap.size === 0 && testMap.get(1) === undefined && testMap.has(1) === false;
}

@Concurrent
export function testCollectionsMap0016(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, '0');
  testMap.set(2, '1');
  testMap.clear();
  return testMap.size === 0 && testMap.get(1) === undefined && testMap.has(2) === false;
}

@Concurrent
export function testCollectionsMap0017(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, '0');
  testMap.set(2, '1');
  testMap.clear();
  testMap.set(3, '4');
  return testMap.size === 1 && testMap.get(3) === '4' && testMap.has(3) === true;
}

@Concurrent
export function testCollectionsMap0018(): boolean {
  const testMap = new collections.Map<string, string>();
  return testMap.delete("") === false;
}

@Concurrent
export function testCollectionsMap0019(): boolean {
  const testMap = new collections.Map<string, string>();
  testMap.set('0', '1');
  return testMap.delete("") === false;
}

@Concurrent
export function testCollectionsMap0020(): boolean {
  const testMap = new collections.Map<null, string>();
  return testMap.delete(null) === false;
}

@Concurrent
export function testCollectionsMap0021(): boolean {
  const testMap = new collections.Map<null, string>();
  testMap.set(null, '0');
  return testMap.delete(null) === true;
}

@Concurrent
export function testCollectionsMap0022(): boolean {
  const testMap = new collections.Map<undefined, string>();
  return testMap.delete(undefined) === false;
}

@Concurrent
export function testCollectionsMap0023(): boolean {
  const testMap = new collections.Map<undefined, string>();
  testMap.set(undefined, '0');
  return testMap.delete(undefined) === true;
}

@Concurrent
export function testCollectionsMap0024(): boolean {
  const testMap = new collections.Map<number, string>();
  return testMap.delete(1) === false;
}

@Concurrent
export function testCollectionsMap0025(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  return testMap.delete(1) === true;
}

@Concurrent
export function testCollectionsMap0026(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  return testMap.delete(2) === false;
}

@Concurrent
export function testCollectionsMap0027(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  if (testMap.delete(1) !== true) {
    return false;
  }
  testMap.set(2, 'b');
  if (testMap.delete(1) !== false) {
    return false;
  }
  if (testMap.delete(2) !== true) {
    return false;
  }
  testMap.clear();
  return testMap.delete(2) === false;
}

@Concurrent
export function testCollectionsMap0028(): boolean {
  let tempNum = 0;
  new collections.Map<number, string>([]).forEach((value, key, map) => {
    tempNum++;
  });
  return tempNum === 0;
}

@Concurrent
export function testCollectionsMap0029(): boolean {
  let tempNum = 0;
  let isValid = true;
  new collections.Map<number, string>([
    [0, 'foo'],
    [1, 'bar'],
  ]).forEach((value, key, map) => {
    if ((key === 0 && value !== 'foo') || (key === 1 && value !== 'bar')) {
      isValid = false;
    }
    tempNum++;
  });
  return isValid && tempNum === 2;
}

@Concurrent
export function testCollectionsMap0030(): string {
  try {
    let tempNum: number = 0;
    new collections.Map<number, string>([
      [0, 'foo'],
      [1, 'bar'],
    ]).forEach((value, key, map) => {
      console.info(`m[${key}] = ${value}`);
      map.delete(key);
      tempNum = tempNum + 1;
    });
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0031(): string {
  try {
    let tempNum: number = 0;
    new collections.Map<number, string>([
      [0, 'foo'],
      [1, 'bar'],
    ]).forEach((value, key, map) => {
      console.info(`m[${key}] = ${value}`);
      map.clear();
      tempNum = tempNum + 1;
    });
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsMap0032(): boolean {
  const testMap = new collections.Map<string, string>();
  return testMap.get("") === undefined;
}

@Concurrent
export function testCollectionsMap0033(): boolean {
  const testMap = new collections.Map<string, string>();
  testMap.set('0', 'a');
  console.info("testMap is: ", testMap);
  return testMap.get("") === undefined;
}

@Concurrent
export function testCollectionsMap0034(): boolean {
  const testMap = new collections.Map<null, string>();
  return testMap.get(null) === undefined;
}

@Concurrent
export function testCollectionsMap0035(): boolean {
  const testMap = new collections.Map<null, string>();
  testMap.set(null, 'a');
  console.info("testMap is: ", testMap);
  return testMap.get(null) === 'a';
}

@Concurrent
export function testCollectionsMap0036(): boolean {
  const testMap = new collections.Map<undefined, string>();
  console.info("testMap is: ", testMap);
  return testMap.get(undefined) === undefined;
}

@Concurrent
export function testCollectionsMap0037(): boolean {
  const testMap = new collections.Map<undefined, string>();
  testMap.set(undefined, 'a');
  console.info("testMap is: ", testMap);
  return testMap.get(undefined) === 'a';
}

@Concurrent
export function testCollectionsMap0038(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  console.info("testMap is: ", testMap);
  return testMap.get(1) === 'a';
}

@Concurrent
export function testCollectionsMap0039(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  console.info("testMap is: ", testMap);
  return testMap.get(2) === undefined;
}

@Concurrent
export function testCollectionsMap0040(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  if (testMap.get(1) !== 'a') {
    return false;
  }
  testMap.delete(1);
  if (testMap.get(1) !== undefined) {
    return false;
  }
  testMap.set(2, 'b');
  if (testMap.get(2) !== 'b') {
    return false;
  }
  testMap.clear();
  return testMap.get(2) === undefined;
}

@Concurrent
export function testCollectionsMap0041(): boolean {
  const testMap = new collections.Map<string, string>();
  return testMap.has("") === false;
}

@Concurrent
export function testCollectionsMap0042(): boolean {
  const testMap = new collections.Map<string, string>();
  testMap.set('0', 'a');
  return testMap.has("") === false;
}

@Concurrent
export function testCollectionsMap0043(): boolean {
  const testMap = new collections.Map<null, string>();
  return testMap.has(null) === false;
}

@Concurrent
export function testCollectionsMap0044(): boolean {
  const testMap = new collections.Map<null, string>();
  testMap.set(null, 'a');
  return testMap.has(null) === true;
}

@Concurrent
export function testCollectionsMap0045(): boolean {
  const testMap = new collections.Map<undefined, string>();
  return testMap.has(undefined) === false;
}

@Concurrent
export function testCollectionsMap0046(): boolean {
  const testMap = new collections.Map<undefined, string>();
  testMap.set(undefined, 'a');
  return testMap.has(undefined) === true;
}

@Concurrent
export function testCollectionsMap0047(): boolean {
  const testMap = new collections.Map<number, string>();
  return testMap.has(1) === false;
}

@Concurrent
export function testCollectionsMap0048(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  return testMap.has(1) === true;
}

@Concurrent
export function testCollectionsMap0049(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  return testMap.has(2) === false;
}

@Concurrent
export function testCollectionsMap0050(): boolean {
  const testMap = new collections.Map<number, string>();
  testMap.set(1, 'a');
  if (testMap.has(1) !== true) {
    return false;
  }
  testMap.delete(1);
  if (testMap.has(1) !== false) {
    return false;
  }
  testMap.set(2, 'b');
  if (testMap.has(2) !== true) {
    return false;
  }
  testMap.clear();
  return testMap.has(2) === false;
}

@Concurrent
export function testCollectionsMap0051(): boolean {
  const testMap = new collections.Map<string, string>();
  testMap.set("", 'a');
  return testMap.size === 1 && testMap.get("") === 'a';
}

@Concurrent
export function testCollectionsMap0052(): boolean {
  const testMap = new collections.Map<string, string>();
  testMap.set("a", "0");
  return testMap.size === 1 && testMap.get("a") === '0';
}

@Concurrent
export function testCollectionsMap0053(): boolean {
  const testMap = new collections.Map<null, string>();
  testMap.set(null, "0");
  return testMap.size === 1 && testMap.get(null) === '0';
}

@Concurrent
export function testCollectionsMap0054(): boolean {
  const testMap = new collections.Map<undefined, string>();
  testMap.set(undefined, "0");
  return testMap.size === 1 && testMap.get(undefined) === '0';
}

@Concurrent
export function testCollectionsMap0055(): boolean {
  const testMap = new collections.Map<string, string>();
  let tempStr = new Array(2048).join('a');
  testMap.set(tempStr, "0");
  return testMap.size === 1 && testMap.get(tempStr) === '0';
}

@Concurrent
export function testCollectionsMap0056(): boolean {
  const testMap = new collections.Map<string, null>();
  testMap.set('0', null);
  return testMap.size === 1 && testMap.get('0') === null;
}

@Concurrent
export function testCollectionsMap0057(): boolean {
  const testMap = new collections.Map<string, number>();
  testMap.set('0', 1);
  return testMap.size === 1 && testMap.get('0') === 1;
}

@Concurrent
export function testCollectionsMap0058(): boolean {
  const testMap = new collections.Map<string, undefined>();
  testMap.set('0', undefined);
  return testMap.size === 1 && testMap.get('0') === undefined;
}

@Concurrent
export function testCollectionsMap0059(): boolean {
  const testMap: collections.Map<number, string> = new collections.Map<number, string>();
  for (let i = 0; i < 1000; i++) {
    testMap.set(i, 'a');
  }
  return testMap.size === 1000 && testMap.get(0) === 'a';
}

@Concurrent
export function testCollectionsMap0060(): boolean {
  const testMap: collections.Map<number, string> = new collections.Map<number, string>();
  testMap.set(1, 'a');
  testMap.delete(1);
  console.info("testMap is: ", testMap);
  let rst1 = testMap.size == 0;
  testMap.set(2, 'b');
  console.info("testMap is: ", testMap);
  let rst2 = testMap.size == 1;
  testMap.clear();
  let rst3 = testMap.size == 0;
  return rst1 && rst2 && rst3;
}