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
import { DataChainedPath0, DataChainedPath1, DataChainedPath2 } from './SendablesChainTestImport3';
import { extractDataJob, taskDataFunction0, taskDataFunction2 } from './SendablesChainTestImport2';

// TESTS IMPLEMENTATION //

export function testChainedPath0(): Promise<string> {
  let p = testChainedPath0Impl();
  return check("testChainedPath0", p);
}

@Concurrent
function taskTaskFunction0(input: DataChainedPath0): taskpool.Task {
  return new taskpool.Task(taskDataFunction0, input.nested);
}

async function testChainedPath0Impl() {
  let input: DataChainedPath0 = new DataChainedPath0();
  let taskOne: Promise<taskpool.Task> = taskpool.execute(taskTaskFunction0, input) as Promise<taskpool.Task>;

  let taskTwo = await (taskOne);
  let res1 = taskpool.execute(taskTwo);
  let res = await (res1);
  if (res == 123) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + 123 + ", but was " + res);
}

export function testChainedPath0Negative(): Promise<string> {
  let p = testChainedPath0ImplNegative()
  return check("testChainedPath0Negative", p);
}

async function testChainedPath0ImplNegative() {
  let input: DataChainedPath0 = new DataChainedPath0();
  let taskOne: Promise<taskpool.Task> = taskpool.execute(taskTaskFunction0, input) as Promise<taskpool.Task>;

  let taskTwo = await (taskOne);
  let res1 = taskpool.execute(taskTwo);
  let res = await (res1);
  if (res == 321) {
    throw new Error("Test failed expected not " + 321 + ", but was " + res);
  }
  return "Test passed, as expected " + 321 + " not equals " + res;
}

@Concurrent
function taskDataFunction1(): DataChainedPath1 {
  let result: DataChainedPath1 = new DataChainedPath1();
  return result;
}

export function testChainedPath1(): Promise<string> {
  let p = testChainedPath1Impl()
  return check("testChainedPath1", p);
}

async function testChainedPath1Impl() {
  let task1: taskpool.Task = new taskpool.Task(taskDataFunction1);
  let task: Promise<DataChainedPath1> = taskpool.execute(task1) as Promise<DataChainedPath1>;

  let input: DataChainedPath1 = await (task) as DataChainedPath1;
  let res1 = taskpool.execute(extractDataJob, input);
  let res: number = await (res1) as number;
  if (res == 123) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + 123 + ", but was " + res);
}

export function testChainedPath2(): Promise<string> {
  let p = testChainedPath2Impl()
  return check("testChainedPath2", p);
}

@Concurrent
function taskTaskFunction2(input: DataChainedPath2): Promise<taskpool.Task> {
  return Promise.resolve(new taskpool.Task(taskDataFunction2, input.nested)); // return new Promise<taskpool.Task>(resolve => new taskpool.Task(taskDataFunction2, input.nested));
}

async function testChainedPath2Impl() {
  let input: DataChainedPath2 = new DataChainedPath2();

  let taskOne: Promise<taskpool.Task> = taskpool.execute(taskTaskFunction2, input) as  Promise<taskpool.Task>;

  let taskTwo = await (taskOne);
  let res1 = taskpool.execute(taskTwo);
  let res = await (res1);
  if (res == 123) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + 123 + ", but was " + res);
}
