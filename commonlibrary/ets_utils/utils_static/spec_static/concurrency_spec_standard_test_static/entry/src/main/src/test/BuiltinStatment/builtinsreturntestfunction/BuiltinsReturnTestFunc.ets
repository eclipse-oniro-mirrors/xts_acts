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

import {
  addNumbers,
  filterOddNumbers,
  filterOddNumbersWithNestedLoop,
  filterOddOrZero,
  MyClass,
  MyClass1,
  TestClass,
  createAddFunction,
} from '../../pages/SequenceRunnerSendableTest'

export function builtinsStatementReturnTest_0100() {
  const TAG = 'builtinsStatementReturnTest_0100';
  const result = addNumbers(5, 10);
  if (15 !== result) {
    console.info(`${TAG} Task execution failed: 15: ${15}`);
    throw new Error('15 check failed, expected result');
  }
}

export function builtinsStatementReturnTest_0200() {
  const TAG = 'builtinsStatementReturnTest_0200';
  const result = createAddFunction(5, 10);
  if (15 !== result()) {
    console.info(`${TAG} Task execution failed: 15: ${15}`);
    throw new Error('15 check failed, expected result()');
  }
}

export function builtinsStatementReturnTest_0300() {
  const TAG = 'builtinsStatementReturnTest_0300';
  const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const oddNumbers = filterOddNumbers(numbers);
  if ('1,3,5,7,9' !== oddNumbers.toString()) {
    console.info(`${TAG} Task execution failed: '1,3,5,7,9': ${'1,3,5,7,9'}`);
    throw new Error('"1,3,5,7,9" check failed, expected oddNumbers.toString()');
  }
}

export function builtinsStatementReturnTest_0400() {
  const TAG = 'builtinsStatementReturnTest_0400';
  const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const oddNumbers = filterOddNumbersWithNestedLoop(numbers);
  if ('1,3,5,7,9' !== oddNumbers.toString()) {
    console.info(`${TAG} Task execution failed: '1,3,5,7,9': ${'1,3,5,7,9'}`);
    throw new Error('"1,3,5,7,9" check failed, expected oddNumbers.toString()');
  }
}

export function builtinsStatementReturnTest_0500() {
  const TAG = 'builtinsStatementReturnTest_0500';
  const numbers = 1;
  const oddNumbers = filterOddOrZero(numbers);
  if (1 !== oddNumbers) {
    console.info(`${TAG} Task execution failed: 1: ${1}`);
    throw new Error('1 check failed, expected oddNumbers');
  }
}

export function builtinsStatementReturnTest_0700() {
  const TAG = 'builtinsStatementReturnTest_0700';
  const instance = new MyClass(42);
  if (42 !== instance.value) {
    console.info(`${TAG} Task execution failed: 42: ${42}`);
    throw new Error('42 check failed, expected instance.value');
  }
}

export function builtinsStatementReturnTest_0800() {
  const TAG = 'builtinsStatementReturnTest_0800';
  const instance = new MyClass1();
  if (42 !== instance.value) {
    console.info(`${TAG} Task execution failed: 42: ${42}`);
    throw new Error('42 check failed, expected instance.value');
  }
}

export function builtinsStatementReturnTest_1300() {
  const TAG = 'builtinsStatementReturnTest_1300';
  const instance = new TestClass();
  const result1 = instance.setValueAndReturn(42);
  const result2 = instance.getValue();
  if (result1 !== (result2)) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected (result2)');
  }
}
