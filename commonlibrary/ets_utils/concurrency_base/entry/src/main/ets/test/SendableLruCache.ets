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

import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';

@Sendable
export class ContainsLruCache {
  cache1: ArkTSUtils.SendableLruCache<number | string, number | string> =
    new ArkTSUtils.SendableLruCache<number | string, number | string>();
  static cache2: ArkTSUtils.SendableLruCache<number | string, number | string> =
    new ArkTSUtils.SendableLruCache<number | string, number | string>();
  cache3: ArkTSUtils.SendableLruCache<number | string, number | string>;

  constructor() {
    this.cache3 = new ArkTSUtils.SendableLruCache<number | string, number | string>();
  }

  TestCache1(): boolean {
    let result: boolean = false
    this.cache1.put(1, 2)
    this.cache1.put(3, 10)
    this.cache1.put(5, 15)
    this.cache1.put('abc', 20)
    this.cache1.get(3)
    this.cache1.remove(5)
    this.cache1.contains(3)
    this.cache1.get(1)
    this.cache1.contains('abc')
    let i = 0;
    let arr = new Array<number | string>();
    for (let entry of this.cache1.entries()) {
      arr[i] = entry[0];
      i++;
      arr[i] = entry[1];
      i++;
    }
    if ((arr[1] === 10) && (arr[3] === 2) && (arr[5] === 20)) {
      result = true
    }
    return result
  }

  TestCache2(): boolean {
    let result: boolean = false
    ContainsLruCache.cache2.clear()
    ContainsLruCache.cache2.put(1, 2)
    ContainsLruCache.cache2.put(3, 10)
    ContainsLruCache.cache2.put(5, 15)
    ContainsLruCache.cache2.put('abc', 20)
    ContainsLruCache.cache2.get(3)
    ContainsLruCache.cache2.remove(5)
    ContainsLruCache.cache2.contains(3)
    ContainsLruCache.cache2.get(1)
    ContainsLruCache.cache2.contains('abc')
    let i = 0;
    let arr = new Array<number | string>();
    for (let entry of ContainsLruCache.cache2.entries()) {
      arr[i] = entry[0];
      i++;
      arr[i] = entry[1];
      i++;
    }
    if ((arr[1] === 10) && (arr[3] === 2) && (arr[5] === 20)) {
      result = true
    }
    return result
  }

  TestCache3(): boolean {
    let result: boolean = false
    this.cache3.put(1, 2)
    this.cache3.put(3, 10)
    this.cache3.put(5, 15)
    this.cache3.put('abc', 20)
    this.cache3.get(3)
    this.cache3.remove(5)
    this.cache3.contains(3)
    this.cache3.get(1)
    this.cache3.contains('abc')
    let i = 0;
    let arr = new Array<number | string>();
    for (let entry of this.cache3.entries()) {
      arr[i] = entry[0];
      i++;
      arr[i] = entry[1];
      i++;
    }
    if ((arr[1] === 10) && (arr[3] === 2) && (arr[5] === 20)) {
      result = true
    }
    return result
  }
}

@Sendable
export class ChildLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
  constructor() {
    super()
  }

  public toString(): string {
    return "Test ChildLruCache";
  }

  public contains(key: K): boolean {
    if (typeof (key as Object) === 'undefined') {
      let error = new Error('ChildLruCache input type error.');
      throw error;
    }
    let flag: boolean = false;
    let result = this.keys()
    if (result.indexOf(key) !== -1) {
      flag = true
    }
    return flag;
  }
}

declare class ArkTools {
  static forceFullGC(): void
}

export async function testWorkerReceiveCache001(): Promise<boolean> {
  const workerInstance = new worker.ThreadWorker('entry/ets/workers/workerReceiveCache.ets');
  // only new cache
  let cache = new ArkTSUtils.SendableLruCache<number, number>();
  workerInstance.postMessageWithSharedSendable(cache);
  return new Promise<boolean>((resolve, reject) => {
    workerInstance.onmessage = (e: MessageEvents): void => {
      ArkTools.forceFullGC()
      cache.put(6, 9)
      cache.contains(6)
      let len = cache.length
      if (len === 3) {
        resolve(true)
      } else {
        reject(false)
      }
      workerInstance.terminate();
    }
  });
}

