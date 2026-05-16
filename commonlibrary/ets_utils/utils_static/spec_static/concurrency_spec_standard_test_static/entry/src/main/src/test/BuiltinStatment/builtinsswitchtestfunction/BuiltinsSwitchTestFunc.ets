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


import {
  getCharacterType,
  ColorSet,
  processPerson,
  Person,
  oneCaseClause,
  anyCaseClause,
  breakCaseClause,
  breakAnyCaseDefaultClause,
  breakNotCaseDefaultClause,
  describeDayAndHour,
  handleUserAction,
  nestedSwitchExample,
} from '../../pages/SequenceRunnerTaskMethodTest'

export function builtinsStatementSwitchTest_2100() {
  const TAG = 'builtinsStatementSwitchTest_2100';
  const thisChar = 'A';
  const getChar: string = getCharacterType(thisChar);
  if ('Uppercase letter' !== getChar) {
    console.info(`${TAG} Task execution failed: 'Uppercase letter': ${'Uppercase letter'}`);
    throw new Error('"Uppercase letter" check failed, expected getChar');
  }
}

export function builtinsStatementSwitchTest_2300() {
  const TAG = 'builtinsStatementSwitchTest_2300';
  const person: Person = {
    name: 'Alice', age: 30, role: 'admin'
  };
  const getObject: string = processPerson(person);
  if ('Alice is an admin.' !== getObject) {
    console.info(`${TAG} Task execution failed: 'Alice is an admin.': ${'Alice is an admin.'}`);
    throw new Error('"Alice is an admin." check failed, expected getObject');
  }
}

export function builtinsStatementSwitchTest_2400() {
  const TAG = 'builtinsStatementSwitchTest_2400';
  const key: string = oneCaseClause(1);
  if ('the number is 1' !== key) {
    console.info(`${TAG} Task execution failed: 'the number is 1': ${'the number is 1'}`);
    throw new Error('"the number is 1" check failed, expected key');
  }
}

export function builtinsStatementSwitchTest_2800() {
  const TAG = 'builtinsStatementSwitchTest_2800';
  const key: string = breakCaseClause(1);
  if ('The value is one.' !== key) {
    console.info(`${TAG} Task execution failed: 'The value is one.': ${'The value is one.'}`);
    throw new Error('"The value is one." check failed, expected key');
  }
}

export function builtinsStatementSwitchTest_3200() {
  const TAG = 'builtinsStatementSwitchTest_3200';
  const key: string = anyCaseClause(1);
  if ('the number is 1' !== key) {
    console.info(`${TAG} Task execution failed: 'the number is 1': ${'the number is 1'}`);
    throw new Error('"the number is 1" check failed, expected key');
  }
}

export function builtinsStatementSwitchTest_3400() {
  const TAG = 'builtinsStatementSwitchTest_3400';
  const key: string = breakAnyCaseDefaultClause(1);
  if ('The value is one.' !== key) {
    console.info(`${TAG} Task execution failed: 'The value is one.': ${'The value is one.'}`);
    throw new Error('"The value is one." check failed, expected key');
  }
}

export function builtinsStatementSwitchTest_3500() {
  const TAG = 'builtinsStatementSwitchTest_3500';
  const key: string = breakNotCaseDefaultClause(1);
  if ('The value is 1.' !== key) {
    console.info(`${TAG} Task execution failed: 'The value is 1.': ${'The value is 1.'}`);
    throw new Error('"The value is 1." check failed, expected key');
  }
}

export function builtinsStatementSwitchTest_3600() {
  const TAG = 'builtinsStatementSwitchTest_3600';
  let result: string = '';
  let additionalInfo: string = 'No additional info.';
  const value: number = 1;
  switch (value.toInt()) {
    case 0:
      result = 'The value is zero.';
      additionalInfo = 'Zero is special.';
      break;
    case 1:
      result = 'The value is one.';
      additionalInfo = 'One is also special.';
      break;
    case 42:
      result = 'The value is the answer to life, the universe, and everything.';
      additionalInfo = '42 is the ultimate answer.';
      break;
    default:
      result = `The value is ${value}.`;
      additionalInfo = 'No special meaning.';
  }
  if ('The value is one.' !== result) {
    console.info(`${TAG} Task execution failed: 'The value is one.': ${'The value is one.'}`);
    throw new Error('"The value is one." check failed, expected result');
  }

  if ('One is also special.' !== additionalInfo) {
    console.info(`${TAG} Task execution failed: 'One is also special.': ${'One is also special.'}`);
    throw new Error('"One is also special." check failed, expected additionalInfo');
  }
}

