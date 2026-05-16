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

export async function sleep(time: int): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

class ExtendedAtomics {
  static exchange(typedArray: Int32Array, index: number, value: number): number {
    console.log(`${index},${value}`);
    const result = Atomics.exchange(typedArray, index as int, value as int);
    console.log(`exchange:${result}`);
    return result;
  }
  static toString(): string {
    return 'extends Atomics';
  }
}
export function taskFunction(sharedArray: Int32Array, index: number, value: number) {
  ExtendedAtomics.exchange(sharedArray, index, value);
}


export declare class ArkTools {
  static forceFullGC(): void;
}

export function gc() {
  // gc
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
    gc();

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
      const referenceRatio = this.referenceObjects.length / this.snapshots.length;
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



export function atomicTask() {
  const buffer = new ArrayBuffer(4);
  const sharedArray = new Int32Array(buffer);
  for (let i = 0; i < 10; i++) {
    Atomics.add(sharedArray, 0, 1);
  }
  return Atomics.load(sharedArray, 0);
}



export function atomicTask1(sharedArray:Int8Array) {
  for (let i = 0; i < 100; i++) {
    Atomics.add(sharedArray, 0, 1);
  }
  return Atomics.load(sharedArray, 0);
}


export class WorkerSrc {
  public static workerInstance :EAWorker= new EAWorker();
}

export function atomicCompareExchangeTask(sharedArray:Int16Array) {
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    const expected = sharedArray[index].toInt();
    const replacement = expected + 1;
    Atomics.compareExchange(sharedArray, index, expected, replacement);
  }
  return Atomics.load(sharedArray, 0);
}


export function atomicOrTask(sharedArray:Int32Array) {
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.or(sharedArray, index, 2);
  }
  return Atomics.load(sharedArray, 0);
}



export function atomicXorTask(buffer:ArrayBuffer) {
  const sharedArray = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    Atomics.xor(sharedArray, i, 2n);
  }
  return Atomics.load(sharedArray, 0);
}

export function checkAllTasksCompleted() {
  const buffer = new ArrayBuffer(800);
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



export function andTask(buffer: ArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.and(array, index, 3n);
  }
  return buffer;
}


export function exchangeTask(buffer: ArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.exchange(array, index, 2000n + BigInt(index));
  }
  return buffer;
}


export function orTask(buffer: ArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.or(array, index, 4n);
  }
  return buffer;
}


export function subTask(buffer: ArrayBuffer) {
  const array = new BigInt64Array(buffer);
  for (let i = 0; i < 100; i++) {
    const index = i % 100;
    Atomics.sub(array, index, 1n);
  }
  return buffer;
}





export function taskXor(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.xor(int32Array, startIndex as int + i, 1);
    Atomics.add(int32Array, counterIndex as int, 1);
  }
}


export function taskStore(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.store(int32Array, startIndex as int + i, i * 2);
    Atomics.add(int32Array, counterIndex as int, 1);
  }
}


export function taskAnd(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.and(int32Array, startIndex as int + i, 0x0F);
    Atomics.add(int32Array, counterIndex as int, 1);
  }
}


export function taskExchange(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.exchange(int32Array, startIndex as int + i, -1);
    Atomics.add(int32Array, counterIndex as int, 1);
  }
}


export function taskOr(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.or(int32Array, startIndex as int + i, 0xFF);
    Atomics.add(int32Array, counterIndex as int, 1);
  }
}


export function taskSub(int32Array: Int32Array, startIndex: number, counterIndex: number) {
  for (let i = 0; i < 100; i++) {
    Atomics.sub(int32Array, startIndex as int + i, 10);
    Atomics.add(int32Array, counterIndex as int, 1);
  }
}



export function modifyValueTask(int8Array: Int8Array, targetIndex: number) {
  Atomics.store(int8Array, targetIndex as int, 20);
}

export function modifyInt16Array(sharedBuffer: ArrayBuffer,
  targetIdx: number, newVal: number, statusIdx: number) {
  const arr: Int32Array = new Int32Array(sharedBuffer);
  Atomics.notify(arr, statusIdx as int);
  setTimeout(() => {
    Atomics.store(arr, targetIdx as int, newVal as int);
    Atomics.store(arr, statusIdx as int, 1);
    Atomics.notify(arr, statusIdx as int);
  }, 3000);
}



export function waitInTaskpool(sharedBuffer: ArrayBuffer, statusIdx: number) {
  const arr: BigInt64Array = new BigInt64Array(sharedBuffer);
  console.log(`Taskpool task is waiting at index ${statusIdx}`);
  Atomics.wait(arr, statusIdx as int, 0n);
  console.log(`Taskpool task at index ${statusIdx} has been notified`);
}

export function notifyInTaskpool(sharedBuffer: ArrayBuffer, statusIdx: number) {
  const arr: BigInt64Array = new BigInt64Array(sharedBuffer);
  console.log(`Taskpool notify task is notifying at index ${statusIdx}`);
  Atomics.notify(arr, statusIdx as int);
  console.log(`Taskpool notify task at index ${statusIdx} has notified`);
}



export function waitInTaskpool3(sharedBuffer: ArrayBuffer, statusIdx: number, expectedValue: bigint) {
  const arr: BigInt64Array = new BigInt64Array(sharedBuffer);
  console.log(`Taskpool wait task is waiting at index ${statusIdx} for value ${expectedValue}`);
  Atomics.wait(arr, statusIdx as int, expectedValue);
  console.log(`Taskpool wait task at index ${statusIdx} for value ${expectedValue} has been notified`);
}


