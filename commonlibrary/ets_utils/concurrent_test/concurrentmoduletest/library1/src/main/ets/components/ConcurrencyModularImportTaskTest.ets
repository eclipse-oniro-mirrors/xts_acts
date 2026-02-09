/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { collections, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { sleep } from './Ulits';
import { fetchData, SendableClass2, Sendablefun } from './ConcurrencyModularImportPromiseTest';

@Concurrent
function taskFunction(): void {
  console.info('Task is executing');
  throw new Error('error from task');
}

export let task: taskpool.Task = new taskpool.Task(taskFunction);

@Concurrent
function additionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

export let taskadd: taskpool.Task = new taskpool.Task(additionDelay, 100);

@Concurrent
export async function taskFunction2(input: string) {
  console.info('Task is executing');
  try {
    const data = await fetchData(input);
    let result: collections.ConcatArray<string> = new collections.Array<string>(data);
    return result;
  } catch (error) {
    console.error('Error in taskFunction:', error);
    throw new Error('error from task');
  }
}

export const task2: taskpool.Task = new taskpool.Task(taskFunction2, '1');


@Concurrent
async function taskFunction3(input: SendableClass2): Promise<SendableClass2> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      try {
        console.info('Task received input (delayed):', input.getValue());
        const result = new SendableClass2(`Processed: ${input.getValue()}`);
        console.info('Task will return (delayed):', result.getValue());
        resolve(result);
      } catch (error) {
        console.error('Error in setTimeout:', error);
        reject(error);
      }
    }, 0);
  });
}

export const task3: taskpool.Task = new taskpool.Task(taskFunction3, '1');

@Concurrent
async function taskFunction4(arg: number): Promise<number> {
  return arg;
}

export const longTask = new taskpool.Task(taskFunction4, 1);

@Concurrent
async function taskWorker(arg: number): Promise<Object> {
  let count: number = 0;
  let workThread: worker.ThreadWorker;
  workThread = new worker.ThreadWorker('../components/workers/Worker');
  workThread.onexit = () => {
    console.log('onexit');
  }
  workThread.postMessage(1);
  workThread.onmessage = (e: MessageEvents): void => {
    count = e.data;
    workThread.terminate();
  }
  while (count != 42) {
    await sleep(300)
  }
  return arg;
}

export const workertask = new taskpool.Task(taskWorker, 1);

const sharedBuffer = new SharedArrayBuffer(16);

export let int8Array: Int8Array = new Int8Array(sharedBuffer);

export let uint8Array: Uint8Array = new Uint8Array(sharedBuffer);

export let int16Array: Int16Array = new Int16Array(sharedBuffer);

export let uint16Array: Uint16Array = new Uint16Array(sharedBuffer);

export let int32Array: Int32Array = new Int32Array(sharedBuffer);

export let uint32Array: Uint32Array = new Uint32Array(sharedBuffer);

export let uint8ClampedArray: Uint8ClampedArray = new Uint8ClampedArray(sharedBuffer);

export let float32Array: Float32Array = new Float32Array(sharedBuffer);

export let bigInt64Array: BigInt64Array = new BigInt64Array(sharedBuffer);

export let bigUint64Array: BigUint64Array = new BigUint64Array(sharedBuffer);
