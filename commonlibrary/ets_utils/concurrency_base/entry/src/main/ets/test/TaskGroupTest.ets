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
import { createUint32Array, indexSetter } from './TaskPoolTestImport';

// TESTS IMPLEMENTATION //

export function testHappyPath(): Promise<string> {
  let p = taskpool.execute(testHappyPathImpl)
  return check("testHappyPath", p);
}

export function testHappyPathCombined(): Promise<string> {
  let p = taskpool.execute(testHappyPathImplCombined)
  return check("testHappyPathCombined", p);
}


@Concurrent
async function testHappyPathImpl() {
  let sab = createUint32Array(3);
  let task1 = new taskpool.Task(indexSetter, sab, 1);
  let task2 = new taskpool.Task(indexSetter, sab, 2);
  let group: taskpool.TaskGroup = new taskpool.TaskGroup();
  group.addTask(task1);
  group.addTask(task2);
  let task: Promise<Object> = taskpool.execute(group, taskpool.Priority.HIGH) as Promise<Object>;

  await (task);
  let res1: number = sab[1];
  let res2: number = sab[2];
  if (1 == res1 && 2 == res2) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + "1 and 2" + ", but was " + res1 + " and " + res2);
}

@Concurrent
async function testHappyPathImplCombined() {
  let sab = createUint32Array(3);

  let group: taskpool.TaskGroup = new taskpool.TaskGroup();
  group.addTask(new taskpool.Task(indexSetter, sab, 1));
  group.addTask(indexSetter, sab, 2);
  let task: Promise<Object> = taskpool.execute(group, taskpool.Priority.HIGH) as Promise<Object>;
  await (task);
  let res1: number = sab[1];
  let res2: number = sab[2];
  if (1 == res1 && 2 == res2) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + "1 and 2" + ", but was " + res1 + " and " + res2);
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

  let group: taskpool.TaskGroup = new taskpool.TaskGroup();
  for (let idx: number = 0; idx < repeats; idx++) {
    let task = new taskpool.Task(indexSetter, sab, idx);
    group.addTask(task);
  }

  let p: Promise<Object> = taskpool.execute(group) as Promise<Object>;

  await (p);

  for (let idx: number = 0; idx < repeats; idx++) {
    let res: number = sab[idx];
    if (idx != res) {
      throw new Error("Test failed Expected at index " + idx + " value " + idx + ", but was " + res);
    }
  }
  return "Test passed";
}
