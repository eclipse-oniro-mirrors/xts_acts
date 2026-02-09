/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { delay, printArgs } from './taskPoolCommon';
import { taskpool } from '@kit.ArkTS';

@Concurrent
function executeTask(taskName: string) {
  let task: taskpool.Task = new taskpool.Task(taskName + ' task', printArgs, taskName);
  taskpool.execute(task);
}

@Concurrent
function executeTaskGroup(taskName: string) {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  let task: taskpool.Task = new taskpool.Task(taskName + ' taskGroup', printArgs, taskName);
  console.info(`${taskName} taskGroup: add task start`);
  taskGroup.addTask(task);
  taskpool.execute(taskGroup);
}

@Concurrent
function executeDelayed(taskName: string) {
  let task: taskpool.Task = new taskpool.Task(taskName + ' executeDelayed', printArgs, taskName);
  taskpool.executeDelayed(100, task);
}

@Concurrent
function executePeriodically(taskName: string) {
  let task: taskpool.Task = new taskpool.Task(taskName + ' executePeriodically', printArgs, taskName);
  taskpool.executePeriodically(1000, task);
}

@Concurrent
function executeSequenceRunner(taskName: string) {
  let task1: taskpool.Task = new taskpool.Task(taskName + ' runner1', printArgs, taskName + ' task1');
  let task2: taskpool.Task = new taskpool.Task(taskName + ' runner2', printArgs, taskName + ' task2');
  let task3: taskpool.Task = new taskpool.Task(taskName + ' runner3', printArgs, taskName + ' task3');
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  console.info(`${taskName} sequenceRunner: execute task start`);
  runner.execute(task1);
  runner.execute(task2);
  runner.execute(task3);
}

@Concurrent
function executeLongTask(taskName: string) {
  let task: taskpool.LongTask = new taskpool.LongTask(taskName + ' longTask', delay, 10000);
  taskpool.execute(task);
}

export {
  executeTask, executeTaskGroup, executeDelayed, executePeriodically, executeSequenceRunner, executeLongTask }

