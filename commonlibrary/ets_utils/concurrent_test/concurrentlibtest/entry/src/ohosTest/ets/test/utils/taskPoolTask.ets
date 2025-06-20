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

import { collections, taskpool } from '@kit.ArkTS';
import { HashMap } from '@kit.ArkTS';

@Concurrent
async function testFailed(args: number): Promise<HashMap<string, number>> {
  await new Promise<void>(resolve => setTimeout(resolve, 100));
  throw new Error('This is a deliberate failure for testing purposes');
  let hashMap1: HashMap<string, number> = new HashMap();
  hashMap1.set('a', args);
  return hashMap1;
}

const periodicTask = (interval: number, count: number): Promise<void> => {
  let executions = 0;
  return new Promise<void>((resolve: () => void) => {
    const intervalId = setInterval(() => {
      executions++;
      console.info(`Periodic task execution ${executions}`);
      if (executions >= count) {
        clearInterval(intervalId);
        resolve();
      }
    }, interval);
  });
}

@Concurrent
function inspectStatus(arg: number): number {
  if (taskpool.Task.isCanceled()) {
    return arg + 2;
  }
  return arg + 1;
}

@Concurrent
function additionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

@Concurrent
function waitForRunner(finalString: string): string {
  return finalString;
}

@Concurrent
function printArgs(args: number): number {
  let t: number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
  console.info('printArgs: ' + args);
  return args;
}

export {
  testFailed, periodicTask, inspectStatus, additionDelay, waitForRunner, printArgs, }

function ConstructorTest1(): string {
  'use concurrent'
  let retString: string = 'ConstructorTest1';
  return retString;
}

function ConstructorTest2(): string {
  "use concurrent"
  let retString: string = 'ConstructorTest2';
  return retString;
}

function ConstructorTest3(): string {
  "use concurrent"
  let retString: string = 'ConstructorTest3';
  return retString;
}

function noConcurrent(): number {
  let retNumber: number = 123;
  return retNumber;
}

@Concurrent
function Concurrent(): number {
  "use concurrent"
  let retNumber: number = 321;
  return retNumber;
}

@Concurrent
function addTaskFunc(args: number): string {
  "use concurrent"
  let errString: string = 'NotNumber';
  if (typeof (args) != 'number') {
    return errString;
  }
  return (args + 1).toString();
}

@Concurrent
function addTaskTask1(args: number): string {
  "use concurrent"
  return args.toString() + 1;
}

@Concurrent
function testLongTask1(args: number): string {
  "use concurrent"
  return args.toString();
}

@Concurrent
function testLongTask2(args: string): string {
  "use concurrent"
  return args;
}

function testSequenceRunner(args: string): string {
  "use concurrent"
  return args;
}

@Concurrent
function testRunnerNum2Str(args: number): string {
  "use concurrent"
  return args.toString();
}

@Concurrent
function testRunnerStr2Str(args: string): string {
  "use concurrent"
  return args;
}

export {
  ConstructorTest1,
  ConstructorTest2,
  ConstructorTest3,
  noConcurrent,
  Concurrent,
  addTaskFunc,
  addTaskTask1,
  testLongTask1,
  testLongTask2,
  testSequenceRunner,
  testRunnerNum2Str,
  testRunnerStr2Str
}