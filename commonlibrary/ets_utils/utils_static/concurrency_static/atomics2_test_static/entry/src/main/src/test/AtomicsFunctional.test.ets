'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import sleep from './Util.test';

const FLOAT_DELTA: float = 0.00001f;
const DOUBLE_DELTA: double = 1e-10;
const EA_WORKER_BATCH_SIZE: int = 8;
const TASKPOOL_BATCH_SIZE: int = 32;

const LONG_ZERO: long = (0).toLong();
const LONG_ONE: long = (1).toLong();
const LONG_HUNDRED: long = (100).toLong();
const LONG_FIVE_HUNDRED: long = (500).toLong();
const LONG_THOUSAND: long = (1000).toLong();
const LONG_MILLION: long = (1000000).toLong();
const LONG_HUNDRED_THOUSAND: long = (100000).toLong();
const LONG_255: long = (255).toLong();
const LONG_999: long = (999).toLong();
const LONG_1050: long = (1050).toLong();
const LONG_SAFE_MINUS_ONE: long = 9007199254740990;
const LONG_SAFE_MAX: long = 9007199254740991;

class RefIdValue {
  public id: int;

  constructor(id: int) {
    this.id = id;
  }
}

function createRefValue(id: int): RefIdValue {
  return new RefIdValue(id);
}

function createRefValues(count: int): RefIdValue[] {
  const values: RefIdValue[] = new Array<RefIdValue>();
  for (let i = 0; i < count; i++) {
    values.push(createRefValue(i));
  }
  return values;
}