export function builtinsStatementSwitchTest_3700() {
  const TAG = 'builtinsStatementSwitchTest_3700';
  let key1: string = describeDayAndHour(0, 8);
  let key2: string = describeDayAndHour(1, 9);
  let key3: string = describeDayAndHour(2, 10);
  let key4: string = describeDayAndHour(3, 12);
  console.log(describeDayAndHour(0, 8));
  console.log(describeDayAndHour(1, 9));
  console.log(describeDayAndHour(2, 10));
  console.log(describeDayAndHour(3, 12));
  if ('Today is Sunday. It\'s 8 AM. Time for breakfast.' !== key1) {
    console.info(`${TAG} Task execution failed: 'Today is Sunday. It\'s 8 AM. Time for breakfast.': ${'Today is Sunday. It\'s 8 AM. Time for breakfast.'}`);
    throw new Error('"Today is Sunday. It\'s 8 AM. Time for breakfast." check failed, expected key1');
  }

  if ('Today is Monday. It\'s 9 AM. Time to start work.' !== key2) {
    console.info(`${TAG} Task execution failed: 'Today is Monday. It\'s 9 AM. Time to start work.': ${'Today is Monday. It\'s 9 AM. Time to start work.'}`);
    throw new Error('"Today is Monday. It\'s 9 AM. Time to start work." check failed, expected key2');
  }

  if ('Today is Tuesday. It\'s 10 AM. Time for a meeting.' !== key3) {
    console.info(`${TAG} Task execution failed: 'Today is Tuesday. It\'s 10 AM. Time for a meeting.': ${'Today is Tuesday. It\'s 10 AM. Time for a meeting.'}`);
    throw new Error('"Today is Tuesday. It\'s 10 AM. Time for a meeting." check failed, expected key3');
  }

  if (' It\'s another day of the week.' !== key4) {
    console.info(`${TAG} Task execution failed: ' It\'s another day of the week.': ${' It\'s another day of the week.'}`);
    throw new Error('"It\'s another day of the week." check failed, expected key4');
  }
}

export function builtinsStatementSwitchTest_3800() {
  const TAG = 'builtinsStatementSwitchTest_3800';
  let key1: string = handleUserAction(1, 1);
  let key2: string = handleUserAction(1, 2);
  let key3: string = handleUserAction(2, 1);
  let key4: string = handleUserAction(3, 1);
  console.log(handleUserAction(1, 1));
  console.log(handleUserAction(1, 2));
  console.log(handleUserAction(2, 1));
  console.log(handleUserAction(3, 1));
  if ('Category 1 selected. Action 1 in Category 1.' !== key1) {
    console.info(`${TAG} Task execution failed: 'Category 1 selected. Action 1 in Category 1.': ${'Category 1 selected. Action 1 in Category 1.'}`);
    throw new Error('"Category 1 selected. Action 1 in Category 1." check failed, expected key1');
  }

  if ('Category 1 selected. Action 2 in Category 1.' !== key2) {
    console.info(`${TAG} Task execution failed: 'Category 1 selected. Action 2 in Category 1.': ${'Category 1 selected. Action 2 in Category 1.'}`);
    throw new Error('"Category 1 selected. Action 2 in Category 1." check failed, expected key2');
  }

  if ('Category 2 selected. Action 1 in Category 2.' !== key3) {
    console.info(`${TAG} Task execution failed: 'Category 2 selected. Action 1 in Category 2.': ${'Category 2 selected. Action 1 in Category 2.'}`);
    throw new Error('"Category 2 selected. Action 1 in Category 2." check failed, expected key3');
  }

  if ('Unknown category.' !== key4) {
    console.info(`${TAG} Task execution failed: 'Unknown category.': ${'Unknown category.'}`);
    throw new Error('"Unknown category." check failed, expected key4');
  }
}

export function builtinsStatementSwitchTest_4000() {
  const TAG = 'builtinsStatementSwitchTest_4000';
  let key1: string = nestedSwitchExample(1, 1);
  let key2: string = nestedSwitchExample(1, 3);
  let key3: string = nestedSwitchExample(2, 2);
  let key4: string = nestedSwitchExample(3, 1);
  console.log(nestedSwitchExample(1, 1));
  console.log(nestedSwitchExample(1, 3));
  console.log(nestedSwitchExample(2, 2));
  console.log(nestedSwitchExample(3, 1));
  if ('Value1 is 1. Value2 is 1.' !== key1) {
    console.info(`${TAG} Task execution failed: 'Value1 is 1. Value2 is 1.': ${'Value1 is 1. Value2 is 1.'}`);
    throw new Error('"Value1 is 1. Value2 is 1." check failed, expected key1');
  }

  if ('Value1 is 1. Value2 is not 1 or 2.' !== key2) {
    console.info(`${TAG} Task execution failed: 'Value1 is 1. Value2 is not 1 or 2.': ${'Value1 is 1. Value2 is not 1 or 2.'}`);
    throw new Error('"Value1 is 1. Value2 is not 1 or 2." check failed, expected key2');
  }

  if ('Value1 is 2. Value2 is 2.' !== key3) {
    console.info(`${TAG} Task execution failed: 'Value1 is 2. Value2 is 2.': ${'Value1 is 2. Value2 is 2.'}`);
    throw new Error('"Value1 is 2. Value2 is 2." check failed, expected key3');
  }

  if ('Value1 is not 1 or 2.' !== key4) {
    console.info(`${TAG} Task execution failed: 'Value1 is not 1 or 2.': ${'Value1 is not 1 or 2.'}`);
    throw new Error('"Value1 is not 1 or 2." check failed, expected key4');
  }
}
