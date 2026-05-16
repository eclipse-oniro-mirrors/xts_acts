'use static'
/*
* Copyright (C) 2024-2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from '../../Util.test';
import {
  processArray,
  processMap,
  processSet,
  processSetWithIterator,
  processString
} from '../../pages/ThrowMethod';

export async function builtinsStatementForOfTest0100() {
  const TAG = 'builtinsStatementForOfTest0100';
  let arr: number[] = [10, 20, 30];
  let doubledArr = new Array<number>();
  for (let value of arr) {
    let doubled = value * 2;
    doubledArr.push(doubled);
    console.log(`Value: ${value}, Doubled: ${doubled}`);
  }
  ;
  console.log('Doubled array:', doubledArr);
  await Utils.msSleep(100);
  if ('20,40,60' !== doubledArr.toString()) {
    console.info(`${TAG} Task execution failed: '20,40,60': ${'20,40,60'}`);
    throw new Error('"20,40,60" check failed, expected doubledArr.toString()');
  }
}

export async function builtinsStatementForOfTest0200() {
  const TAG = 'builtinsStatementForOfTest0200';
  let arr: number[] = [10, 20, 30];
  let doubledArr = new Array<number>();
  for (const value of arr) {
    const doubled = value * 2;
    doubledArr.push(doubled);
  }
  ;
  await Utils.msSleep(100);
  if ('20,40,60' !== doubledArr.toString()) {
    console.info(`${TAG} Task execution failed: '20,40,60': ${'20,40,60'}`);
    throw new Error('"20,40,60" check failed, expected doubledArr.toString()');
  }
}

export async function builtinsStatementForOfTest0300() {
  const TAG = 'builtinsStatementForOfTest0300';
  let arr: number[] = [10, 20, 30];
  let processedResults = processArray(arr);
  await Utils.msSleep(100);
  expect('Value: 10, Max so far: 10,Value: 20, Max so far: 20,Value: 30, Max so far: 30')
    .assertEqual(processedResults.toString());

}

export async function builtinsStatementForOfTest0400() {
  const TAG = 'builtinsStatementForOfTest0400';
  let arr = [1, 2, undefined, 4, 5];
  let undefinedIndexes: number = 0;
  for (let i = 0; i < arr.length; i++) {
    let element = arr[i];
    if (element === undefined) {
      undefinedIndexes = i;
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if (2 !== undefinedIndexes) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected undefinedIndexes');
  }
}

export async function builtinsStatementForOfTest0500() {
  const TAG = 'builtinsStatementForOfTest0500';
  let arr = [1, 2, 3, null, 4, 5];
  let undefinedIndexes: number = 0;
  for (let i = 0; i < arr.length; i++) {
    let element = arr[i];
    if (element === null) {
      undefinedIndexes = i;
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if (3 !== undefinedIndexes) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected undefinedIndexes');
  }
}

export async function builtinsStatementForOfTest0600() {
  const TAG = 'builtinsStatementForOfTest0600';
  let arr = [1, 2, '', 4, 5];
  let undefinedIndexes: number = 0;
  for (let i = 0; i < arr.length; i++) {
    let element = arr[i];
    if (element === '') {
      undefinedIndexes = i;
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if (2 !== undefinedIndexes) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected undefinedIndexes');
  }
}

export async function builtinsStatementForOfTest0700() {
  const TAG = 'builtinsStatementForOfTest0700';
  let str: string = '';
  let str2: string = ''
  if (str.length === 0) {
    str2 = 'The string is empty.';
  } else {
    for (let cha of str) {
      console.log(cha);
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if ('The string is empty.' !== str2) {
    console.info(`${TAG} Task execution failed: 'The string is empty.': ${'The string is empty.'}`);
    throw new Error('"The string is empty." check failed, expected str2');
  }
}

export function builtinsStatementForOfTest0800() {
  const TAG = 'builtinsStatementForOfTest0800';
  let str: string = 'Hello';
  let str2: string = '';
  if (str.length > 0) {
    str2 = str[0];
  }
  ;
  if ('H' !== str2) {
    console.info(`${TAG} Task execution failed: 'H': ${'H'}`);
    throw new Error('"H" check failed, expected str2');
  }
}

export async function builtinsStatementForOfTest0900() {
  const TAG = 'builtinsStatementForOfTest0900';
  let str = 'Hello undefined World';
  let specialSubstr = 'undefined';
  let foundIndices = new Array<int>();
  let newStr: string = str;
  for (let i = 0; i <= str.length - specialSubstr.length; i++) {
    let match = true;
    for (let j = 0; j < specialSubstr.length; j++) {
      if (str[i + j] !== specialSubstr[j]) {
        match = false;
        break;
      }
      ;
    }
    ;
    if (match) {
      foundIndices.push(i);
    }
    ;
  }
  ;
  foundIndices.sort((a, b) => b - a);
  for (let index of foundIndices) {
    newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
  }
  ;
  await Utils.msSleep(100);
  if ('Hello  World' !== newStr) {
    console.info(`${TAG} Task execution failed: 'Hello  World': ${'Hello  World'}`);
    throw new Error('"Hello  World" check failed, expected newStr');
  }
}

export async function builtinsStatementForOfTest1000() {
  const TAG = 'builtinsStatementForOfTest1000';
  let str = 'Hello null World';
  let specialSubstr = 'null';
  let foundIndices = new Array<int>();
  let newStr: string = str;
  for (let i = 0; i <= str.length - specialSubstr.length; i++) {
    let match = true;
    for (let j = 0; j < specialSubstr.length; j++) {
      if (str[i + j] !== specialSubstr[j]) {
        match = false;
        break;
      }
      ;
    }
    ;
    if (match) {
      foundIndices.push(i);
    }
    ;
  }
  ;
  foundIndices.sort((a, b) => b - a);
  for (let index of foundIndices) {
    newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
  }
  ;
  await Utils.msSleep(100);
  if ('Hello  World' !== newStr) {
    console.info(`${TAG} Task execution failed: 'Hello  World': ${'Hello  World'}`);
    throw new Error('"Hello  World" check failed, expected newStr');
  }
}

export async function builtinsStatementForOfTest1100() {
  const TAG = 'builtinsStatementForOfTest1100';
  let str = 'Hello \'\' World';
  let specialSubstr = '\'\'';
  let foundIndices = new Array<int>();
  let newStr: string = str; // 初始化新字符串为原始字符串
  for (let i = 0; i <= str.length - specialSubstr.length; i++) {
    let match = true;
    for (let j = 0; j < specialSubstr.length; j++) {
      if (str[i + j] !== specialSubstr[j]) {
        match = false;
        break;
      }
      ;
    }
    ;
    if (match) {
      foundIndices.push(i);
    }
    ;
  }
  ;
  foundIndices.sort((a, b) => b - a);
  for (let index of foundIndices) {
    newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
  }
  ;
  console.log('New string after removing \'\':', newStr);
  await Utils.msSleep(110);
  if ('Hello  World' !== newStr) {
    console.info(`${TAG} Task execution failed: 'Hello  World': ${'Hello  World'}`);
    throw new Error('"Hello  World" check failed, expected newStr');
  }
}

export async function builtinsStatementForOfTest1200() {
  const TAG = 'builtinsStatementForOfTest1200';
  let originalString = 'Hello World';
  let joinedString = '';
  for (const cha of originalString) {
    joinedString += cha;
  }
  ;
  await Utils.msSleep(120);
  if ('Hello World' !== joinedString) {
    console.info(`${TAG} Task execution failed: 'Hello World': ${'Hello World'}`);
    throw new Error('"Hello World" check failed, expected joinedString');
  }
}

export async function builtinsStatementForOfTest1300() {
  const TAG = 'builtinsStatementForOfTest1300';
  let testCases = new Array<string>('Hello World');
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
    console.log('Processed string:', result);
  });
  await Utils.msSleep(120);
  if ('Hello World' !== result) {
    console.info(`${TAG} Task execution failed: 'Hello World': ${'Hello World'}`);
    throw new Error('"Hello World" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest1400() {
  const TAG = 'builtinsStatementForOfTest1400';
  let testCases = [
    undefined
  ];
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
    console.log('Processed string:', result);
  });
  await Utils.msSleep(120);
  if ('' !== result) {
    console.info(`${TAG} Task execution failed: '': ${''}`);
    throw new Error('"" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest1500() {
  const TAG = 'builtinsStatementForOfTest1500';
  let testCases = [
    null
  ];
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
    console.log('Processed string:', result);
  });
  await Utils.msSleep(120);
  if ('' !== result) {
    console.info(`${TAG} Task execution failed: '': ${''}`);
    throw new Error('"" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest1600() {
  const TAG = 'builtinsStatementForOfTest1600';
  let testCases = new Array<string>('');
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
  });
  await Utils.msSleep(120)
  if ('' !== result) {
    console.info(`${TAG} Task execution failed: '': ${''}`);
    throw new Error('"" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest1700() {
  const TAG = 'builtinsStatementForOfTest1700';
  let testMapWithException = new Map<string, string>([
    ['name', 'Alice'],
  ]);
  const processedResultsWithException = processMap(testMapWithException);
  await Utils.msSleep(120);
  if ('Processed name: Alice' !== processedResultsWithException.toString()) {
    console.info(`${TAG} Task execution failed: 'Processed name: Alice': ${'Processed name: Alice'}`);
    throw new Error('"Processed name: Alice" check failed, expected processedResultsWithException.toString()');
  }
}

export async function builtinsStatementForOfTest1800() {
  const TAG = 'builtinsStatementForOfTest1800';
  let testSetWithException = new Set<string>(['Alice', 'Bob', 'Charlie']);
  const setException = processSet(testSetWithException);
  await Utils.msSleep(120);
  expect('Processed value: Alice,Processed value: Bob,Processed value: Charlie')
    .assertEqual(setException.toString());

}

export async function builtinsStatementForOfTest1900() {
  const TAG = 'builtinsStatementForOfTest1900';
  let testIteratorWithException = new Set<string>(['abc', 'Tom', 'Sala']);
  const iteratorException = processSetWithIterator(testIteratorWithException);
  await Utils.msSleep(120);
  expect('Processed value: abc,Processed value: Tom,Processed value: Sala')
    .assertEqual(iteratorException.toString());

}

export async function builtinsStatementForOfTest2000() {
  const TAG = 'builtinsStatementForOfTest2000';
  let mixedArray = new Array<Int | Array<Int>>();
  mixedArray.push(1);
  let element2 = new Array<Int>(5, 6, 7);
  mixedArray.push(element2);
  let a: number = 1;
  for (let item of mixedArray) {
    console.log(`Item type: ${typeof item}, Item value:`, item);
    if (Array.isArray(item)) {
      console.log('This is an array with elements:');
      let childItem = item as Array<Int>;
      for (let subItem of childItem) {
        console.log(`Sub-item: ${subItem}`);
      }
      ;
      if (childItem === mixedArray[1]) {
        a = childItem[0].toDouble();
      }
      ;
    } else {
      console.log('This is a non-array item.');
    }
    ;
  }
  ;
  await Utils.msSleep(120);
  if (a !== 5) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected 5');
  }
}

export async function builtinsStatementForOfTest2200() {
  const TAG = 'builtinsStatementForOfTest2200';
  const arr: number[] = [10, 20, 30];
  let doubledArr = new Array<number>();
  for (const value of arr) {
    const doubled = value * 2;
    doubledArr.push(doubled);
    console.log(`Value: ${value}, Doubled: ${doubled}`);
  }
  ;
  console.log('Doubled array:', doubledArr);
  await Utils.msSleep(100);
  if ('20,40,60' !== doubledArr.toString()) {
    console.info(`${TAG} Task execution failed: '20,40,60': ${'20,40,60'}`);
    throw new Error('"20,40,60" check failed, expected doubledArr.toString()');
  }
}

export async function builtinsStatementForOfTest2300() {
  const TAG = 'builtinsStatementForOfTest2300';
  const arr = [1, 2, undefined, 4, 5];
  let undefinedIndexes: number = 0;
  for (let i = 0; i < arr.length; i++) {
    let element = arr[i];
    if (element === undefined) {
      undefinedIndexes = i;
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if (2 !== undefinedIndexes) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected undefinedIndexes');
  }
}

export async function builtinsStatementForOfTest2400() {
  const TAG = 'builtinsStatementForOfTest2400';
  const arr = [1, 2, null, 4, 5];
  let undefinedIndexes: number = 0;
  for (let i = 0; i < arr.length; i++) {
    let element = arr[i];
    if (element === null) {
      undefinedIndexes = i;
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if (2 !== undefinedIndexes) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected undefinedIndexes');
  }
}

export async function builtinsStatementForOfTest2500() {
  const TAG = 'builtinsStatementForOfTest2500';
  const arr = [1, 2, '', 4, 5];
  let undefinedIndexes: number = 0;
  for (let i = 0; i < arr.length; i++) {
    let element = arr[i];
    if (element === '') {
      undefinedIndexes = i;
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if (2 !== undefinedIndexes) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected undefinedIndexes');
  }
}

export async function builtinsStatementForOfTest2600() {
  const TAG = 'builtinsStatementForOfTest2600';
  const str: string = '';
  let str2: string = ''
  if (str.length === 0) {
    str2 = 'The string is empty.';
  } else {
    for (let cha of str) {
      console.log(cha);
    }
    ;
  }
  ;
  await Utils.msSleep(100);
  if ('The string is empty.' !== str2) {
    console.info(`${TAG} Task execution failed: 'The string is empty.': ${'The string is empty.'}`);
    throw new Error('"The string is empty." check failed, expected str2');
  }
}

export function builtinsStatementForOfTest2700() {
  const TAG = 'builtinsStatementForOfTest2700';
  const str: string = 'Hello';
  let str2: string = '';
  if (str.length > 0) {
    str2 = str[0]
  }
  if ('H' !== str2) {
    console.info(`${TAG} Task execution failed: 'H': ${'H'}`);
    throw new Error('"H" check failed, expected str2');
  }
}

export async function builtinsStatementForOfTest2800() {
  const TAG = 'builtinsStatementForOfTest2800';
  const str = 'Hello undefined World';
  let specialSubstr = 'undefined';
  let foundIndices = new Array<int>();
  let newStr = str;
  for (let i = 0; i <= str.length - specialSubstr.length; i++) {
    let match = true;
    for (let j = 0; j < specialSubstr.length; j++) {
      if (String(str.charAt(i + j)) !== specialSubstr[j]) {
        match = false;
        break;
      }
      ;
    }
    ;
    if (match) {
      foundIndices.push(i);
    }
    ;
  }
  ;
  foundIndices.sort((a, b) => b - a);
  for (let index of foundIndices) {
    newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
  }
  ;
  console.log('New string after removing undefined:', newStr);
  await Utils.msSleep(100);
  if ('Hello  World' !== newStr) {
    console.info(`${TAG} Task execution failed: 'Hello  World': ${'Hello  World'}`);
    throw new Error('"Hello  World" check failed, expected newStr');
  }
}

export async function builtinsStatementForOfTest2900() {
  const TAG = 'builtinsStatementForOfTest2900';
  const str = 'Hello null World';
  let specialSubstr = 'null';
  let foundIndices = new Array<int>();
  let newStr = str;
  for (let i = 0; i <= str.length - specialSubstr.length; i++) {
    let match = true;
    for (let j = 0; j < specialSubstr.length; j++) {
      if (String(str.charAt(i + j)) !== specialSubstr[j]) {
        match = false;
        break;
      }
      ;
    }
    ;
    if (match) {
      foundIndices.push(i);
    }
    ;
  }
  ;
  foundIndices.sort((a, b) => b - a);
  for (let index of foundIndices) {
    newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
  }
  ;
  await Utils.msSleep(100);
  if ('Hello  World' !== newStr) {
    console.info(`${TAG} Task execution failed: 'Hello  World': ${'Hello  World'}`);
    throw new Error('"Hello  World" check failed, expected newStr');
  }
}

export async function builtinsStatementForOfTest3000() {
  const TAG = 'builtinsStatementForOfTest3000';
  const str = 'Hello \'\' World';
  let specialSubstr = '\'\'';
  let foundIndices = new Array<int>();
  let newStr = str;
  for (let i = 0; i <= str.length - specialSubstr.length; i++) {
    let match = true;
    for (let j = 0; j < specialSubstr.length; j++) {
      if (String(str.charAt(i + j)) !== specialSubstr[j]) {
        match = false;
        break;
      }
    }
    if (match) {
      foundIndices.push(i);
    }
    ;
  }
  ;
  foundIndices.sort((a, b) => b - a);
  for (let index of foundIndices) {
    newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
  }
  ;
  await Utils.msSleep(100)
  if ('Hello  World' !== newStr) {
    console.info(`${TAG} Task execution failed: 'Hello  World': ${'Hello  World'}`);
    throw new Error('"Hello  World" check failed, expected newStr');
  }
}

export async function builtinsStatementForOfTest3100() {
  const TAG = 'builtinsStatementForOfTest3100';
  const originalString = 'Hello World';
  let joinedString = '';
  for (const cha of originalString) {
    joinedString += cha;
  }
  ;
  await Utils.msSleep(120);
  if ('Hello World' !== joinedString) {
    console.info(`${TAG} Task execution failed: 'Hello World': ${'Hello World'}`);
    throw new Error('"Hello World" check failed, expected joinedString');
  }
}

export async function builtinsStatementForOfTest3200() {
  const TAG = 'builtinsStatementForOfTest3200';
  let testCases = new Array<string>('Hello World');
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
  });
  await Utils.msSleep(120);
  if ('Hello World' !== result) {
    console.info(`${TAG} Task execution failed: 'Hello World': ${'Hello World'}`);
    throw new Error('"Hello World" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest3300() {
  const TAG = 'builtinsStatementForOfTest3300';
  const testCases = [
    null
  ];
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
  });
  await Utils.msSleep(120);
  if ('' !== result) {
    console.info(`${TAG} Task execution failed: '': ${''}`);
    throw new Error('"" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest3400() {
  const TAG = 'builtinsStatementForOfTest3400';
  let testCases = new Array<string>('');
  let result: String = ''
  testCases.forEach((testCase) => {
    result = processString(testCase);
    console.log('Processed string:', result);
  });
  await Utils.msSleep(120);
  if ('' !== result) {
    console.info(`${TAG} Task execution failed: '': ${''}`);
    throw new Error('"" check failed, expected result');
  }
}

export async function builtinsStatementForOfTest3500() {
  const TAG = 'builtinsStatementForOfTest3500';
  const testMapWithException = new Map<string, string>([
    ['name', 'Alice'],
  ]);
  const processedResultsWithException = processMap(testMapWithException);
  console.log('Processed results with exception handling:', processedResultsWithException);
  await Utils.msSleep(120);
  if ('Processed name: Alice' !== processedResultsWithException.toString()) {
    console.info(`${TAG} Task execution failed: 'Processed name: Alice': ${'Processed name: Alice'}`);
    throw new Error('"Processed name: Alice" check failed, expected processedResultsWithException.toString()');
  }
}

export async function builtinsStatementForOfTest3600() {
  const TAG = 'builtinsStatementForOfTest3600';
  const testSetWithException = new Set<string>(['Alice', 'Bob', 'Charlie']);
  const setException = processSet(testSetWithException);
  await Utils.msSleep(120);
  expect('Processed value: Alice,Processed value: Bob,Processed value: Charlie')
    .assertEqual(setException.toString());

}

export async function builtinsStatementForOfTest3700() {
  const TAG = 'builtinsStatementForOfTest3700';
  const testIteratorWithException = new Set<string>(['abc', 'Tom', 'Sala']);
  const iteratorException = processSetWithIterator(testIteratorWithException);
  await Utils.msSleep(120);
  expect('Processed value: abc,Processed value: Tom,Processed value: Sala')
    .assertEqual(iteratorException.toString());

}

export async function builtinsStatementForOfTest3800() {
  const TAG = 'builtinsStatementForOfTest3800';
  let mixedArray = new Array<Int | Array<Int>>();
  mixedArray.push(1);
  let element2 = new Array<Int>(5, 6, 7);
  mixedArray.push(element2);
  let a: number = 1
  for (let item of mixedArray) {
    console.log(`Item type: ${typeof item}, Item value:`, item);
    if (Array.isArray(item)) {
      console.log('This is an array with elements:');
      let childItem = item as Array<Int>;
      for (let subItem of childItem) {
        console.log(`Sub-item: ${subItem}`);
      }
      if (item === mixedArray[1]) {
        a = childItem[0].toDouble();
      }
      ;
    } else {
      console.log('This is a non-array item.');
    }
    ;
  }
  ;
  await Utils.msSleep(120);
  if (a !== 5) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected 5');
  }
}

export async function builtinsStatementForOfTest3900() {
  const TAG = 'builtinsStatementForOfTest3900';
  const matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  let stringElements = new Array<Int>();
  for (const row of matrix) {
    for (const element of row) {
      console.log('==========', string(element));
      stringElements.push(element);
    }
  }
  ;
  await Utils.msSleep(100);
  if (stringElements.toString() !== '1,2,3,4,5,6,7,8,9') {
    console.info(`${TAG} Task execution failed: stringElements.toString(): ${stringElements.toString()}`);
    throw new Error('stringElements.toString() check failed, expected 1,2,3,4,5,6,7,8,9');
  }
}

export async function builtinsStatementForOfTest4000() {
  const TAG = 'builtinsStatementForOfTest4000';
  const matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  let rowIndex = 0;
  const positions = new Array<string>();
  for (const row of matrix) {
    let colIndex = 0;
    for (const element of row) {
      const position = `${rowIndex}, ${colIndex}`;
      positions.push(position);
      colIndex++;
    }
    rowIndex++;
  }
  ;
  await Utils.msSleep(120);
  expect('0, 0,0, 1,0, 2,1, 0,1, 1,1, 2,2, 0,2, 1,2, 2')
    .assertEqual(positions.toString());

}

export async function builtinsStatementForOfTest4100() {
  const TAG = 'builtinsStatementForOfTest4100';
  let num: number = 0
  const array5D = [
    [
      [
        [
          [1, 2],
          [3, 4]
        ],
        [
          [5, 6],
          [7, 8]
        ]
      ]
    ],
    [
      [
        [
          [9, 10],
          [11, 12]
        ],
        [
          [13, 14],
          [15, 16]
        ]
      ]
    ]
  ];
  for (const dim1 of array5D) {
    let index1 = 0;
    for (const dim2 of dim1) {
      let index2 = 0;
      for (const dim3 of dim2) {
        let index3 = 0;
        for (const dim4 of dim3) {
          let index4 = 0;
          for (let element of dim4) {
            let indices = new Array<number>(index1, index2, index3, index4);
            console.log(`Value: ${element} at indices: ${indices.join(', ')}`);
            num++
            index4++;
          }
          index3++;
        }
        index2++;
      }
      index1++;
    }
  }
  await Utils.msSleep(120);
  if (16 !== num) {
    console.info(`${TAG} Task execution failed: 16: ${16}`);
    throw new Error('16 check failed, expected num');
  }
}

export async function builtinsStatementForOfTest4200() {
  const TAG = 'builtinsStatementForOfTest4200';
  let num: number = 0;
  const array10D = [
    [
      [
        [
          [
            [
              [
                [
                  [
                    [[1, 2], [3, 4]],
                    [[5, 6], [7, 8]]
                  ],
                  [
                    [[9, 10], [11, 12]],
                    [[13, 14], [15, 16]]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]
  ];

  for (const dim1 of array10D) {
    let index1 = 0;
    for (const dim2 of dim1) {
      let index2 = 0;
      for (const dim3 of dim2) {
        let index3 = 0;
        for (const dim4 of dim3) {
          let index4 = 0;
          for (const dim5 of dim4) {
            let index5 = 0;
            for (const dim6 of dim5) {
              let index6 = 0;
              for (const dim7 of dim6) {
                let index7 = 0;
                for (const dim8 of dim7) {
                  let index8 = 0;
                  for (const dim9 of dim8) {
                    let index9 = 0;
                    for (const element of dim9) {
                      let indices =
                        new Array<number>(index1, index2, index3, index4, index5, index6, index7, index8, index9);
                      console.log(`Value: ${element} at indices: ${indices.join(', ')}`);
                      num++;
                      index9++;
                    }
                    index8++;
                  }
                  index7++;
                }
                index6++;
              }
              index5++;
            }
            index4++;
          }
          index3++;
        }
        index2++;
      }
      index1++;
    }
  }
  await Utils.msSleep(120);
  if (8 !== num) {
    console.info(`${TAG} Task execution failed: 8: ${8}`);
    throw new Error('8 check failed, expected num');
  }
}

export async function builtinsStatementForOfTest4300() {
  const TAG = 'builtinsStatementForOfTest4300';
  let foundValue: number | null = null;
  let foundIndex: number | null = null;
  const array1D = new Array<number>(10, 20, 30, 40, 50);
  for (const element of array1D) {
    const currentIndex = array1D.indexOf(element);
    if (element === 30) {
      foundValue = element;
      foundIndex = currentIndex;
      break;
    }
  }
  await Utils.msSleep(120);
  if (30 !== foundValue) {
    console.info(`${TAG} Task execution failed: 30: ${30}`);
    throw new Error('30 check failed, expected foundValue');
  }

  if (2 !== foundIndex) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected foundIndex');
  }
}

export function builtinsStatementForOfTest4400() {
  const TAG = 'builtinsStatementForOfTest4400';
  const currentIndex: string = ''
  const array = new Array<number>(10, 20, 30, 40, 50);
  let foundValue: number | null = null;
  for (const element of array) {
    const currentIndex = array.indexOf(element);
    const innerVariable = `Current element is ${element}, at index ${currentIndex}`;
    if (element === 30) {
      foundValue = element;
      break;
    }
  }
  ;
  if (30 !== foundValue) {
    console.info(`${TAG} Task execution failed: 30: ${30}`);
    throw new Error('30 check failed, expected foundValue');
  }

  if ('' !== currentIndex) {
    console.info(`${TAG} Task execution failed: '': ${''}`);
    throw new Error('"" check failed, expected currentIndex');
  }
}
