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
import { BusinessError } from '@ohos.base';

export function throwDivisor(a: number, b: number): number {
  if (b === 0) {
    throw new Error('The divisor cannot be zero');
  }
  return a / b;
}

// export function throwUsers(username: string, age: number): void {
//   if (username && username.length < 3) {
//     throw new Error('The username must contain at least 3 characters');
//   }
//
//   if (age !== undefined && (typeof age !== 'number' || age < 18)) {
//     throw new Error('Age must be numeric and greater than or equal to 18 years');
//   }
//
//   console.log('pass');
//
// }

export function positiveNumbers(numbers: number[]): void {
  for (let i = 0; i < numbers.length; i++) {
    const num = numbers[i];
    if (num == 0) {
      throw new Error('The number cannot be zero');
    }
    if (num < 0) {
      throw new Error('Numbers should not be negative');
    }
    console.log(`Number ${num} is valid`);
  }
  console.log('All numbers are valid');
}

export function UserWithAddressAddress(username: string, age: number, address: string): void {
  if (username.length < 3) {
    throw new Error('Username too short: must be at least 3 characters long');
  }
  if (age < 18) {
    throw new Error('Age too young: must be at least 18 years old');
  }
  if (address.length === 0) {
    throw new Error('address cannot be empty');
  }
  if (address.length < 5 || address.length > 20) {
    throw new Error('address length must be between 5 and 20 characters');
  }
}

export function testTryCatch(): boolean {
  try {
  } catch (error) {
    console.error('An error occurred:', error);
    return false;
  }
  console.log('No errors occurred');
  return true;
}

export function Input(input: string): string {
  try {
    if (input.length < 3) {
      throw new Error('Input too short: must be at least 3 characters long');
    }
    if (!input.includes('@')) {
      throw new Error('Invalid format: input must contain an @ character');
    }
    console.log('Input is valid:', input);
  } catch (error) {
    throw new Error('input error')
  }
  return input
}

export function Input2(a: number, b: number): number | null {
  if (b === 0) {
    console.log('Warning: Division by zero is not allowed. Returning null.');
    return null;
  }
  if (a < 0 && b < 0) {
    throw new Error('a and b cannot be negative number');
  }
  return a / b;
}

export function asyncInput(prompt: string): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      if (prompt === '@') {
        resolve('The user entered @');
      } else {
        reject(new Error('Invalid input'));
      }
    }, 100);
  });
}

export function nestedTryFinally(resourceMessage: string): string {
  try {
    console.log('Get the outer resources');
    resourceMessage = 'Get the outer resources'
    try {
      console.log('Get the inner layer resources');
      resourceMessage = resourceMessage + '\nGet the inner layer resources'
      if (Math.random() > 1) {
        throw new Error('Simulate anomalies');
      }
      console.log('Normal execution is complete');
    } finally {
      console.log('Release the inner layer resources');
      resourceMessage = resourceMessage + '\nRelease the inner layer resources'
    }
  } catch (error) {
    if (error instanceof BusinessError) {
      console.error('An exception was caught:', error.message);
    }
  } finally {
    console.log('Release outer resources');
    resourceMessage = resourceMessage + '\nRelease outer resources'
  }
  return resourceMessage
}

export function bubbleSort(arr: Array<number>): Array<number> {
  try {
    if (arr.length === 0) {
      throw new Error('Array is empty');
    }
    let n = arr.length;
    let swapped: boolean = true;
    do {
      swapped = false;
      for (let i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1]) {
          let temp = arr[i];
          arr[i] = arr[i + 1];
          arr[i + 1] = temp;
          swapped = true;
        }
      }
      n--;
    } while (swapped);
    console.log('Sorted array:', arr);
  } catch (error) {
    if (error instanceof BusinessError) {
      console.error('An error occurred during sorting:', error.message);
    }
  } finally {
    console.info('===========Cleaning up resources...');
  }
  console.info('===========Continuing after try-catch-finally block');
  return arr;
}

export function processArray(arr: number[]): Array<string> {
  let result = new Array<string>();
  let currentMax: number | undefined = undefined;
  for (let value of arr) {
    if (currentMax === undefined || value > currentMax) {
      currentMax = value;
    }
    const processed = `Value: ${value}, Max so far: ${currentMax}`;
    result.push(processed);
    console.log(processed);
  }
  return result;
}

export function processString(input: string | undefined | null): string {
  let joinedString = '';
  if (!input) {
    console.log('Input is empty or undefined.');
    return joinedString;
  }
  try {
    for (let ch of input) {
      if (ch) {
        joinedString += ch;
      }
    }
  } catch (error) {
    error = error as Error;
    console.error('An error occurred while processing the string:', error);
  }
  return joinedString;
}

export function sdkMethod(key: string, value: string): string {
  return `Processed ${key}: ${value}`;
}

export function sdkMethod2(value: string): string {
  return `Processed value: ${value}`;
}

export function processMap(inputMap: Map<string, string>): Array<string> {
  let results = new Array<string>();
  if (!inputMap || inputMap.size === 0) {
    console.log('Input map is empty or undefined.');
    return results;
  }
  try {
    for (let entry of inputMap.entries()) {
      let key = entry[0];
      let value = entry[1];
      const result = sdkMethod(key, value);
      results.push(result);
      console.log(`Processed key-value pair: ${key} => ${value}`);
    }
  } catch (error) {
    console.error('An error occurred while processing the map:', error);
  }
  return results;
}
``
export function processSet(inputSet: Set<string>): Array<string> {
  let results = new Array<string>();
  if (!inputSet || inputSet.size === 0) {
    console.log('Input set is empty or undefined.');
    return results;
  }
  try {
    for (let value of inputSet) {
      const result = sdkMethod2(value);
      results.push(result);
      console.log(`Processed value: ${value}`);
    }
  } catch (error) {
    console.error('An error occurred while processing the set:', error);
  }

  return results;
}

export function processSetWithIterator(inputSet: Set<string>): Array<string> {
  let results = new Array<string>();
  if (!inputSet || inputSet.size === 0) {
    console.log('Input set is empty or undefined.');
    return results;
  }
  try {
    const iterator = inputSet.values();
    for (let value of iterator) {
      const result = sdkMethod2(value);
      results.push(result);
      console.log(`Processed value: ${value}`);
    }
  } catch (error) {
    console.error('An error occurred while processing the set:', error);
  }
  return results;
}
