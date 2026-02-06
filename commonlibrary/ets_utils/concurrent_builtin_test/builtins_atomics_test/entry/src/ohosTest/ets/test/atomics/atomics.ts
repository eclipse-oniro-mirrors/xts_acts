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

// Async generator that performs atomic adds
export async function* atomicAddGenerator(values: number[], i32a: Int32Array): AsyncGenerator<number> {
  for (const value of values) {
    await new Promise(resolve => setTimeout(resolve, 10));
    const oldValue = Atomics.add(i32a, 0, value);
    yield oldValue;
  }
}
export async function* andGenerator90(arr: Int32Array, idx: number, masks: number[]) {
  for (const mask of masks) {
    await new Promise<void>(resolve => setTimeout(resolve, 2));
    const oldVal = Atomics.and(arr, idx, mask);
    yield { oldVal, newVal: arr[idx] };
  }
}
export async function atomicsAndTest090(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 40; // 0b101000

  // Async generator function for Atomics.and


  // Iterate generator and collect results
  const masks = [0b101111, 0b100000];
  const generator = andGenerator90(ia, 0, masks);
  const results: type90[] = [];

  for await (const res of generator) {
    results.push(res);
  }
  return results
}

export async function atomicsCompareExchangeTest067(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 100;

  // Async generator that yields compareExchange results
  async function* atomicGenerator(updates: [number, number][]) {
    for (const [expected, newValue] of updates) {
      yield new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.compareExchange(ia, 0, expected, newValue);
          resolve(oldValue);
        }, 3);
      });
    }
  }

  // Define update sequence
  const updates: [number, number][] = [[100, 110], [110, 120], [120, 130]];
  const generator = atomicGenerator(updates);
  const oldValues: number[] = [];

  // Consume generator
  for await (const oldVal of generator) {
    oldValues.push(oldVal);
  }
  return oldValues
}

