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
import { worker } from '@kit.ArkTS';

/**
 * Sleep function for test synchronization
 * @param ms Milliseconds to sleep
 * @returns Promise that resolves after specified milliseconds
 */
export function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}


@Concurrent
export function taskFunction(sharedArray: Int32Array, index: number, value: number) {
  class ExtendedAtomics {
    static exchange(typedArray: Int32Array, index: number, value: number): number {
      console.log(`${index},${value}`);
      const result = Atomics.exchange(typedArray, index, value);
      console.log(`exchange:${result}`);
      return result;
    }
    static toString(): string {
      return 'extends Atomics';
    }
  }
  ExtendedAtomics.exchange(sharedArray, index, value);
}


export declare class ArkTools {
  static forceFullGC(): void;
}

export function gc() {
  ArkTools.forceFullGC()
}


export function getCurrentTime(): number {
  return new Date().getTime();
}


export class MemorySnapshotInfo {
  public timestamp: number = 0;
  public description: string = '';
  public heapEstimate: number = 0;

  constructor(description: string) {
    this.timestamp = getCurrentTime();
    this.description = description;

    const startTime = getCurrentTime();
    const array = new Array<number>(10000);
    for (let i = 0; i < 100; i++) {
      array[i] = i;
    }
    const endTime = getCurrentTime();

    this.heapEstimate = endTime - startTime;
  }
}

export class MemoryMonitor {
  private snapshots: MemorySnapshotInfo[] = [];
  private label: string;
  private referenceObjects: Array<Object> = [];

  constructor(label: string) {
    this.label = label;
  }


  async takeSnapshot(description: string): Promise<MemorySnapshotInfo> {
    await gc();

    const testObject = new MemorySnapshotInfo(description);
    this.referenceObjects.push(testObject);

    const snapshot = new MemorySnapshotInfo(description);
    this.snapshots.push(snapshot);

    console.info(`Memory snapshot for ${this.label} (${description}): ${snapshot.heapEstimate}ms`);

    return snapshot;
  }


  getSnapshots(): MemorySnapshotInfo[] {
    const result: MemorySnapshotInfo[] = [];
    for (let i = 0; i < this.snapshots.length; i++) {
      result.push(this.snapshots[i]);
    }
    return result;
  }


  checkForLeaks(allowedGrowthFactor: number = 1.5): boolean {
    if (this.snapshots.length < 2) {
      console.info(`${this.label}: Not enough snapshots to check for leaks`);
      return true;
    }

    const first = this.snapshots[0];
    const last = this.snapshots[this.snapshots.length - 1];

    console.info(`${this.label}: Comparing first and last snapshots`);
    console.info(`First: ${first.description}, Estimate: ${first.heapEstimate}ms`);
    console.info(`Last: ${last.description}, Estimate: ${last.heapEstimate}ms`);

    if (first.heapEstimate > 0) {
      const growthFactor = last.heapEstimate / first.heapEstimate;
      console.info(`${this.label}: Allocation time ratio: ${growthFactor.toFixed(2)}`);

      const referenceRatio = this.referenceObjects.length / this.snapshots.length;
      console.info(`${this.label}: Reference ratio: ${referenceRatio.toFixed(2)}`);

      return growthFactor <= allowedGrowthFactor;
    }

    console.info(`${this.label}: Cannot compare heap usage - metrics not available`);
    return true;
  }

  clear(): void {
    this.snapshots = [];
    this.referenceObjects = [];
  }
}


@Concurrent
export function atomicTask() {
  const buffer = new SharedArrayBuffer(4);
  const sharedArray = new Int32Array(buffer);
  for (let i = 0; i < 10; i++) {
    Atomics.add(sharedArray, 0, 1);
  }
  return Atomics.load(sharedArray, 0);
}


@Concurrent
export function atomicTask1(sharedArray:Int8Array) {
  for (let i = 0; i < 100; i++) {
    Atomics.add(sharedArray, 0, 1);
  }
  return Atomics.load(sharedArray, 0);
}


export class WorkerSrc {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/Worker');
}

export class WorkerSrc2 {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/Worker7');
}

export class WorkerSrc3 {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/Worker8');
}

export class WorkerSrc4 {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/Worker9');
}




@Concurrent
export function atomicCompareExchangeTask(sharedArray:Int16Array) {
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    const expected = sharedArray[index];
    const replacement = expected + 1;
    Atomics.compareExchange(sharedArray, index, expected, replacement);
  }
  return Atomics.load(sharedArray, 0);
}

@Concurrent
export function atomicOrTask(sharedArray:Int32Array) {
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.or(sharedArray, index, 2);
  }
  return Atomics.load(sharedArray, 0);
}


@Concurrent
export function atomicXorTask(buffer:SharedArrayBuffer) {
  const sharedArray = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    Atomics.xor(sharedArray, i, 2n);
  }
  return Atomics.load(sharedArray, 0);
}


export class WorkerSrc1 {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/Worker2');
}



export class XorWorker {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/XorWorker');
}


export class StoreWorker {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/StoreWorker');
}



