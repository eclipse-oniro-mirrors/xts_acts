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
import { worker } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

@Concurrent
export async function taskFunction1(index: number): Promise<number> {
  const innerPromise = new Promise<number>((innerResolve, innerReject) => {
    import('./TaskPoolMethod')
      .then((module) => {
        const calculate = module.calculate;
        const result = calculate(index);
        innerResolve(result);
      })
      .catch((error: BusinessError) => {
        innerReject(error);
      });
  });
  const result = await innerPromise;
  return result;
}

@Concurrent
export async function taskFunction2(index: number): Promise<number> {
  const innerPromise = new Promise<number>((innerResolve, innerReject) => {
    import('./TaskPoolMethod')
      .then((module) => {
        const asyncCalculate = module.asyncCalculate;
        asyncCalculate(index)
          .then((result) => {
            innerResolve(result);
          })
          .catch((error: BusinessError) => {
            innerReject(error);
          });
      })
      .catch((error: BusinessError) => {
        innerReject(error);
      });
  });

  const result = await innerPromise;
  return result;
}


@Concurrent
export async function taskFunction3(index: number): Promise<number> {
  const firstPromise: Promise<void> = new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, 1000);
  });

  await firstPromise;

  const innerPromise = new Promise<number>((resolve, reject) => {
    import('./TaskPoolMethod')
      .then((module) => {
        const asyncCalculate1 = module.asyncCalculate1;
        asyncCalculate1(index)
          .then((calculationResult) => {
            resolve(calculationResult);
          })
          .catch((error: BusinessError) => {
            console.error(`计算函数执行出错: ${error}`);
            reject(error);
          });
      })
      .catch((error: BusinessError) => {
        console.error(`动态导入模块出错: ${error}`);
        reject(error);
      });
  });

  const result = await innerPromise;
  return result;
}


@Concurrent
export async function taskFunction4(index: number): Promise<number> {
  const firstPromise: Promise<void> = new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, 1000);
  });

  let calculationResult = 0;
  try {
    await firstPromise;

    const secondPromise: Promise<void> = new Promise((resolve) => {
      setTimeout(() => {
        resolve();
      }, 500);
    });
    await secondPromise;

  } finally {
    const module = await import('./TaskPoolMethod');
    const calculate = module.calculate;
    calculationResult = await calculate(index);
  }
  return calculationResult;
}

@Concurrent
export async function taskFunction5(index: number): Promise<number> {

  const firstPromise: Promise<void> = new Promise((resolve, reject) => {

    const shouldFail = Math.random() < 1;
    if (shouldFail) {
      reject(new Error('模拟异步操作失败'));
    } else {
      setTimeout(() => {
        resolve();
      }, 500);
    }
  });

  try {

    await firstPromise;
    return 0;
  } catch (error) {

    const module = await import('./TaskPoolMethod');
    const calculate = module.calculate;
    const calculationResult = await calculate(index);

    return calculationResult;
  }
}


@Concurrent
export async function taskFunction6(index: number): Promise<number> {

  const firstPromise: Promise<void> = new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, 500);
  });

  let calculationResult = 0
  try {
    await firstPromise;

    const module = await import('./TaskPoolMethod');
    const calculate = module.calculate;
    calculationResult = await calculate(index);

  } catch (error) {
    console.error(`任务执行出错: ${error}`);
  }

  return calculationResult;
}

@Concurrent
export async function taskFunction7(index: number): Promise<number> {
  let calculationResult = 0;
  try {

    const firstPromise: Promise<void> = new Promise((resolve) => {
      setTimeout(() => {
        resolve();
      }, 1000);
    });

    await firstPromise;

    const module = await import('./TaskPoolMethod');
    const asyncCalculate1 = module.asyncCalculate1;
    calculationResult = await asyncCalculate1(index);

  } catch (error) {
    console.error(`执行任务时出错: ${error}`);
  }

  return calculationResult;
}

@Concurrent
export async function taskFunction8(index: number): Promise<number> {
  let calculationResult = 0
  try {

    const firstPromise: Promise<void> = new Promise((resolve) => {
      setTimeout(() => {
        resolve();
      }, 500);
    });
    await firstPromise;


    const module = await import('./TaskPoolMethod');
    const calculate = module.calculate;
    const calculationPromise = calculate(index);


    calculationResult = await calculationPromise;

  } catch (error) {
    console.error(`任务执行出错: ${error}`);
  }


  return calculationResult;
}


@Concurrent
export function taskFunction9(index: number): number {
  return index;
}


@Concurrent
export function taskFunction10(index: number): number {
  if (index % 2 === 0) {
    throw new Error(`Task ${index} execution failed`);
  }
  return index;
}


@Concurrent
export function taskFunction11(index: number): Promise<number> {
  throw new Error(`Task ${index} execution error`);
}

export class WorkerSrc {
  workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../pages/workers/Worker');
}

export class WorkThread1 {
  workerStageModel = new worker.ThreadWorker('./workers/CalculatorWorker1.ets');
}

export class WorkThread2 {
  workerStageModel = new worker.ThreadWorker('./workers/CalculatorWorker2.ets');
}
