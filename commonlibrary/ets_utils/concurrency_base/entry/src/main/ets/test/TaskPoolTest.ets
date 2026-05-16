/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import taskpool from '@ohos.taskpool'
import { check } from './utils';
import { createUint32Array, indexSetter, indexSetterWithTimeout } from './TaskPoolTestImport';
import { taskpoolExecuteChained } from './TaskPoolTestImport2';

// TESTS IMPLEMENTATION //

export function testHappyPath(): Promise<string> {
  let p = taskpool.execute(testHappyPathImpl)
  return check("testHappyPath", p);
}

@Concurrent
async function testHappyPathImpl() {
  let sab = createUint32Array(3);
  let task1 = new taskpool.Task(indexSetter, sab, 1);
  let task: Promise<Object> = taskpool.execute(task1, taskpool.Priority.HIGH) as Promise<Object>;

  let res = await (task) as Uint32Array;
  if (1 == res[1]) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + 1 + ", but was " + res[1]);
}

export function testTwoTasks(): Promise<string> {
  let p = taskpool.execute(testTwoTasksImpl)
  return check("testTwoTasks", p);
}

@Concurrent
async function testTwoTasksImpl() {
  let sab = createUint32Array(3);
  let task1 = new taskpool.Task(indexSetter, sab, 1);
  let task2 = new taskpool.Task(indexSetter, sab, 2);
  let task: Promise<Object> = taskpool.execute(task1) as Promise<Object>;
  let taskNext: Promise<Object> = taskpool.execute(task2) as Promise<Object>;

  await (task);
  let res = await (taskNext) as Uint32Array;
  if (1 == res[1] && 2 == res[2]) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + "1, 2" + ", but was " + res[1] + ", " + res[2]);
}

export function testManyTasks(): Promise<string> {
  let p = taskpool.execute(testManyTasksImpl)
  return check("testManyTasks", p);
}

@Concurrent
async function testManyTasksImpl() {
  let stressCount: number = 10;
  let size: number = stressCount + 3;
  let sab = createUint32Array(size);
  let res: Uint32Array = sab;
  for (let idx: number = 0; idx < stressCount; idx++) {
    let taskCurr = new taskpool.Task(indexSetter, sab, idx);
    let promiseCurr = taskpool.execute(taskCurr) as Promise<Object>;
    res = await (promiseCurr) as Uint32Array;
  }
  for (let idx: number = 0; idx < stressCount; idx++) {
    if (idx != res[idx]) {
      throw new Error("Test failed Expected at index " + idx + " value " + idx + ", but was " + res[idx]);
    }
  }
  return "Test passed";
}

export function testTwoTasksChained(): Promise<string> {
  let p = testTwoTasksChainedImpl();
  return check("testTwoTasksChained", p);
}

async function testTwoTasksChainedImpl() {
  let sab = createUint32Array(3);
  let taskCurr = new taskpool.Task(taskpoolExecuteChained, sab, 0, 2);
  let promiseCurr = taskpool.execute(taskCurr) as Promise<Object>;
  await (promiseCurr);
  for (let idx: number = 0; idx < 2; idx++) {
    let res:number = sab[idx]
    if (idx != res) {
      throw new Error("Test failed Expected at index " + idx + " value " + idx + ", but was " + res);
    }
  }
  return "Test passed";
}

export function testManyTasksChained(): Promise<string> {
  let p = testManyTasksChainedImpl()
  return check("testManyTasksChained", p);
}

async function testManyTasksChainedImpl() {
  let stressCount: number = 10;
  let size: number = stressCount + 3;
  let sab = createUint32Array(size);
  let taskCurr = new taskpool.Task(taskpoolExecuteChained, sab, 0, stressCount);
  let promiseCurr = taskpool.execute(taskCurr) as Promise<Object>;
  await (promiseCurr);
  for (let idx: number = 0; idx < stressCount; idx++) {
    let res:number = sab[idx]
    if (idx != res) {
      throw new Error("Test failed Expected at index " + idx + " value " + idx + ", but was " + res);
    }
  }
  return "Test passed";
}

export function testUnder3Minutes(): Promise<string> {
  let p = taskpool.execute(testUnder3MinutesImpl)
  return check("testUnder3Minutes", p);
}

@Concurrent
async function testUnder3MinutesImpl() {
  let sab = createUint32Array(3);
  let timeout: number = 1000 * 60 * 2 + 1000 * 50;
  let task1 = new taskpool.Task(indexSetterWithTimeout, sab, 1, timeout);
  let task: Promise<Object> = taskpool.execute(task1) as Promise<Object>;

  let res = await (task) as Uint32Array;
  if (1 == res[1]) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + 1 + ", but was " + res[1]);
}

export function testOver3Minutes(): Promise<string> {
  let p = taskpool.execute(testOver3MinutesImpl)
  return check("testOver3Minutes", p);
}

@Concurrent
async function testOver3MinutesImpl() {
  let sab = createUint32Array(3);
  let timeout: number = 1000 * 60 * 4;
  let task1 = new taskpool.Task(indexSetterWithTimeout, sab, 1, timeout);
  let task: Promise<Object> = taskpool.execute(task1) as Promise<Object>;

  let res = await (task) as Uint32Array;
  if (1 == res[1]) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + 1 + ", but was " + res[1]);
}

export function testRepeats(): Promise<string> {
  let p = taskpool.execute(testRepeatsImpl)
  return check("testRepeats", p);
}

@Concurrent
async function testRepeatsImpl() {
  let repeats: number = 10;
  let size: number = repeats + 3;
  let sab = createUint32Array(size);
  let res: Uint32Array = sab;

  let promises: Promise<Object>[] = [];
  for (let idx: number = 0; idx < repeats; idx++) {
    let task = new taskpool.Task(indexSetter, sab, idx);
    let promise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
    let tmp: Promise<Object>[] = [promise];
    promises.push(...tmp);
  }

  await Promise.all(promises);

  for (let idx: number = 0; idx < repeats; idx++) {
    if (idx != res[idx]) {
      throw new Error("Test failed Expected at index " + idx + " value " + idx + ", but was " + res[idx]);
    }
  }
  return "Test passed";
}
