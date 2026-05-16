'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

import { condition, Ob, St, Arr, Big, Inter, Colour, cd } from '../../pages/Function';
import { BusinessError } from '@ohos.base';

type ID = string | number;
type Direction = 'north' | 'south' | 'east' | 'west';
type tuple = [string, number, boolean];

export function builtinsStatementIfTest1001() {
  const TAG = 'builtinsStatementIfTest1001';
  let a: number = 0;
  try {
    if (0) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1002() {
  const TAG = 'builtinsStatementIfTest1002';
  let a: number = 0;
  try {
    if (NaN) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1003() {
  const TAG = 'builtinsStatementIfTest1003';
  let a: number = 0;
  try {
    if ('') {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1004() {
  const TAG = 'builtinsStatementIfTest1004';
  let a: number = 0;
  try {
    if (null) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1005() {
  const TAG = 'builtinsStatementIfTest1005';
  let a: number = 0;
  try {
    if (undefined) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1006() {
  const TAG = 'builtinsStatementIfTest1006';
  let a: number = 0;
  try {
    if (!'s') {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1007() {
  const TAG = 'builtinsStatementIfTest1007';
  let a: number = 0;
  try {
    if (!0) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1008() {
  const TAG = 'builtinsStatementIfTest1008';
  let a: number = 0;
  try {
    if (true) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1009() {
  const TAG = 'builtinsStatementIfTest1009';
  let a: number = 0;
  try {
    if (false) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1010() {
  const TAG = 'builtinsStatementIfTest1010';
  let a: number = 0;
  try {
    if (condition()) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1011() {
  const TAG = 'builtinsStatementIfTest1011';
  let a: number = 0;
  try {
    if ((2 > 1) && (4 == 4)) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1012() {
  const TAG = 'builtinsStatementIfTest1012';
  let a: number = 0;
  try {
    if (6) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1013() {
  const TAG = 'builtinsStatementIfTest1013';
  let condition1 = new Array<number>(1, 2, 3);
  let a: number = 0;
  try {
    if (condition1) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1014() {
  const TAG = 'builtinsStatementIfTest1014';
  let condition1: string = 'abc'
  let a: number = 0;
  try {
    if (condition1) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1015() {
  const TAG = 'builtinsStatementIfTest1015';
  let person: Ob = new Ob('a', 12)
  let a: number = 0;
  try {
    if (person) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1016() {
  const TAG = 'builtinsStatementIfTest1016';
  let num: bigint = 10000000000000000000n
  let a: number = 0;
  try {
    if (num) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1017() {
  const TAG = 'builtinsStatementIfTest1017';
  let str: St = new St('abcd')
  let a: number = 0;
  try {
    if (str) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1018() {
  const TAG = 'builtinsStatementIfTest1018';
  let array: Arr<number> = new Arr<number>()
  let a: number = 0;
  try {
    if (array) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1019() {
  const TAG = 'builtinsStatementIfTest1019';
  let num: Big = new Big(100000n)
  let a: number = 0;
  try {
    if (num) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1020() {
  const TAG = 'builtinsStatementIfTest1020';
  let str: string = 'abc';
  let box: Box<string> = new Box<string>(str)
  let a: number = 0;
  try {
    if (box) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1021() {
  const TAG = 'builtinsStatementIfTest1021';
  let num: number = 123;
  let box: Box<number> = new Box<number>(num)
  let a: number = 0;
  try {
    if (box) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1022() {
  const TAG = 'builtinsStatementIfTest1022';
  let bool: boolean = true;
  let box: Box<boolean> = new Box<boolean>(bool)
  let a: number = 0;
  try {
    if (box) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1023() {
  const TAG = 'builtinsStatementIfTest1023';
  let bignum: bigint = 110n;
  let box: Box<bigint> = new Box<bigint>(bignum)
  let a: number = 0;
  try {
    if (box) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1024() {
  const TAG = 'builtinsStatementIfTest1024';
  let i: Inter = {
    value: '888'
  }
  let a: number = 0;
  try {
    if (i) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1025() {
  const TAG = 'builtinsStatementIfTest1025';
  let r: Colour = Colour.RED;
  let a: number = 0;
  try {
    if (r) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1026() {
  const TAG = 'builtinsStatementIfTest1026';
  let g: Colour = Colour.GREEN;
  let a: number = 0;
  try {
    if (g) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1027() {
  const TAG = 'builtinsStatementIfTest1027';
  let t: tuple = ['a', 1, true];
  let a: number = 0;
  try {
    if (t) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1028() {
  const TAG = 'builtinsStatementIfTest1028';
  let i: ID = 10;
  let a: number = 0;
  try {
    if (i) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1029() {
  const TAG = 'builtinsStatementIfTest1029';
  let d: Direction = 'north';
  let a: number = 0;
  try {
    if (d) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1031() {
  const TAG = 'builtinsStatementIfTest1031';
  let a: number = 0;
  try {
    if (true) {
      a++;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1032() {
  const TAG = 'builtinsStatementIfTest1032';
  let a: number = 0;
  try {
    if (true) {
      a++;
    } else {
      a--;
    }
  } catch (e) {
  }
  if (1 !== a) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1034() {
  const TAG = 'builtinsStatementIfTest1034';
  let a: number = 0;
  try {
    if (false) {
      a++;
    } else if (true) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1035() {
  const TAG = 'builtinsStatementIfTest1035';
  let a: number = 0;
  try {
    if (0) {
      a++;
    } else if (!0) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1036() {
  const TAG = 'builtinsStatementIfTest1036';
  let a: number = 0;
  try {
    if (NaN) {
      a++;
    } else if (!NaN) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1037() {
  const TAG = 'builtinsStatementIfTest1037';
  let a: number = 0;
  try {
    if ('') {
      a++;
    } else if (!'') {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1038() {
  const TAG = 'builtinsStatementIfTest1038';
  let a: number = 0;
  try {
    if (null) {
      a++;
    } else if (!null) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1039() {
  const TAG = 'builtinsStatementIfTest1039';
  let a: number = 0;
  try {
    if (undefined) {
      a++;
    } else if (!undefined) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1040() {
  const TAG = 'builtinsStatementIfTest1040';
  let a: number = 0;
  try {
    if (undefined) {
      a++;
    } else if (!undefined) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1041() {
  const TAG = 'builtinsStatementIfTest1041';
  let a: number = 0;
  try {
    if (!'s') {
      a++;
    } else if ('s') {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1042() {
  const TAG = 'builtinsStatementIfTest1042';
  let a: number = 0;
  try {
    if (cd()) {
      a++;
    } else if (condition()) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1043() {
  const TAG = 'builtinsStatementIfTest1043';
  let condition1 = true;
  let condition2 = false;
  let a: number = 0;
  try {
    if (!condition1 || condition2) {
      a++;
    } else if (condition1 && !condition2) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1044() {
  const TAG = 'builtinsStatementIfTest1044';
  let score = 85;
  let a: number = 0;
  try {
    if (score >= 90) {
      a++;
    } else if (score >= 80) {
      a += 2;
    } else if (score >= 70) {
      a += 3;
    } else if (score >= 60) {
      a += 4;
    } else {
      a += 5;
    }
  } catch (e) {
  }
  if (2 !== a) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected a');
  }
}

export function builtinsStatementIfTest1045() {
  const TAG = 'builtinsStatementIfTest1045';
  let condition1: Array<number> = new Array<number>(1, 2, 3);
  let a: number = 0;
  try {
    if (!condition1) {
      a++;
    } else if (condition1) {
      a--;
    }
  } catch (e) {
    e = e as BusinessError;
    console.info('error is', e.message)
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1046() {
  const TAG = 'builtinsStatementIfTest1046';
  let condition1: string = 'abc';
  let a: number = 0;
  try {
    if (!condition1) {
      a++;
    } else if (condition1) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1047() {
  const TAG = 'builtinsStatementIfTest1047';
  let person: Ob = new Ob('a', 12)
  let a: number = 0;
  try {
    if (!person) {
      a++;
    } else if (person) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1048() {
  const TAG = 'builtinsStatementIfTest1048';
  let num: bigint = 10000000000000000000n
  let a: number = 0;
  try {
    if (!num) {
      a++;
    } else if (num) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1049() {
  const TAG = 'builtinsStatementIfTest1049';
  let str: St = new St('abcd')
  let a: number = 0;
  try {
    if (!str) {
      a++;
    } else if (str) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1050() {
  const TAG = 'builtinsStatementIfTest1050';
  let array: Arr<number> = new Arr<number>()
  let a: number = 0;
  try {
    if (!array) {
      a++;
    } else if (array) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1051() {
  const TAG = 'builtinsStatementIfTest1051';
  let num: Big = new Big(100000n)
  let a: number = 0;
  try {
    if (!num) {
      a++;
    } else if (num) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1052() {
  const TAG = 'builtinsStatementIfTest1052';
  let str: string = 'abc';
  let box: Box<string> = new Box<string>(str)
  let a: number = 0;
  try {
    if (!box) {
      a++;
    } else if (box) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1053() {
  const TAG = 'builtinsStatementIfTest1053';
  let num: number = 123;
  let box: Box<number> = new Box<number>(num)
  let a: number = 0;
  try {
    if (!box) {
      a++;
    } else if (box) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1054() {
  const TAG = 'builtinsStatementIfTest1054';
  let bool: boolean = true;
  let box: Box<boolean> = new Box<boolean>(bool)
  let a: number = 0;
  try {
    if (!box) {
      a++;
    } else if (box) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1055() {
  const TAG = 'builtinsStatementIfTest1055';
  let bignum: bigint = 110n;
  let box: Box<bigint> = new Box<bigint>(bignum)
  let a: number = 0;
  try {
    if (!box) {
      a++;
    } else if (box) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1056() {
  const TAG = 'builtinsStatementIfTest1056';
  let a: Inter = {
    value: '888'
  }
  let b: number = 0;
  try {
    if (!a) {
      b++;
    } else if (a) {
      b--;
    }
  } catch (e) {
  }
  if (-1 !== b) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected b');
  }
}

export function builtinsStatementIfTest1057() {
  const TAG = 'builtinsStatementIfTest1057';
  let a: Colour = Colour.GREEN;
  let b: Colour = Colour.RED;
  let c: number = 0;
  try {
    if (b) {
      c++;
    } else if (a) {
      c--;
    }
  } catch (e) {
  }
  if (-1 !== c) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected c');
  }
}

export function builtinsStatementIfTest1058() {
  const TAG = 'builtinsStatementIfTest1058';
  let a: tuple = ['a', 1, true];
  let b: number = 0;
  try {
    if (!a) {
      b++;
    } else if (a) {
      b--;
    }
  } catch (e) {
  }
  if (-1 !== b) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected b');
  }
}

export function builtinsStatementIfTest1059() {
  const TAG = 'builtinsStatementIfTest1059';
  let a: ID = 10;
  let b: number = 0;
  try {
    if (!a) {
      b++;
    } else if (a) {
      b--;
    }
  } catch (e) {
  }
  if (-1 !== b) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected b');
  }
}

export function builtinsStatementIfTest1060() {
  const TAG = 'builtinsStatementIfTest1060';
  let a: Direction = 'north';
  let b: number = 0;
  try {
    if (!a) {
      b++;
    } else if (a) {
      b--;
    }
  } catch (e) {
  }
  if (-1 !== b) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected b');
  }
}

export function builtinsStatementIfTest1061() {
  const TAG = 'builtinsStatementIfTest1061';
  let a: number = 0;
  try {
    if (false) {
      a++;
    } else if (true) {
      a--;
    }
  } catch (e) {
  }
  if (-1 !== a) {
    console.info(`${TAG} Task execution failed: -1: ${-1}`);
    throw new Error('-1 check failed, expected a');
  }
}

export function builtinsStatementIfTest1062() {
  const TAG = 'builtinsStatementIfTest1062';
  let a: number = 10;
  let b: number = 5;
  let c: number = 8;
  let num: number = 0;
  try {
    if (a > 0 && b > 0 && c > 0) {
      num++;
      if (a + b > c) {
        num++;
        if (a + c > b) {
          num++;
          if (b + c > a) {
            num++;
            if (Math.abs(a - b) < c) {
              num++;
            } else {
              num--;
            }
          } else {
            num--;
          }
        } else {
          num--;
        }
      } else {
        num--;
      }
    } else {
      num--;
    }
  } catch (e) {
  }
  if (5 !== num) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected num');
  }
}

export function builtinsStatementIfTest1063() {
  const TAG = 'builtinsStatementIfTest1063';
  let num: number = 7;
  let a: number = 0;
  try {
    if (num > 10) {
      a++;
    } else {
      a--;
      if (num <= 5) {
        a++;
      } else {
        a--;
        if (num % 2 === 0) {
          a++;
        } else {
          a--;
          if (num % 3 === 0) {
            a++;
          } else {
            a--;
            if (num % 5 === 0) {
              a++;
            } else {
              a--;
            }
          }
        }
      }
    }
  } catch (e) {
  }
  if (7 !== num) {
    console.info(`${TAG} Task execution failed: 7: ${7}`);
    throw new Error('7 check failed, expected num');
  }
}

export function builtinsStatementIfTest1064() {
  const TAG = 'builtinsStatementIfTest1064';
  let num: number = 15;
  try {
    if (num > 20) {
    } else if (num > 15) {
    } else if (num > 10) {
      if (num % 2 === 0) {
      } else if (num % 3 === 0) {
      }
    } else if (num > 5) {
    } else {
    }
  } catch (e) {
  }
  if (num % 3 === 0 !== true) {
    console.info(`${TAG} Task execution failed: num % 3 === 0: ${num % 3 === 0}`);
    throw new Error('num % 3 === 0 check failed, expected true');
  }
}

export function builtinsStatementIfTest1065() {
  const TAG = 'builtinsStatementIfTest1065';
  let num: number = 50;
  try {
    if (num > 100) {
    } else {
      if (num > 80) {
      } else {
        if (num > 60) {
        } else {
          if (num > 40) {
          } else {
            if (num > 20) {
            } else {
              if (num > 10) {
              } else {
                if (num > 5) {
                } else {
                  if (num > 2) {
                  } else {
                    if (num > 1) {
                    } else {
                      if (num === 0) {
                      } else {
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } catch (e) {
    e = e as BusinessError;
    console.info('error is', e.message);
  }
  if (true !== num > 40) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num > 40');
  }
}

export function builtinsStatementIfTest1066() {
  const TAG = 'builtinsStatementIfTest1066';
  let num: number = 50
  try {
    if (num > 100) {
    } else {
      if (num > 90) {
      } else {
        if (num > 80) {
        } else {
          if (num > 70) {
          } else {
            if (num > 60) {
            } else {
              if (num > 50) {
              } else {
                if (num > 40) {
                } else {
                  if (num > 30) {
                  } else {
                    if (num > 20) {
                    } else {
                      if (num > 10) {
                      } else {
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } catch (e) {
  }
  if (true !== num <= 100) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num <= 100');
  }

  if (true !== num <= 90) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num <= 90');
  }

  if (true !== num <= 80) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num <= 80');
  }

  if (true !== num <= 70) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num <= 70');
  }

  if (true !== num <= 60) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num <= 60');
  }

  if (true !== num <= 50) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num <= 50');
  }

  if (true !== num > 40) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num > 40');
  }
}

export function builtinsStatementIfTest1067() {
  const TAG = 'builtinsStatementIfTest1067';
  let num: number = 50
  try {
    if (num > 100) {
    } else if (num > 90) {
    } else if (num > 80) {
    } else if (num > 70) {
    } else if (num > 60) {
    } else if (num > 50) {
    } else if (num > 40) {
    } else if (num > 30) {
    } else if (num > 20) {
    } else if (num > 10) {
    } else {
    }
  } catch (e) {
  }
  if (true !== num > 40 && num <= 50) {
    console.info(`${TAG} Task execution failed: true: ${true}`);
    throw new Error('true check failed, expected num > 40 && num <= 50');
  }
}

export function builtinsStatementIfTest1068() {
  const TAG = 'builtinsStatementIfTest1068';
  let num: number = 0;
  try {
    if (true) {
      num = 100;
    }
  } catch (e) {
  }
  if (100 !== num) {
    console.info(`${TAG} Task execution failed: 100: ${100}`);
    throw new Error('100 check failed, expected num');
  }
}

export function builtinsStatementIfTest1069() {
  const TAG = 'builtinsStatementIfTest1069';
  let num: number = 0;
  try {
    if (false) {
    } else if (true) {
      num = 100;
    }
  } catch (e) {
  }
  if (100 !== num) {
    console.info(`${TAG} Task execution failed: 100: ${100}`);
    throw new Error('100 check failed, expected num');
  }
}

export function builtinsStatementIfTest1070() {
  const TAG = 'builtinsStatementIfTest1070';
  let num: number = 0;
  try {
    if (false) {
    } else {
      num = 100;
    }
  } catch (e) {
  }
  if (100 !== num) {
    console.info(`${TAG} Task execution failed: 100: ${100}`);
    throw new Error('100 check failed, expected num');
  }
}

export function builtinsStatementIfTest1071() {
  const TAG = 'builtinsStatementIfTest1071';
  let result: string = "";
  try {
    let num: number = 15;
    if (num > 10) {
      result = "Number is greater than 10";
      if (num > 12) {
        result = "Number is greater than 12";
        if (num % 2 === 0) {
          result = "Number is even and greater than 12";
        } else {
          result = "Number is odd and greater than 12";
          if (num === 15) {
            result = "Number is exactly 15";
          } else {
            result = "Number is odd, greater than 12, but not 15";
          }
        }
      } else {
        result = "Number is between 11 and 12";
      }
    } else {
      result = "Number is not greater than 10";
    }
  } catch (e) {
  }
  if ('Number is exactly 15' !== result) {
    console.info(`${TAG} Task execution failed: 'Number is exactly 15': ${'Number is exactly 15'}`);
    throw new Error('"Number is exactly 15" check failed, expected result');
  }
}
