/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import { asyncSleep } from '../test/exportFunclist';
import { SendableClassTest } from '../test/sendable';
import { level2Task, taskError2, timeoutDemo2 } from './TimeoutFunc2';

@Concurrent
export function timeoutDemo (time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return time;
}
@Concurrent
export async function demoSenddata(time: number) {
  let start = Date.now();
  let count = 1;
  while (Date.now() - start < time) {
    taskpool.Task.sendData(count);
    count++;
    await asyncSleep(100);
  }
}

@Concurrent
export function taskFunc(task: taskpool.Task) {
  return task;
}

@Concurrent
export function taskError(time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  throw new Error('task error');
}

@Concurrent
export function sendableFuncWithTime(func : Function, time: number) : number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let num : number = func();
  return num;
}

@Concurrent
export function sendableClassWithTime(classT : SendableClassTest, time: number) : number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let num = classT.foo();
  num += classT.func();
  return num;
}

@Concurrent
export function setTransferListTestWithTime(arg1: Uint8Array, arg2: Uint8Array, time: number): number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return arg1.byteLength + arg2.byteLength;
}

@Concurrent
export function setCloneListTestWithTime(arrayBuffer: Array<number>, time: number): Int32Array {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [5, 6, 7, 8];
  for (let i: number = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

@Concurrent
export async function nestedOuterTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 10 }).then((res) => {
    data = res as number;
    console.log('nestedOuterTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedOuterTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function nestedTimeoutTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedTimeoutTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedTimeoutTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function nestedDifferentTimeout(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
    data = res as number;
    console.log('nestedDifferentTimeout then')
  }).catch((e: BusinessError) => {
    console.log('nestedDifferentTimeout catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function nestedTaskGroupTask(time: number): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 150);
  let data = [0];
  await taskpool.execute(innerGroup, { timeout: 50 }).then((res) => {
    data = res as number[];
    console.log('nestedTaskGroupTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedTaskGroupTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function level3Task(): Promise<number> {
  return await taskpool.execute(new taskpool.Task(timeoutDemo2, 100), { timeout: 5000 }) as number;
}


@Concurrent
export async function level1Task(): Promise<number> {
  return await taskpool.execute(new taskpool.Task(level2Task), { timeout: 50 }) as number;
}

@Concurrent
export async function outerAwaitMultipleTimeout(time: number): Promise<number[]> {
  let results: number[] = [];
  let task1 = new taskpool.Task(timeoutDemo2, 100);
  let task2 = new taskpool.Task(timeoutDemo2, 100);
  results.push(await taskpool.execute(task1, { timeout: 5000 }) as number);
  results.push(await taskpool.execute(task2, { timeout: 5000 }) as number);
  return results;
}

@Concurrent
export async function asyncRunnerNestedTask(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('asyncRunnerNestedTask then')
  }).catch((e: BusinessError) => {
    console.log('asyncRunnerNestedTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function asyncRunnerNestedGroup(): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 200);
  let data = [0];
  await taskpool.execute(innerGroup, { timeout: 100 }).then((res) => {
    data = res as number[];
    console.log('asyncRunnerNestedGroup then')
  }).catch((e: BusinessError) => {
    console.log('asyncRunnerNestedGroup catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function sequenceRunnerNestedTask(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('sequenceRunnerNestedTask then')
  }).catch((e: BusinessError) => {
    console.log('sequenceRunnerNestedTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function sequenceRunnerNestedGroup(): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 200);
  let data = [0];
  await taskpool.execute(innerGroup, { timeout: 100 }).then((res) => {
    data = res as number[];
    console.log('sequenceRunnerNestedGroup then')
  }).catch((e: BusinessError) => {
    console.log('sequenceRunnerNestedGroup catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function workerTimeoutTask(): Promise<number> {
  let task = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(task, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('workerTimeoutTask then')
  }).catch((e: BusinessError) => {
    console.log('workerTimeoutTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function workerTimeoutGroup(): Promise<number[]> {
  let group = new taskpool.TaskGroup();
  group.addTask(timeoutDemo2, 200);
  let data = [0];
  await taskpool.execute(group, { timeout: 100 }).then((res) => {
    data = res as number[];
    console.log('workerTimeoutGroup then')
  }).catch((e: BusinessError) => {
    console.log('workerTimeoutGroup catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function workerMultipleTimeout(): Promise<number[]> {
  let results: number[] = [];
  let task1 = new taskpool.Task(timeoutDemo2, 100);
  let task2 = new taskpool.Task(timeoutDemo2, 100);
  await taskpool.execute(task1, { timeout: 20 }).then((res) => {
    results.push(res as number);
    console.log('workerMultipleTimeout task1 then')
  }).catch((e: BusinessError) => {
    console.log('workerMultipleTimeout task1 catch: ' + e)
    throw new Error(e.code.toString());
  });
  await taskpool.execute(task2, { timeout: 200 }).then((res) => {
    results.push(res as number);
    console.log('workerMultipleTimeout task2 then')
  }).catch((e: BusinessError) => {
    console.log('workerMultipleTimeout task2 catch: ' + e)
    throw new Error(e.code.toString());
  });
  return results;
}

@Concurrent
export async function workerNestedTaskPool(): Promise<number> {
  let task = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await taskpool.execute(task, { timeout: 10 }).then((res) => {
    data = res as number;
    console.log('workerNestedTaskPool then')
  }).catch((e: BusinessError) => {
    console.log('workerNestedTaskPool catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function delayedNestedTask(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('delayedNestedTask then')
  }).catch((e: BusinessError) => {
    console.log('delayedNestedTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function periodicTaskInner(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('periodicTaskInner then')
  }).catch((e: BusinessError) => {
    console.log('periodicTaskInner catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function longTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('longTaskNestedTimeout then')
  }).catch((e: BusinessError) => {
    console.log('longTaskNestedTimeout catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function longTaskNestedGroup(): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 200);
  let data = [0];
  await taskpool.execute(innerGroup, { timeout: 100 }).then((res) => {
    data = res as number[];
    console.log('longTaskNestedGroup then')
  }).catch((e: BusinessError) => {
    console.log('longTaskNestedGroup catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function timeoutWithLongTask(): Promise<number> {
  let longTask = new taskpool.LongTask(timeoutDemo2);
  return await taskpool.execute(longTask, 100) as number;
}

@Concurrent
export async function nestedOuterCancelTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedOuterCancelTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedOuterCancelTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function nestedOuterCompleteTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await taskpool.execute(innerTask).then((res) => {
    data = res as number;
    console.log('nestedOuterCompleteTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedOuterCompleteTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function nestedInnerTimeoutTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  let terminate = false;
  taskpool.execute(innerTask).then((res) => {
    data = res as number;
    console.log('nestedInnerTimeoutTask then')
    terminate = true
  }).catch((e: BusinessError) => {
    console.log('nestedInnerTimeoutTask catch: ' + e)
    terminate = true
    throw new Error(e.code.toString());
  });
  setTimeout(() => {
    try {
      taskpool.cancel(innerTask);
    } catch (e) {}
  }, 100);
  while(!terminate){
    await asyncSleep(100)
  }
  return data;
}

@Concurrent
export async function nestedInnerExceptionTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(taskError2, 100);
  let data = 0;
  await taskpool.execute(innerTask).then((res) => {
    data = res as number;
    console.log('nestedInnerExceptionTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedInnerExceptionTask catch: ' + e)
    throw new Error(e.message);
  });
  return data;
}

@Concurrent
export async function nestedInnerTimeout1Task(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedInnerTimeout1Task then')
  }).catch((e: BusinessError) => {
    console.log('nestedInnerTimeout1Task catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function nestedOuterTimeoutTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
    data = res as number;
    console.log('nestedOuterTimeoutTask then')
  }).catch((e: BusinessError) => {
    console.log('nestedOuterTimeoutTask catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function rejectTaskShort(time: number): Promise<number> {
  await new Promise<number>((_, reject) => setTimeout(() => reject(new Error('reject')), 100));
  return time;
}

@Concurrent
export async function rejectTaskLong(time: number): Promise<number> {
  await new Promise<number>((_, reject) => setTimeout(() => reject(new Error('reject')), 500));
  return time;
}

@Concurrent
export async function nestedInnerCancelExceptionTimeout(time: number): Promise<number> {
  let innerTask = new taskpool.Task(taskError2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedInnerCancelExceptionTimeout then')
  }).catch((e: BusinessError) => {
    console.log('nestedInnerCancelExceptionTimeout catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function asyncRunnerTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('asyncRunnerTaskNestedTimeout then')
  }).catch((e: BusinessError) => {
    console.log('asyncRunnerTaskNestedTimeout catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function sequenceRunnerTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('sequenceRunnerTaskNestedTimeout then')
  }).catch((e: BusinessError) => {
    console.log('sequenceRunnerTaskNestedTimeout catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function workerTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('workerTaskNestedTimeout then')
  }).catch((e: BusinessError) => {
    console.log('workerTaskNestedTimeout catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskAsyncRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskAsyncRunnerInnerShortOuterLong then')
  }).catch((e: BusinessError) => {
    console.log('taskAsyncRunnerInnerShortOuterLong catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskSequenceRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask0 = new taskpool.Task(timeoutDemo2, 100);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  runner.execute(innerTask0)
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskSequenceRunnerInnerShortOuterLong then')
  }).catch((e: BusinessError) => {
    console.log('taskSequenceRunnerInnerShortOuterLong catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskAsyncRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskAsyncRunnerInnerLongOuterShort then')
  }).catch((e: BusinessError) => {
    console.log('taskAsyncRunnerInnerLongOuterShort catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskSequenceRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask0 = new taskpool.Task(timeoutDemo2, 100);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  runner.execute(innerTask0)
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskSequenceRunnerInnerLongOuterShort then')
  }).catch((e: BusinessError) => {
    console.log('taskSequenceRunnerInnerLongOuterShort catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskGroupAsyncRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupAsyncRunnerInnerShortOuterLong then')
  }).catch((e: BusinessError) => {
    console.log('taskGroupAsyncRunnerInnerShortOuterLong catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskGroupSequenceRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupSequenceRunnerInnerShortOuterLong then')
  }).catch((e: BusinessError) => {
    console.log('taskGroupSequenceRunnerInnerShortOuterLong catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskGroupAsyncRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupAsyncRunnerInnerLongOuterShort then')
  }).catch((e: BusinessError) => {
    console.log('taskGroupAsyncRunnerInnerLongOuterShort catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}

@Concurrent
export async function taskGroupSequenceRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask0 = new taskpool.Task(timeoutDemo2, 100);
  let innerTask = new taskpool.Task(timeoutDemo2, 100);
  let data = 0;
  runner.execute(innerTask0)
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupSequenceRunnerInnerLongOuterShort then')
  }).catch((e: BusinessError) => {
    console.log('taskGroupSequenceRunnerInnerLongOuterShort catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}