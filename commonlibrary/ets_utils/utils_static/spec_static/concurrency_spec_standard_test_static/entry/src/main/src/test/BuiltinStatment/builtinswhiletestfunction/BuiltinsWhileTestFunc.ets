'use static'
/*
* Copyright (C) 2026 HiHope Open Source Organization.
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

import { getNumber, MyClass, MyColor, MyObject, shouldContinue, ContinueChecker, createContinueChecker } from "../../pages/Utils";

type MyUnionType = number | string;
type Direction = 'up' | 'down' | 'left' | 'right';

export function builtinsStatementWhileTest0100() {
  const TAG = 'builtinsStatementWhileTest0100';
  let executed1 = false;
  while (0) { // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    console.log('print:this is while statement' + 0);
    executed1 = true;
  }
  ;
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + 0);
    executed2 = true;
  } while (0);
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0200() {
  const TAG = 'builtinsStatementWhileTest0200';
  let executed1 = false;
  while (NaN) {
    console.log('print:this is while statement' + NaN);
    executed1 = true;
  }
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + NaN);
    executed2 = true;
  } while (NaN);
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0300() {
  const TAG = 'builtinsStatementWhileTest0300';
  let executed1 = false;
  while ("") {
    console.log('print:this is while statement' + "");
    executed1 = true;
  }
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + "");
    executed2 = true;
  } while ("");
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0400() {
  const TAG = 'builtinsStatementWhileTest0400';
  let executed1 = false;
  while (null) {
    console.log('print:this is while statement' + null);
    executed1 = true;
  }
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + null);
    executed2 = true;
  } while (null);
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0500() {
  const TAG = 'builtinsStatementWhileTest0500';
  let executed1 = false;
  while (undefined) {
    console.log('print:this is while statement' + undefined);
    executed1 = true;
  }
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + undefined);
    executed2 = true;
  } while (undefined);
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0600() {
  const TAG = 'builtinsStatementWhileTest0600';
  let executed1 = false;
  while (!'s') {
    console.log('print:this is while statement' + !'s');
    executed1 = true;
  }
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + !'s');
    executed2 = true;
  } while (!'s');
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0700() {
  const TAG = 'builtinsStatementWhileTest0700';
  let executed1 = false;
  while (!0) {
    console.log('print:this is while statement' + !0);
    executed1 = true;
    break;
  }
  ;
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + !0);
    executed2 = true;
    break;
  } while (!0);
  if (executed1 !== true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0800() {
  const TAG = 'builtinsStatementWhileTest0800';
  let executed1 = false;
  while (true) {
    console.log('print:this is while statement' + true);
    executed1 = true;
    break;
  }
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + true);
    executed2 = true;
    break;
  } while (true);
  if (executed1 !== true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest0900() {
  const TAG = 'builtinsStatementWhileTest0900';
  let executed1 = false;
  while (false) {
    console.log('print:this is while statement' + false);
    executed1 = true;
  }
  ;
  let executed2 = false;
  do {
    console.log('print:this is do while statement' + false);
    executed2 = true;
  } while (false);
  if (executed1 !== !true) {
    console.info(`${TAG} Task execution failed: executed1: ${executed1}`);
    throw new Error('executed1 check failed, expected !true');
  }

  if (executed2 !== true) {
    console.info(`${TAG} Task execution failed: executed2: ${executed2}`);
    throw new Error('executed2 check failed, expected true');
  }
}

export function builtinsStatementWhileTest1000(): void {
  const TAG = 'builtinsStatementWhileTest1000';
  let count1 = 1;
  let count2 = 1;

  // Use ContinueChecker object for thread-safe calls
  const checker = createContinueChecker();

  while (checker.check()) {
    count1++;
  }

  do {
    count2++;
  } while (checker.check());

  if (4 !== count1) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected count1');
  }

  if (2 !== count2) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected count2');
  }
}

export function builtinsStatementWhileTest1100() {
  const TAG = 'builtinsStatementWhileTest1100';
  let count = 1;
  let limit = 5;
  let isRunning = true;
  while (count < limit && isRunning) {
    count++;
    if (count === 3) {
      isRunning = false;
    }
  }
  let x = 0;
  let y = 3;
  let max = 5;
  do {
    console.log(`x: ${x}, y: ${y}`);
    x++;
    y--;
  } while (x < max || y > 0)
  let a = 0;
  let b = 5;
  let c = false;
  while ((a < 3 && b > 2) || !c) {
    console.log(`a: ${a}, b: ${b}, c: ${c}`);
    a++;
    b--;
    if (a === 2) {
      c = true;
    }
  }
  if (3 !== count) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected count');
  }

  if (5 !== x) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected x');
  }

  if (-2 !== y) {
    console.info(`${TAG} Task execution failed: -2: ${-2}`);
    throw new Error('-2 check failed, expected y');
  }

  if (3 !== a) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected a');
  }

  if (2 !== b) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected b');
  }
}

export function builtinsStatementWhileTest1200() {
  const TAG = 'builtinsStatementWhileTest1200';
  let num1: number = 5;
  while (num1) {
    num1--;
  }
  let num2: number = 5;
  do {
    num2--;
  } while (num2);
  if (0 !== num1) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected num1');
  }

  if (0 !== num2) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected num2');
  }
}

export function builtinsStatementWhileTest1300() {
  const TAG = 'builtinsStatementWhileTest1300';
  const arr: number[] = [1, 2, 3, 4];
  let index1 = 0;
  while (arr) {
    if (index1 >= arr.length) {
      break;
    }
    index1++;
  }
  let index2 = 0;
  do {
    if (index2 >= arr.length) {
      break;
    }
    index2++;
  } while (arr);
  if (4 !== index1) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected index1');
  }

  if (4 !== index2) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected index2');
  }
}

export function builtinsStatementWhileTest1400() {
  const TAG = 'builtinsStatementWhileTest1400';
  const str: string = "abcd";
  let index1 = 0;
  while (str) {
    if (index1 >= str.length) {
      break;
    }
    index1++;
  }
  ;
  let index2 = 0;
  do {
    if (index2 >= str.length) {
      break;
    }
    index2++;
  } while (str);
  if (4 !== index1) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected index1');
  }

  if (4 !== index2) {
    console.info(`${TAG} Task execution failed: 4: ${4}`);
    throw new Error('4 check failed, expected index2');
  }
}

export function builtinsStatementWhileTest1500() {
  const TAG = 'builtinsStatementWhileTest1500';
  const obj: MyObject = {
    a: 1, b: 2, c: 3
  };
  const keys = Object.keys(obj);
  let index1 = 0;
  while (obj) {
    if (index1 >= keys.length) {
      break;
    }
    const key = keys[index1];
    index1++;
  }
  let index2 = 0;
  do {
    if (index2 >= keys.length) {
      break;
    }
    const key = keys[index2];
    index2++;
  } while (obj);
  if (3 !== index1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected index1');
  }

  if (3 !== index2) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected index2');
  }
}

export function builtinsStatementWhileTest1600() {
  const TAG = 'builtinsStatementWhileTest1600';
  const num: bigint = 3n;
  let current1: bigint = num;
  while (num) {
    if (current1 === 0n) {
      break;
    }
    current1--;
  }
  let current2: bigint = num;
  do {
    if (current2 === 0n) {
      break;
    }
    current2--;
  } while (num);
  if (0n !== current1) {
    console.info(`${TAG} Task execution failed: 0n: ${0n}`);
    throw new Error('0n check failed, expected current1');
  }

  if (0n !== current2) {
    console.info(`${TAG} Task execution failed: 0n: ${0n}`);
    throw new Error('0n check failed, expected current2');
  }
}

export function builtinsStatementWhileTest1700() {
  const TAG = 'builtinsStatementWhileTest1700';
  const myInstance = new MyClass();
  const keys = Object.keys(myInstance);
  let index1 = 0;
  while (myInstance) {
    if (index1 >= keys.length) {
      break;
    }
    const key = keys[index1];
    index1++;
  }
  let index2 = 0;
  do {
    if (index2 >= keys.length) {
      break;
    }
    const key = keys[index2];
    index2++;
  } while (myInstance)
  if (3 !== index1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected index1');
  }

  if (3 !== index2) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected index2');
  }
}

export function builtinsStatementWhileTest2000() {
  const TAG = 'builtinsStatementWhileTest2000';
  const values: MyUnionType[] = [10, "hello", 20, "world"];
  let index1 = 0;
  while (values[index1]) {
    const currentValue = values[index1];
    if (typeof currentValue === "string" && currentValue === "world") {
      break;
    }
    index1++;
    if (index1 >= values.length) {
      break;
    }
  }
  let index2 = 0;
  do {
    const currentValue = values[index2];
    if (typeof currentValue === "string" && currentValue === "world") {
      break;
    }
    index2++;
    if (index1 >= values.length) {
      break;
    }
    ;
  } while (values[index2]);
  if (3 !== index1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected index1');
  }

  if (3 !== index2) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected index2');
  }
}

export function builtinsStatementWhileTest2200() {
  const TAG = 'builtinsStatementWhileTest2200';
  let currentDirection: Direction = 'up';
  let step1 = 0;
  while (currentDirection) {
    console.log(`当前方向是: ${currentDirection}`);
    if (step1 === 0) {
      currentDirection = 'right';
    } else if (step1 === 1) {
      currentDirection = 'down';
    } else if (step1 === 2) {
      currentDirection = 'left';
    } else {
      console.log('循环结束，已经遍历完所有方向');
      break;
    }
    step1++;
  }
  let step2 = 0;
  do {
    console.log(`当前方向是: ${currentDirection}`);
    // 根据步数改变方向
    if (step2 === 0) {
      currentDirection = 'right';
    } else if (step2 === 1) {
      currentDirection = 'down';
    } else if (step2 === 2) {
      currentDirection = 'left';
    } else {
      console.log('循环结束，已经遍历完所有方向');
      break;
    }
    step2++;
  } while (currentDirection);
  if (3 !== step1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected step1');
  }

  if (3 !== step2) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected step2');
  }
}

export function builtinsStatementWhileTest2300() {
  const TAG = 'builtinsStatementWhileTest2300';
  let num1: number = 0;
  while (0) {
    console.log(`当前数字: ${num1}`);
    num1++;
  }
  let num2: number = 0;
  do {
    console.log(`当前数字: ${num2}`);
    num2++;
  } while (0);
  if (0 !== num1) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected num1');
  }

  if (1 !== num2) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected num2');
  }
}

export function builtinsStatementWhileTest2400() {
  const TAG = 'builtinsStatementWhileTest2400';
  let num1: number = 0;
  while (+0.0) {
    console.log(`当前数字: ${num1}`);
    num1++;
  }
  let num2: number = 0;
  do {
    console.log(`当前数字: ${num2}`);
    num2++;
  } while (+0.0);
  if (0 !== num1) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected num1');
  }

  if (1 !== num2) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected num2');
  }
}

export function builtinsStatementWhileTest2500() {
  const TAG = 'builtinsStatementWhileTest2500';
  let num1: number = 0;
  while (false) {
    console.log(`当前数字: ${num1}`);
    num1++;
  }
  let num2: number = 0;
  do {
    console.log(`当前数字: ${num2}`);
    num2++;
  } while (false);
  if (0 !== num1) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected num1');
  }

  if (1 !== num2) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected num2');
  }
}

export function builtinsStatementWhileTest2600() {
  const TAG = 'builtinsStatementWhileTest2600';
  let num1 = 5;
  let str = "hello";
  while (num1 && str) {
    console.log("所有值都是真值，继续循环");
    num1--;
    if (!num1) {
      console.log("num1 变为假值，跳出循环");
      break;
    }
  }
  let num2 = 0;
  let emptyStr = "";
  let anotherNum = 10;
  do {
    console.log("存在真值，继续循环");
    anotherNum--;
    if (!num2 && !emptyStr && !anotherNum) {
      console.log("所有值都变为假值，跳出循环");
      break;
    }
  } while (num2 || emptyStr || anotherNum);
  if (0 !== num1) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected num1');
  }

  if (0 !== anotherNum) {
    console.info(`${TAG} Task execution failed: 0: ${0}`);
    throw new Error('0 check failed, expected anotherNum');
  }
}

export function builtinsStatementWhileTest2700() {
  const TAG = 'builtinsStatementWhileTest2700';
  const getNextNumber = getNumber();
  let count1 = 0;
  while (getNextNumber()) {
    console.log(`当前数字: ${getNextNumber()}`);
    count1++;
  }
  let count2 = 0;
  do {
    console.log(`当前数字: ${getNextNumber()}`);
    count2++;
  } while (getNextNumber());
  if (3 !== count1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected count1');
  }

  if (1 !== count2) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count2');
  }
}

export function builtinsStatementWhileTest2900() {
  const TAG = 'builtinsStatementWhileTest2900';
  let condition1 = true;
  let count1 = 0;
  while (condition1) {
    condition1 = false;
    count1++;
  }
  let condition2 = true;
  let count2 = 0;
  do {
    condition2 = false;
    count2++;
  } while (condition2);
  if (1 !== count1) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count1');
  }

  if (1 !== count2) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected count2');
  }
}

export function builtinsStatementWhileTest3000() {
  const TAG = 'builtinsStatementWhileTest3000';
  const maxIterations = 5
  let count1 = 0;
  while (count1 < maxIterations) {
    count1++;
  }
  let count2 = 0;
  do {
    count2++;
  } while (count2 < maxIterations);
  if (5 !== count1) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count1');
  }

  if (5 !== count2) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count2');
  }
}

export function builtinsStatementWhileTest3200() {
  const TAG = 'builtinsStatementWhileTest3200';
  let count1 = 0;
  try {
    while (count1 < 5) {
      if (count1 === 3) {
        throw new Error('Throw an exception when Count1 reaches 3');
      }
      console.log(`The current value of count1: ${count1}`);
      count1++;
    }
  } catch (error) {
    error = error as Error;
    console.error(`Exception caught: ${error.message}`);
  } finally {
    console.log('The finally block executes regardless of whether there is an exception');
  }
  let count2 = 0;
  try {
    do {
      if (count2 === 3) {
        throw new Error('Throw an exception when Count2 reaches 3');
      }
      console.log(`The current value of count2: ${count2}`);
      count2++;
    } while (count2 < 5);
  } catch (error) {
    error = error as Error;
    console.error(`Exception caught: ${error.message}`);
  } finally {
    console.log('The finally block executes regardless of whether there is an exception');
  }
  if (3 !== count1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected count1');
  }

  if (3 !== count2) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected count2');
  }
}

export function builtinsStatementWhileTest3300() {
  const TAG = 'builtinsStatementWhileTest3300';
  let count1 = 0;
  while (count1 < 5) {
    count1 = count1 + 1;
    console.log(`The value of num within the loop: ${count1}`);
  }
  if (5 !== count1) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count1');
  }
}

export function builtinsStatementWhileTest3400() {
  const TAG = 'builtinsStatementWhileTest3400';
  let count2 = 0;
  do {
    count2 = count2 + 1;
    console.log(`The value of num within the loop: ${count2}`);
  } while (count2 < 5);
  if (5 !== count2) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected count2');
  }
}

export function builtinsStatementWhileTest3500() {
  const TAG = 'builtinsStatementWhileTest3500';
  let loopIndex1 = 0;
  while (loopIndex1 < 3) {
    let innerVar = loopIndex1 * 2;
    console.log(`The value of innerVar within the loop: ${innerVar}`);
    loopIndex1++;
  }
  if (3 !== loopIndex1) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected loopIndex1');
  }
}

export function builtinsStatementWhileTest3600() {
  const TAG = 'builtinsStatementWhileTest3600';
  let loopIndex2 = 0;
  do {
    let innerVar = loopIndex2 * 2;
    console.log(`The value of innerVar within the loop: ${innerVar}`);
    loopIndex2++;
  } while (loopIndex2 < 5);
  if (5 !== loopIndex2) {
    console.info(`${TAG} Task execution failed: 5: ${5}`);
    throw new Error('5 check failed, expected loopIndex2');
  }
}

export function builtinsStatementWhileTest3700() {
  const TAG = 'builtinsStatementWhileTest3700';
  let num = 0;
  while (num < 10) {
    num++;
  }
  console.log(`The final cumulative data: ${num}`);
  if (10 !== num) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected num');
  }
}

export function builtinsStatementWhileTest3800() {
  const TAG = 'builtinsStatementWhileTest3800';
  let num = 0;
  do {
    num++;
  } while (num < 10);
  console.log(`The final cumulative data: ${num}`);
  if (10 !== num) {
    console.info(`${TAG} Task execution failed: 10: ${10}`);
    throw new Error('10 check failed, expected num');
  }
}

export function builtinsStatementWhileTest3900() {
  const TAG = 'builtinsStatementWhileTest3900';
  let outerCounter = 0;
  while (outerCounter < 3) {
    console.log(`The first iteration of the outer loop ${outerCounter + 1}`);
    let innerCounter = 0;
    while (innerCounter < 2) {
      console.log(` The first iteration of the inner loop is ${innerCounter +
        1} and the current iteration of the outer loop is ${outerCounter + 1}.`);
      innerCounter++;
    }
    outerCounter++;
  }
  if (3 !== outerCounter) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected outerCounter');
  }
}

export function builtinsStatementWhileTest4000() {
  const TAG = 'builtinsStatementWhileTest4000';
  let outerCounter = 0;
  do {
    console.log(`The outer do-while loop is the first iteration of ${outerCounter + 1}`);
    let innerCounter = 0;
    do {
      console.log(`  The first iteration of the inner do-while loop is ${innerCounter +
        1} and the current iteration of the outer do-while loop is ${outerCounter + 1}`);
      innerCounter++;
    } while (innerCounter < 2);
    outerCounter++;
  } while (outerCounter < 3);
  if (3 !== outerCounter) {
    console.info(`${TAG} Task execution failed: 3: ${3}`);
    throw new Error('3 check failed, expected outerCounter');
  }
}

export function builtinsStatementWhileTest4100() {
  const TAG = 'builtinsStatementWhileTest4100';
  let counter1 = 0;
  while (counter1 < 2) {
    console.log(`The first loop, the current iteration: ${counter1 + 1}`);
    let counter2 = 0;
    while (counter2 < 2) {
      console.log(`  The second layer loop, the current iteration: ${counter2 +
        1}，Outer loop iteration: ${counter1 + 1}`);
      let counter3 = 0;
      while (counter3 < 2) {
        console.log(`    The third layer loop, the current iteration: ${counter3 +
          1}，Outer loop iteration: ${counter2 + 1}-${counter1 + 1}`);
        let counter4 = 0;
        while (counter4 < 2) {
          console.log(`     Fourth layer loop, current iteration: ${counter4 + 1}，Outer loop iteration: ${counter3 +
            1}-${counter2 + 1}-${counter1 + 1}`);
          let counter5 = 0;
          while (counter5 < 2) {
            console.log(`        The fifth layer loop, the current iteration: ${counter5 +
              1}，Outer loop iteration: ${counter4 + 1}-${counter3 + 1}-${counter2 + 1}-${counter1 + 1}`);
            counter5++;
          }
          counter4++;
        }
        counter3++;
      }
      counter2++;
    }
    counter1++;
  }
  if (2 !== counter1) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected counter1');
  }
}

export function builtinsStatementWhileTest4200() {
  const TAG = 'builtinsStatementWhileTest4200';
  let counter1 = 0;
  while (counter1 < 2) {
    let counter2 = 0;
    while (counter2 < 2) {
      let counter3 = 0;
      while (counter3 < 2) {
        let counter4 = 0;
        while (counter4 < 2) {
          let counter5 = 0;
          while (counter5 < 2) {
            let counter6 = 0;
            while (counter6 < 2) {
              let counter7 = 0;
              while (counter7 < 2) {
                let counter8 = 0;
                while (counter8 < 2) {
                  let counter9 = 0;
                  while (counter9 < 2) {
                    let counter10 = 0;
                    while (counter10 < 2) {
                      counter10++;
                    }
                    counter9++;
                  }
                  counter8++;
                }
                counter7++;
              }
              counter6++;
            }
            counter5++;
          }
          counter4++;
        }
        counter3++;
      }
      counter2++;
    }
    counter1++;
  }
  if (2 !== counter1) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected counter1');
  }
}

export function builtinsStatementWhileTest4300() {
  const TAG = 'builtinsStatementWhileTest4300';
  let counter1: number = 0;
  do {
    let counter2: number = 0;
    do {
      let counter3: number = 0;
      do {
        let counter4: number = 0;
        do {
          let counter5: number = 0;
          do {
            counter5++;
          } while (counter5 < 2);
          counter4++;
        } while (counter4 < 2);
        counter3++;
      } while (counter3 < 2);
      counter2++;
    } while (counter2 < 2);
    counter1++;
  } while (counter1 < 2);
  if (2 !== counter1) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected counter1');
  }
}

export function builtinsStatementWhileTest4400() {
  const TAG = 'builtinsStatementWhileTest4400';
  let counter1 = 0;
  do {
    let counter2 = 0;
    do {
      let counter3 = 0;
      do {
        let counter4 = 0;
        do {
          let counter5 = 0;
          do {
            let counter6 = 0;
            do {
              let counter7 = 0;
              do {
                let counter8 = 0;
                do {
                  let counter9 = 0;
                  do {
                    let counter10 = 0;
                    do {
                      counter10++;
                    } while (counter10 < 2);
                    counter9++;
                  } while (counter9 < 2);
                  counter8++;
                } while (counter8 < 2);
                counter7++;
              } while (counter7 < 2);
              counter6++;
            } while (counter6 < 2);
            counter5++;
          } while (counter5 < 2);
          counter4++;
        } while (counter4 < 2);
        counter3++;
      } while (counter3 < 2);
      counter2++;
    } while (counter2 < 2);
    counter1++;
  } while (counter1 < 2);
  if (2 !== counter1) {
    console.info(`${TAG} Task execution failed: 2: ${2}`);
    throw new Error('2 check failed, expected counter1');
  }
}
