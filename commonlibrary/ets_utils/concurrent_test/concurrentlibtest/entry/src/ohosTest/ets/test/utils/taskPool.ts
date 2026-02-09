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

class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log(`Hello, my name is ${this.name}.`);
  }
}

@
Concurrent

async function delay(ms: number): Promise<number> {
  const promise = await new Promise<number>(resolve => {
    setTimeout(() => resolve(ms), ms);
  });
  return promise;
}

function taskTest001(): number {
  "use concurrent"
  //console.info("test Task001: no args");
  return 0;
}

function funcRetNumber(): number {
  "use concurrent"
  //console.info("funcRetNumber: " + args);
  return 0;
}

function funcRetString(args: number): string {
  "use concurrent"
  console.info("testTaskpoolExecute005: " + args);
  args += 1;
  return "This is string";
}

function funcRetBool(args1: string, args2: boolean): boolean {
  "use concurrent"
  console.info("testTaskpool: " + args1 + args2);
  if (typeof (args1) != "string" || typeof (args2) != "boolean") {
    return false;
  }
  return true;
}

function funcRetUndef(): undefined {
  "use concurrent"
  return;
}

function funcRetNull(args: boolean): null {
  "use concurrent"
  console.info("testTaskpool: " + args);
  return null;
}

function funcRetBigint(args: bigint): bigint {
  "use concurrent"
  console.info("testTaskpoolExecute009: " + args);
  let res = 231n;
  args += res;
  return args;
}

function funcRetDate(args1: string, args2: number, args3: number): Date {
  "use concurrent"
  console.info("testTaskpoolExecute010: " + args1 + args2 + args3);
  let timestamp = Date.parse(args1);
  let dateObj = new Date(timestamp);
  console.info(dateObj.toISOString()); // 输出类似 Date 2023-04-01T00:00:00.000Z
  return dateObj;
}

function funcRetArray(args: Array<number>): Array<number> {
  "use concurrent"
  for (let i = 0; i < args.length; i++) {
    args[i] += 1;
  }
  return args;
}

function funcRetMap(args1: Map<string, number>, args2: boolean): Map<string, number> {
  "use concurrent"
  args1.forEach((value, key) => {
    args1.set(key, value * 2);
  });
  if (args2 == false) {
    args2 = true;
  }
  for (let [key, value] of args1.entries()) {
    console.info(`testTaskpoolTask011 test funcRetMap ${key} :  ${value}`);
  }
  return args1;
}

function funcRetSet(args1: Set<number>, args2: boolean): Set<number> {
  "use concurrent"
  for (let value of args1.values()) {
    value += 1;
  }
  if (args2 == false) {
    args2 = true;
  }
  return args1;
}

function funcRetClass(args1: string, args2: Person): Person {
  "use concurrent"
  args2.name = args1;
  console.info("testTaskpoolExecute014: " + args1);
  return args2;
}

function funcRetAB(args1: string, args2: ArrayBuffer): ArrayBuffer {
  "use concurrent"
  console.info("testTaskpoolExecute015: " + args1);
  let dataView = new DataView(args2);
  dataView.setUint32(0, 0x12345678, true);
  let resN = dataView.getUint32(0, true);
  console.info(`testTaskpoolExecute015 testFunction ${resN.toString(16)}`);
  return args2;
}

function funcRetU8(args1: Uint8Array, args2: boolean): Uint8Array {
  "use concurrent"
  console.info("testTaskpoolExecute016: " + args2);
  args1[5] = 255; // 添加一个新元素
  args1[6] = 100;
  return args1;
}

function funcRetArray2(args: string): Array<number> {
  "use concurrent"
  let resA = new Array(1, 2, 3, 4, 5);
  for (let i = 0; i < resA.length; i++) {
    resA[i] += 1;
  }
  return resA;
}

function printNumber(args: number): number {
  "use concurrent"
  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function printString(args: string): string {
  "use concurrent"
  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function printArgs(args: number): number {
  "use concurrent"
  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function printABool(args: boolean): boolean {
  "use concurrent"
  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function printABig(args: bigint): bigint {
  "use concurrent"
  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function mathMore(args: number): number {
  "use concurrent"
  return args % 5;
}

function mathPow(value1: number, value2: number): number {
  "use concurrent"
  return Math.pow(value1, value2);
}

function mathSqrt(value1: number): number {
  "use concurrent"
  return Math.sqrt(value1);
}

function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  "use concurrent"
  console.info("testTransfer arg1 byteLength: " + arg1.byteLength);
  console.info("testTransfer arg2 byteLength: " + arg2.byteLength);
  return 100;
}

function stringToNumber(str: string | number): number {
  "use concurrent"
  if (typeof (str) == 'number') {
    return str;
  }
  return str === 'a' ? 2 : str === 'b' ? 4 : 0;
}

function testFunc(arrayBuffer: ArrayBuffer): Int32Array {
  "use concurrent"
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [11, 12, 13, 14];
  for (let i = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

function concurrentF(num: number): number {
  "use concurrent"
  let res: number = num * 10;
  console.info(`concurrentF: res1 ${res}`);
  taskpool.Task.sendData(res);
  console.info(`concurrentF: res2 ${res}`);
  return num;
}

function spileString(value1: string, value2: string): string {
  "use concurrent"
  let str: string = value1 + value2;
  taskpool.Task.sendData(str);
  return str;
}

function funArray(value1: number[]): void {
  "use concurrent"
  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funDate(value1: object): void {
  "use concurrent"
  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function changeT(value1: boolean): void {
  "use concurrent"
  if (value1 == false) {
    value1 = true;
  }
  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funcRUndef(value1: undefined): void {
  "use concurrent"
  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function changeN2T(value1: null): void {
  "use concurrent"
  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funcChangeBigint(value1: bigint): void {
  "use concurrent"
  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

export {
  taskTest001,
  funcRetNumber,
  funcRetString,
  funcRetBool,
  funcRetUndef,
  funcRetNull,
  funcRetBigint,
  funcRetDate,
  funcRetArray,
  funcRetMap,
  funcRetSet,
  funcRetClass,
  funcRetAB,
  funcRetU8,
  funcRetArray2,
  printNumber,
  printString,
  printArgs,
  printABool,
  printABig,
  mathMore,
  mathPow,
  mathSqrt,
  testTransfer,
  stringToNumber,
  testFunc,
  concurrentF,
  spileString,
  funArray,
  funDate,
  changeT,
  funcRUndef,
  changeN2T,
  funcChangeBigint,
  delay,
}

function ConstructorTest1(): string {
  "use concurrent"
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
  testRunnerStr2Str,
}

@
Concurrent

async function testFailed(args: number): Promise<HashMap<string, number>> {
  await new Promise<void>(resolve => setTimeout(resolve, 100));
  throw new Error("This is a deliberate failure for testing purposes");
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

export {
  testFailed, periodicTask, inspectStatus, additionDelay, waitForRunner, getTaskStateByTaskName, }

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

@Concurrent
function getTaskStateByTaskName(taskpoolInfo: taskpool.TaskPoolInfo, taskName: string): number {
  let taskIS = Array.from(taskpoolInfo.taskInfos)
  let state: number = 0
  for (let taskInfo of taskIS) {
    if (taskInfo.name == taskName) {
      state = taskInfo.state
    }
  }
  return state
}
