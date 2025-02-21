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
import { BypassFunctionType, fillAndBypassContainer, allocateAndBypassFunction } from './BypassFunction';
import { Allocator } from './Ring'
import { check } from './utils';
import { NumberContainer, NumberContainerArray, ValuedNumberContainer } from './Containers'

export function testSendablesFromOtherTaskWithAlloc() {
  let p = testSendablesFromOtherTaskWithAllocImpl();
  return check("testSendablesFromOtherTaskWithAlloc", p);
}

@Concurrent
function allocateAndPrepareTaskGroup(): taskpool.TaskGroup {
  Allocator.allocate();
  let group = new taskpool.TaskGroup();
  let data = new NumberContainer();
  let job: BypassFunctionType<NumberContainer> = allocateAndBypassFunction;
  for(let i = 0; i < 20; i++) {
    group.addTask(new taskpool.Task(job, data))
  }
  return group;
}

async function testSendablesFromOtherTaskWithAllocImpl() {
  let tasks = 20;
  let root = new taskpool.Task(allocateAndPrepareTaskGroup);
  let tasksGroup: taskpool.TaskGroup = await taskpool.execute(root) as taskpool.TaskGroup;

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);
  let tr: NumberContainer[] = await (p) as NumberContainer[];

  if(tr.length != tasks) throw new Error("Mismatch passed and promised length...");
  for(let i = 0; i < tasks; i++) {
    if(tr[i].data == 123) continue;
    throw new Error("Data Mismatch passed and promised")
  }
  return "Test passed";
}

export function testManySendablesToGroup() {
  let p = taskpool.execute(testManySendablesToGroupImpl)
  return check("testManySendablesToGroup", p);
}

@Concurrent
async function testManySendablesToGroupImpl(): Promise<string> {
  let data: ValuedNumberContainer[] = [];
  let tasks = 10;
  let tasksGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  let job: BypassFunctionType<ValuedNumberContainer> = allocateAndBypassFunction;

  for(let i = 0; i < tasks; i++) {
    let vc = new ValuedNumberContainer(i);
    data.push(vc);
    tasksGroup.addTask(new taskpool.Task(job, vc));

  }

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);
  let tr: ValuedNumberContainer[] = await (p) as ValuedNumberContainer[];
  if(tr.length != tasks) throw new Error("Mismatch passed and promised length...");
  for(let i = 0; i < tasks; i++) {
    if(tr[i].data == data[i].data) continue;
    throw new Error("Data Mismatch passed and promised")
  }

  return "Test passed";
}

export function testSendableToGroupAndUpdate() {
  let p = taskpool.execute(testSendableToGroupAndUpdateImpl)
  return check("testSendableToGroupAndUpdate", p);
}

@Concurrent
async function testSendableToGroupAndUpdateImpl(): Promise<string> {
  let tasks = 20;
  let data: NumberContainerArray = new NumberContainerArray();
  let containersArray: NumberContainer[] = new Array(tasks);
  for(let i = 0; i < tasks; i++) {
    containersArray[i] = new NumberContainer();
  }
  data.data = containersArray;

  let tasksGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  for(let i = 0; i < tasks; i++) {
    let container: NumberContainer = containersArray[i] as NumberContainer;
    tasksGroup.addTask(new taskpool.Task(fillAndBypassContainer, container, i));
  }

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);

  let tr: number[] = await (p) as number[];
  if(tr.length != tasks) throw new Error("Mismatch passed " + tasks + " and promised length " + tr.length);
  for(let i = 0; i < tasks; i++) {
    if(tr[i] == containersArray[i].data) continue;
    throw new Error("Data Mismatch at " + i + ", expected " + containersArray[i].data + " and got " + tr[i]);
  }
  return "Test passed";
}