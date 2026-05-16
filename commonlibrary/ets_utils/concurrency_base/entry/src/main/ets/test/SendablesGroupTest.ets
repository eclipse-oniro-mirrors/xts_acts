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
import { bypassFunction, BypassFunctionType, fillAndBypassContainer } from './BypassFunction';
import { check } from './utils';
import { NumberContainer, ValuedNumberContainer } from './Containers'
import { createNumberContainer, bypassNumberContainer } from './SendablesGroupTestImport'

export function testSendablesFromOtherTask() {
  let p = testSendablesFromOtherTaskImpl();
  return check("testSendablesFromOtherTask", p);
}

async function testSendablesFromOtherTaskImpl() {
  return "Test passed";
}

export function testSendablesFromOtherTask_1() {
  let p = testSendablesFromOtherTaskImpl_1();
  return check("testSendablesFromOtherTask_1", p);
}

async function testSendablesFromOtherTaskImpl_1() {
  return "Test passed";
}

export function testSendablesFromOtherTask_2() {
  let p = testSendablesFromOtherTaskImpl_2();
  return check("testSendablesFromOtherTask_2", p);
}

@Concurrent
function prepareTaskGroup_2(tasks: number): taskpool.TaskGroup {
  let group = new taskpool.TaskGroup();
  for(let i = 0; i < tasks; i++) {
    let task: taskpool.Task = new taskpool.Task(createNumberContainer);
    group.addTask(task);
  }
  return group;
}

async function testSendablesFromOtherTaskImpl_2() {
  let tasks = 20;
  let promiseGroup: Promise<Object> = taskpool.execute(prepareTaskGroup_2, tasks) as Promise<Object>;
  let tasksGroup: taskpool.TaskGroup = await (promiseGroup) as taskpool.TaskGroup;

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);
  let tr: NumberContainer[] = await (p) as NumberContainer[];

  if(tr.length != tasks) throw new Error("Mismatch passed " + tasks + " and promised length " + tr.length);
  for(let i = 0; i < tasks; i++) {
    let res: NumberContainer = tr[i] as NumberContainer;
    if(res.data == 12345678) continue;
    throw new Error("Data Mismatch passed " + 12345678 + " and promised " + res);
  }
  return "Test passed";
}

export function testSendablesFromOtherTask_2_1() {
  let p = testSendablesFromOtherTaskImpl_2_1();
  return check("testSendablesFromOtherTask_2_1", p);
}

function prepareTaskGroup_2_1(tasks: number): taskpool.TaskGroup {
  let group = new taskpool.TaskGroup();
  for(let i = 0; i < tasks; i++) {
    let task: taskpool.Task = new taskpool.Task(createNumberContainer);
    group.addTask(task);
  }
  return group;
}

async function testSendablesFromOtherTaskImpl_2_1() {
  let tasks = 20;

  let tasksGroup: taskpool.TaskGroup = prepareTaskGroup_2_1(tasks) as taskpool.TaskGroup;

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);

  let tr: NumberContainer[] = await (p) as NumberContainer[];

  if(tr.length != tasks) throw new Error("Mismatch passed " + tasks + " and promised length " + tr.length);

  for(let i = 0; i < tasks; i++) {
    let res: NumberContainer = tr[i] as NumberContainer;
    if(res.data == 12345678) continue;
    throw new Error("Data Mismatch passed " + 12345678 + " and promised " + res.data);
  }
  return "Test passed";
}

export function testSendablesFromOtherTask_3() {
  let p = testSendablesFromOtherTaskImpl_3();
  return check("testSendablesFromOtherTask_3", p);
}

@Concurrent
function prepareTaskGroup_3(tasks: number): taskpool.TaskGroup {
  let group = new taskpool.TaskGroup();
  let data: NumberContainer = new NumberContainer();
  for(let i = 0; i < tasks; i++) {
    let task: taskpool.Task = new taskpool.Task(bypassNumberContainer, data);
    group.addTask(task);
  }
  return group;
}

async function testSendablesFromOtherTaskImpl_3() {
  let tasks = 20;
  let promiseGroup: Promise<Object> = taskpool.execute(prepareTaskGroup_3, tasks) as Promise<Object>;
  let tasksGroup: taskpool.TaskGroup = await (promiseGroup) as taskpool.TaskGroup;

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);
  let tr: NumberContainer[] = await (p) as NumberContainer[];

  if(tr.length != tasks) throw new Error("Mismatch passed " + tasks + " and promised length " + tr.length);
  for(let i = 0; i < tasks; i++) {
    let res: NumberContainer = tr[i] as NumberContainer;
    if(res.data == 12345678) continue;
    throw new Error("Data Mismatch passed " + 12345678 + " and promised " + res.data);
  }
  return "Test passed";
}

export function testSendablesFromOtherTask_3_1() {
  let p = testSendablesFromOtherTaskImpl_3_1();
  return check("testSendablesFromOtherTask_3_1", p);
}

@Concurrent
function prepareTaskGroup_3_1(tasks: number): taskpool.TaskGroup {
  let group = new taskpool.TaskGroup();
  let data: NumberContainer = new NumberContainer();
  for(let i = 0; i < tasks; i++) {
    let task: taskpool.Task = new taskpool.Task(bypassFunction, data);
    group.addTask(task);
  }
  return group;
}

async function testSendablesFromOtherTaskImpl_3_1() {
  let tasks = 20;
  let promiseGroup: Promise<Object> = taskpool.execute(prepareTaskGroup_3_1, tasks) as Promise<Object>;
  let tasksGroup: taskpool.TaskGroup = await (promiseGroup) as taskpool.TaskGroup;

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);
  let tr: NumberContainer[] = await (p) as NumberContainer[];

  if(tr.length != tasks) throw new Error("Mismatch passed " + tasks + " and promised length " + tr.length);
  for(let i = 0; i < tasks; i++) {
    let res: NumberContainer = tr[i] as NumberContainer;
    if(res.data == 12345678) continue;
    throw new Error("Data Mismatch passed " + 12345678 + " and promised " + res.data);
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
  let tasks = 20;
  let tasksGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  let job: BypassFunctionType<ValuedNumberContainer> = bypassFunction;

  for(let i = 0; i < tasks; i++) {
    let vc = new ValuedNumberContainer(i);
    data.push(vc);
    tasksGroup.addTask(new taskpool.Task(job, vc));

  }

  let p: Promise<Object[]> = taskpool.execute(tasksGroup);
  let tr: ValuedNumberContainer[] = await (p) as ValuedNumberContainer[];
  if(tr.length != tasks) throw new Error("Mismatch passed " + tasks + " and promised length " + tr.length);
  for(let i = 0; i < tasks; i++) {
    if(tr[i].data == data[i].data) continue;
    throw new Error("Data Mismatch at " + i + " passed " + data[i].data + " and promised " + tr[i].data)
  }

  return "Test passed";
}

export function testSendableToGroupAndUpdate() {
  let p = testSendableToGroupAndUpdateImpl();
  return check("testSendableToGroupAndUpdate", p);
}

async function testSendableToGroupAndUpdateImpl() {
  let tasks = 20;
  let containersArray: NumberContainer[] = new Array(tasks) as NumberContainer[];
  for(let i = 0; i < tasks; i++) {
    containersArray[i] = new NumberContainer();
  }

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
