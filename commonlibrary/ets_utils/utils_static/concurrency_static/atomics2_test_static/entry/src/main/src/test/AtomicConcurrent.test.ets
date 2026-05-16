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
 * WITHOUT WARRANTIES OR CONDITIONS OF Any KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep from './Util.test';

class TestClass {
  public value: int = 0;

  constructor(value: int) {
    this.value = value;
  }
}

export default function atomicConcurrentTest() {
  describe('atomicConcurrentTest', () => {
    afterEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicRefEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_EAWORKER_0100
     * @tc.desc   Verify AtomicReference EAWorker load() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let count = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let value = atomicRef.load();
          count.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      while (count.load() < 20) {
        await sleep(10);
      }
      expect(count.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicRefEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_EAWORKER_0200
     * @tc.desc   Verify AtomicReference EAWorker store() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let finalValue: number = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicRef.store(i * 10);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicRef.load();
      expect(finalValue >= 0 && finalValue <= 190).assertTrue();
    });

    /**
     * @tc.name   atomicRefEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_EAWORKER_0300
     * @tc.desc   Verify AtomicReference EAWorker exchange() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let oldValue: number = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          oldValue = atomicRef.exchange(i + 1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      let finalValue = atomicRef.load();
      expect(finalValue >= 1 && finalValue <= 20).assertTrue();
    });

    /**
     * @tc.name   atomicRefEAWorker004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_EAWORKER_0400
     * @tc.desc   Verify AtomicReference EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefEAWorker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let class1 = new TestClass(0);
      let atomicRef = new AtomicReference<TestClass>(class1);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicRef.compareAndSwap(class1, new TestClass(i + 1));
          if (result === class1) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      let result = atomicRef.load()
      expect(result.value <= 20 && result.value >= 1).assertTrue();
    });

    /**
     * @tc.name   atomicRefEAWorker005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_EAWORKER_0500
     * @tc.desc   Verify AtomicReference EAWorker mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefEAWorker005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let atomicInt = new AtomicInt(0);
      let mixedCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicRef.store(i);
          atomicInt.fetchAdd(1);
          mixedCount.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })

      expect(atomicRef.load() >= 0 && atomicRef.load() <= 19).assertTrue();
      expect(mixedCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicRefEAWorker006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_EAWORKER_0600
     * @tc.desc   Verify AtomicReference EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefEAWorker006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let atomicInt = new AtomicInt(0);
      let atomicLong = new AtomicLong(0);
      let finalValue: number = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicRef.store(i);
          atomicInt.fetchAdd(1);
          atomicLong.fetchAdd(1);
          atomicInt.fetchAdd(1);
          finalValue = atomicRef.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue >= 0 && finalValue <= 19).assertTrue();
      expect(atomicInt.load()).assertEqual(40);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicIntEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0100
     * @tc.desc   Verify AtomicInt EAWorker fetchAdd() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let initial = atomicInt.load();
      let finalValue = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicInt.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicInt.load();
      expect(finalValue).assertEqual(initial + 20);
    });

    /**
     * @tc.name   atomicIntEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0200
     * @tc.desc   Verify AtomicInt EAWorker fetchSub() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(100);
      let initial = atomicInt.load();
      let finalValue = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicInt.fetchSub(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicInt.load();
      expect(finalValue).assertEqual(initial - 20);
    });

    /**
     * @tc.name   atomicIntEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0300
     * @tc.desc   Verify AtomicInt EAWorker fetchAdd/fetchSub mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (i % 2 === 0) {
            atomicInt.fetchAdd(1);
          } else {
            atomicInt.fetchSub(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicInt.load();
      expect(finalValue).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntEAWorker004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0400
     * @tc.desc   Verify AtomicInt EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicInt.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntEAWorker005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0500
     * @tc.desc   Verify AtomicInt EAWorker bit operations concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      let finalValue = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicInt.fetchAnd(0xFF);
          atomicInt.fetchOr(0x10);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicInt.load();
      expect(finalValue).assertEqual(255);
    });

    /**
     * @tc.name   atomicIntEAWorker006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0600
     * @tc.desc   Verify AtomicInt EAWorker mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicInt.store(i);
          atomicInt.fetchAdd(1);
          atomicInt.fetchSub(1);
          finalValue = atomicInt.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue >= 0 && finalValue <= 19).assertTrue();
    });

    /**
     * @tc.name   atomicIntEAWorker007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_EAWORKER_0700
     * @tc.desc   Verify AtomicInt EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntEAWorker007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let fetchAddCount = new AtomicInt(0);
      let fetchSubCount = new AtomicInt(0);
      let fetchAndCount = new AtomicInt(0);
      let fetchOrCount = new AtomicInt(0);
      let fetchXorCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicInt.fetchAdd(1);
          fetchAddCount.fetchAdd(1);
          atomicInt.fetchSub(1);
          fetchSubCount.fetchAdd(1);
          atomicInt.fetchAnd(0xFF);
          fetchAndCount.fetchAdd(1);
          atomicInt.fetchOr(0x10);
          fetchOrCount.fetchAdd(1);
          atomicInt.fetchXor(0x10);
          fetchXorCount.fetchAdd(1);
          finalValue = atomicInt.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(0);
      expect(fetchAddCount.load()).assertEqual(20);
      expect(fetchSubCount.load()).assertEqual(20);
      expect(fetchAndCount.load()).assertEqual(20);
      expect(fetchOrCount.load()).assertEqual(20);
      expect(fetchXorCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_LONG_EAWORKER_0100
     * @tc.desc   Verify AtomicLong EAWorker fetchAdd() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let initial = atomicLong.load();
      let finalValue:long = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicLong.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicLong.load();
      expect(finalValue).assertEqual(initial + 20);
    });

    /**
     * @tc.name   atomicLongEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_LONG_EAWORKER_0200
     * @tc.desc   Verify AtomicLong EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicLong.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicLong.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_LONG_EAWORKER_0300
     * @tc.desc   Verify AtomicLong EAWorker mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let finalValue:long = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicLong.store(i);
          atomicLong.fetchAdd(1);
          finalValue = atomicLong.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue >= 0 && finalValue <= 20).assertTrue();
    });

    /**
     * @tc.name   atomicLongEAWorker004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_LONG_EAWORKER_0400
     * @tc.desc   Verify AtomicLong EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongEAWorker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let finalValue:long = 0;
      let fetchAddCount = new AtomicInt(0);
      let fetchSubCount = new AtomicInt(0);
      let fetchAndCount = new AtomicInt(0);
      let fetchOrCount = new AtomicInt(0);
      let fetchXorCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicLong.fetchAdd(1);
          fetchAddCount.fetchAdd(1);
          atomicLong.fetchSub(1);
          fetchSubCount.fetchAdd(1);
          atomicLong.fetchAnd(0xFFFFFFFF);
          fetchAndCount.fetchAdd(1);
          atomicLong.fetchOr(0x10);
          fetchOrCount.fetchAdd(1);
          atomicLong.fetchXor(0x10);
          fetchXorCount.fetchAdd(1);
          finalValue = atomicLong.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(0);
      expect(fetchAddCount.load()).assertEqual(20);
      expect(fetchSubCount.load()).assertEqual(20);
      expect(fetchAndCount.load()).assertEqual(20);
      expect(fetchOrCount.load()).assertEqual(20);
      expect(fetchXorCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicShortEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_SHORT_EAWORKER_0100
     * @tc.desc   Verify AtomicShort EAWorker fetchAdd() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let initial = atomicShort.load();
      let finalValue:short = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicShort.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicShort.load();
      expect(finalValue).assertEqual(initial + 20);
    });

    /**
     * @tc.name   atomicShortEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_SHORT_EAWORKER_0200
     * @tc.desc   Verify AtomicShort EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicShort.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicShort.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_SHORT_EAWORKER_0300
     * @tc.desc   Verify AtomicShort EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let finalValue = 0;
      let fetchAddCount = new AtomicInt(0);
      let fetchSubCount = new AtomicInt(0);
      let fetchAndCount = new AtomicInt(0);
      let fetchOrCount = new AtomicInt(0);
      let fetchXorCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicShort.fetchAdd(1);
          fetchAddCount.fetchAdd(1);
          atomicShort.fetchSub(1);
          fetchSubCount.fetchAdd(1);
          atomicShort.fetchAnd(0xFF);
          fetchAndCount.fetchAdd(1);
          atomicShort.fetchOr(0x10);
          fetchOrCount.fetchAdd(1);
          atomicShort.fetchXor(0x10);
          fetchXorCount.fetchAdd(1);
          finalValue = Short.toInt(atomicShort.load());
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(0);
      expect(fetchAddCount.load()).assertEqual(20);
      expect(fetchSubCount.load()).assertEqual(20);
      expect(fetchAndCount.load()).assertEqual(20);
      expect(fetchOrCount.load()).assertEqual(20);
      expect(fetchXorCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicByteEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BYTE_EAWORKER_0100
     * @tc.desc   Verify AtomicByte EAWorker fetchAdd() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let initial = atomicByte.load();
      let finalValue = 0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicByte.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicByte.load();
      expect(finalValue).assertEqual(initial + 20);
    });

    /**
     * @tc.name   atomicByteEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BYTE_EAWORKER_0200
     * @tc.desc   Verify AtomicByte EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicByte.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicByte.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicByteEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BYTE_EAWORKER_0300
     * @tc.desc   Verify AtomicByte EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let finalValue = 0;
      let fetchAddCount = new AtomicInt(0);
      let fetchSubCount = new AtomicInt(0);
      let fetchAndCount = new AtomicInt(0);
      let fetchOrCount = new AtomicInt(0);
      let fetchXorCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicByte.fetchAdd(1);
          fetchAddCount.fetchAdd(1);
          atomicByte.fetchSub(1);
          fetchSubCount.fetchAdd(1);
          atomicByte.fetchAnd(127);
          fetchAndCount.fetchAdd(1);
          atomicByte.fetchOr(16);
          fetchOrCount.fetchAdd(1);
          atomicByte.fetchXor(16);
          fetchXorCount.fetchAdd(1);
          finalValue = Byte.toInt(atomicByte.load());
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(0);
      expect(fetchAddCount.load()).assertEqual(20);
      expect(fetchSubCount.load()).assertEqual(20);
      expect(fetchAndCount.load()).assertEqual(20);
      expect(fetchOrCount.load()).assertEqual(20);
      expect(fetchXorCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicCharEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_CHAR_EAWORKER_0100
     * @tc.desc   Verify AtomicChar EAWorker store() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let finalValue = c'A';
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicChar.store(c'B');
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicChar.load();
      expect(finalValue).assertEqual(c'B');
    });

    /**
     * @tc.name   atomicCharEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_CHAR_EAWORKER_0200
     * @tc.desc   Verify AtomicChar EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicChar.compareAndSwap(c'A', c'B');
          if (result === c'A'){
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicChar.load()).assertEqual(c'B');
    });

    /**
     * @tc.name   atomicCharEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_CHAR_EAWORKER_0300
     * @tc.desc   Verify AtomicChar EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let finalValue = c'A';
      let storeCount = new AtomicInt(0);
      let exchangeCount = new AtomicInt(0);
      let casCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicChar.store(c'B');
          storeCount.fetchAdd(1);
          let oldValue = atomicChar.exchange(c'C');
          exchangeCount.fetchAdd(1);
          let result = atomicChar.compareAndSwap(c'C', c'D');
          casCount.fetchAdd(1);
          finalValue = atomicChar.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(c'D');
      expect(storeCount.load()).assertEqual(20);
      expect(exchangeCount.load()).assertEqual(20);
      expect(casCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicFloatEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_FLOAT_EAWORKER_0100
     * @tc.desc   Verify AtomicFloat EAWorker store() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let finalValue: float = 0.0f;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicFloat.store(1.5f);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicFloat.load();
      expect(finalValue).assertEqual(1.5f);
    });

    /**
     * @tc.name   atomicFloatEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_FLOAT_EAWORKER_0200
     * @tc.desc   Verify AtomicFloat EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicFloat.compareAndSwap(0.0f, 1.5f);
          if (result === 0.0f) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicFloat.load()).assertEqual(1.5f);
    });

    /**
     * @tc.name   atomicFloatEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_FLOAT_EAWORKER_0300
     * @tc.desc   Verify AtomicFloat EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let finalValue = 0.0f;
      let storeCount = new AtomicInt(0);
      let exchangeCount = new AtomicInt(0);
      let casCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicFloat.store(1.5f);
          storeCount.fetchAdd(1);
          let oldValue = atomicFloat.exchange(2.5f);
          exchangeCount.fetchAdd(1);
          let result = atomicFloat.compareAndSwap(2.5f, 3.5f);
          casCount.fetchAdd(1);
          finalValue = atomicFloat.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(3.5f);
      expect(storeCount.load()).assertEqual(20);
      expect(exchangeCount.load()).assertEqual(20);
      expect(casCount.load()).assertEqual(20);

    });

    /**
     * @tc.name   atomicDoubleEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_DOUBLE_EAWORKER_0100
     * @tc.desc   Verify AtomicDouble EAWorker store() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let finalValue = 0.0;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicDouble.store(1.5);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      finalValue = atomicDouble.load();
      expect(finalValue).assertEqual(1.5);
    });

    /**
     * @tc.name   atomicDoubleEAWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_DOUBLE_EAWORKER_0200
     * @tc.desc   Verify AtomicDouble EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicDouble.compareAndSwap(0.0, 1.5);
          if (result === 0.0) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicDouble.load()).assertEqual(1.5);
    });

    /**
     * @tc.name   atomicDoubleEAWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_DOUBLE_EAWORKER_0300
     * @tc.desc   Verify AtomicDouble EAWorker all interfaces mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let finalValue = 0.0;
      let storeCount = new AtomicInt(0);
      let exchangeCount = new AtomicInt(0);
      let casCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicDouble.store(1.5);
          storeCount.fetchAdd(1);
          let oldValue = atomicDouble.exchange(2.5);
          exchangeCount.fetchAdd(1);
          let result = atomicDouble.compareAndSwap(2.5, 3.5);
          casCount.fetchAdd(1);
          finalValue = atomicDouble.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(3.5);
      expect(storeCount.load()).assertEqual(20);
      expect(exchangeCount.load()).assertEqual(20);
      expect(casCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicBooleanEAWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BOOLEAN_EAWORKER_0100
     * @tc.desc   Verify AtomicBoolean EAWorker compareAndSwap() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicBooleanEAWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let result = atomicBoolean.compareAndSwap(false, true);
          if (result === false) {
            successCount.fetchAdd(1);
          }
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicBoolean.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicBooleanEAWorker002
     * @tc.desc   Verify AtomicBoolean EAWorker mixed operations
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BOOLEAN_EAWORKER_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicBooleanEAWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let mixedCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicBoolean.store(false);
          atomicBoolean.exchange(true);
          atomicBoolean.compareAndSwap(true, false);
          mixedCount.fetchAdd(1);
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(atomicBoolean.load()).assertEqual(false);
      expect(mixedCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicBooleanEAWorker003
     * @tc.desc   Verify AtomicBoolean EAWorker all interfaces mixed operations
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BOOLEAN_EAWORKER_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicBooleanEAWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let loadCount = new AtomicInt(0);
      let storeCount = new AtomicInt(0);
      let exchangeCount = new AtomicInt(0);
      let casCount = new AtomicInt(0);
      let finalValue = false;
      let eaws: EAWorker[] = [];
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicBoolean.load();
          loadCount.fetchAdd(1);
          atomicBoolean.store(true);
          storeCount.fetchAdd(1);
          atomicBoolean.exchange(false);
          exchangeCount.fetchAdd(1);
          atomicBoolean.compareAndSwap(false, true);
          if (atomicBoolean.load()) {
            casCount.fetchAdd(1);
          }
          finalValue = atomicBoolean.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit();
      })
      expect(finalValue).assertEqual(true);
      expect(loadCount.load()).assertEqual(20);
      expect(storeCount.load()).assertEqual(20);
      expect(exchangeCount.load()).assertEqual(20);
      expect(casCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   comboStampedToken001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_STAMPED_TOKEN_0100
     * @tc.desc   Verify AtomicReference with version number CAS (resolve ABA problem)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboStampedToken001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ref = new AtomicReference<number>(1);
      let version = new AtomicInt(0);
      let successCount = new AtomicInt(0);
      let failCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let v = version.load();
          let expected = ref.load();
          let result = ref.compareAndSwap(expected, 2.0);
          if (result === expected) {
            successCount.fetchAdd(1);
            version.fetchAdd(1);
          } else {
            failCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit();
      })

      expect(successCount.load()).assertEqual(20);
      expect(failCount.load()).assertEqual(0);
      expect(ref.load()).assertEqual(1);
      expect(version.load()).assertEqual(20);
    });

    /**
     * @tc.name   comboDoubleBuffer001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_DOUBLE_BUFFER_0100
     * @tc.desc   Verify read-write double buffer pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboDoubleBuffer001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let readBuffer = new AtomicInt(0);
      let writeBuffer = new AtomicInt(0);
      let readCount = new AtomicInt(0);
      let writeCount = new AtomicInt(0);
      let switchCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (i % 2 === 0) {
            readBuffer.store(1);
            readCount.fetchAdd(1);
          } else {
            writeBuffer.store(2);
            writeCount.fetchAdd(1);
          }
          if (readBuffer.load() === writeBuffer.load()) {
            switchCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit();
      })

      expect(readCount.load()).assertEqual(10);
      expect(writeCount.load()).assertEqual(10);
      expect(switchCount.load()).assertEqual(0);
      expect(readBuffer.load()).assertEqual(1);
      expect(writeBuffer.load()).assertEqual(2);
    });

    /**
     * @tc.name   comboBitLock001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_BIT_LOCK_0100
     * @tc.desc   Verify concurrent bit lock with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboBitLock001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let lock = new AtomicInt(0);
      let lockCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      let acquired = false;
      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (lock.compareAndSwap(0, 1)) {
            acquired = true;
            lockCount.fetchAdd(1);
            lock.fetchAnd(2147483647 - 1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(acquired).assertEqual(true);
      expect(lockCount.load()).assertEqual(10);
      expect(lock.load()).assertEqual(0);
    });

    /**
     * @tc.name   comboRingBuffer001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_RING_BUFFER_0100
     * @tc.desc   Verify ring buffer with atomic pointers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboRingBuffer001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let writeIndex = new AtomicInt(0);
      let readIndex = new AtomicInt(0);
      let writeCount = new AtomicInt(0);
      let readCount = new AtomicInt(0);
      let eaws1:EAWorker[] = [];
      let eaws2:EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws1.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (writeIndex.load() < readIndex.load() + 100) {
            writeIndex.fetchAdd(1);
            writeCount.fetchAdd(1);
          }
        });
      }

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws2.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          readIndex.fetchAdd(1);
          readCount.fetchAdd(1);
        });
      }

      eaws1.forEach((eaw) => {
        eaw.quit()
      })

      eaws2.forEach((eaw) => {
        eaw.quit()
      })

      expect(writeCount.load()).assertEqual(20);
      expect(readCount.load()).assertEqual(20);
      expect(writeIndex.load()).assertEqual(20);
      expect(readIndex.load()).assertEqual(20);
    });

    /**
     * @tc.name   comboSingleton001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_SINGLETON_0100
     * @tc.desc   Verify singleton pattern with CAS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboSingleton001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let instance = new AtomicReference<Any>(null);
      let instanceCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (instance.compareAndSwap(null, new Object())) {
            instanceCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(instanceCount.load()).assertEqual(19);
      expect(instance.load() != null).assertTrue();
    });

    /**
     * @tc.name   comboBitField001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_BIT_FIELD_0100
     * @tc.desc   Verify atomic bit flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboBitField001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let flags = new AtomicInt(0);
      let setCount = new AtomicInt(0);
      let clearCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (flags.compareAndSwap(0, 1)) {
            setCount.fetchAdd(1);
            flags.fetchOr(2);
          } else {
            clearCount.fetchAdd(1);
            flags.fetchAnd(2147483647);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(setCount.load()).assertEqual(19);
      expect(clearCount.load()).assertEqual(1);
      expect(flags.load()).assertEqual(3);
    });

    /**
     * @tc.name   comboConcurrentCounter001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_CONCURRENT_COUNTER_0100
     * @tc.desc   Verify concurrent counter with limit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboConcurrentCounter001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(0);
      let limit = 10;
      let failCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (counter.load() < limit) {
            counter.fetchAdd(1);
          } else {
            failCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(failCount.load()).assertEqual(limit);
      expect(counter.load()).assertEqual(limit);
    });

    /**
     * @tc.name   comboLazyInit001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_LAZY_INIT_0100
     * @tc.desc   Verify double-checked lazy initialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboLazyInit001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let instance = new AtomicReference<Any>(null);
      let initCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let oldValue = instance.compareAndSwap(null, new Object());
          if (oldValue == null) {
            initCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(initCount.load()).assertEqual(1);
      expect(instance.load() != null).assertTrue();
    });

    /**
     * @tc.name   comboABA001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ABA_0100
     * @tc.desc   Verify classic ABA problem scenario
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboABA001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>('1');
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          let v = atomicRef.load();
          if (atomicRef.compareAndSwap(v, '2')) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(successCount.load()).assertEqual(20);
      expect(atomicRef.load()).assertEqual('2');
    });

    /**
     * @tc.name   comboNestedCAS001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_NESTED_CAS_0100
     * @tc.desc   Verify nested CAS operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboNestedCAS001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          if (atomicInt.compareAndSwap(0, 1)) {
            if (atomicInt.compareAndSwap(1, 2)) {
              successCount.fetchAdd(1);
            }
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      expect(successCount.load()).assertEqual(19);
      expect(atomicInt.load()).assertEqual(2);
    });

    /**
     * @tc.name   comboRaceCondition001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_RACE_CONDITION_0100
     * @tc.desc   Verify thread-safe counter with CAS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboRaceCondition001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(0);
      let count = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          counter.fetchAdd(1);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      count = counter.load();
      expect(count).assertEqual(20);
    });

    /**
     * @tc.name   comboMultipleThreads001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_MULTIPLE_THREADS_0100
     * @tc.desc   Verify multiple threads accessing same atomic variable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboMultipleThreads001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let threadCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 20; i++) {
        let eaw = new EAWorker();
        eaws.push(eaw);
        eaw.start();
        eaw.run<void>((): void => {
          atomicInt.fetchAdd(10);
          threadCount.fetchAdd(1);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })

      finalValue = atomicInt.load();
      expect(finalValue).assertEqual(200);
      expect(threadCount.load()).assertEqual(20);
    });

    /**
     * @tc.name   comboValueUpdate001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_VALUE_UPDATE_0100
     * @tc.desc   Verify atomic value update across multiple operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboValueUpdate001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let exchangeValue = 0;
      let loadValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          exchangeValue = atomicInt.exchange(100);
          loadValue = atomicInt.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicInt.load();
      expect(exchangeValue).assertEqual(100);
      expect(loadValue).assertEqual(100);
      expect(finalValue).assertEqual(100);
    });

    /**
     * @tc.name   comboAtomicIntStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_INT_STORE_LOAD_0100
     * @tc.desc   Verify atomicInt store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicIntStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let storedValue = 0;
      let loadedValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicInt.store(42);
          storedValue = atomicInt.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicInt.load();
      expect(storedValue).assertEqual(42);
      expect(loadedValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicReferenceStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_REFERENCE_STORE_LOAD_0100
     * @tc.desc   Verify AtomicReference store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicReferenceStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let storedValue:number = 0;
      let loadedValue:number = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicRef.store(42);
          storedValue = atomicRef.load();
        });
      }
      eaws.forEach((eaw) => {
        eaw.quit()
      })

      loadedValue = atomicRef.load();
      expect(storedValue).assertEqual(42);
      expect(loadedValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicLongStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_LONG_STORE_LOAD_0100
     * @tc.desc   Verify AtomicLong store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicLongStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let storedValue: long = 0;
      let loadedValue: long= 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicLong.store(42);
          storedValue = atomicLong.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicLong.load();
      expect(storedValue).assertEqual(42);
      expect(loadedValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicFloatStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_FLOAT_STORE_LOAD_0100
     * @tc.desc   Verify AtomicFloat store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicFloatStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let storedValue = 0.0f;
      let loadedValue = 0.0f;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicFloat.store(1.5f);
          storedValue = atomicFloat.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicFloat.load();
      expect(storedValue).assertEqual(1.5f);
      expect(loadedValue).assertEqual(1.5f);
    });

    /**
     * @tc.name   comboAtomicDoubleStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_DOUBLE_STORE_LOAD_0100
     * @tc.desc   Verify AtomicDouble store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicDoubleStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let storedValue = 0.0;
      let loadedValue = 0.0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicDouble.store(1.5);
          storedValue = atomicDouble.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicDouble.load();
      expect(storedValue).assertEqual(1.5);
      expect(loadedValue).assertEqual(1.5);
    });

    /**
     * @tc.name   comboAtomicByteStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_BYTE_STORE_LOAD_0100
     * @tc.desc   Verify AtomicByte store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicByteStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let storedValue = 0;
      let loadedValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicByte.store(42);
          storedValue = Byte.toInt(atomicByte.load());
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicByte.load();
      expect(storedValue).assertEqual(42);
      expect(loadedValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicShortStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_SHORT_STORE_LOAD_0100
     * @tc.desc   Verify AtomicShort store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicShortStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let storedValue = 0;
      let loadedValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicShort.store(42);
          storedValue = Short.toInt(atomicShort.load());
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicShort.load();
      expect(storedValue).assertEqual(42);
      expect(loadedValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicCharStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_CHAR_STORE_LOAD_0100
     * @tc.desc   Verify AtomicChar store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicCharStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let storedValue = c'A';
      let loadedValue = c'A';
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicChar.store(c'B');
          storedValue = atomicChar.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicChar.load();
      expect(storedValue).assertEqual(c'B');
      expect(loadedValue).assertEqual(c'B');
    });

    /**
     * @tc.name   comboAtomicBooleanStoreLoad001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_BOOLEAN_STORE_LOAD_0100
     * @tc.desc   Verify AtomicBoolean store and load operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicBooleanStoreLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let storedValue = false;
      let loadedValue = false;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicBoolean.store(true);
          storedValue = atomicBoolean.load();
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      loadedValue = atomicBoolean.load();
      expect(storedValue).assertEqual(true);
      expect(loadedValue).assertEqual(true);
    });

    /**
     * @tc.name   comboAtomicIntExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_INT_EXCHANGE_0100
     * @tc.desc   Verify AtomicInt exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicIntExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let oldValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicInt.exchange(42);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicInt.load();
      expect(oldValue).assertEqual(42);
      expect(finalValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicReferenceExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_REFERENCE_EXCHANGE_0100
     * @tc.desc   Verify AtomicReference exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicReferenceExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let finalValue:number = 0;
      let oldValue:number = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicRef.exchange(42);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicRef.load();
      expect(oldValue).assertEqual(42);
      expect(finalValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicLongExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_LONG_EXCHANGE_0100
     * @tc.desc   Verify AtomicLong exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicLongExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let finalValue: long = 0;
      let oldValue: long = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicLong.exchange(42);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicLong.load();
      expect(oldValue).assertEqual(42);
      expect(finalValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicFloatExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_FLOAT_EXCHANGE_0100
     * @tc.desc   Verify AtomicFloat exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicFloatExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let finalValue = 0.0f;
      let oldValue = 0.0f;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicFloat.exchange(1.5f);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicFloat.load();
      expect(oldValue).assertEqual(1.5f);
      expect(finalValue).assertEqual(1.5f);
    });

    /**
     * @tc.name   comboAtomicDoubleExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_DOUBLE_EXCHANGE_0100
     * @tc.desc   Verify AtomicDouble exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicDoubleExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let finalValue = 0.0;
      let oldValue = 0.0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicDouble.exchange(1.5);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicDouble.load();
      expect(oldValue).assertEqual(1.5);
      expect(finalValue).assertEqual(1.5);
    });

    /**
     * @tc.name   comboAtomicByteExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_BYTE_EXCHANGE_0100
     * @tc.desc   Verify AtomicByte exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicByteExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let finalValue = 0;
      let oldValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = Byte.toInt(atomicByte.exchange(42));
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicByte.load();
      expect(oldValue).assertEqual(42);
      expect(finalValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicShortExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_SHORT_EXCHANGE_0100
     * @tc.desc   Verify AtomicShort exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicShortExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let finalValue = 0;
      let oldValue = 0;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = Short.toInt(atomicShort.exchange(42));
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicShort.load();
      expect(oldValue).assertEqual(42);
      expect(finalValue).assertEqual(42);
    });

    /**
     * @tc.name   comboAtomicCharExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_CHAR_EXCHANGE_0100
     * @tc.desc   Verify AtomicChar exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicCharExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let finalValue = c'A';
      let oldValue = c'A';
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicChar.exchange(c'B');
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicChar.load();
      expect(oldValue).assertEqual(c'B');
      expect(finalValue).assertEqual(c'B');
    });

    /**
     * @tc.name   comboAtomicBooleanExchange001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_BOOLEAN_EXCHANGE_0100
     * @tc.desc   Verify AtomicBoolean exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicBooleanExchange001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let finalValue = false;
      let oldValue = false;
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          oldValue = atomicBoolean.exchange(true);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      finalValue = atomicBoolean.load();
      expect(oldValue).assertEqual(true);
      expect(finalValue).assertEqual(true);
    });

    /**
     * @tc.name   comboMultipleAtomicInt001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_MULTIPLE_ATOMIC_INT_0100
     * @tc.desc   Verify multiple AtomicInt instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboMultipleAtomicInt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(0);
      let atomicInt2 = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicInt1.fetchAdd(1);
        });
      }

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          atomicInt2.fetchAdd(1);
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(atomicInt1.load()).assertEqual(10);
      expect(atomicInt2.load()).assertEqual(10);
    });

    /**
     * @tc.name   comboAtomicIntCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_INT_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicInt compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicIntCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicInt.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   comboAtomicReferenceCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_REFERENCE_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicReference compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicReferenceCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicRef.compareAndSwap(0, 1); // int值得数字不会比较成功
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(10);
      expect(atomicRef.load()).assertEqual(0);
    });

    /**
     * @tc.name   comboAtomicLongCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_LONG_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicLong compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicLongCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicLong.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicLong.load()).assertEqual(1);
    });

    /**
     * @tc.name   comboAtomicFloatCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_FLOAT_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicFloat compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicFloatCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicFloat.compareAndSwap(0.0f, 1.5f);
          if (result === 0.0f) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicFloat.load()).assertEqual(1.5f);
    });

    /**
     * @tc.name   comboAtomicDoubleCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_DOUBLE_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicDouble compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicDoubleCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicDouble.compareAndSwap(0.0, 1.5);
          if (result === 0.0) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicDouble.load()).assertEqual(1.5);
    });

    /**
     * @tc.name   comboAtomicByteCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_BYTE_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicByte compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicByteCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicByte.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicByte.load()).assertEqual(1);
    });

    /**
     * @tc.name   comboAtomicShortCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_SHORT_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicShort compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicShortCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicShort.compareAndSwap(0, 1);
          if (result === 0) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicShort.load()).assertEqual(1);
    });

    /**
     * @tc.name   comboAtomicCharCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_CHAR_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicChar compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicCharCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicChar.compareAndSwap(c'A', c'B');
          if (result === c'A') {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicChar.load()).assertEqual(c'B');
    });

    /**
     * @tc.name   comboAtomicBooleanCompareAndSwap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COMBO_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_0100
     * @tc.desc   Verify AtomicBoolean compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('comboAtomicBooleanCompareAndSwap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let successCount = new AtomicInt(0);
      let eaws: EAWorker[] = [];

      for (let i = 0; i < 10; i++) {
        let eaw = new EAWorker();
        eaw.start();
        eaws.push(eaw);
        eaw.run<void>((): void => {
          let result = atomicBoolean.compareAndSwap(false, true);
          if (result === false) {
            successCount.fetchAdd(1);
          }
        });
      }

      eaws.forEach((eaw) => {
        eaw.quit()
      })
      expect(successCount.load()).assertEqual(1);
      expect(atomicBoolean.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicRefTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_TASKPOOL_0100
     * @tc.desc   Verify AtomicReference TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let finalValue:number = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicRef.store(i);
          let value = atomicRef.load();
          atomicRef.exchange(i + 1);
          atomicRef.compareAndSwap(value, i + 2);
          finalValue = atomicRef.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue >= 1 && finalValue <= 100).assertTrue();
    });

    /**
     * @tc.name   atomicRefTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_REFERENCE_TASKPOOL_0200
     * @tc.desc   Verify AtomicReference TaskPool multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicRefTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let finalValue:number = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicRef.store(i);
          let v1 = atomicRef.load();
          let v2 = atomicRef.exchange(i + 1);
          let v3 = atomicRef.compareAndSwap(v1, i + 2);
          finalValue = atomicRef.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue >= 1 && finalValue <= 100).assertTrue();
    });

    /**
     * @tc.name   atomicIntTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_TASKPOOL_0100
     * @tc.desc   Verify AtomicInt TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicInt.fetchAdd(1);
          atomicInt.fetchSub(1);
          atomicInt.fetchAnd(0xFF);
          atomicInt.fetchOr(0x10);
          atomicInt.fetchXor(0x10);
          finalValue = atomicInt.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue==0 || finalValue==16).assertEqual(true);
    });

    /**
     * @tc.name   atomicIntTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_INT_TASKPOOL_0200
     * @tc.desc   Verify AtomicInt TaskPool arithmetic sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let finalValue = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicInt.fetchAdd(10);
          atomicInt.fetchSub(5);
          finalValue = atomicInt.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(500);
    });

    /**
     * @tc.name   atomicLongTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_LONG_TASKPOOL_0100
     * @tc.desc   Verify AtomicLong TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let finalValue: long = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicLong.store(i);
          atomicLong.fetchAdd(1);
          atomicLong.fetchSub(1);
          atomicLong.fetchAnd(0xFFFFFFFF);
          finalValue = atomicLong.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue >= 0 && finalValue <= 99).assertTrue();
    });

    /**
     * @tc.name   atomicLongTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_LONG_TASKPOOL_0200
     * @tc.desc   Verify AtomicLong TaskPool large value operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let finalValue: long = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicLong.fetchAdd(1000);
          finalValue = atomicLong.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(100000);
    });

    /**
     * @tc.name   atomicShortTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_SHORT_TASKPOOL_0100
     * @tc.desc   Verify AtomicShort TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let finalValue = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicShort.store(i.toShort());
          atomicShort.fetchAdd(1);
          atomicShort.fetchSub(1);
          atomicShort.fetchAnd(0xFF);
          finalValue = Short.toInt(atomicShort.load());
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue >=0 && finalValue <=99).assertTrue();
    });

    /**
     * @tc.name   atomicShortTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_SHORT_TASKPOOL_0200
     * @tc.desc   Verify AtomicShort TaskPool bit operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort = new AtomicShort(0);
      let finalValue = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicShort.fetchAnd(0xFF);
          atomicShort.fetchOr(0x10);
          atomicShort.fetchXor(0x10);
          finalValue = Short.toInt(atomicShort.load());
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue==0 || finalValue==16).assertEqual(true);
    });

    /**
     * @tc.name   atomicByteTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BYTE_TASKPOOL_0100
     * @tc.desc   Verify AtomicByte TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let finalValue = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute((index: int) => {
          atomicByte.store(index.toByte());
          atomicByte.fetchAdd(1);
          atomicByte.fetchSub(1);
          atomicByte.fetchAnd(127);
          finalValue = Byte.toInt(atomicByte.load());
        }, i).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue >=0 && finalValue <=99).assertTrue();
    });

    /**
     * @tc.name   atomicByteTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BYTE_TASKPOOL_0200
     * @tc.desc   Verify AtomicByte TaskPool fetch operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let finalValue = 0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicByte.fetchAdd(1);
          atomicByte.fetchSub(1);
          finalValue = Byte.toInt(atomicByte.load());
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(0);
    });

    /**
     * @tc.name   atomicCharTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_CHAR_TASKPOOL_0100
     * @tc.desc   Verify AtomicChar TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let finalValue = c'A';
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicChar.store(c'B');
          atomicChar.exchange(c'C');
          atomicChar.compareAndSwap(c'C', c'D');
          finalValue = atomicChar.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(c'D');
    });

    /**
     * @tc.name   atomicCharTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_CHAR_TASKPOOL_0200
     * @tc.desc   Verify AtomicChar TaskPool multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'A');
      let finalValue = c'A';
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicChar.load();
          atomicChar.store(c'B');
          atomicChar.exchange(c'C');
          finalValue = atomicChar.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(c'C');
    });

    /**
     * @tc.name   atomicFloatTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_FLOAT_TASKPOOL_0100
     * @tc.desc   Verify AtomicFloat TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let finalValue = 0.0f;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicFloat.store(1.5f);
          atomicFloat.fetchAdd(0.5f);
          atomicFloat.fetchSub(0.5f);
          finalValue = atomicFloat.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(1.5f);
    });

    /**
     * @tc.name   atomicFloatTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_FLOAT_TASKPOOL_0200
     * @tc.desc   Verify AtomicFloat TaskPool exchange and CAS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(0.0f);
      let finalValue = 0.0f;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicFloat.exchange(1.5f);
          atomicFloat.compareAndSwap(1.5f, 2.5f);
          finalValue = atomicFloat.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(2.5f);
    });

    /**
     * @tc.name   atomicDoubleTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_DOUBLE_TASKPOOL_0100
     * @tc.desc   Verify AtomicDouble TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let finalValue = 0.0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicDouble.store(1.5);
          atomicDouble.fetchAdd(0.5);
          atomicDouble.fetchSub(0.5);
          finalValue = atomicDouble.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(1.5);
    });

    /**
     * @tc.name   atomicDoubleTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_DOUBLE_TASKPOOL_0200
     * @tc.desc   Verify AtomicDouble TaskPool exchange and CAS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.0);
      let finalValue = 0.0;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicDouble.exchange(1.5);
          atomicDouble.compareAndSwap(1.5, 2.5);
          finalValue = atomicDouble.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(2.5);
    });

    /**
     * @tc.name   atomicBooleanTaskPoolFullInterface001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BOOLEAN_TASKPOOL_0100
     * @tc.desc   Verify AtomicBoolean TaskPool full interface combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicBooleanTaskPoolFullInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let finalValue = false;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicBoolean.store(true);
          atomicBoolean.exchange(false);
          atomicBoolean.compareAndSwap(false, true);
          finalValue = atomicBoolean.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(true);
    });

    /**
     * @tc.name   atomicBooleanTaskPoolFullInterface002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ATOMIC_BOOLEAN_TASKPOOL_0200
     * @tc.desc   Verify AtomicBoolean TaskPool load and store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicBooleanTaskPoolFullInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicBoolean = new AtomicBoolean(false);
      let finalValue = false;
      let count = 0;
      for (let i = 0; i < 100; i++) {
        taskpool.execute(() => {
          atomicBoolean.load();
          atomicBoolean.store(true);
          finalValue = atomicBoolean.load();
        }).then(() => {
          count++
        });
      }
      while (count < 100) {
        await sleep(100)
      }
      expect(finalValue).assertEqual(true);
    });

  });
}
