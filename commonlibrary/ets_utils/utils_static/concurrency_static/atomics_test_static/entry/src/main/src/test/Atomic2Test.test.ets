'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep from './Util.test';


export default function atomics2Test() {
  describe('atomics2Test', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   atomicsAddTest057
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0157
     * @tc.desc   Test with BigUint64Array and large addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const largeValue = BigInt('18446744073709551615'); // Maximum value for BigUint64

      const oldValue = Atomics.add(ta, 0, largeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(largeValue);
    });


    /**
     * @tc.name   atomicsAndTest087
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0087
     * @tc.desc   Test Atomics.and with BigUint64Array in Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16); // 2 BigUint64Array elements (8 bytes each)
      const bua64 = new BigUint64Array(sab);
      bua64[0] = 1311768467463790320n;
      bua64[1] = 18364758544493064720n;

      // Parallel Atomics.and on BigUint64Array via Promise.all
      const result = await Promise.all([
        Promise.resolve(Atomics.and(bua64, 0, 18446462598732906495n)),
        Promise.resolve(Atomics.and(bua64, 1, 281470681808895n))
      ]);

      expect(result[0]).assertEqual(1311768467463790320n);
      expect(result[1]).assertEqual(18364758544493064720n);
      expect(bua64[0]).assertEqual(1311673391471714032n); // Masked result for index 0
      expect(bua64[1]).assertEqual(205161997808144n); // Masked result for index 1
    });


    /**
     * @tc.name   atomicsExchangeTest008
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_008
     * @tc.desc   Test with BigUint64Array: replace 64-bit unsigned BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 18446744073709551615n;
      const oldValue = Atomics.exchange(bua, 0, 1n);
      expect(oldValue).assertEqual(18446744073709551615n);
      expect(bua[0]).assertEqual(1n);
    });


    /**
     * @tc.name   atomicsExchangeTest037
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_037
     * @tc.desc   Test exchange on BigUint64Array with large positive BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 9223372036854775808n; // Mid BigUint64 value
      const oldValue = Atomics.exchange(bua, 0, 1000000000000000n);
      expect(oldValue).assertEqual(9223372036854775808n);
      expect(bua[0]).assertEqual(1000000000000000n);
    });

    /**
     * @tc.name   atomicsLoadTest008
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0008
     * @tc.desc   Load value from BigUint64Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 18446744073709551615n;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(18446744073709551615n);
    });
    /**
     * @tc.name   atomicsLoadTest082
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0082
     * @tc.desc   Load value from BigUint64Array in Promise.race with multiple valid loaders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 9876543210987654321n;

      // Multiple valid loaders with different delays
      const loader1 = new Promise<bigint>((resolve) => {
        setTimeout(() => resolve(Atomics.load(ta, 0)), 50)
      }
      );
      const loader2 = new Promise<bigint>((resolve) => {
        setTimeout(() => resolve(Atomics.load(ta, 0)), 2)
      }
      );

      const raceResult = await Promise.race([loader1, loader2]);
      expect(raceResult).assertEqual(9876543210987654321n);
    });


    /**
     * @tc.name   atomicsStoreTest008
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0008
     * @tc.desc   Store BigInt value to BigUint64Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const storedVal = Atomics.store(ta, 0, 18446744073709551615n);
      expect(storedVal).assertEqual(18446744073709551615n);
      expect(ta[0]).assertEqual(18446744073709551615n);
    });


    /**
     * @tc.name   atomicsStoreTest068
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0068
     * @tc.desc   Promise.allSettled with mixed valid/invalid Uint8Array stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2); // 2 Uint8 elements
      const ta = new Uint8Array(sab);
      const validVal: int = 200;
      const invalidIdx1: int = -5;
      const invalidIdx2: int = -2;

      const promises = [
        Promise.resolve().then((): number => Atomics.store(ta, 1, validVal.toLong())),
        Promise.resolve().then((): number => Atomics.store(ta, invalidIdx1 as int, 100)),
        Promise.resolve().then((): number => Atomics.store(ta, invalidIdx2 as int, 50))
      ];

      const results = await Promise.allSettled(promises);
      // Valid store result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(validVal);
      expect(ta[1]).assertEqual(validVal);
      // Invalid store results
      expect(results[1].status).assertEqual('rejected');
      expect(results[2].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index');
      expect((results[2] as PromiseRejectedResult).reason.message).assertContain('Index');
    });


    /**
     * @tc.name   atomicsStoreTest086
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0086
     * @tc.desc   Promise.allSettled with Uint8Array store and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2); // 2 Uint8 elements
      const ta = new Uint8Array(sab);
      const validVal: int = 255;

      const promises = [
        Promise.resolve().then((): number => Atomics.store(ta, 0, validVal.toLong())), // Valid
        Promise.resolve().then((): number => Atomics.store(ta, -5, 100)), // Invalid
        Promise.resolve().then((): number => Atomics.store(ta, -1, 50))// Invalid
      ];

      const results = await Promise.allSettled(promises);
      let validStored: int = 0;
      let errorCount: int = 0;

      results.forEach((res) => {
        if (res.status === 'fulfilled') {
          validStored++;
          expect((res as PromiseFulfilledResult<number>).value).assertEqual(validVal);
        } else {
          errorCount++;
          expect((res as PromiseRejectedResult).reason.message).assertContain('Index');
        }
      });

      expect(validStored).assertEqual(1);
      expect(errorCount).assertEqual(2);
      expect(ta[0]).assertEqual(validVal);
    });


    /**
     * @tc.name   atomicsStoreTest058
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0058
     * @tc.desc   Nested arrow store for Uint8Array with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      const rangeCheckStore = (arr: Uint8Array, idx: int, val: number, min: number, max: number) => {
        const storedVal = Atomics.store(arr, idx as int, val.toLong());
        return storedVal >= min && storedVal <= max ? storedVal : 'Out of range';
      }

      expect(rangeCheckStore(ta, 0, 150, 100, 200)).assertEqual(150);
      expect(rangeCheckStore(ta, 0, 250, 200, 300)).assertEqual(250);
      expect(ta[0]).assertEqual(250);
    });


    /**
     * @tc.name   atomicsStoreTest044
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0044
     * @tc.desc   Arrow function for Uint8Array store with even index check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(3); // 3 Uint8 elements
      const ta = new Uint8Array(sab);
      const evenIndexStore = (arr: Uint8Array, idx: int, val: number) =>
      idx % 2 === 0 ? Atomics.store(arr, idx as int, val.toLong()) : 'Odd index'

      expect(evenIndexStore(ta, 2, 255)).assertEqual(255);
      expect(evenIndexStore(ta, 1, 100)).assertEqual('Odd index');
      expect(ta[2]).assertEqual(255);
      expect(ta[1]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsStoreTest028
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0028
     * @tc.desc   Store value to Uint8Array then overwrite with new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      Atomics.store(ta, 0, 50);
      const storedVal = Atomics.store(ta, 0, 150);
      expect(storedVal).assertEqual(150);
      expect(ta[0]).assertEqual(150);
    });


    /**
     * @tc.name   atomicsStoreTest006
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0006
     * @tc.desc   Store value to Uint16Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Uint16Array(sab);
      const storedVal = Atomics.store(ta, 0, 65535);
      expect(storedVal).assertEqual(65535);
      expect(ta[0]).assertEqual(65535);
    });


    /**
     * @tc.name   atomicsStoreTest004
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0004
     * @tc.desc   Store value to Uint8Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      const storedVal = Atomics.store(ta, 0, 255);
      expect(storedVal).assertEqual(255);
      expect(ta[0]).assertEqual(255);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest049
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_049
     * @tc.desc   Test Uint16Array exchange with mid-range value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 32768; // Mid-range of Uint16 (0-65535)
      const oldValue = Atomics.compareExchange(ua, 0, 32768, 16384);
      expect(oldValue).assertEqual(32768);
      expect(ua[0]).assertEqual(16384);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest042
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_042
     * @tc.desc   Test Uint8Array exchange with value 128 (mid-range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 128;
      const oldValue = Atomics.compareExchange(ua, 0, 128, 64);
      expect(oldValue).assertEqual(128);
      expect(ua[0]).assertEqual(64);
    });


    /**
     * @tc.name   atomicsCompareExchangeTest034
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_034
     * @tc.desc   Test Uint16Array exchange with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = Atomics.compareExchange(ua, 0, 65535, 65536); // 65536 mod 65536 = 0
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest025
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_025
     * @tc.desc   Test with Uint16Array maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      const maxUint16: int = 65535;
      ua[0] = maxUint16;
      const oldValue = Atomics.compareExchange(ua, 0, maxUint16.toLong(), 100);
      expect(oldValue).assertEqual(maxUint16);
      expect(ua[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest019
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_019
     * @tc.desc   Test value overflow for Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.compareExchange(ua, 0, 255, 260); // 260 mod 256 = 4
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest006
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_006
     * @tc.desc   Test with Uint16Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 60000;
      const oldValue = Atomics.compareExchange(ua, 0, 60000, 1000);
      expect(oldValue).assertEqual(60000);
      expect(ua[0]).assertEqual(1000);
    });


    /**
     * @tc.name   atomicsCompareExchangeTest004
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_004
     * @tc.desc   Test with Uint8Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 250;
      const oldValue = Atomics.compareExchange(ua, 0, 250, 10);
      expect(oldValue).assertEqual(250);
      expect(ua[0]).assertEqual(10);
    });


    /**
     * @tc.name   atomicsExchangeTest084
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_084
     * @tc.desc   Test async exchange with Promise.allSettled and error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12); // 3 Int32: [A, B, C]
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;
      ia[2] = 25;
      const errorLogs: string[] = [];

      // Async exchange function (may throw)
      const exchangeWithError = async (index: int, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (index === 1) {
              const errMsg = `Index 1 update failed`;
              errorLogs.push(errMsg);
              reject(new Error(errMsg));
            }
            const old = Atomics.exchange(ia, index as int, newValue.toLong());
            resolve(old);
          }, 3);
        });
      };

      // Run multiple exchanges with Promise.allSettled
      const results = await Promise.allSettled([
        exchangeWithError(0, 10), // Success
        exchangeWithError(1, 20), // Failure
        exchangeWithError(2, 30)// Success
      ]);

      // Verify results
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Index 1 update failed');
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(25);
      expect(errorLogs).assertDeepEquals(['Index 1 update failed']);
      expect(ia[0]).assertEqual(10); // Updated
      expect(ia[1]).assertEqual(20); // Not updated
      expect(ia[2]).assertEqual(30); // Updated
    });
    /**
     * @tc.name   atomicsExchangeTest070
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_070
     * @tc.desc   Test async exchange with nested error propagation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let errorPropagated = false;

      // Inner function that may throw
      const innerExchange = async (index: int, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (newValue < 0) {
              reject(new Error('Negative value not allowed'));
            }
            const old = Atomics.exchange(ia, index as int, newValue.toLong());
            resolve(old);
          }, 3);
        });
      };

      // Outer function that propagates error
      const outerExchange = async (): Promise<boolean> => {
        try {
          await innerExchange(0, 10); // Valid
          await innerExchange(0, -5); // Invalid (throws)
          return true;
        } catch (err) {
          errorPropagated = true;
          expect((err as Error).message).assertEqual('Negative value not allowed');
          return false;
        }
      };

      const success = await outerExchange();
      expect(success).assertEqual(false);
      expect(errorPropagated).assertEqual(true);
      expect(ia[0]).assertEqual(-5); // First exchange persists
    });


    /**
     * @tc.name   atomicsExchangeTest058
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_058
     * @tc.desc   Test async exchange with Promise.allSettled for partial success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // Async exchange function (may throw)
      const partialExchange = async (index: int, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (index === 1) {
              reject(new Error('Index 1 blocked'));
            }
            const old = Atomics.exchange(ia, index as int, newValue.toLong());
            resolve(old);
          }, 4);
        });
      };

      // Run partial exchanges
      const results = await Promise.allSettled([
        partialExchange(0, 10), // Success
        partialExchange(1, 20)// Failure
      ]);

      // Verify results
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Index 1 blocked');
      expect(ia[0]).assertEqual(10); // Updated
      expect(ia[1]).assertEqual(20); // Not updated
    });
    
    /**
     * @tc.name   atomicsExchangeTest093
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_093
     * @tc.desc   Test async exchange with Promise.race between exchange and state change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let stateChanged = false;

      // Exchange task: tries to update to 20
      const exchangeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.exchange(ia, 0, 20);
          resolve(oldValue);
        }, 180);
      });

      // State change task: modifies value before exchange completes
      const stateChangeTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 15); // Changes state
          stateChanged = true;
          resolve(undefined);
        }, 50);
      });

      // Race exchange and state change
      const oldValue = await Promise.all([exchangeTask, stateChangeTask]);
      expect(stateChanged).assertEqual(true);
      expect(oldValue[0]).assertEqual(15); // Exchange uses modified state
      expect(ia[0]).assertEqual(20); // Exchange completes after state change
    });

  })
}