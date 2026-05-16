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
  asyncInput,
  bubbleSort,
  Input,
  Input2,
  nestedTryFinally,
  testTryCatch,
  throwDivisor,
} from '../../pages/ThrowMethod';
import Utils from '../../Util.test';

export function builtinsStatementTry0100() {
  const TAG = 'builtinsStatementTry0100';
  try {
    let flag: number = 0;
    testTryCatch();
    throw new Error('Simulated error');
  } catch (error) {
    error = error as Error;
    if (error.message !== 'Simulated error') {
      console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
      throw new Error('error.message check failed, expected Simulated error');
    }
  }
}

export async function builtinsStatementTry0200() {
  const TAG = 'builtinsStatementTry0200';
  try {
    let flag: number = 0;
    try {
      Input('@');
    } catch (error) {
      error = error as Error;
      console.error('Validation failed:', error.message);
      flag = 2;
      if (error.message !== 'input error') {
        console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
        throw new Error('error.message check failed, expected input error');
      }
    }
    if (flag !== 2) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 2');
    }
    await Utils.msSleep(100);
    try {
      Input('@');
    } catch (error) {
      error = error as Error;
      console.error('Validation failed:', error.message);
      flag = 3;
      if (error.message !== 'input error') {
        console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
        throw new Error('error.message check failed, expected input error');
      }
    }
    await Utils.msSleep(100);
    if (flag !== 3) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 3');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0300() {
  const TAG = 'builtinsStatementTry0300';
  try {
    let flag: number = 0;
    try {
      Input('ab');
    } catch (error) {
      error = error as Error;
      flag = 3;
      console.error('Validation failed:', error.message);
      if (error.message !== 'input error') {
        console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
        throw new Error('error.message check failed, expected input error');
      }
    } finally {
      flag = flag + 1;
      console.info('builtinsStatementTry0300 is executed');
    }
    await Utils.msSleep(100);
    if (flag !== 4) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 4');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0400() {
  const TAG = 'builtinsStatementTry0400';
  try {
    let flag: number = 0;
    try {
      Input('ab');
    } catch (error) {
      error = error as Error;
      flag = 3;
      console.error('Validation failed:', error.message);
      if (error.message !== 'input error') {
        console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
        throw new Error('error.message check failed, expected input error');
      }
    }
    await Utils.msSleep(100);
    if (flag !== 3) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 3');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0500() {
  const TAG = 'builtinsStatementTry0500';
  try {
    let flag: number = 0;
    try {
    } catch (error) {
      error = error as Error;
      console.error('Validation failed:', error.message);
    } finally {
      flag = 5;
      console.info('builtinsStatementTry0300 is executed');
    }
    await Utils.msSleep(100);
    if (flag !== 5) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 5');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0600() {
  const TAG = 'builtinsStatementTry0600';
  try {
    let flag: number = 0;
    try {
      Input('@');
    } catch (error) {
      error = error as Error;
      try {
        console.error('Validation failed:', error.message);
        flag = 6;
        if (error.message !== 'input error') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected input error');
        }
        throw new Error('Simulated error in catch execution.');
      } catch (err) {
        err = err as Error;
        flag = flag + 1;
        if (err.message !== 'Simulated error in catch execution.') {
          console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
          throw new Error('err.message check failed, expected Simulated error in catch execution.');
        }
      }
    }
    await Utils.msSleep(100);
    if (flag !== 7) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 7');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0700() {
  const TAG = 'builtinsStatementTry0700';
  try {
    let flag: number = 0;
    await asyncInput('###').then(() => {
      console.info('builtinsStatementTry0700 is executed');
    })
      .catch<void>((error: Error): void => {
        console.error(error.message);
        if (error.message !== 'Invalid input') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Invalid input');
        }
        flag = 8;
      });
    await Utils.msSleep(100);
    if (flag !== 8) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 8');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0800() {
  const TAG = 'builtinsStatementTry0800';
  try {
    let errorOccurred = false;
    let errorMessage: string | null = null;
    try {
      Input2(-1, -2);
    } catch (error) {
      error = error as Error;
      errorOccurred = true;
      errorMessage = error.message;
      if (errorMessage !== 'a and b cannot be negative number') {
        console.error(`${TAG} Task execution failed: errorMessage: ${errorMessage}`);
        throw new Error('errorMessage check failed, expected a and b cannot be negative number');
      }
    } finally {
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(100);
    if (!errorOccurred) {
      console.error(`${TAG} Task execution failed: errorOccurred: ${errorOccurred}`);
      throw new Error('errorOccurred check failed, expected true');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry0900() {
  const TAG = 'builtinsStatementTry0900';
  try {
    let errorOccurred = false;
    try {
      Input2(-1, -2);
    } catch (error) {
      error = error as Error;
      let errorOccurred = true;
      let errorMessage: string = '';
      errorMessage = error.message;
      if (errorMessage !== 'a and b cannot be negative number') {
        console.error(`${TAG} Task execution failed: errorMessage: ${errorMessage}`);
        throw new Error('errorMessage check failed, expected a and b cannot be negative number');
      }
    } finally {
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(100);
    if (errorOccurred) {
      console.error(`${TAG} Task execution failed: errorOccurred: ${errorOccurred}`);
      throw new Error('errorOccurred check failed, expected false');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1000() {
  const TAG = 'builtinsStatementTry1000';
  try {
    let flag: number = 0;
    try {
      throw new Error('Simulated error in try1 execution.');
    } catch (error) {
      error = error as Error;
      try {
        throw new Error('Simulated error in try2 execution.');
      } catch (err) {
        err = err as Error;
        console.error(err.message);
        if (err.message !== 'Simulated error in try2 execution.') {
          console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
          throw new Error('err.message check failed, expected Simulated error in try2 execution.');
        }
        flag = 10;
      }
    } finally {
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(100);
    if (flag !== 10) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 10');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1100() {
  const TAG = 'builtinsStatementTry1100';
  try {
    let flag: number = 0;
    try {
      throw new Error('Simulated error in try1 execution.');
    } catch (error) {
      error = error as Error;
      try {
        throw new Error('Simulated error in try2 execution.');
      } catch (err) {
        err = err as Error;
        console.error(err.message);
        if (err.message !== 'Simulated error in try2 execution.') {
          console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
          throw new Error('err.message check failed, expected Simulated error in try2 execution.');
        }
        flag = 11;
      }
    } finally {
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(110);
    if (flag !== 11) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 11');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1200() {
  const TAG = 'builtinsStatementTry1200';
  try {
    let flag: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      try {
        throw new Error('Cache read error');
      } catch (error) {
        error = error as Error;
        if (err.message !== 'Cache read error') {
          console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
          throw new Error('err.message check failed, expected Cache read error');
        }
      } finally {
        flag = 12;
      }
    } finally {
      flag = flag + 1;
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(100);
    if (flag !== 13) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 13');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1300() {
  const TAG = 'builtinsStatementTry1300';
  let flag: number = 0;
  let result: string = '';
  try {
    result = nestedTryFinally('');
    throw new Error('Cache read error');
  } catch (err) {
    err = err as Error;
    try {
      throw new Error('Cache read error');
    } catch (error) {
      error = error as Error;
      if (error.message !== 'Cache read error') {
        console.info(`${TAG} Task execution failed: error.message: ${error.message}`);
        throw new Error('error.message check failed, expected Cache read error');
      }
    }
  }
  finally {
    if (result !== 'Get the outer resources\n' +
      'Get the inner layer resources\n' +
      'Release the inner layer resources\n' +
      'Release outer resources') {
      console.info(`${TAG} Task execution failed: result: ${result}`);
      throw new Error('result check failed, expected Get the outer resources\nGet the inner layer resources\nRelease the inner layer resources\nRelease outer resources');
    }
    flag = 13;
    console.log('This part will execute regardless of whether an exception occurs');
  }
  await Utils.msSleep(100);
  if (flag !== 13) {
    console.info(`${TAG} Task execution failed: flag: ${flag}`);
    throw new Error('flag check failed, expected 13');
  }
}

export async function builtinsStatementTry1400() {
  const TAG = 'builtinsStatementTry1400';
  try {
    let flag: number = 0;
    try {
      throwDivisor(4, 2);
    } finally {
      flag = 14;
    }
    await Utils.msSleep(100);
    if (flag !== 14) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 14');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1500() {
  const TAG = 'builtinsStatementTry1500';
  try {
    let flag: number = 0;
    try {
      throwDivisor(4, 0);
    } catch (e) {
      e = e as Error;
      if (e.message !== 'The divisor cannot be zero') {
        console.error(`${TAG} Task execution failed: e.message: ${e.message}`);
        throw new Error('e.message check failed, expected The divisor cannot be zero');
      }
    } finally {
      flag = 15;
    }
    await Utils.msSleep(100);
    if (flag !== 15) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 15');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1600() {
  const TAG = 'builtinsStatementTry1600';
  try {
    let flag: number = 0;
    try {
    } finally {
      flag = 16;
    }
    await Utils.msSleep(100);
    if (flag !== 16) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 16');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1700() {
  const TAG = 'builtinsStatementTry1700';
  try {
    let flag: number = 0;
    try {
      throw new Error('Simulated error in try execution.');
    } catch (e) {
      e = e as Error;
      if (e.message !== 'Simulated error in try execution.') {
        console.error(`${TAG} Task execution failed: e.message: ${e.message}`);
        throw new Error('e.message check failed, expected Simulated error in try execution.');
      }
    } finally {
      flag = 17;
    }
    await Utils.msSleep(100);
    if (flag !== 17) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 17');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1800() {
  const TAG = 'builtinsStatementTry1800';
  try {
    let flag: number = 0;
    try {
      throw new Error('Simulated error in try execution.');
    } catch (e) {
      e = e as Error;
      if (e.message !== 'Simulated error in try execution.') {
        console.error(`${TAG} Task execution failed: e.message: ${e.message}`);
        throw new Error('e.message check failed, expected Simulated error in try execution.');
      }
    } finally {
      try {
        throw new Error('Simulated error in finally execution.');
      } catch (err) {
        err = err as Error;
        flag = 18;
        if (err.message !== 'Simulated error in finally execution.') {
          console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
          throw new Error('err.message check failed, expected Simulated error in finally execution.');
        }
      }
    }
    await Utils.msSleep(100);
    if (flag !== 18) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 18');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry1900() {
  const TAG = 'builtinsStatementTry1900';
  try {
    let flag: number = 0;
    await asyncInput('###').then(() => {
      console.info('builtinsStatementTry01900 is executed');
    })
      .catch<void>((error: Error): void => {
        console.error(error.message);
        if (error.message !== 'Invalid input') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Invalid input');
        }
        flag = 18;
      }).finally(() => {
        flag = flag + 1;
      });
    await Utils.msSleep(100);
    if (flag !== 19) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 19');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2000() {
  const TAG = 'builtinsStatementTry2000';
  try {
    let flag: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      await asyncInput('@').finally(() => {
        flag = 20;
      });
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(100);
    if (flag !== 20) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 20');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2100() {
  const TAG = 'builtinsStatementTry2100';
  try {
    let flag: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      try {
        throw new Error('Cache read error');
      } catch (error) {
        error = error as Error;
        if (error.message !== 'Cache read error') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Cache read error');
        }
      } finally {
        flag = 20;
      }
      flag = flag + 1;
      console.log('This part will execute regardless of whether an exception occurs');
    }
    await Utils.msSleep(100);
    if (flag !== 21) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 21');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2200() {
  const TAG = 'builtinsStatementTry2200';
  try {
    let num: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      num = num + 1;
    }
    await Utils.msSleep(100);
    if (num !== 1) {
      console.error(`${TAG} Task execution failed: num: ${num}`);
      throw new Error('num check failed, expected 1');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2300() {
  const TAG = 'builtinsStatementTry2300';
  try {
    let num: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      let num: number = 1;
    }
    await Utils.msSleep(100);
    if (num !== 0) {
      console.error(`${TAG} Task execution failed: num: ${num}`);
      throw new Error('num check failed, expected 0');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2400() {
  const TAG = 'builtinsStatementTry2400';
  try {
    let flag: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      try {
        flag = 23;
        throw new Error('Cache read error');
      } catch (error) {
        error = error as Error;
        flag = flag + 1;
        if (error.message !== 'Cache read error') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Cache read error');
        }
      }
    }
    await Utils.msSleep(100);
    if (flag !== 24) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 24');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2500() {
  const TAG = 'builtinsStatementTry2500';
  try {
    let flag: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      try {
        flag = 24;
      } finally {
        flag = flag + 1;
      }
    }
    await Utils.msSleep(100);
    if (flag !== 25) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 25');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2600() {
  const TAG = 'builtinsStatementTry2600';
  try {
    let flag: number = 0;
    try {
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      try {
        flag = 24;
        throw new Error('Cache read error');
      } catch (error) {
        error = error as Error;
        flag = flag + 1;
        if (error.message !== 'Cache read error') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Cache read error');
        }
      } finally {
        flag = flag + 1;
      }
    }
    await Utils.msSleep(100);
    if (flag !== 26) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 26');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2700() {
  const TAG = 'builtinsStatementTry2700';
  try {
    let flag: number = 0;
    let result: string = '';
    try {
      result += 'Outside try';
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      result += '\nOutside catch';
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      try {
        flag = 24;
        result += '\nOutside finally inside try';
        throw new Error('Cache read error');
      } catch (error) {
        error = error as Error;
        result += '\nOutside finally inside catch';
        flag = flag + 1;
        if (error.message !== 'Cache read error') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Cache read error');
        }
      } finally {
        result += '\nOutside finally inside finally';
      }
      result += '\nOutside finally';
      console.info('=============' + result);
    }
    await Utils.msSleep(100);
    if (result !== 'Outside try\n' +
      'Outside catch\n' +
      'Outside finally inside try\n' +
      'Outside finally inside catch\n' +
      'Outside finally inside finally\n' +
      'Outside finally') {
      console.error(`${TAG} Task execution failed: result: ${result}`);
      throw new Error('result check failed, expected Outside try\nOutside catch\nOutside finally inside try\nOutside finally inside catch\nOutside finally inside finally\nOutside finally');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2800() {
  const TAG = 'builtinsStatementTry2800';
  try {
    let flag: number = 0;
    try {
    } finally {
      flag = 28;
    }
    await Utils.msSleep(100);
    if (flag !== 28) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 28');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry2900() {
  const TAG = 'builtinsStatementTry2900';
  try {
    let flag: number = 0;
    try {
      flag = 28;
      throw new Error('Cache read error');
    } catch (err) {
      err = err as Error;
      flag += 1;
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    }
    await Utils.msSleep(100);
    if (flag !== 29) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 29');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3000() {
  const TAG = 'builtinsStatementTry3000';
  try {
    let flag: number = 0;
    let num: number = 0.9;
    try {
      if (num < 0.3) {
        throw new Error('Cache read error1');
      }
      if (num >= 0.3 && num < 0.6) {
        throw new Error('Cache read error2');
      }
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
      flag = 30;
    }
    await Utils.msSleep(100);
    if (flag !== 30) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 30');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3100() {
  const TAG = 'builtinsStatementTry3100';
  try {
    let flag: number = 0;
    let arr = [1, 2, 3, 4, 5];
    try {
      flag = 30;
      for (let i = 0; i < arr.length; i++) {
        console.info(string(arr[i]));
      }
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
      flag += 1;
    }
    await Utils.msSleep(100);
    if (flag !== 31) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 31');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3200() {
  const TAG = 'builtinsStatementTry3200';
  try {
    let flag: number = 0;
    try {
      flag = 31;
      let resultArray = new Array<number>(64, 34, 25, 12, 22, 11, 90);
      let result = bubbleSort(resultArray);
      if (result.toString() !== '11,12,22,25,34,64,90') {
        console.error(`${TAG} Task execution failed: result.toString(): ${result.toString()}`);
        throw new Error('result.toString() check failed, expected 11,12,22,25,34,64,90');
      }
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
      flag += 1;
    }
    await Utils.msSleep(100);
    if (flag !== 32) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 32');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3300() {
  const TAG = 'builtinsStatementTry3300';
  try {
    let num: number = 1;
    try {
      num += 1;
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
    }
    await Utils.msSleep(100);
    if (num !== 2) {
      console.error(`${TAG} Task execution failed: num: ${num}`);
      throw new Error('num check failed, expected 2');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3400() {
  const TAG = 'builtinsStatementTry3400';
  try {
    let num: number = 1;
    try {
      let num = 2;
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
    }
    await Utils.msSleep(100);
    if (num !== 1) {
      console.error(`${TAG} Task execution failed: num: ${num}`);
      throw new Error('num check failed, expected 1');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3500() {
  const TAG = 'builtinsStatementTry3500';
  try {
    let flag: number = 0;
    try {
      flag = 34;
      try {
        throw new Error('Simulated error in try execution.');
      } catch (error) {
        error = error as Error;
        flag += 1;
        if (error.message !== 'Simulated error in try execution.') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Simulated error in try execution.');
        }
      }
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
    }
    await Utils.msSleep(100);
    if (flag !== 35) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 35');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3600() {
  const TAG = 'builtinsStatementTry3600';
  try {
    let flag: number = 0;
    try {
      try {
        flag = 35;
      } finally {
        flag += 1;
      }
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
    }
    await Utils.msSleep(100);
    if (flag !== 36) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 36');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3700() {
  const TAG = 'builtinsStatementTry3700';
  try {
    let flag: number = 0;
    try {
      flag = 35;
      try {
        throw new Error('Simulated error in try execution.');
      } catch (error) {
        error = error as Error;
        flag += 1;
        if (error.message !== 'Simulated error in try execution.') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Simulated error in try execution.');
        }
      } finally {
        flag += 1;
      }
    } catch (err) {
      err = err as Error;
      console.info(`Caught an error: ${err.message}`);
    } finally {
      console.info('Executing finally block');
    }
    await Utils.msSleep(100);
    if (flag !== 37) {
      console.error(`${TAG} Task execution failed: flag: ${flag}`);
      throw new Error('flag check failed, expected 37');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}

export async function builtinsStatementTry3800() {
  const TAG = 'builtinsStatementTry3800';
  try {
    let result: string = '';
    try {
      result = 'Outside try';
      try {
        result += '\nOutside try inside try';
        throw new Error('Cache read error');
      } catch (error) {
        error = error as Error;
        result += '\nOutside try inside catch';
        if (error.message !== 'Cache read error') {
          console.error(`${TAG} Task execution failed: error.message: ${error.message}`);
          throw new Error('error.message check failed, expected Cache read error');
        }
      } finally {
        result += '\nOutside try inside finally';
        throw new Error('Cache read error');
      }
    } catch (err) {
      err = err as Error;
      result += '\nOutside catch';
      if (err.message !== 'Cache read error') {
        console.error(`${TAG} Task execution failed: err.message: ${err.message}`);
        throw new Error('err.message check failed, expected Cache read error');
      }
    } finally {
      result += '\nOutside finally';
      console.info('=============' + result);
    }
    await Utils.msSleep(100);
    if (result !== 'Outside try\n' +
      'Outside try inside try\n' +
      'Outside try inside catch\n' +
      'Outside try inside finally\n' +
      'Outside catch\n' +
      'Outside finally') {
      console.error(`${TAG} Task execution failed: result: ${result}`);
      throw new Error('result check failed, expected Outside try\nOutside try inside try\nOutside try inside catch\nOutside try inside finally\nOutside catch\nOutside finally');
    }
  } catch (error) {
    console.error(`${TAG} Task execution failed: ${error}`);
    throw new Error(`${TAG} catch error`);
  }
}
