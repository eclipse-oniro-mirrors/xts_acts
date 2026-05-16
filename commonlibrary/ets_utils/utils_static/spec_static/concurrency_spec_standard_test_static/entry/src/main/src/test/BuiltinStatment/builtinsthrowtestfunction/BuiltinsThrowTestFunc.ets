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

import {
  Input2,
  positiveNumbers,
  throwDivisor,
  // throwUsers,
  UserWithAddressAddress
} from '../../pages/ThrowMethod';
import Utils from '../../Util.test';



export function builtinsStatementThrow0100() {
  const TAG = 'builtinsStatementThrow0100';
  let error: Error = new Error('');
  let flag: number = 0
  try {
    throwDivisor(1, 0);
  } catch (err) {
    error = err as Error;
    console.error(error.message);
    flag = 1
  }
  if (error.message !== 'The divisor cannot be zero') {
    console.info(`${TAG} Task execution failed: error.message: ${error.message}`);
    throw new Error('error.message check failed, expected The divisor cannot be zero');
  }

  if (flag !== 1) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 1');
  }
}

export async function builtinsStatementThrow0300() {
  const TAG = 'builtinsStatementThrow0300';
  let flag: number = 0
  let error1: Error = new Error('');
  let error2: Error = new Error('');
  try {
    console.log('Testing testData1:');
    positiveNumbers([1, 0, 3, 4, 5]);
  } catch (err) {
    error1 = err as Error;
    console.error('Error in testData1:', error1.message);
    flag = 4;
    if (error1.message !== 'The number cannot be zero') {
      console.info(`${TAG} Task execution failed: error1.message: ${error1.message}`);
      throw new Error('error1.message check failed, expected The number cannot be zero');
    }
  }
  if (flag !== 4) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 4');
  }
  await Utils.msSleep(100);
  try {
    console.log('Testing testData2:');
    positiveNumbers([1, 2, -3, 4, 5]);
  } catch (err) {
    error2 = err as Error;
    console.error('Error in testData2:', error2.message);
    flag = 5;
    if (error2.message !== 'Numbers should not be negative') {
      console.info(`${TAG} Task execution failed: error2.message: ${error2.message}`);
      throw new Error('error2.message check failed, expected Numbers should not be negative');
    }
  }
  if (flag !== 5) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 5');
  }
}

export async function builtinsStatementThrow0400() {
  let flag: number = 0
  const TAG = 'builtinsStatementThrow0400';
  let error1: Error = new Error('');
  let error2: Error = new Error('');
  let error3: Error = new Error('');
  try {
    console.log('Testing testData1:');
    UserWithAddressAddress('Alice', 30, '123');
  } catch (err) {
    error1 = err as Error;
    console.error('Error in testData1:', error1.message);
    flag = 6;
    if (error1.message !== 'address length must be between 5 and 20 characters') {
      console.info(`${TAG} Task execution failed: error1.message: ${error1.message}`);
      throw new Error('error1.message check failed, expected address length must be between 5 and 20 characters');
    }
  }
  if (flag !== 6) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 6');
  }
  await Utils.msSleep(100);
  try {
    console.log('Testing testData2:');
    UserWithAddressAddress('ab', 30, '123 Main St Wonderland');
  } catch (err) {
    error2 = err as Error;
    console.error('Error in testData2:', error2.message);
    flag = 7;
    if (error2.message !== 'Username too short: must be at least 3 characters long') {
      console.info(`${TAG} Task execution failed: error2.message: ${error2.message}`);
      throw new Error('error2.message check failed, expected Username too short: must be at least 3 characters long');
    }
  }
  if (flag !== 7) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 7');
  }
  await Utils.msSleep(100);
  try {
    console.log('Testing testData3:');
    UserWithAddressAddress('abb', 10, '123 Main St Wonderland');
  } catch (err) {
    error3 = err as Error;
    console.error('Error in testData3:', error3.message);
    flag = 8;
    if (error3.message !== 'Age too young: must be at least 18 years old') {
      console.info(`${TAG} Task execution failed: error3.message: ${error3.message}`);
      throw new Error('error3.message check failed, expected Age too young: must be at least 18 years old');
    }
  }
  if (flag !== 8) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 8');
  }
}

export function builtinsStatementThrow0500() {
  const TAG = 'builtinsStatementThrow0500';
  let a = Input2(1, 0);
  if (a !== null) {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected null');
  }
}

export function builtinsStatementThrow0600() {
  const TAG = 'builtinsStatementThrow0600';
  let err: Error;
  try {
    throw new Error('This is a global error');
  } catch (caughtErr) {
    err = caughtErr as Error;
  }
  if (err.message !== 'This is a global error') {
    console.info(`${TAG} Task execution failed: err.message: ${err.message}`);
    throw new Error('err.message check failed, expected This is a global error');
  }
}