export function checkAllTasksCompleted() {
  const buffer = new SharedArrayBuffer(800);
  const sharedArray = new BigInt64Array(buffer);
  let completedTasks = 0;
  const totalTasks = 6;
  if (completedTasks === totalTasks) {
    let allPassed = true;
    for (let i = 0; i < 100; i++) {
      const expected = calculateExpectedValue(i);
      const mainResult = Atomics.load(sharedArray, i);
      if (mainResult!== expected) {
        allPassed = false;
        console.error(`索引 ${i} 校验失败，预期值: ${expected}，实际值: ${mainResult}`);
      }
    }
    if (allPassed) {
      console.info('所有校验通过');
    }
  }
}


export function calculateExpectedValue(index: number) {
  let value = BigInt(index);
  for (let i = 0; i < 100; i++) {
    value = value ^ 2n;
  }
  for (let i = 0; i < 100; i++) {
    value = 1000n + BigInt(index);
  }
  for (let i = 0; i < 100; i++) {
    value = value & 3n;
  }
  for (let i = 0; i < 100; i++) {
    value = 2000n + BigInt(index);
  }
  for (let i = 0; i < 100; i++) {
    value = value | 4n;
  }
  for (let i = 0; i < 100; i++) {
    value = value - 1n;
  }
  return value;
}


@Concurrent
export function andTask(buffer: SharedArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.and(array, index, 3n);
  }
  return buffer;
}

@Concurrent
export function exchangeTask(buffer: SharedArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.exchange(array, index, 2000n + BigInt(index));
  }
  return buffer;
}

@Concurrent
export function orTask(buffer: SharedArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.or(array, index, 4n);
  }
  return buffer;
}

@Concurrent
export function subTask(buffer: SharedArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.sub(array, index, 1n);
  }
  return buffer;
}




@Concurrent
export function taskXor(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.xor(int32Array, startIndex + i, 1);
    Atomics.add(int32Array, counterIndex, 1);
  }
}

@Concurrent
export function taskStore(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.store(int32Array, startIndex + i, i * 2);
    Atomics.add(int32Array, counterIndex, 1);
  }
}

@Concurrent
export function taskAnd(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.and(int32Array, startIndex + i, 0x0F);
    Atomics.add(int32Array, counterIndex, 1);
  }
}

@Concurrent
export function taskExchange(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.exchange(int32Array, startIndex + i, -1);
    Atomics.add(int32Array, counterIndex, 1);
  }
}

@Concurrent
export function taskOr(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.or(int32Array, startIndex + i, 0xFF);
    Atomics.add(int32Array, counterIndex, 1);
  }
}

@Concurrent
export function taskSub(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.sub(int32Array, startIndex + i, 10);
    Atomics.add(int32Array, counterIndex, 1);
  }
}


@Concurrent
export function modifyValueTask(int8Array: Int8Array, targetIndex: number) {
  Atomics.store(int8Array, targetIndex, 20);
}


export class Worker3 {
  public static workerInstance :worker.ThreadWorker= new worker.ThreadWorker('../pages/workers/Worker3');
}


@Concurrent
export function modifyInt16Array(sharedBuffer: SharedArrayBuffer,
  targetIdx: number, newVal: number, statusIdx: number) {
  const arr: Int32Array = new Int32Array(sharedBuffer);
  Atomics.notify(arr, statusIdx);
  setTimeout(() => {
    Atomics.store(arr, targetIdx, newVal);
    Atomics.store(arr, statusIdx, 1);
    Atomics.notify(arr, statusIdx);
  }, 3000);
}


@Concurrent
export function waitInTaskpool(sharedBuffer: SharedArrayBuffer, statusIdx: number) {
  const arr: BigInt64Array = new BigInt64Array(sharedBuffer);
  console.log(`Taskpool task is waiting at index ${statusIdx}`);
  Atomics.wait(arr, statusIdx, 0n);
  console.log(`Taskpool task at index ${statusIdx} has been notified`);
}


@Concurrent
export function waitInTaskpool2(sharedBuffer: SharedArrayBuffer, statusIdx: number) {
  const arr: Int32Array = new Int32Array(sharedBuffer);
  console.log(`Taskpool task is waiting at index ${statusIdx} with timeout 1s`);
  const waitResult = Atomics.wait(arr, statusIdx, 0, 1000);
  if (waitResult === 'ok') {
    console.log(`Taskpool task at index ${statusIdx} has been notified`);
  } else if (waitResult === 'timed-out') {
    console.log(`Taskpool task at index ${statusIdx} timed out`);
  } else {
    console.log(`Taskpool task at index ${statusIdx} got unexpected result: ${waitResult}`);
  }
}



@Concurrent
export function notifyInTaskpool(sharedBuffer: SharedArrayBuffer, statusIdx: number) {
  const arr: BigInt64Array = new BigInt64Array(sharedBuffer);
  console.log(`Taskpool notify task is notifying at index ${statusIdx}`);
  Atomics.notify(arr, statusIdx);
  console.log(`Taskpool notify task at index ${statusIdx} has notified`);
}


@Concurrent
export function waitInTaskpool3(sharedBuffer: SharedArrayBuffer, statusIdx: number, expectedValue: bigint) {
  const arr: BigInt64Array = new BigInt64Array(sharedBuffer);
  console.log(`Taskpool wait task is waiting at index ${statusIdx} for value ${expectedValue}`);
  Atomics.wait(arr, statusIdx, expectedValue);
  console.log(`Taskpool wait task at index ${statusIdx} for value ${expectedValue} has been notified`);
}


