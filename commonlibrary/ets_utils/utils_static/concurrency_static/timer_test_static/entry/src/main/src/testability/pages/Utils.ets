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
// import { worker } from '@kit.ArkTS';
import { calculate, asyncCalculate, asyncCalculate1 } from './TaskPoolMethod'

export function sleep(time: number): Promise<void> {
  return new Promise<void>((re, je) => {
    setTimeout(() => {
      re(undefined);
    }, time as int);
  });
}


export async function taskFunction1(index: number): Promise<number> {
  const innerPromise = new Promise<number>((innerResolve, innerReject) => {
        const result = calculate(index);
        innerResolve(result);
      })


  const result = await innerPromise;
  return result;
}


export async function taskFunction2(index: number): Promise<number> {
  const innerPromise = new Promise<number>((innerResolve, innerReject) => {
    asyncCalculate(index)
      .then((result:number) => {
        innerResolve(result);
      })
      .catch((error: Error) => {
        innerReject(error);
      });
  });

  const result = await innerPromise;
  return result;
}



export async function taskFunction3(index: number): Promise<number> {
  const firstPromise: Promise<void> = new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined);
    }, 1000);
  });

  await firstPromise;

  const innerPromise = new Promise<number>((resolve, reject) => {
    asyncCalculate1(index)
      .then((calculationResult:number) => {
        resolve(calculationResult);
      })
      .catch((error: Error) => {
        console.error(`计算函数执行出错: ${error}`);
        reject(error);
      });
  });

  const result = await innerPromise;
  return result;
}



export async function taskFunction4(index: number): Promise<number> {
  const firstPromise: Promise<void> = new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined);
    }, 1000);
  });

  let calculationResult: number = 0;
  try {
    await firstPromise;

    const secondPromise: Promise<void> = new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve(undefined);
      }, 500);
    });
    await secondPromise;

  } finally {
    calculationResult = calculate(index);
  }
  return calculationResult;
}


export async function taskFunction5(index: number): Promise<number> {

  const firstPromise: Promise<void> = new Promise<void>((resolve, reject) => {

    const shouldFail = Math.random() < 1;
    if (shouldFail) {
      reject(new Error('模拟异步操作失败'));
    } else {
      setTimeout(() => {
        resolve(undefined);
      }, 500);
    }
  });

  try {

    await firstPromise;
    return Promise.resolve(0 as double);
  } catch (error) {
    const calculationResult: number = calculate(index);

    return calculationResult;
  }
}



export async function taskFunction6(index: number): Promise<number> {

  const firstPromise: Promise<void> = new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined);
    }, 500);
  });

  let calculationResult: number = 0
  try {
    await firstPromise;
    calculationResult = calculate(index);

  } catch (error) {
    console.error(`任务执行出错: ${error}`);
  }

  return calculationResult;
}


export async function taskFunction7(index: number): Promise<number> {
  let calculationResult: number = 0;
  try {

    const firstPromise: Promise<void> = new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve(undefined);
      }, 1000);
    });

    await firstPromise;
    calculationResult = await asyncCalculate1(index);

  } catch (error) {
    console.error(`执行任务时出错: ${error}`);
  }

  return calculationResult;
}


export async function taskFunction8(index: number): Promise<number> {
  let calculationResult: number = 0
  try {

    const firstPromise: Promise<void> = new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve(undefined);
      }, 500);
    });
    await firstPromise;
    const calculationPromise = calculate(index);


    calculationResult = calculationPromise;

  } catch (error) {
    console.error(`任务执行出错: ${error}`);
  }


  return calculationResult;
}



export function taskFunction9(index: number): number {
  return index;
}



export function taskFunction10(index: number): number {
  if (index % 2 === 0) {
    throw new Error(`Task ${index} execution failed`);
  }
  return index;
}



export function taskFunction11(index: number): Promise<number> {
  throw new Error(`Task ${index} execution error`);
}