export async function atomicsCompareExchangeTest082(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 10;

  // Async iterator: persists last expected value between yields
  async function* atomicUpdateIterator(updates: number[]): AsyncGenerator<number> {
    let lastExpected = ia[0]; // Persist state
    for (const newValue of updates) {
      yield new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.compareExchange(ia, 0, lastExpected, newValue);
          if (oldValue === lastExpected) {
            lastExpected = newValue; // Update persisted state on success
          }
          resolve(oldValue);
        }, 4);
      });
    }
  }

  // Define update sequence (depends on persisted state)
  const updates = [15, 20, 25];
  const iterator = atomicUpdateIterator(updates);
  const oldValues: number[] = [];

  // Consume iterator
  for await (const oldVal of iterator) {
    oldValues.push(oldVal);
  }
  return oldValues
}
export async function atomicsExchangeTest096(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 0;
  const stopValue = 25; // Stop when value reaches 25
  const oldValues: number[] = [];

  // Async iterator: stops when value reaches stopValue
  async function* autoStopIterator(step: number) {
    let current = ia[0];
    while (current < stopValue) {
      yield new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, current + step);
          oldValues.push(old);
          current += step;
          resolve(old);
        }, 3);
      });
    }
  }

  // Consume iterator (stops automatically)
  const iterator = autoStopIterator(10);
  for await (const _ of iterator) { /* No-op: track via oldValues */ }
  return oldValues
}
export async function atomicsExchangeTest078(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 10;
  const errorValues = new Set([20, 30]); // Values that trigger error
  const oldValues: number[] = [];
  let errorCount = 0;

  // Async iterator with per-iteration error handling
  async function* exchangeIterator(values: number[]) {
    for (const val of values) {
      yield new Promise<{ old: number; success: boolean }>((resolve) => {
        setTimeout(() => {
          if (errorValues.has(val)) {
            errorCount++;
            resolve({ old: ia[0], success: false }); // Error: skip exchange
            return;
          }
          const old = Atomics.exchange(ia, 0, val);
          oldValues.push(old);
          resolve({ old, success: true });
        }, 3);
      });
    }
  }

  // Define value sequence (includes error values)
  const values = [15, 20, 25, 30, 35];
  const iterator = exchangeIterator(values);

  // Consume iterator
  for await (const res of iterator) { /* No-op: results tracked via side effects */ }

  return oldValues
}
export async function atomicsExchangeTest063(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 0;

  // Async iterator: generates new values dynamically (current * 2)
  async function* dynamicValueGenerator(count: number) {
    let current = ia[0];
    for (let i = 0; i < count; i++) {
      current *= 2;
      yield new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, current);
          resolve(old);
        }, 3);
      });
    }
  }

  // Consume iterator (3 dynamic updates)
  const generator = dynamicValueGenerator(3);
  const oldValues: number[] = [];
  for await (const old of generator) {
    oldValues.push(old);
  }
  return oldValues
}
export async function atomicsExchangeTest054(){
  const sab = new SharedArrayBuffer(4);
  const ia = new Int32Array(sab);
  ia[0] = 10;

  // Async generator: yields old values after exchange
  async function* exchangeGenerator(newValues: number[]) {
    for (const val of newValues) {
      yield new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, val);
          resolve(old);
        }, 3);
      });
    }
  }

  // Define update sequence
  const newValues = [20, 30, 40];
  const generator = exchangeGenerator(newValues);
  const oldValues: number[] = [];

  // Consume generator
  for await (const old of generator) {
    oldValues.push(old);
  }

  return oldValues
}
export async function atomicsIsLockFreeTest088(){
  async function* lockFreeGeneratorWithErrorHandling(sizes: any[]) {
    for (const size of sizes) {
      try {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        // @ts-ignore: Allow non-number sizes
        const isFree = Atomics.isLockFree(size);
        yield { size, isFree, hasError: false };
      } catch (err) {
        yield { size, error: err, hasError: true };
      }
    }
  }

  const sizes = [1, 'invalid', 1];
  const generator = lockFreeGeneratorWithErrorHandling(sizes);
  const results: any[] = [];

  for await (const res of generator) {
    results.push(res);
  }

  return results
}
export async function atomicsIsLockFreeTest051(){
  async function* lockFreeGenerator(sizes: number[]) {
    for (const size of sizes) {
      await new Promise<void>(resolve => setTimeout(resolve, 2));
      yield { size, isFree: Atomics.isLockFree(size) };
    }
  }

  const sizes = [1, 1, 1];
  const generator = lockFreeGenerator(sizes);
  const results: { size: number, isFree: boolean }[] = [];

  for await (const res of generator) {
    results.push(res);
  }

  return results
}
export async function atomicsIsLockFreeTest077(){
  async function* lockFreeGeneratorWithEarlyReturn(sizes: number[], maxCalls: number) {
    let callCount = 0;
    for (const size of sizes) {
      if (callCount >= maxCalls) {
        return;
      } // Early return after max calls
      callCount++;
      await new Promise<void>(resolve => setTimeout(resolve, 2));
      yield { size, result: Atomics.isLockFree(size) };
    }
  }

  const sizes = [2, 2, 2, 2];
  const generator = lockFreeGeneratorWithEarlyReturn(sizes, 2);
  const results: { size: number, result: boolean }[] = [];

  for await (const res of generator) {
    results.push(res);
  }
  return results
}
export async function atomicsIsLockFreeTest067(){
  async function* validatedLockFreeGenerator(sizes: number[]) {
    for (const size of sizes) {
      await new Promise<void>(resolve => setTimeout(resolve, 2));
      const isFree = Atomics.isLockFree(size);
      yield {
        size,
        isFree,
        isValidSize: [1, 2, 4, 8].includes(size),
        resultIsValid: typeof isFree === 'boolean'
      };
    }
  }

  const sizes = [4, 4, 5]; // 2 valid, 1 invalid
  const generator = validatedLockFreeGenerator(sizes);
  const results: any[] = [];

  for await (const res of generator) {
    results.push(res);
  }
  return results
}
export async function atomicsIsLockFreeTest099(){
  async function* lockFreeGenerator(sizes: number[]) {
    for (const size of sizes) {
      await new Promise<void>(resolve => setTimeout(resolve, 2));
      yield { size, isFree: Atomics.isLockFree(size) };
    }
  }

  const sizes = [4, 5, 4, 6, 4];
  const generator = lockFreeGenerator(sizes);
  const filteredResults: { size: number, isFree: boolean }[] = [];

  for await (const res of generator) {
    if (res.size === 4) {
      filteredResults.push(res);
    } // Filter to only 4-byte results
  }
  return filteredResults
}
export type typeOld = { old: BigInt; new: BigInt }
export type type56 = { time: number; old: number; new: number; val: number }
export type type63 = { old: number; success: boolean }
export type type71 = { old: bigint; success: boolean }
export type type90 = { oldVal: number, newVal: number }
export type type69 = { idx: number, res: number }
export type type73 = { oldVal: number, newVal: number, mask: number }
export type type96 = { time: number; oldValue: number; success: boolean }
export type typeCom90 ={ success: boolean; oldValue: number }
export type type97 ={ old: number; new: number; success: boolean }
export type type86 ={ old: number; new: number; time: number }
export type type94 ={ success: boolean; reason?: string }
export type type41 ={ size: number, isFree: boolean, isValidSize: boolean }
export type type55 ={ type: string, result: boolean|number}
export type type88 ={ hasError: boolean, isFree: boolean}
export type type51 ={ size: number, isFree: boolean }
export type type67 ={ resultIsValid: boolean, isFree: boolean , isValidSize: boolean }
export type type77 ={ size: number, result: boolean }
export type typeLock71 ={ valid: boolean, result?: boolean }
export type typeLock100 ={ size: number, isFree: boolean, isValid: boolean }
export type typeLock91 ={ delay: number, result: boolean }
export type typeLock74 ={ result:boolean, callCount:number, size:number}
export type typeLoad85 ={ [key: number]: number }
export type typeLoad80 ={ loaded: boolean, value: number }
export type typeLoad95 ={ id1: number, id2: number }
export type typeLoad88 ={ value: number, inRange: boolean }
export type typeNotify96 ={ valid0: boolean; valid1: boolean }
export type typeNotify78 ={ time: number; count: number }
export type typeOr75 ={ old: number; success: boolean }
export type typeOr87 ={ oldValues: number[], newValues: number[] }
export type typeOr80 ={ old: number; success: boolean }
export type typeOr60 ={ time: number; old: number; new: number }
export type typeOr52 ={ old: bigint; new: bigint }
export type typeOr97 ={ mask: number; timestamp: number }
export type typeOr26 ={idx: number, val: number}
export type typeStore85 ={ [key: number]: number }
export type typeStore95 ={ id1: bigint, id2: bigint }
export type typeStore88 ={ storedVal: number, inRange: boolean }
export type typeStore80 ={ stored: boolean, value: number }
export type typeSub76 ={ old: number; success: boolean }
export type typeSub83 ={ oldValues: number[], newValues: number[] }
export type typeSub71 ={ old: bigint; success: boolean }
export type typeSub63 ={ old: number; success: boolean }
export type typeSub98 ={ before: number; after: number; val: number }
export type typeSub93 ={ val: number; timestamp: number }
export type typeSub56 ={ time: number; old: number; new: number }
export type typeSub46 ={  oldValue:bigint, newValue: bigint }
export type typeSub25 ={idx: number, val: number}
export type typeXor93 ={ val: number; timestamp: number }
export type typeXor98 ={ before: number; after: number; val: number }
export type typeWait01 ={ ta:Int32Array, index: number, value: number }
export type typeWait04 ={ ta:BigInt64Array, index: number, value: bigint }
export type typeWait02 ={ ta:Int32Array, index: number }
export type typeWait05 ={ ta:BigInt64Array, index: number }
export type typeWait03 ={ ta:Int32Array, index: number, value: number ,timeout:number}
export type typeWait06 ={ ta:BigInt64Array, index: number, value: bigint ,timeout:number}
