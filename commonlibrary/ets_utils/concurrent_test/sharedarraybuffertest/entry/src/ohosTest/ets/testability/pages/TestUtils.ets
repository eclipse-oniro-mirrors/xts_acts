/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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

/**
 * Interface for the result of processing a slice of SharedArrayBuffer
 */
export interface SliceResult {
  threadId: number;
  sum: number;
  byteLength: number;
}

/**
 * Interface for the result of worker processing on BufferContainer
 */
export interface WorkerResult {
  workerId: number;
  length: number;
}

/**
 * Container class for SharedArrayBuffer operations
 */
export class BufferContainer {
  constructor(size: number) {
    this.buffer = new SharedArrayBuffer(size);
    this.array = new Int32Array(this.buffer);
  }
  
  public buffer: SharedArrayBuffer;
  public array: Int32Array;
}

/**
 * Process a slice of SharedArrayBuffer
 */
@Concurrent
export function processSlice(sab: SharedArrayBuffer, threadId: number, sliceSize: number): SliceResult {
  const startOffset = threadId * sliceSize;
  const endOffset = Math.min(startOffset + sliceSize, sab.byteLength);
  
  const sliced = sab.slice(startOffset, endOffset);
  const slicedArray = new Int32Array(sliced);
  
  let sum = 0;
  
  for (let i = 0; i < slicedArray.length; i++) {
    sum += slicedArray[i];
  }
  
  return { 
    threadId, 
    sum, 
    byteLength: sliced.byteLength 
  };
}

/**
 * Worker function to modify a buffer based on worker ID
 */
@Concurrent
export function workerFunction(container: BufferContainer, workerId: number): WorkerResult {
  const array = new Int32Array(container.buffer);
  
  for (let i = 0; i < array.length; i++) {
    if (i % 10 === workerId) {
      array[i] += workerId;
    }
  }
  
  return { workerId, length: array.length };
}

/**
 * Function to modify a specific buffer element
 */
@Concurrent
export function modifyFunction(container: BufferContainer): boolean {
  const array = new Int32Array(container.buffer);
  array[0] = 999;
  return true;
}

/**
 * Function to read and return buffer contents
 */
@Concurrent
export function readFunction(container: BufferContainer): number[] {
  const array = new Int32Array(container.buffer);
  return Array.from(array);
}


export declare class ArkTools {
  static forceFullGC(): void;
}

export function gc() {
  ArkTools.forceFullGC()
}



/**
 * Get current timestamp in milliseconds
 */
export function getCurrentTime(): number {
  return new Date().getTime();
}

/**
 * Memory snapshot information structure
 */
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

/**
 * Memory monitoring utility class adapted for ArkTS
 */
export class MemoryMonitor {
  private snapshots: MemorySnapshotInfo[] = [];
  private label: string;
  private referenceObjects: Array<Object> = [];

  constructor(label: string) {
    this.label = label;
  }

  /**
   * Take a memory snapshot
   */
  async takeSnapshot(description: string): Promise<MemorySnapshotInfo> {
    await gc();
    
    const testObject = new MemorySnapshotInfo(description);
    this.referenceObjects.push(testObject);
    
    const snapshot = new MemorySnapshotInfo(description);
    this.snapshots.push(snapshot);
    
    console.info(`Memory snapshot for ${this.label} (${description}): ${snapshot.heapEstimate}ms`);
    
    return snapshot;
  }
  
  /**
   * Get all snapshots taken so far
   */
  getSnapshots(): MemorySnapshotInfo[] {
    const result: MemorySnapshotInfo[] = [];
    for (let i = 0; i < this.snapshots.length; i++) {
      result.push(this.snapshots[i]);
    }
    return result;
  }
  
  /**
   * Compare first and last snapshots to check for memory growth
   */
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
  
  /**
   * Clear all snapshots
   */
  clear(): void {
    this.snapshots = [];
    this.referenceObjects = [];
  }
}

/**
 * Performs buffer operations for the SharedArrayBuffer performance test
 * Used in SharedArrayBufferTest2100 - Tests multi-threaded (10 threads) operations on SharedArrayBuffer 
 * Each thread performs 1000 iterations of buffer creation, typed array usage, and slice operations
 * 
 * @returns The sum of all processed array values across all iterations
 */
@Concurrent
export function performBufferOperations(): number {
  let threadSum: number = 0;
  for (let i = 0; i < 1000; i++) {
    const sab = new SharedArrayBuffer(64);
    const int32Array = new Int32Array(sab);
    for (let j = 0; j < int32Array.length; j++) {
      int32Array[j] = j;
    }
    
    let sum: number = 0;
    for (let j = 0; j < int32Array.length; j++) {
      sum += int32Array[j];
    }
    threadSum += sum;
    
    const sabSlice = sab.slice(0, 32);
    const checkByteLength = sabSlice.byteLength === 32;
    if (!checkByteLength) {
      threadSum -= 1;
    }
  }
  return threadSum;
} 