function createCharValues(): char[] {
  return [c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J'];
}

function createFloatValues(): float[] {
  return [1.1f, 2.2f, 3.3f, 4.4f, 5.5f, 6.6f, 7.7f, 8.8f, 9.9f, 10.1f];
}

function createDoubleValues(): double[] {
  return [1.01, 2.02, 3.03, 4.04, 5.05, 6.06, 7.07, 8.08, 9.09, 10.1];
}

function containsRefValue(values: RefIdValue[], target: RefIdValue): boolean {
  for (let i = 0; i < values.length; i++) {
    if (values[i] === target) {
      return true;
    }
  }
  return false;
}

function containsCharValue(values: char[], target: char): boolean {
  for (let i = 0; i < values.length; i++) {
    if (values[i] == target) {
      return true;
    }
  }
  return false;
}

function isNearFloat(actual: float, expected: float, delta: float = FLOAT_DELTA): boolean {
  return actual >= expected - delta && actual <= expected + delta;
}

function isNearDouble(actual: double, expected: double, delta: double = DOUBLE_DELTA): boolean {
  return actual >= expected - delta && actual <= expected + delta;
}

function waitUntil(counter: AtomicInt, expected: int): void {
  while (counter.load() < expected) {
  }
}

async function runTaskpoolResults(count: int, work: Function): Promise<Any[]> {
  const results: Any[] = new Array<Any>();

  for (let start = 0; start < count; start += TASKPOOL_BATCH_SIZE) {
    const tasks: Promise<Any>[] = new Array<Promise<Any>>();
    let batchEnd = start + TASKPOOL_BATCH_SIZE;
    if (batchEnd > count) {
      batchEnd = count;
    }

    for (let i = start; i < batchEnd; i++) {
      tasks.push(taskpool.execute(work, i));
    }

    const batchResults = await Promise.all(tasks) as Any[];
    for (let i = 0; i < batchResults.length; i++) {
      results.push(batchResults[i]);
    }
  }

  return results;
}

async function runEAWorkers<R>(count: int, work: Function): Promise<R[]> {
  const results: R[] = new Array<R>();

  for (let start = 0; start < count; start += EA_WORKER_BATCH_SIZE) {
    const workers: EAWorker[] = new Array<EAWorker>();
    const promises: Promise<R>[] = new Array<Promise<R>>();
    let batchEnd = start + EA_WORKER_BATCH_SIZE;
    if (batchEnd > count) {
      batchEnd = count;
    }

    for (let i = start; i < batchEnd; i++) {
      const worker = new EAWorker();
      workers.push(worker);
      worker.start();
      promises.push(worker.run<R>(work, i));
    }

    for (let i = 0; i < promises.length; i++) {
      results.push(await promises[i] as R);
    }

    for (let i = 0; i < workers.length; i++) {
      workers[i].quit();
    }
  }

  return results;
}

export default function atomicsFunctionalTest(): void {
  describe('atomicsFunctionalTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicsFunctionalTest001
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0001
     * @tc.desc   Verify FR-AR-001 store+load returns stored value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      atom.store(123);
      expect(atom.load()).assertEqual(123);
    });

    /**
     * @tc.name   atomicsFunctionalTest002
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0002
     * @tc.desc   Verify FR-AR-002 store+exchange returns previous value and updates current value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      atom.store(10);
      const oldValue = atom.exchange(20);
      expect(oldValue).assertEqual(10);
      expect(atom.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicsFunctionalTest003
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0003
     * @tc.desc   Verify FR-AR-003 store+compareAndSwap returns old value under current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      atom.store(10);
      const oldValue = atom.compareAndSwap(10, 30);
      expect(oldValue).assertEqual(10);
      expect(atom.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicsFunctionalTest004
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0004
     * @tc.desc   Verify FR-AR-004 compareAndSwap followed by load reflects current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(100);
      const oldValue = atom.compareAndSwap(100, 200);
      expect(oldValue).assertEqual(100);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest005
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0005
     * @tc.desc   Verify FR-AR-005 exchange+compareAndSwap+load sequence keeps stepwise correctness under current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(1);
      const exchanged = atom.exchange(2);
      expect(exchanged).assertEqual(1);
      const casOld = atom.compareAndSwap(2, 3);
      expect(casOld).assertEqual(2);
      expect(atom.load()).assertEqual(2);
    });

    /**
     * @tc.name   atomicsFunctionalTest006
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0006
     * @tc.desc   Verify FR-AR-006 100 rounds of store+load always read latest object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<RefIdValue>(createRefValue(-1));
      for (let i = 0; i < 100; i++) {
        const value = createRefValue(i);
        atom.store(value);
        expect(atom.load() === value).assertTrue();
      }
    });

    /**
     * @tc.name   atomicsFunctionalTest007
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0007
     * @tc.desc   Verify FR-AR-007 compareAndSwap results under current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(10);
      const failOld = atom.compareAndSwap(0, 20);
      expect(failOld).assertEqual(10);
      expect(atom.load()).assertEqual(10);

      const successOld = atom.compareAndSwap(10, 20);
      expect(successOld).assertEqual(10);
      expect(atom.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicsFunctionalTest008
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0008
     * @tc.desc   Verify FR-AR-008 mixed store/load/compareAndSwap/exchange/store sequence under current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      atom.store(5);
      expect(atom.load()).assertEqual(5);
      expect(atom.compareAndSwap(5, 6)).assertEqual(5);
      expect(atom.exchange(7)).assertEqual(5);
      expect(atom.load()).assertEqual(7);
      atom.store(8);
      expect(atom.load()).assertEqual(8);
    });

    /**
     * @tc.name   atomicsFunctionalTest009
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0009
     * @tc.desc   Verify FR-AR-MT-001 TaskPool concurrent store keeps atomicity and final value equals last store value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const values = createRefValues(10);
      const atom = new AtomicReference<RefIdValue>(createRefValue(-1));
      const counter = new AtomicInt(0);

      await runTaskpoolResults(10, (index: int): int => {
        if (index < 9) {
          atom.store(values[index]);
          counter.fetchAdd(1);
        } else {
          waitUntil(counter, 9);
          atom.store(values[index]);
        }
        return 0;
      });

      expect(atom.load() === values[9]).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest010
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0010
     * @tc.desc   Verify FR-AR-MT-002 TaskPool concurrent load reads consistent current value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const value = createRefValue(100);
      const atom = new AtomicReference<RefIdValue>(value);
      const results = await runTaskpoolResults(10, (): RefIdValue => atom.load());

      for (let i = 0; i < results.length; i++) {
        const result: RefIdValue = results[i] as RefIdValue;
        expect(result === value).assertTrue();
      }
    });

    /**
     * @tc.name   atomicsFunctionalTest011
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0011
     * @tc.desc   Verify FR-AR-MT-003 TaskPool concurrent exchange completes atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const initial = createRefValue(-1);
      const values = createRefValues(10);
      const atom = new AtomicReference<RefIdValue>(initial);
      const results = await runTaskpoolResults(10, (index: int): RefIdValue => atom.exchange(values[index]));

      let initialCount = 0;
      for (let i = 0; i < results.length; i++) {
        const oldValue: RefIdValue = results[i] as RefIdValue;
        expect(containsRefValue(values, oldValue) || oldValue === initial).assertTrue();
        if (oldValue === initial) {
          initialCount++;
        }
      }

      expect(initialCount).assertEqual(1);
      expect(containsRefValue(values, atom.load())).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest012
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0012
     * @tc.desc   Verify FR-AR-MT-004 TaskPool concurrent compareAndSwap reflects current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      const results = await runTaskpoolResults(10, (index: int): int => atom.compareAndSwap(0, index + 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: int = results[i] as int;
        if (result == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(10);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicsFunctionalTest013
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0013
     * @tc.desc   Verify FR-AR-MT-005 TaskPool mixed store/load/compareAndSwap keeps consistent final state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(100);
      const results = await runTaskpoolResults(10, (index: int): int => {
        if (index % 3 == 0) {
          atom.store(100);
          return atom.load();
        }
        if (index % 3 == 1) {
          return atom.load();
        }
        return atom.compareAndSwap(-1, 200);
      });

      for (let i = 0; i < results.length; i++) {
        const result: int = results[i] as int;
        expect(result).assertEqual(100);
      }
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest014
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0014
     * @tc.desc   Verify FR-AR-MT-006 TaskPool competing compareAndSwap reflects current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      const results = await runTaskpoolResults(100, (): int => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: int = results[i] as int;
        if (result == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(100);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicsFunctionalTest015
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0015
     * @tc.desc   Verify FR-AR-MT-007 TaskPool producer-consumer model lets consumers read producer-written object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const producerValueA = createRefValue(1);
      const producerValueB = createRefValue(2);
      const atom = new AtomicReference<RefIdValue>(producerValueA);
      const producedCount = new AtomicInt(0);

      const producerTasks: Promise<Any>[] = new Array<Promise<Any>>();
      producerTasks.push(taskpool.execute((): int => {
        atom.store(producerValueA);
        producedCount.fetchAdd(1);
        return 0;
      }));
      producerTasks.push(taskpool.execute((): int => {
        atom.store(producerValueB);
        producedCount.fetchAdd(1);
        return 0;
      }));

      const consumerTasks: Promise<Any>[] = new Array<Promise<Any>>();
      for (let i = 0; i < 2; i++) {
        consumerTasks.push(taskpool.execute((): RefIdValue => {
          while (producedCount.load() < 1) {
          }
          return atom.load();
        }));
      }

      await Promise.all(producerTasks);
      const consumerResults = await Promise.all(consumerTasks) as Any[];

      for (let i = 0; i < consumerResults.length; i++) {
        const result: RefIdValue = consumerResults[i] as RefIdValue;
        expect(result === producerValueA || result === producerValueB).assertTrue();
      }
      expect(atom.load() === producerValueA || atom.load() === producerValueB).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest016
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0016
     * @tc.desc   Verify FR-AR-EA-001 EAWorker concurrent store keeps atomicity and final value equals last store value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const values = createRefValues(10);
      const atom = new AtomicReference<RefIdValue>(createRefValue(-1));
      const counter = new AtomicInt(0);

      await runEAWorkers<int>(10, (index: int): int => {
        if (index < 9) {
          atom.store(values[index]);
          counter.fetchAdd(1);
        } else {
          waitUntil(counter, 9);
          atom.store(values[index]);
        }
        return 0;
      });

      expect(atom.load() === values[9]).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest017
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0017
     * @tc.desc   Verify FR-AR-EA-002 EAWorker concurrent compareAndSwap reflects current boxed-reference semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(0);
      const results = await runEAWorkers<int>(10, (index: int): int => atom.compareAndSwap(0, index + 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i] == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(10);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicsFunctionalTest018
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0018
     * @tc.desc   Verify FR-AR-EA-003 EAWorker mixed store/load/exchange/compareAndSwap keeps final state consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(200);
      const results = await runEAWorkers<int>(10, (index: int): int => {
        if (index % 4 == 0) {
          atom.store(200);
          return atom.load();
        }
        if (index % 4 == 1) {
          return atom.load();
        }
        if (index % 4 == 2) {
          return atom.exchange(200);
        }
        return atom.compareAndSwap(-1, 300);
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(200);
      }
      expect(atom.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicsFunctionalTest019
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0019
     * @tc.desc   Verify FR-AR-EA-004 EAWorker all interfaces mixed operations keep final state consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicReference<int>(500);
      const results = await runEAWorkers<int>(10, (index: int): int => {
        if (index == 0 || index == 1) {
          return atom.load();
        }
        if (index == 2 || index == 3) {
          atom.store(500);
          return atom.load();
        }
        if (index == 4 || index == 5) {
          return atom.exchange(500);
        }
        return atom.compareAndSwap(-1, 999);
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(500);
      }
      expect(atom.load()).assertEqual(500);
    });

    /**
     * @tc.name   atomicsFunctionalTest020
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0020
     * @tc.desc   Verify FR-AI-001 store+load returns 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      atom.store(100);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest021
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0021
     * @tc.desc   Verify FR-AI-002 fetchAdd+fetchSub results in net increase of 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(100);
      atom.fetchAdd(10);
      atom.fetchSub(5);
      expect(atom.load()).assertEqual(105);
    });

    /**
     * @tc.name   atomicsFunctionalTest022
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0022
     * @tc.desc   Verify FR-AI-003 fetchAnd+fetchOr keeps final value 0xF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0xF);
      atom.fetchAnd(0xA);
      atom.fetchOr(0x5);
      expect(atom.load()).assertEqual(0xF);
    });

    /**
     * @tc.name   atomicsFunctionalTest023
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0023
     * @tc.desc   Verify FR-AI-004 fetchXor twice restores original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0xF);
      atom.fetchXor(0x10);
      atom.fetchXor(0x10);
      expect(atom.load()).assertEqual(0xF);
    });

    /**
     * @tc.name   atomicsFunctionalTest024
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0024
     * @tc.desc   Verify FR-AI-005 compareAndSwap followed by load returns updated value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(42);
      expect(atom.compareAndSwap(42, 84)).assertEqual(42);
      expect(atom.load()).assertEqual(84);
    });

    /**
     * @tc.name   atomicsFunctionalTest025
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0025
     * @tc.desc   Verify FR-AI-006 exchange+fetchAdd sequence returns old value and final value 150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(10);
      expect(atom.exchange(100)).assertEqual(10);
      expect(atom.fetchAdd(50)).assertEqual(100);
      expect(atom.load()).assertEqual(150);
    });

    /**
     * @tc.name   atomicsFunctionalTest026
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0026
     * @tc.desc   Verify FR-AI-007 arithmetic sequence fetchAdd->fetchSub->fetchAdd yields net increase 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      atom.fetchAdd(10);
      atom.fetchSub(5);
      atom.fetchAdd(20);
      expect(atom.load()).assertEqual(25);
    });

    /**
     * @tc.name   atomicsFunctionalTest027
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0027
     * @tc.desc   Verify FR-AI-008 bitwise sequence fetchAnd->fetchOr->fetchXor ends at fetchAnd result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0x3FF);
      atom.fetchAnd(0xFF);
      atom.fetchOr(0x100);
      atom.fetchXor(0x100);
      expect(atom.load()).assertEqual(0xFF);
    });

    /**
     * @tc.name   atomicsFunctionalTest028
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0028
     * @tc.desc   Verify FR-AI-MT-001 TaskPool concurrent fetchAdd(1) with 100 threads increases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      await runTaskpoolResults(100, (): int => atom.fetchAdd(1));
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest029
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0029
     * @tc.desc   Verify FR-AI-MT-002 TaskPool concurrent fetchSub(1) with 100 threads decreases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      await runTaskpoolResults(100, (): int => atom.fetchSub(1));
      expect(atom.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicsFunctionalTest030
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0030
     * @tc.desc   Verify FR-AI-MT-003 TaskPool mixed fetchAdd/fetchSub reaches expected net increase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      const results = await runTaskpoolResults(100, (index: int): int => {
        if (index < 75) {
          return atom.fetchAdd(1);
        }
        return atom.fetchSub(1);
      });
      expect(results.length).assertEqual(100);
      expect(atom.load()).assertEqual(50);
    });

    /**
     * @tc.name   atomicsFunctionalTest031
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0031
     * @tc.desc   Verify FR-AI-MT-004 TaskPool competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      const results = await runTaskpoolResults(100, (): int => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: int = results[i] as int;
        if (result == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsFunctionalTest032
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0032
     * @tc.desc   Verify FR-AI-MT-005 TaskPool mixed add/sub/compareAndSwap/exchange operations keep final value correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(100);
      const results = await runTaskpoolResults(100, (index: int): int => {
        if (index % 4 == 0) {
          return atom.fetchAdd(0);
        }
        if (index % 4 == 1) {
          return atom.fetchSub(0);
        }
        if (index % 4 == 2) {
          return atom.compareAndSwap(-1, 200);
        }
        return atom.exchange(100);
      });

      for (let i = 0; i < results.length; i++) {
        const result: int = results[i] as int;
        expect(result).assertEqual(100);
      }
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest033
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0033
     * @tc.desc   Verify FR-AI-MT-006 TaskPool mixed fetchAnd/fetchOr/fetchXor operations complete atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0xFF);
      await runTaskpoolResults(10, (): int => atom.fetchAnd(0xF0));
      expect(atom.load()).assertEqual(0xF0);
      await runTaskpoolResults(10, (): int => atom.fetchOr(0x0F));
      expect(atom.load()).assertEqual(0xFF);
      await runTaskpoolResults(10, (): int => atom.fetchXor(0x0F));
      expect(atom.load()).assertEqual(0xFF);
    });

    /**
     * @tc.name   atomicsFunctionalTest034
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0034
     * @tc.desc   Verify FR-AI-MT-007 TaskPool mixed store+load allows readers to observe latest stored value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      const earlyStoresDone = new AtomicInt(0);
      const finalStoreDone = new AtomicBoolean(false);
      const tasks: Promise<Any>[] = new Array<Promise<Any>>();

      for (let i = 1; i <= 4; i++) {
        tasks.push(taskpool.execute((value: int): int => {
          atom.store(value);
          earlyStoresDone.fetchAdd(1);
          return atom.load();
        }, i));
      }

      tasks.push(taskpool.execute((): int => {
        waitUntil(earlyStoresDone, 4);
        atom.store(5);
        finalStoreDone.store(true);
        return atom.load();
      }));

      for (let i = 0; i < 5; i++) {
        tasks.push(taskpool.execute((): int => {
          while (!finalStoreDone.load()) {
          }
          return atom.load();
        }));
      }

      const results = await Promise.all(tasks) as Any[];

      for (let i = 5; i < results.length; i++) {
        const result: int = results[i] as int;
        expect(result).assertEqual(5);
      }
      expect(atom.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicsFunctionalTest035
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0035
     * @tc.desc   Verify FR-AI-EA-001 EAWorker concurrent fetchAdd(1) with 100 workers increases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      await runEAWorkers<int>(100, (): int => atom.fetchAdd(1));
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest036
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0036
     * @tc.desc   Verify FR-AI-EA-002 EAWorker competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(0);
      const results = await runEAWorkers<int>(100, (): int => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i] == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsFunctionalTest037
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0037
     * @tc.desc   Verify FR-AI-EA-003 EAWorker mixed add/sub/compareAndSwap/exchange operations complete atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(300);
      const results = await runEAWorkers<int>(100, (index: int): int => {
        if (index % 4 == 0) {
          return atom.fetchAdd(0);
        }
        if (index % 4 == 1) {
          return atom.fetchSub(0);
        }
        if (index % 4 == 2) {
          return atom.compareAndSwap(-1, 500);
        }
        return atom.exchange(300);
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(300);
      }
      expect(atom.load()).assertEqual(300);
    });

    /**
     * @tc.name   atomicsFunctionalTest038
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0038
     * @tc.desc   Verify FR-AI-EA-004 EAWorker all interfaces mixed operations complete atomically with correct final value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicInt(255);
      const results = await runEAWorkers<int>(100, (index: int): int => {
        switch (index % 9) {
          case 0:
            return atom.load();
          case 1:
            atom.store(255);
            return atom.load();
          case 2:
            return atom.exchange(255);
          case 3:
            return atom.compareAndSwap(-1, 999);
          case 4:
            return atom.fetchAdd(0);
          case 5:
            return atom.fetchSub(0);
          case 6:
            return atom.fetchAnd(-1);
          case 7:
            return atom.fetchOr(0);
          default:
            return atom.fetchXor(0);
        }
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(255);
      }
      expect(atom.load()).assertEqual(255);
    });

    /**
     * @tc.name   atomicsFunctionalTest039
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0039
     * @tc.desc   Verify FR-AL-001 store+load returns 1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_ZERO);
      atom.store(LONG_MILLION);
      expect(atom.load()).assertEqual(LONG_MILLION);
    });

    /**
     * @tc.name   atomicsFunctionalTest040
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0040
     * @tc.desc   Verify FR-AL-002 fetchAdd+fetchSub results in net increase of 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_MILLION);
      atom.fetchAdd(LONG_THOUSAND);
      atom.fetchSub(LONG_FIVE_HUNDRED);
      expect(atom.load()).assertEqual((1000500).toLong());
    });

    /**
     * @tc.name   atomicsFunctionalTest041
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0041
     * @tc.desc   Verify FR-AL-003 large-number compareAndSwap succeeds and returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_SAFE_MINUS_ONE);
      expect(atom.compareAndSwap(LONG_SAFE_MINUS_ONE, LONG_SAFE_MAX)).assertEqual(LONG_SAFE_MINUS_ONE);
      expect(atom.load()).assertEqual(LONG_SAFE_MAX);
    });

    /**
     * @tc.name   atomicsFunctionalTest042
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0042
     * @tc.desc   Verify FR-AL-004 mixed arithmetic sequence fetchAdd->fetchSub->fetchAdd yields net increase 1050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_ZERO);
      atom.fetchAdd(LONG_HUNDRED);
      atom.fetchSub((50).toLong());
      atom.fetchAdd(LONG_THOUSAND);
      expect(atom.load()).assertEqual(LONG_1050);
    });

    /**
     * @tc.name   atomicsFunctionalTest043
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0043
     * @tc.desc   Verify FR-AL-MT-001 TaskPool concurrent fetchAdd(100) with 1000 threads increases value by 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_ZERO);
      await runTaskpoolResults(100, (): long => atom.fetchAdd(LONG_HUNDRED));
      expect(atom.load()).assertEqual(10000);
    });

    /**
     * @tc.name   atomicsFunctionalTest044
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0044
     * @tc.desc   Verify FR-AL-MT-002 TaskPool competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_ZERO);
      const results = await runTaskpoolResults(100, (): long => atom.compareAndSwap(LONG_ZERO, LONG_ONE));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: long = results[i] as long;
        if (result == LONG_ZERO) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(LONG_ONE);
    });

    /**
     * @tc.name   atomicsFunctionalTest045
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0045
     * @tc.desc   Verify FR-AL-MT-003 TaskPool mixed add/sub/compareAndSwap/exchange operations complete atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_THOUSAND);
      const results = await runTaskpoolResults(100, (index: int): long => {
        if (index % 4 == 0) {
          return atom.fetchAdd(LONG_ZERO);
        }
        if (index % 4 == 1) {
          return atom.fetchSub(LONG_ZERO);
        }
        if (index % 4 == 2) {
          return atom.compareAndSwap((-1).toLong(), LONG_ZERO);
        }
        return atom.exchange(LONG_THOUSAND);
      });

      for (let i = 0; i < results.length; i++) {
        const result: long = results[i] as long;
        expect(result).assertEqual(LONG_THOUSAND);
      }
      expect(atom.load()).assertEqual(LONG_THOUSAND);
    });

    /**
     * @tc.name   atomicsFunctionalTest046
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0046
     * @tc.desc   Verify FR-AL-EA-001 EAWorker concurrent fetchAdd(100) with 1000 workers increases value by 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_ZERO);
      await runEAWorkers<long>(100, (): long => atom.fetchAdd(LONG_HUNDRED));
      expect(atom.load()).assertEqual(10000);
    });

    /**
     * @tc.name   atomicsFunctionalTest047
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0047
     * @tc.desc   Verify FR-AL-EA-002 EAWorker competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_ZERO);
      const results = await runEAWorkers<long>(100, (): long => atom.compareAndSwap(LONG_ZERO, LONG_ONE));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i] == LONG_ZERO) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(LONG_ONE);
    });

    /**
     * @tc.name   atomicsFunctionalTest048
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0048
     * @tc.desc   Verify FR-AL-EA-003 EAWorker all interfaces mixed operations complete atomically with correct final value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicLong(LONG_255);
      const results = await runEAWorkers<long>(100, (index: int): long => {
        switch (index % 9) {
          case 0:
            return atom.load();
          case 1:
            atom.store(LONG_255);
            return atom.load();
          case 2:
            return atom.exchange(LONG_255);
          case 3:
            return atom.compareAndSwap((-1).toLong(), LONG_999);
          case 4:
            return atom.fetchAdd(LONG_ZERO);
          case 5:
            return atom.fetchSub(LONG_ZERO);
          case 6:
            return atom.fetchAnd((-1).toLong());
          case 7:
            return atom.fetchOr(LONG_ZERO);
          default:
            return atom.fetchXor(LONG_ZERO);
        }
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(LONG_255);
      }
      expect(atom.load()).assertEqual(LONG_255);
    });

    /**
     * @tc.name   atomicsFunctionalTest049
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0049
     * @tc.desc   Verify FR-AS-001 store+load returns 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      atom.store(100);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest050
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0050
     * @tc.desc   Verify FR-AS-002 fetchAdd+fetchSub results in net increase of 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(100);
      atom.fetchAdd(10);
      atom.fetchSub(5);
      expect(atom.load()).assertEqual(105);
    });

    /**
     * @tc.name   atomicsFunctionalTest051
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0051
     * @tc.desc   Verify FR-AS-003 bitwise fetchAnd/fetchOr/fetchXor sequence ends at fetchAnd result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0x3FF);
      atom.fetchAnd(0xFF);
      atom.fetchOr(0x100);
      atom.fetchXor(0x100);
      expect(atom.load()).assertEqual(0xFF);
    });

    /**
     * @tc.name   atomicsFunctionalTest052
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0052
     * @tc.desc   Verify FR-AS-MT-001 TaskPool concurrent fetchAdd(1) with 100 threads increases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      await runTaskpoolResults(100, (): short => atom.fetchAdd(1));
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest053
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0053
     * @tc.desc   Verify FR-AS-MT-002 TaskPool competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      const results = await runTaskpoolResults(100, (): short => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: short = results[i] as short;
        if (result == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsFunctionalTest054
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0054
     * @tc.desc   Verify FR-AS-EA-001 EAWorker concurrent fetchAdd(1) with 100 workers increases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      await runEAWorkers<short>(100, (): short => atom.fetchAdd(1));
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest055
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0055
     * @tc.desc   Verify FR-AS-EA-002 EAWorker competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      const results = await runEAWorkers<short>(100, (): short => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i] == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsFunctionalTest056
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0056
     * @tc.desc   Verify FR-AS-EA-003 EAWorker all interfaces mixed operations complete atomically with correct final value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(255);
      const results = await runEAWorkers<short>(100, (index: int): short => {
        switch (index % 9) {
          case 0:
            return atom.load();
          case 1:
            atom.store(255);
            return atom.load();
          case 2:
            return atom.exchange(255);
          case 3:
            return atom.compareAndSwap(-1, 999);
          case 4:
            return atom.fetchAdd(0);
          case 5:
            return atom.fetchSub(0);
          case 6:
            return atom.fetchAnd(-1);
          case 7:
            return atom.fetchOr(0);
          default:
            return atom.fetchXor(0);
        }
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(255);
      }
      expect(atom.load()).assertEqual(255);
    });

    /**
     * @tc.name   atomicsFunctionalTest057
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0057
     * @tc.desc   Verify FR-AB-001 store+load returns 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      atom.store(42);
      expect(atom.load()).assertEqual(42);
    });

    /**
     * @tc.name   atomicsFunctionalTest058
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0058
     * @tc.desc   Verify FR-AB-002 fetchAdd+fetchSub results in net increase of 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(42);
      atom.fetchAdd(5);
      atom.fetchSub(3);
      expect(atom.load()).assertEqual(44);
    });

    /**
     * @tc.name   atomicsFunctionalTest059
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0059
     * @tc.desc   Verify FR-AB-MT-001 TaskPool concurrent fetchAdd(1) with 100 threads increases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      await runTaskpoolResults(100, (): byte => atom.fetchAdd(1));
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest060
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0060
     * @tc.desc   Verify FR-AB-MT-002 TaskPool competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      const results = await runTaskpoolResults(100, (): byte => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: byte = results[i] as byte;
        if (result == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsFunctionalTest061
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0061
     * @tc.desc   Verify FR-AB-EA-001 EAWorker concurrent fetchAdd(1) with 100 workers increases value by 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      await runEAWorkers<byte>(100, (): byte => atom.fetchAdd(1));
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicsFunctionalTest062
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0062
     * @tc.desc   Verify FR-AB-EA-002 EAWorker competing compareAndSwap from 0 to 1 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      const results = await runEAWorkers<byte>(100, (): byte => atom.compareAndSwap(0, 1));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i] == 0) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsFunctionalTest063
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0063
     * @tc.desc   Verify FR-AB-EA-003 EAWorker all interfaces mixed operations complete atomically with correct final value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(25);
      const results = await runEAWorkers<byte>(100, (index: int): byte => {
        switch (index % 9) {
          case 0:
            return atom.load();
          case 1:
            atom.store(25);
            return atom.load();
          case 2:
            return atom.exchange(25);
          case 3:
            return atom.compareAndSwap(-1, 99);
          case 4:
            return atom.fetchAdd(0);
          case 5:
            return atom.fetchSub(0);
          case 6:
            return atom.fetchAnd(-1);
          case 7:
            return atom.fetchOr(0);
          default:
            return atom.fetchXor(0);
        }
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(25);
      }
      expect(atom.load()).assertEqual(25);
    });

    /**
     * @tc.name   atomicsFunctionalTest064
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0064
     * @tc.desc   Verify FR-AC-001 store+load returns 'A'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'X');
      atom.store(c'A');
      expect(atom.load()).assertEqual(c'A');
    });

    /**
     * @tc.name   atomicsFunctionalTest065
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0065
     * @tc.desc   Verify FR-AC-002 exchange+load returns 'B' after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'A');
      expect(atom.exchange(c'B')).assertEqual(c'A');
      expect(atom.load()).assertEqual(c'B');
    });

    /**
     * @tc.name   atomicsFunctionalTest066
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0066
     * @tc.desc   Verify FR-AC-MT-001 TaskPool concurrent store keeps atomicity and final value equals last store character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'Z');
      const chars = createCharValues();
      const counter = new AtomicInt(0);

      await runTaskpoolResults(chars.length, (index: int): int => {
        if (index < chars.length - 1) {
          atom.store(chars[index]);
          counter.fetchAdd(1);
        } else {
          waitUntil(counter, chars.length - 1);
          atom.store(chars[index]);
        }
        return 0;
      });

      expect(atom.load()).assertEqual(chars[chars.length - 1]);
    });

    /**
     * @tc.name   atomicsFunctionalTest067
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0067
     * @tc.desc   Verify FR-AC-MT-002 TaskPool concurrent exchange completes atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'Z');
      const chars = createCharValues();
      const results = await runTaskpoolResults(chars.length, (index: int): char => atom.exchange(chars[index]));

      let initialCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: char = results[i] as char;
        expect(containsCharValue(chars, result) || result == c'Z').assertTrue();
        if (result == c'Z') {
          initialCount++;
        }
      }

      expect(initialCount).assertEqual(1);
      expect(containsCharValue(chars, atom.load())).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest068
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0068
     * @tc.desc   Verify FR-AC-EA-001 EAWorker concurrent store keeps atomicity and final value equals last store character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'Z');
      const chars = createCharValues();
      const counter = new AtomicInt(0);

      await runEAWorkers<int>(chars.length, (index: int): int => {
        if (index < chars.length - 1) {
          atom.store(chars[index]);
          counter.fetchAdd(1);
        } else {
          waitUntil(counter, chars.length - 1);
          atom.store(chars[index]);
        }
        return 0;
      });

      expect(atom.load()).assertEqual(chars[chars.length - 1]);
    });

    /**
     * @tc.name   atomicsFunctionalTest069
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0069
     * @tc.desc   Verify FR-AC-EA-002 EAWorker concurrent exchange completes atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'Z');
      const chars = createCharValues();
      const results = await runEAWorkers<char>(chars.length, (index: int): char => atom.exchange(chars[index]));

      let initialCount = 0;
      for (let i = 0; i < results.length; i++) {
        expect(containsCharValue(chars, results[i]) || results[i] == c'Z').assertTrue();
        if (results[i] == c'Z') {
          initialCount++;
        }
      }

      expect(initialCount).assertEqual(1);
      expect(containsCharValue(chars, atom.load())).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest070
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0070
     * @tc.desc   Verify FR-AC-EA-003 EAWorker competing compareAndSwap from 'A' to 'B' has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'A');
      const results = await runEAWorkers<char>(10, (): char => atom.compareAndSwap(c'A', c'B'));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i] == c'A') {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(c'B');
    });

    /**
     * @tc.name   atomicsFunctionalTest071
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0071
     * @tc.desc   Verify FR-AC-EA-004 EAWorker all interfaces mixed operations complete atomically with consistent final state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicChar(c'Q');
      const results = await runEAWorkers<char>(10, (index: int): char => {
        if (index % 4 == 0) {
          return atom.load();
        }
        if (index % 4 == 1) {
          atom.store(c'Q');
          return atom.load();
        }
        if (index % 4 == 2) {
          return atom.exchange(c'Q');
        }
        return atom.compareAndSwap(c'Z', c'W');
      });

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(c'Q');
      }
      expect(atom.load()).assertEqual(c'Q');
    });

    /**
     * @tc.name   atomicsFunctionalTest072
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0072
     * @tc.desc   Verify FR-ABO-001 store+load returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicBoolean(false);
      atom.store(true);
      expect(atom.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicsFunctionalTest073
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0073
     * @tc.desc   Verify FR-ABO-002 exchange+compareAndSwap sequence executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicBoolean(true);
      expect(atom.exchange(false)).assertEqual(true);
      expect(atom.compareAndSwap(false, true)).assertEqual(false);
      expect(atom.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicsFunctionalTest074
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0074
     * @tc.desc   Verify FR-ABO-MT-001 TaskPool competing compareAndSwap from false to true has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicBoolean(false);
      const results = await runTaskpoolResults(100, (): boolean => atom.compareAndSwap(false, true));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: boolean = results[i] as boolean;
        if (result == false) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(atom.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicsFunctionalTest075
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0075
     * @tc.desc   Verify FR-ABO-MT-002 TaskPool mixed store/exchange/compareAndSwap operations complete atomically with correct final value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicBoolean(true);
      const results = await runTaskpoolResults(10, (index: int): boolean => {
        if (index % 3 == 0) {
          atom.store(true);
          return atom.load();
        }
        if (index % 3 == 1) {
          return atom.exchange(true);
        }
        return atom.compareAndSwap(false, true);
      });

      for (let i = 0; i < results.length; i++) {
        const result: boolean = results[i] as boolean;
        expect(result).assertEqual(true);
      }
      expect(atom.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicsFunctionalTest076
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0076
     * @tc.desc   Verify FR-AF-001 store+load returns 3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(0.0f);
      atom.store(3.14f);
      expect(isNearFloat(atom.load(), 3.14f)).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest077
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0077
     * @tc.desc   Verify FR-AF-002 exchange+load returns 2.71
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(3.14f);
      expect(isNearFloat(atom.exchange(2.71f), 3.14f)).assertTrue();
      expect(isNearFloat(atom.load(), 2.71f)).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest078
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0078
     * @tc.desc   Verify FR-AF-MT-001 TaskPool concurrent store keeps atomicity and final value equals last store value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(0.0f);
      const values = createFloatValues();
      const counter = new AtomicInt(0);

      await runTaskpoolResults(values.length, (index: int): int => {
        if (index < values.length - 1) {
          atom.store(values[index]);
          counter.fetchAdd(1);
        } else {
          waitUntil(counter, values.length - 1);
          atom.store(values[index]);
        }
        return 0;
      });

      expect(isNearFloat(atom.load(), values[values.length - 1])).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest079
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0079
     * @tc.desc   Verify FR-AF-MT-002 TaskPool competing compareAndSwap from 0.0 to 1.0 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(0.0f);
      const results = await runTaskpoolResults(10, (): float => atom.compareAndSwap(0.0f, 1.0f));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: float = results[i] as float;
        if (isNearFloat(result, 0.0f)) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(isNearFloat(atom.load(), 1.0f)).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest080
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0080
     * @tc.desc   Verify FR-AD-001 store+load returns 3.14159265
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicDouble(0.0);
      atom.store(3.14159265);
      expect(isNearDouble(atom.load(), 3.14159265)).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest081
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0081
     * @tc.desc   Verify FR-AD-002 exchange+compareAndSwap sequence executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicDouble(3.14159265);
      expect(isNearDouble(atom.exchange(2.718), 3.14159265)).assertTrue();
      expect(isNearDouble(atom.compareAndSwap(2.718, 1.414), 2.718)).assertTrue();
      expect(isNearDouble(atom.load(), 1.414)).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest082
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0082
     * @tc.desc   Verify FR-AD-MT-001 TaskPool concurrent store keeps atomicity and final value equals last store value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicDouble(0.0);
      const values = createDoubleValues();
      const counter = new AtomicInt(0);

      await runTaskpoolResults(values.length, (index: int): int => {
        if (index < values.length - 1) {
          atom.store(values[index]);
          counter.fetchAdd(1);
        } else {
          waitUntil(counter, values.length - 1);
          atom.store(values[index]);
        }
        return 0;
      });

      expect(isNearDouble(atom.load(), values[values.length - 1])).assertTrue();
    });

    /**
     * @tc.name   atomicsFunctionalTest083
     * @tc.number SUB_BUILTINS_ATOMICS_FUNCTIONAL_TEST_0083
     * @tc.desc   Verify FR-AD-MT-002 TaskPool competing compareAndSwap from 0.0 to 1.0 has exactly one successful update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsFunctionalTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicDouble(0.0);
      const results = await runTaskpoolResults(10, (): double => atom.compareAndSwap(0.0, 1.0));

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        const result: double = results[i] as double;
        if (isNearDouble(result, 0.0)) {
          successCount++;
        }
      }

      expect(successCount).assertEqual(1);
      expect(isNearDouble(atom.load(), 1.0)).assertTrue();
    });
  });
}