export async function testWorkerReceiveCache002(): Promise<boolean> {
  const workerInstance = new worker.ThreadWorker('entry/ets/workers/workerReceiveCache.ets');
  // initial cache after new cache
  let cache = new ArkTSUtils.SendableLruCache<number, number>();
  cache.put(5, 6)
  workerInstance.postMessageWithSharedSendable(cache);
  return new Promise<boolean>((resolve, reject) => {
    workerInstance.onmessage = (e: MessageEvents): void => {
      ArkTools.forceFullGC()
      cache.put(6, 9)
      cache.contains(2)
      let len = cache.length
      if (len === 4) {
        resolve(true)
      } else {
        reject(false)
      }
      workerInstance.terminate();
    }
  });
}

export async function testWorkerSendCache001(): Promise<boolean> {
  const workerInstance = new worker.ThreadWorker('entry/ets/workers/workerSendCache.ets');
  workerInstance.postMessageWithSharedSendable('start');
  return new Promise<boolean>((resolve, reject) => {
    workerInstance.onmessage = (e: MessageEvents): void => {
      ArkTools.forceFullGC()
      let cache = e.data as ArkTSUtils.SendableLruCache<number, number>;
      cache.put(4, 5)
      let len = cache.length
      if (len === 3) {
        resolve(true)
      } else {
        reject(false)
      }
      workerInstance.postMessage('end');
      workerInstance.terminate();
    }
  });
}

@Concurrent
async function testNotCreateCache(cache: ArkTSUtils.SendableLruCache<number, number>, lock: ArkTSUtils.locks.AsyncLock,
  initialKey: number) {
  await lock.lockAsync(() => {
    cache.put(initialKey, initialKey + 1)
  })
}

export async function testTaskPoolCreateCacheInMainThread001(): Promise<boolean> {
  let cache = new ArkTSUtils.SendableLruCache<number, number>();
  let lock = new ArkTSUtils.locks.AsyncLock()
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(testNotCreateCache, cache, lock, 10); // 10: test number
  taskGroup.addTask(testNotCreateCache, cache, lock, 20); // 20: test number
  taskGroup.addTask(testNotCreateCache, cache, lock, 30); // 30: test number
  let result: boolean = false;
  try {
    await taskpool.execute(taskGroup)
    ArkTools.forceFullGC()
    cache.put(4, 5)
    let len = cache.length
    if (len === 4) {
      result = true
    }
  } catch (error) {
    console.log(`testSendableLRUCacheTaskPool001 catchError ${JSON.stringify(error)}}`);
  }
  return result
}

export async function testTaskPoolCreateCacheInMainThread002(): Promise<boolean> {
  let cache = new ArkTSUtils.SendableLruCache<number, number>();
  let lock = new ArkTSUtils.locks.AsyncLock()
  cache.put(40, 45)
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(testNotCreateCache, cache, lock, 10); // 10: test number
  taskGroup.addTask(testNotCreateCache, cache, lock, 20); // 20: test number
  taskGroup.addTask(testNotCreateCache, cache, lock, 30); // 30: test number
  let result: boolean = false;
  try {
    await taskpool.execute(taskGroup)
    ArkTools.forceFullGC()
    cache.put(4, 5)
    let len = cache.length
    if (len === 5) {
      result = true
    }
  } catch (error) {
    console.log(`testSendableLRUCacheTaskPool001 catchError ${JSON.stringify(error)}}`);
  }
  return result
}

@Concurrent
function testCreateCache(initialKey: number): ArkTSUtils.SendableLruCache<number, number> {
  let cache = new ArkTSUtils.SendableLruCache<number, number>();
  cache.put(initialKey, initialKey + 1)
  return cache
}

export async function testTaskPoolCreateCacheInTaskThread001(): Promise<boolean> {
  let task: taskpool.Task = new taskpool.Task(testCreateCache, 100); // 100: test number
  return taskpool.execute(task, taskpool.Priority.LOW).then((value: Object) => {
    ArkTools.forceFullGC()
    let cache = value as ArkTSUtils.SendableLruCache<number, number>;
    cache.put(4, 5)
    let len = cache.length
    if ((cache.contains(100)) && (cache.length === 2)) {
      return true
    } else {
      return false
    }
  });
}