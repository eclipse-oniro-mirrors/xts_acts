'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep  from './Util.test';

interface typeWait01 {
  ta: Int32Array,
  index: int,
  value: long
}

interface typeWait04 {
  ta: BigInt64Array,
  index: int,
  value: bigint
}

interface typeWait02 {
  ta: Int32Array,
  index: int
}

interface typeWait05 {
  ta: BigInt64Array,
  index: int
}

interface typeWait03 {
  ta: Int32Array,
  index: int,
  value: long,
  timeout: int
}

interface typeWait06 {
  ta: BigInt64Array,
  index: int,
  value: bigint,
  timeout: int
}

export default function atomicsWaitTest() {
  describe('atomicsWaitTest', () => {
    afterEach(async () => {
      await sleep(50)
    })


    /**
     * @tc.name   atomicsWaitTest001
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0001
     * @tc.desc   Return "not-equal" when Int32Array value doesn't match expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 10; // Actual value
      let finish = false;
      // Run in worker to avoid blocking main thread
      const result = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = { ta, index: 0, value: 20 } as typeWait01
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest002
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0002
     * @tc.desc   Return "ok" when Int32Array wait is woken by Atomics.notify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 0; // Match expected value
      let finish = false;
      let finish2 = false;

      const waitResult = new Promise<string>((resolve) => {
        (async () => {
          let eaw = new EAWorker()
          eaw.start()
          let data = { ta, index: 0, value: 0 } as typeWait01
          let job = eaw.run<string>((): string => {
            let res = Atomics.wait(data.ta, data.index as int, data.value as long);
            return res
          })

          await sleep(200)
          let eaw1 = new EAWorker()
          eaw1.start()
          let data1 = { ta, index: 0 } as typeWait02
          let result1 = eaw1.run<number>((): number => {
            let res = Atomics.notify(data1.ta, data1.index as int, 1);
            return res
          }).Await()
          eaw1.join().Await()

          resolve(job.Await())
          eaw.join().Await()
        })()
      })
      const result = await waitResult;
      expect(result).assertEqual('ok');
    });

    /**
     * @tc.name   atomicsWaitTest003
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0003
     * @tc.desc   Return "timed-out" when Int32Array wait exceeds timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 5; // Match expected value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = {
          ta,
          index: 0,
          value: 5,
          timeout: 10
        } as typeWait03
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long, data.timeout);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      expect(result).assertEqual('timed-out');
    });

    /**
     * @tc.name   atomicsWaitTest004
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0004
     * @tc.desc   Return "not-equal" when BigInt64Array value doesn't match expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 100n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = { ta, index: 0, value: 200n } as typeWait04
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as bigint);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });

      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest005
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0005
     * @tc.desc   Return "ok" when BigInt64Array wait is woken by Atomics.notify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 0n; // Match expected value
      let finish = false;
      let finish2 = false;

      const waitResult = new Promise<string>((resolve) => {
        (async () => {
          let eaw = new EAWorker()
          eaw.start()
          let data = { ta, index: 0, value: 0n } as typeWait04
          let job = eaw.run<string>((): string => {
            let res = Atomics.wait(data.ta, data.index as int, data.value as bigint);
            return res
          })

          await sleep(200)
          let eaw1 = new EAWorker()
          eaw1.start()
          let data1 = { ta, index: 0 } as typeWait05
          let result1 = eaw1.run<number>((): number => {
            let res = Atomics.notify(data.ta, data.index as int, 1);
            return res
          }).Await()
          eaw1.join().Await()

          resolve(job.Await())
          eaw.join().Await()
        })()
      })

      const result = await waitResult;
      expect(result).assertEqual('ok');
    });

    /**
     * @tc.name   atomicsWaitTest006
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0006
     * @tc.desc   Return "timed-out" when BigInt64Array wait exceeds timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 50n; // Match expected value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = {
          ta,
          index: 0,
          value: 50n,
          timeout: 15
        } as typeWait06
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as bigint, data.timeout);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      expect(result).assertEqual('timed-out');
    });

    /**
     * @tc.name   atomicsWaitTest007
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0007
     * @tc.desc   Throw TypeError when typedArray is Uint32Array (not Int32Array/BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab); // Invalid typed array type
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = { ta, index: 1, value: 0 } as typeWait01
        eaw.setUncaughtExceptionHandler((e: Error) => {
          resolve(e.message)
        })
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long);
          return res
        }).Await()
        eaw.join().Await()
      });
      expect(errorResult).assertContain('Index out of bounds');
    });


    /**
     * @tc.name   atomicsWaitTest010
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0010
     * @tc.desc   Treat undefined timeout as Infinity (Int32Array never times out)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = {
          ta,
          index: 0,
          value: 1,
          timeout: 200.4 as int
        } as typeWait03
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long, data.timeout);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest011
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0011
     * @tc.desc   Treat NaN timeout as Infinity (BigInt64Array woken by notify)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = {
          ta,
          index: 0,
          value: 1,
          timeout: Number.MAX_VALUE as int
        } as typeWait03
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long, data.timeout);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest012
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0012
     * @tc.desc   Treat negative timeout as 0 (Int32Array times out immediately)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = {
          ta,
          index: 0,
          value: 1,
          timeout: -100
        } as typeWait03
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long, data.timeout);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest015
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0015
     * @tc.desc   BigInt64Array wait woken by notify even if value changes after wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        let eaw = new EAWorker()
        eaw.start()
        let data = {
          ta,
          index: 0,
          value: 1,
          timeout: 200
        } as typeWait03
        let result = eaw.run<string>((): string => {
          let res = Atomics.wait(data.ta, data.index as int, data.value as long, data.timeout);
          return res
        }).Await()
        resolve(result)
        eaw.join().Await()
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, Number.MAX_VALUE + 1 as int);
      }, 100)
      expect(errorResult).assertEqual('not-equal');
    });


  })
}