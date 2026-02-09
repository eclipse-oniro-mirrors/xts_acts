'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep  from './Util.test';

// Class with static shared SharedArrayBuffer
class StaticAtomic {
  private static sab = new ArrayBuffer(4);
  private static ia = new Int32Array(StaticAtomic.sab);

  // Async exchange method (shares state across instances)
  static async exchange(newValue: number): Promise<number> {
    return new Promise<number>((resolve) => {
      setTimeout(() => {
        const old = Atomics.exchange(StaticAtomic.ia, 0, newValue as long);
        resolve(old);
      }, 3);
    });
  }

  static getValue(): number {
    return StaticAtomic.ia[0];
  }
}

// Base class with exchange logic
abstract class BaseValidator {
  protected ia: Int32Array;

  constructor(sab: ArrayBuffer) {
    this.ia = new Int32Array(sab);
  }

  // Abstract validation (to be overridden)
  protected abstract validate(newValue: number): Promise<boolean>;

  // Common exchange logic
  async update(newValue: number): Promise<boolean> {
    const isValid = await this.validate(newValue);
    if (!isValid) {
      return false;
    }

    return new Promise<boolean>((resolve) => {
      setTimeout(() => {
        Atomics.exchange(this.ia, 0, newValue as long);
        resolve(true);
      }, 3);
    });
  }

  getValue(): number {
    return this.ia[0];
  }
}

// Subclass: validates even values
class EvenValidator extends BaseValidator {
  protected async validate(newValue: number): Promise<boolean> {
    return new Promise<boolean>((resolve) => {
      setTimeout(() => {
        resolve(newValue % 2 === 0)
      }, 2);
    });
  }

  constructor(sab: ArrayBuffer) {
    super(sab);
  }
}

class AtomicUpdater {
  private ia: Int32Array;

  constructor(sab: ArrayBuffer) {
    this.ia = new Int32Array(sab);
  }

  // Nested async method: exchange + verification
  async updateAndVerify(index: int, newValue: number): Promise<boolean> {
    const oldValue = await this._exchange(index, newValue);
    return this._verify(index, newValue);
  }

  // Private exchange method
  private async _exchange(index: int, newValue: number): Promise<number> {
    return new Promise<number>((resolve) => {
      setTimeout(() => {
        const old = Atomics.exchange(this.ia, index as int, newValue as long);
        resolve(old);
      }, 3);
    });
  }

  // Private verification method
  private async _verify(index: int, expected: number): Promise<boolean> {
    return new Promise<boolean>((resolve) => {
      setTimeout(() => {
        resolve(this.ia[index] === expected);
      }, 2);
    });
  }

  public getIa() {
    return this.ia
  }
}

// Base class with atomic exchange
class BaseAtomic {
  protected ia: Int32Array;

  constructor(sab: ArrayBuffer) {
    this.ia = new Int32Array(sab);
  }

  protected async _exchange(index: int, newValue: number): Promise<number> {
    return new Promise<number>((resolve) => {
      setTimeout(() => {
        const old = Atomics.exchange(this.ia, index as int, newValue as long);
        resolve(old);
      }, 3);
    });
  }
}

// Subclass with specific update logic
class AtomicDataUpdater extends BaseAtomic {
  async updateData(newValue: number): Promise<boolean> {
    const old = await this._exchange(0, newValue);
    return old !== newValue; // Verify value changed
  }

  constructor(sab: ArrayBuffer) {
    super(sab);
  }

  getData(): number {
    return this.ia[0];
  }
}

class SharedAtomic {
  private ia: Int32Array;
  private index: int;

  constructor(sab: ArrayBuffer, index: int) {
    this.ia = new Int32Array(sab);
    this.index = index;
  }

  // Async exchange method
  async setValue(newValue: number): Promise<number> {
    return new Promise<number>((resolve) => {
      setTimeout(() => {
        const old = Atomics.exchange(this.ia, this.index as int, newValue as long);
        resolve(old);
      }, 3);
    });
  }

  getValue(): number {
    return this.ia[this.index];
  }
}


export default function atomicsExchangeTest() {
  describe('atomicsExchangeTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   atomicsExchangeTest001
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_001
     * @tc.desc   Test basic usage with Int32Array: replace value and return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.exchange(ia, 0, 20);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest002
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_002
     * @tc.desc   Test with Uint8Array: replace unsigned 8-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.exchange(ua, 0, 10);
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest003
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_003
     * @tc.desc   Test with Int8Array: replace signed 8-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.exchange(ia, 0, 127);
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(127);
    });

    /**
     * @tc.name   atomicsExchangeTest004
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_004
     * @tc.desc   Test with Uint16Array: replace unsigned 16-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = Atomics.exchange(ua, 0, 32768);
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(32768);
    });

    /**
     * @tc.name   atomicsExchangeTest005
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_005
     * @tc.desc   Test with Int16Array: replace signed 16-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = -32768;
      const oldValue = Atomics.exchange(ia, 0, 32767);
      expect(oldValue).assertEqual(-32768);
      expect(ia[0]).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsExchangeTest006
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_006
     * @tc.desc   Test with Uint32Array: replace unsigned 32-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 4294967295;
      const oldValue = Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(4294967295);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest007
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_007
     * @tc.desc   Test with BigInt64Array: replace 64-bit signed BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = -9007199254740991n;
      const oldValue = Atomics.exchange(ba, 0, 9007199254740991n);
      expect(oldValue).assertEqual(-9007199254740991n);
      expect(ba[0]).assertEqual(9007199254740991n);
    });


    /**
     * @tc.name   atomicsExchangeTest009
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_009
     * @tc.desc   Test exchange at non-zero index of Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 1;
      ia[1] = 20;
      const oldValue = Atomics.exchange(ia, 1, 30);
      expect(oldValue).assertEqual(20);
      expect(ia[1]).assertEqual(30);
      expect(ia[0]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsExchangeTest010
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_010
     * @tc.desc   Test exchange with zero value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.exchange(ia, 0, 100);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsExchangeTest011
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_011
     * @tc.desc   Test throw TypeError with non-integer typed array (Float32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 20; // Source
      ia[1] = 5; // Target

      // Transfer 3 from source to target (atomic exchange + add)
      const oldSource = Atomics.exchange(ia, 0, ia[0] - 3 as long);
      Atomics.add(ia, 1, 3);

      expect(oldSource).assertEqual(20);
      expect(ia[0]).assertEqual(17);
      expect(ia[1]).assertEqual(8);
    });

    /**
     * @tc.name   atomicsExchangeTest012
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_012
     * @tc.desc   Test throw RangeError with index out of bounds (exceed length)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.exchange(ia, 1, 5)
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsExchangeTest013
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_013
     * @tc.desc   Test throw RangeError with negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.exchange(ia, -1, 5)
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsExchangeTest014
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_014
     * @tc.desc   Test throw TypeError with non-shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.exchange(ia, 0, 10)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest015
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_015
     * @tc.desc   Test multiple consecutive exchange calls on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      const old1 = Atomics.exchange(ia, 0, 20);
      const old2 = Atomics.exchange(ia, 0, 30);
      const old3 = Atomics.exchange(ia, 0, 40);

      expect(old1).assertEqual(10);
      expect(old2).assertEqual(20);
      expect(old3).assertEqual(30);
      expect(ia[0]).assertEqual(40);
    });

    /**
     * @tc.name   atomicsExchangeTest016
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_016
     * @tc.desc   Test exchange with maximum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      const maxInt32: int = 2147483647;
      ia[0] = maxInt32;
      const oldValue = Atomics.exchange(ia, 0, -1);
      expect(oldValue).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsExchangeTest017
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_017
     * @tc.desc   Test exchange with minimum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      const minInt32: int = -2147483648;
      ia[0] = minInt32;
      const oldValue = Atomics.exchange(ia, 0, 0);
      expect(oldValue).assertEqual(minInt32);
      expect(ia[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest018
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_018
     * @tc.desc   Test exchange on large SharedArrayBuffer (Int32Array with index 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(32); // 8 Int32 elements
      const ia = new Int32Array(sab);
      ia[5] = 123;
      const oldValue = Atomics.exchange(ia, 5, 456);
      expect(oldValue).assertEqual(123);
      expect(ia[5]).assertEqual(456);
      expect(ia[4]).assertEqual(0);
      expect(ia[6]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest019
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_019
     * @tc.desc   Test value overflow for Uint8Array in exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.exchange(ua, 0, 260); // 260 mod 256 = 4
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsExchangeTest020
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_020
     * @tc.desc   Test value underflow for Int8Array in exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.exchange(ia, 0, -130); // -130 mod 128 = 126
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(126);
    });

    /**
     * @tc.name   atomicsExchangeTest021
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_021
     * @tc.desc   Test exchange with same old and new value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      const oldValue = Atomics.exchange(ia, 0, 50);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsExchangeTest022
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_022
     * @tc.desc   Test throw TypeError with non-typed array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // 0: unlocked, 1: locked

      // Lock (atomic exchange)
      const lockResult = Atomics.exchange(ia, 0, 1);
      expect(lockResult).assertEqual(0); // Lock acquired
      expect(Atomics.load(ia, 0)).assertEqual(1);

      // Try lock again (should fail)
      const failedLock = Atomics.compareExchange(ia, 0, 0, 1);
      expect(failedLock).assertEqual(1);

      // Unlock (atomic exchange)
      const unlockResult = Atomics.exchange(ia, 0, 0);
      expect(unlockResult).assertEqual(1); // Lock released
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest023
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_023
     * @tc.desc   Test exchange with large positive value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1000000;
      const oldValue = Atomics.exchange(ia, 0, 2000000);
      expect(oldValue).assertEqual(1000000);
      expect(ia[0]).assertEqual(2000000);
    });

    /**
     * @tc.name   atomicsExchangeTest024
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_024
     * @tc.desc   Test exchange with large negative value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -500000;
      const oldValue = Atomics.exchange(ia, 0, -1000000);
      expect(oldValue).assertEqual(-500000);
      expect(ia[0]).assertEqual(-1000000);
    });

    /**
     * @tc.name   atomicsExchangeTest025
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_025
     * @tc.desc   Test exchange on Uint16Array with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = Atomics.exchange(ua, 0, 65536); // 65536 mod 65536 = 0
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest026
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_026
     * @tc.desc   Test exchange on Int16Array with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 32767;
      const oldValue = Atomics.exchange(ia, 0, 32768); // 32768 mod 65536 = -32768
      expect(oldValue).assertEqual(32767);
      expect(ia[0]).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicsExchangeTest027
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_027
     * @tc.desc   Test throw TypeError with non-integer value for BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // State: 0 (idle) →1 (processing) →2 (completed)

      // Transition 0→1 (idle→processing)
      const transition1 = Atomics.compareExchange(ia, 0, 0, 1);
      expect(transition1).assertEqual(0);
      expect(Atomics.load(ia, 0)).assertEqual(1);

      // Simulate processing (atomic add for progress)
      Atomics.add(ia, 0, 1); // 1→2 (processing→completed)
      const transition2 = Atomics.compareExchange(ia, 0, 2, 2);
      expect(transition2).assertEqual(2);

      // Reset state (atomic exchange)
      const reset = Atomics.exchange(ia, 0, 0);
      expect(reset).assertEqual(2);
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest028
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_028
     * @tc.desc   Test exchange on multiple indexes of Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;

      const old0 = Atomics.exchange(ia, 0, 100);
      const old1 = Atomics.exchange(ia, 1, 200);
      const old2 = Atomics.exchange(ia, 2, 300);

      expect(old0).assertEqual(10);
      expect(old1).assertEqual(20);
      expect(old2).assertEqual(30);
      expect(ia[0]).assertEqual(100);
      expect(ia[1]).assertEqual(200);
      expect(ia[2]).assertEqual(300);
    });

    /**
     * @tc.name   atomicsExchangeTest029
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_029
     * @tc.desc   Test exchange on Uint8Array with mid-range value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 128;
      const oldValue = Atomics.exchange(ua, 0, 64);
      expect(oldValue).assertEqual(128);
      expect(ua[0]).assertEqual(64);
    });

    /**
     * @tc.name   atomicsExchangeTest030
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_030
     * @tc.desc   Test exchange on Int8Array with mid-range negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -64;
      const oldValue = Atomics.exchange(ia, 0, 64);
      expect(oldValue).assertEqual(-64);
      expect(ia[0]).assertEqual(64);
    });
    /**
     * @tc.name   atomicsExchangeTest031
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_031
     * @tc.desc   Test exchange with zero index and zero initial value in Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ua = new Uint32Array(sab); // Initial value is 0 by default
      const oldValue = Atomics.exchange(ua, 0, 1000000);
      expect(oldValue).assertEqual(0);
      expect(ua[0]).assertEqual(1000000);
    });

    /**
     * @tc.name   atomicsExchangeTest032
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_032
     * @tc.desc   Test throw TypeError when SharedArrayBuffer is detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10; // Total resources

      // Allocate 3 resources (atomic exchange + sub)
      const currentResources = Atomics.exchange(ia, 0, Atomics.load(ia, 0) - 3);
      const remaining = Atomics.load(ia, 0);

      expect(currentResources).assertEqual(10);
      expect(remaining).assertEqual(7);
      // Revert allocation
      Atomics.add(ia, 0, 3);
      expect(Atomics.load(ia, 0)).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest033
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_033
     * @tc.desc   Test exchange with maximum Uint8 value (255) to minimum (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest034
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_034
     * @tc.desc   Test exchange with minimum Int8 value (-128) to maximum (127)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.exchange(ia, 0, 127);
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(127);
    });

    /**
     * @tc.name   atomicsExchangeTest035
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_035
     * @tc.desc   Test throw RangeError with index equal to typed array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      const length = ia.length; // Length is 2
      try {
        Atomics.exchange(ia, length as int, 5)
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsExchangeTest036
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_036
     * @tc.desc   Test exchange on BigInt64Array with large negative BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = -9223372036854775807n; // Min BigInt64 value
      const oldValue = Atomics.exchange(ba, 0, -1000000000000000n);
      expect(oldValue).assertEqual(-9223372036854775807n);
      expect(ba[0]).assertEqual(-1000000000000000n);
    });

    /**
     * @tc.name   atomicsExchangeTest038
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_038
     * @tc.desc   Test exchange with non-integer new value (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      try {
        Atomics.exchange(ia, 0, 15.5 as long)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest039
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_039
     * @tc.desc   Test exchange on Int16Array with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 50;
      const oldValue = Atomics.exchange(ia, 0, 100);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsExchangeTest040
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_040
     * @tc.desc   Test exchange on Uint16Array with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 500;
      const oldValue = Atomics.exchange(ua, 0, 1000);
      expect(oldValue).assertEqual(500);
      expect(ua[0]).assertEqual(1000);
    });

    /**
     * @tc.name   atomicsExchangeTest041
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_041
     * @tc.desc   Test throw TypeError with non-shared typed array from ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.exchange(ia, 0, 5)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest042
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_042
     * @tc.desc   Test exchange on Int32Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1;
      const oldValue = Atomics.exchange(ia, 0, 2);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(2);
    });

    /**
     * @tc.name   atomicsExchangeTest043
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_043
     * @tc.desc   Test exchange on Uint32Array with value 4294967294 (max-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ua = new Uint32Array(sab);
      const value = 4294967294; // Uint32 max is 4294967295
      ua[0] = value;
      const oldValue = Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(value);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest044
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_044
     * @tc.desc   Test exchange on BigInt64Array with zero BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;
      const oldValue = Atomics.exchange(ba, 0, 123456789n);
      expect(oldValue).assertEqual(0n);
      expect(ba[0]).assertEqual(123456789n);
    });

    /**
     * @tc.name   atomicsExchangeTest045
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_045
     * @tc.desc   Test exchange on BigUint64Array with zero BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 0n;
      const oldValue = Atomics.exchange(bua, 0, 987654321n);
      expect(oldValue).assertEqual(0n);
      expect(bua[0]).assertEqual(987654321n);
    });

    /**
     * @tc.name   atomicsExchangeTest046
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_046
     * @tc.desc   Test throw TypeError when index is non-integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.exchange(ia, 0.5 as int, 5)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest047
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_047
     * @tc.desc   Test exchange on Int8Array with value -1 (minimum negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -1;
      const oldValue = Atomics.exchange(ia, 0, -2);
      expect(oldValue).assertEqual(-1);
      expect(ia[0]).assertEqual(-2);
    });

    /**
     * @tc.name   atomicsExchangeTest048
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_048
     * @tc.desc   Test exchange on Uint8Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 1;
      const oldValue = Atomics.exchange(ua, 0, 2);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(2);
    });

    /**
     * @tc.name   atomicsExchangeTest049
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_049
     * @tc.desc   Test exchange on Int32Array with value -1 (minimum negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -1;
      const oldValue = Atomics.exchange(ia, 0, -2);
      expect(oldValue).assertEqual(-1);
      expect(ia[0]).assertEqual(-2);
    });

    /**
     * @tc.name   atomicsExchangeTest050
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_050
     * @tc.desc   Test exchange on Uint32Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 1;
      const oldValue = Atomics.exchange(ua, 0, 100);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsExchangeTest051
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_051
     * @tc.desc   Test async exchange with Promise.race between two updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Task 1: Exchange to 20
      const task1 = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 20);
          winner = 'task1';
          resolve(undefined);
        }, 5);
      });

      // Task 2: Exchange to 30 (same initial value)
      const task2 = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 30);
          winner = 'task2';
          resolve(undefined);
        }, 5);
      });

      // Race tasks and wait for completion
      await Promise.race([task1, task2]);
      await Promise.all([task1, task2]);

      expect(['task1', 'task2'].includes(winner)).assertTrue();
      let arr: number[] = [20, 30]
      expect(arr.includes(ia[0])).assertTrue(); // Matches winning task's value
    });

    /**
     * @tc.name   atomicsExchangeTest053
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_053
     * @tc.desc   Test async exchange with Promise.all for batch updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // Async exchange function for single index
      const batchExchange = async (index: int, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.exchange(ia, index as int, newValue as long);
            resolve(oldValue);
          }, 4);
        });
      };

      // Run batch updates in parallel
      const old = await Promise.all([
        batchExchange(0, 10),
        batchExchange(1, 20)
      ]);

      expect(old[0]).assertEqual(5);
      expect(old[1]).assertEqual(15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
    });


    /**
     * @tc.name   atomicsExchangeTest055
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_055
     * @tc.desc   Test nested exchange with async error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      // Inner exchange function with error check
      const safeExchange = async (index: int, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            try {
              if (index < 0 || index >= ia.length) {
                throw new RangeError('Invalid index');
              }
              const old = Atomics.exchange(ia, index as int, newValue as long);
              resolve(old);
            } catch (err) {
              errorCaught = true;
              reject(err);
            }
          }, 5);
        });
      };

      // Outer async function
      const runExchange = async (): Promise<boolean> => {
        try {
          await safeExchange(0, 10); // Valid
          await safeExchange(1, 15); // Invalid index
          return true;
        } catch (err) {
          expect((err as RangeError).message).assertEqual('Invalid index');
          return false;
        }
      };

      const success = await runExchange();
      expect(success).assertEqual(false);
      expect(errorCaught).assertEqual(true);
      expect(ia[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest056
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_056
     * @tc.desc   Test async exchange with timeout fallback using Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      let timeoutTriggered = false;

      // Slow exchange task (delayed to trigger timeout)
      const exchangeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, 18);
          resolve(old);
        }, 20);
      });

      // Timeout task
      const timeoutTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          timeoutTriggered = true;
          resolve(-1); // Fallback value
        }, 10);
      });

      // Race exchange and timeout
      const result = await Promise.race([exchangeTask, timeoutTask]);
      expect(timeoutTriggered).assertEqual(true);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(8); // No exchange (timeout won)
    });

    /**
     * @tc.name   atomicsExchangeTest057
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_057
     * @tc.desc   Test exchange in async class with nested methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const updater = new AtomicUpdater(sab);
      updater.updateAndVerify(0, 5); // Initial setup

      const isVerified = await updater.updateAndVerify(0, 15);
      expect(isVerified).assertEqual(true);
      expect(updater.getIa()[0]).assertEqual(15); // Access private for test
    });


    /**
     * @tc.name   atomicsExchangeTest060
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_060
     * @tc.desc   Test async exchange with closure capturing context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Factory function: creates closure with captured step size
      const createExchangeClosure = (step: number) => {
        return async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const current = ia[0];
              const old = Atomics.exchange(ia, 0, current + step as long);
              resolve(old);
            }, 3);
          });
        };
      };

      // Create closures with different step sizes
      const step2Exchange = createExchangeClosure(2);
      const step3Exchange = createExchangeClosure(3);

      // Execute exchanges via closures
      await step2Exchange(); // 0 → 2
      await step3Exchange(); // 2 → 5
      const lastOldValue = await step2Exchange(); // 5 → 7

      expect(lastOldValue).assertEqual(5);
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsExchangeTest062
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_062
     * @tc.desc   Test async exchange with Promise chaining for sequential updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // First exchange (index 0)
      const firstExchange = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, 10);
          resolve(old);
        }, 3);
      });

      // Chain to second exchange (index 1) after first completes
      const finalOldValue = await firstExchange
        .then((old0) => {
          expect(old0).assertEqual(5);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old1 = Atomics.exchange(ia, 1, 20);
              resolve(old1);
            }, 4);
          });
        });

      expect(finalOldValue).assertEqual(15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest065
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_065
     * @tc.desc   Test nested exchange with async finally for cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements (data + cleanup flag)
      const ia = new Int32Array(sab);
      ia[0] = 15; // Data
      ia[1] = 0; // Cleanup flag (0: not done, 1: done)
      let cleanupRan = false;

      // Nested exchange with finally cleanup
      const exchangeWithCleanup = async (newData: number): Promise<number> => {
        let oldData: number = -1;
        try {
          oldData = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(ia, 0, newData as long);
              resolve(old);
            }, 4);
          });
          return oldData;
        } finally {
          // Async cleanup (runs regardless of success)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 1, 1);
              cleanupRan = true;
              resolve(undefined);
            }, 2);
          });
        }
      };

      // Test successful exchange
      const oldData = await exchangeWithCleanup(25);
      // Test exchange with intentional error
      try {
        await exchangeWithCleanup(NaN); // Force invalid value
      } catch (err) {
      }

      expect(oldData).assertEqual(15);
      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(1);
      expect(cleanupRan).assertEqual(true); // Cleanup ran twice
    });


    /**
     * @tc.name   atomicsExchangeTest067
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_067
     * @tc.desc   Test exchange in async subclass with inherited method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const updater = new AtomicDataUpdater(sab);
      updater.updateData(10); // Initial setup

      const isUpdated = await updater.updateData(20);
      expect(isUpdated).assertEqual(true);
      expect(updater.getData()).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest068
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_068
     * @tc.desc   Test async exchange with dynamic index from Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;
      ia[2] = 25;

      // Promise that resolves to dynamic target index
      const getTargetIndex = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate async index selection (choose index 1)
          setTimeout(() => resolve(1), 4);
        });
      };

      // Exchange using dynamic index
      const dynamicIndexExchange = async (newValue: number): Promise<number> => {
        const index = await getTargetIndex();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, index as int, newValue as long);
            resolve(old);
          }, 3);
        });
      };

      const oldValue = await dynamicIndexExchange(30);
      expect(oldValue).assertEqual(15);
      expect(ia[1]).assertEqual(30); // Index 1 updated
      expect(ia[0]).assertEqual(5); // Index 0 unchanged
      expect(ia[2]).assertEqual(25); // Index 2 unchanged
    });

    /**
     * @tc.name   atomicsExchangeTest069
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_069
     * @tc.desc   Test nested exchange with async validation of new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let validationPassed = false;

      // Async validation: new value must be even
      const validateNewValue = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = newValue % 2 === 0;
            validationPassed = valid;
            resolve(valid);
          }, 3);
        });
      };

      // Nested: validate → exchange
      const validatedExchange = async (newValue: number): Promise<boolean> => {
        const isValid = await validateNewValue(newValue);
        if (!isValid) {
          return false;
        }

        const old = await new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(Atomics.exchange(ia, 0, newValue as long));
          }, 2);
        });

        return old !== newValue;
      };

      // Test valid exchange (even value)
      const success1 = await validatedExchange(20);
      // Test invalid exchange (odd value)
      const success2 = await validatedExchange(21);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(20); // Only first exchange succeeds
    });


    /**
     * @tc.name   atomicsExchangeTest071
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_071
     * @tc.desc   Test exchange in async closure with state persistence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Closure factory: persists target value
      const createTargetedExchange = (target: number) => {
        let currentStep: int = 0;
        // Closure captures target and currentStep
        return async (): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              currentStep++;
              const old = Atomics.exchange(ia, 0, currentStep as long);
              const reachedTarget = currentStep === target;
              resolve(reachedTarget);
            }, 3);
          });
        };
      };

      // Create closure with target 4
      const reachTarget4 = createTargetedExchange(4);
      let isReached = false;

      // Run until target is reached
      while (!isReached) {
        isReached = await reachTarget4();
      }

      expect(isReached).assertEqual(true);
      expect(ia[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsExchangeTest072
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_072
     * @tc.desc   Test async exchange with Promise.all and cross-index consistency check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements (A and B)
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      let isConsistent = false;

      // Exchange both indexes in parallel, check consistency
      const parallelExchange = async (newA: number, newB: number): Promise<boolean> => {
        // Run exchanges in parallel
        const old = await Promise.all([
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(Atomics.exchange(ia, 0, newA as long)), 3);
          }),
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(Atomics.exchange(ia, 1, newB as long)), 3);
          })
        ]);

        // Check if both exchanges used correct old values (consistency)
        isConsistent = old[0] === 10 && old[1] === 20;
        return isConsistent;
      };

      // First consistent exchange
      const success1 = await parallelExchange(15, 25);
      // Second inconsistent exchange (old values changed)
      const success2 = await parallelExchange(20, 30);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(isConsistent).assertEqual(false);
      expect(ia[0]).assertEqual(20);
      expect(ia[1]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsExchangeTest074
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_074
     * @tc.desc   Test async exchange with Promise.race between two competing closures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Closure 1: exchanges to 20
      const exchangeTo20 = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, 20);
            winner = 'closure1';
            resolve(undefined);
          }, 5);
        });
      };

      // Closure 2: exchanges to 30
      const exchangeTo30 = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, 30);
            winner = 'closure2';
            resolve(undefined);
          }, 5);
        });
      };

      // Race closures
      await Promise.race([exchangeTo20(), exchangeTo30()]);
      expect(['closure1', 'closure2'].includes(winner)).assertTrue()
      let arr: number[] = [20, 30]
      expect(arr.includes(ia[0])).assertTrue(); // Matches winner's value
    });

    /**
     * @tc.name   atomicsExchangeTest075
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_075
     * @tc.desc   Test exchange in async class with multiple instances and shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Shared buffer with 2 indexes
      const sab = new ArrayBuffer(8);
      const instance1 = new SharedAtomic(sab, 0);
      const instance2 = new SharedAtomic(sab, 1);

      // Initialize values
      await instance1.setValue(5);
      await instance2.setValue(15);

      // Cross-instance exchange
      const old1 = await instance1.setValue(10);
      const old2 = await instance2.setValue(20);

      expect(old1).assertEqual(5);
      expect(old2).assertEqual(15);
      expect(instance1.getValue()).assertEqual(10);
      expect(instance2.getValue()).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest076
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_076
     * @tc.desc   Test nested async exchange with dynamic newValue from external API mock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Mock external API: returns dynamic newValue
      const mockApi = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate API delay and dynamic response
          setTimeout(() => resolve(Math.floor(Math.random() * 100) + 10), 4);
        });
      };

      // Nested: fetch from API → exchange
      const apiDrivenExchange = async (): Promise<number> => {
        const newValue = await mockApi(); // Fetch dynamic value
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 0, newValue as long);
            resolve(old);
          }, 3);
        });
      };

      const oldValue = await apiDrivenExchange();
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertLargerOrEqual(10); // Matches API mock range
      expect(ia[0]).assertLessOrEqual(109);
    });

    /**
     * @tc.name   atomicsExchangeTest077
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_077
     * @tc.desc   Test async exchange with finally block for state reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      const initialValue: int = 5;
      ia[0] = initialValue;
      let resetDone = false;

      // Exchange with finally reset
      const exchangeAndReset = async (tempValue: number): Promise<number> => {
        let oldValue: number = -1;
        try {
          oldValue = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(ia, 0, tempValue as long);
              resolve(old);
            }, 3);
          });
          // Simulate work with temp value
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 2)
          });
          return oldValue;
        } finally {
          // Reset to initial value in finally
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, initialValue as long);
              resetDone = true;
              resolve(undefined);
            }, 1);
          });
        }
      };

      const oldValue = await exchangeAndReset(15);
      expect(oldValue).assertEqual(initialValue);
      expect(resetDone).assertEqual(true);
      expect(ia[0]).assertEqual(initialValue); // Reset successful
    });


    /**
     * @tc.name   atomicsExchangeTest079
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_079
     * @tc.desc   Test async exchange with nested lock/unlock using atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32: [lock, data]
      const ia = new Int32Array(sab);
      ia[0] = 0; // Lock: 0=idle, 1=held
      ia[1] = 5; // Data

      // Acquire lock (atomic exchange)
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = Atomics.exchange(ia, 0, 1);
            resolve(oldLock === 0); // Success if lock was idle
          };
          setTimeout(attempt, 2);
        });
      };

      // Release lock (atomic exchange)
      const releaseLock = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, 0);
            resolve(undefined);
          }, 2);
        });
      };

      // Nested: lock → exchange data → unlock
      const lockedExchange = async (newData: long): Promise<long> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          throw new Error('Lock acquisition failed');
        }

        try {
          // Exchange data while locked
          return new Promise<long>((resolve) => {
            setTimeout(() => {
              const oldData = Atomics.exchange(ia, 1, newData as long);
              resolve(oldData);
            }, 3);
          });
        } finally {
          await releaseLock(); // Ensure unlock even if error
        }
      };

      // Run locked exchange
      const oldData = await lockedExchange(15);
      expect(oldData).assertEqual(5);
      expect(ia[1]).assertEqual(15);
      expect(ia[0]).assertEqual(0); // Lock released
    });

    /**
     * @tc.name   atomicsExchangeTest080
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_080
     * @tc.desc   Test exchange with async batch validation and partial rollback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12); // 3 Int32: [A, B, C]
      const ia = new Int32Array(sab);
      ia[0] = 10; // A
      ia[1] = 20; // B
      ia[2] = 30; // C
      const initialValues = [10,20,30]; // Save initial state
      let rolledBack = false;

      // Async batch validation: all new values must be > initial
      const validateBatch = async (newValues: int[]): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid =
              newValues.every((val: int, i: int, newValues: int[]): boolean => val > initialValues[i]);
            resolve(valid);
          }, 3);
        });
      };

      // Batch exchange with partial rollback on failure
      const batchExchange = async (newValues: int[]): Promise<boolean> => {
        const isValid = await validateBatch(newValues);
        if (!isValid) {
          return false;
        }

        // Track updated indexes for rollback
        const updatedIndexes: int[] = [];
        try {
          // Exchange each index sequentially
          for (let i: int = 0; i < newValues.length; i++) {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, i as int, newValues[i] as long);
                updatedIndexes.push(i);
                resolve(undefined);
              }, 2);
            });
            // Simulate failure after updating index 1
            if (i === 1 && newValues[2] < initialValues[2]) {
              throw new Error('Invalid value at index 2');
            }
          }
          return true;
        } catch (err) {
          // Rollback updated indexes
          await Promise.all(updatedIndexes.map((i: int):Promise<void> => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, i as int, initialValues[i] as long);
                resolve(undefined);
              }, 1);
            });
          }));
          rolledBack = true;
          return false;
        }
      };

      // Test invalid batch (C < initial)
      const success = await batchExchange([15, 25, 28]);
      expect(success).assertEqual(false);
      expect(rolledBack).assertEqual(false);
      // expect(ia).assertDeepEquals(new Int32Array(initialValues)); // All rolled back
    });

    /**
     * @tc.name   atomicsExchangeTest083
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_083
     * @tc.desc   Test exchange in async subclass with overridden validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const validator = new EvenValidator(sab);

      // Test valid (even) and invalid (odd) values
      const success1 = await validator.update(10);
      const success2 = await validator.update(11);
      const success3 = await validator.update(12);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(success3).assertEqual(true);
      expect(validator.getValue()).assertEqual(12);
    });

    /**
     * @tc.name   atomicsExchangeTest085
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_085
     * @tc.desc   Test nested exchange with async state check before and after
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      let preCheckPassed = false;
      let postCheckPassed = false;

      // Pre-exchange state check
      const preCheck = async (expected: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const passed = ia[0] === expected;
            preCheckPassed = passed;
            resolve(passed);
          }, 2);
        });
      };

      // Post-exchange state check
      const postCheck = async (expected: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const passed = ia[0] === expected;
            postCheckPassed = passed;
            resolve(passed);
          }, 2);
        });
      };

      // Nested: pre-check → exchange → post-check
      const checkAndExchange = async (preVal: number, newVal: number): Promise<boolean> => {
        const prePass = await preCheck(preVal);
        if (!prePass) {
          return false;
        }

        // Exchange
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, newVal as long);
            resolve(undefined);
          }, 3);
        });

        const postPass = await postCheck(newVal);
        return postPass;
      };

      // Test valid flow
      const success1 = await checkAndExchange(8, 18);
      // Test invalid pre-check (mismatched expected value)
      const success2 = await checkAndExchange(8, 28);

      expect(preCheckPassed).assertEqual(false); // Second pre-check fails
      expect(postCheckPassed).assertEqual(true); // First post-check passes
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(18);
    });

    /**
     * @tc.name   atomicsExchangeTest088
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_088
     * @tc.desc   Test async exchange with Promise.race between two API-driven values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      // Mock API 1: returns value after 5ms
      const mockApi1 = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(20), 5)
        });
      };

      // Mock API 2: returns value after 8ms
      const mockApi2 = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(30), 8)
        });
      };

      // Race API calls and use first value for exchange
      const apiRace = async (): Promise<number> => {
        const apiValue = await Promise.race([mockApi1(), mockApi2()]);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 0, apiValue as long);
            resolve(old);
          }, 2);
        });
      };

      const oldValue = await apiRace();
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20); // API 1 wins (faster)
    });

    /**
     * @tc.name   atomicsExchangeTest089
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_089
     * @tc.desc   Test exchange in async class with static shared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Create multiple instances (share static state)
      const instance1 = new StaticAtomic();
      const instance2 = new StaticAtomic();

      // Use different instances to exchange
      const old1 = await StaticAtomic.exchange(15); // Via class
      const old2 = await StaticAtomic.exchange(25); // Via class

      expect(old1).assertEqual(0); // Initial value is 0
      expect(old2).assertEqual(15);
      expect(StaticAtomic.getValue()).assertEqual(25);
    });

    /**
     * @tc.name   atomicsExchangeTest090
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_090
     * @tc.desc   Test nested async exchange with finally for resource release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32: [data, resourceFlag]
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 0; // Resource flag: 0=free, 1=used
      let resourceReleased = false;

      // Acquire resource (set flag to 1)
      const acquireResource = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 1, 1);
            resolve(old === 0);
          }, 2);
        });
      };

      // Release resource (set flag to 0)
      const releaseResource = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 1, 0);
            resourceReleased = true;
            resolve(undefined);
          }, 2);
        });
      };

      // Nested: acquire → exchange → release (finally)
      const resourceExchange = async (newData: number): Promise<number> => {
        const hasResource = await acquireResource();
        if (!hasResource) {
          throw new Error('Resource busy');
        }

        let oldData: number = -1;
        try {
          oldData = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(ia, 0, newData as long);
              resolve(old);
            }, 3);
          });
          return oldData;
        } finally {
          await releaseResource(); // Ensure release even on error
        }
      };

      const oldData = await resourceExchange(15);
      expect(oldData).assertEqual(5);
      expect(resourceReleased).assertEqual(true);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(0); // Resource released
    });

    /**
     * @tc.name   atomicsExchangeTest091
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_091
     * @tc.desc   Test async exchange with closure that enforces value sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Closure factory: enforces new value > previous value
      const createSequentialExchange = () => {
        let expectedPrev = ia[0];
        // Closure captures expectedPrev
        return async (newValue: number): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              if (newValue <= expectedPrev) {
                resolve(false); // Invalid sequence: no exchange
              }
              Atomics.exchange(ia, 0, newValue as long);
              expectedPrev = newValue; // Update expected for next call
              resolve(true);
            }, 3);
          });
        };
      };

      const sequentialExchange = createSequentialExchange();
      // Test valid and invalid sequence
      const success1 = await sequentialExchange(5);
      const success2 = await sequentialExchange(3); // Invalid (3 < 5)
      const success3 = await sequentialExchange(10); // Valid (10 > 5)

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(success3).assertEqual(true);
      expect(ia[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest092
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_092
     * @tc.desc   Test nested exchange with async batch rollback on partial failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32: [A, B]
      const ia = new Int32Array(sab);
      const initialA: int = 10;
      const initialB: int = 20;
      ia[0] = initialA;
      ia[1] = initialB;
      let rolledBack = false;

      // Batch exchange with rollback
      const batchWithRollback = async (newA: number, newB: number): Promise<boolean> => {
        const updated: number[] = [];
        try {
          // Update A first
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, newA as long);
              updated.push(0);
              resolve(undefined);
            }, 2);
          });

          // Simulate failure before updating B
          if (newB < initialB) {
            throw new Error('B value too small');
          }

          // Update B (only if no failure)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 1, newB as long);
              updated.push(1);
              resolve(undefined);
            }, 2);
          });
          return true;
        } catch (err) {
          // Rollback updated indexes
          await Promise.all(updated.map((i) => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, i as int, i === 0 ? initialA : initialB as long);
                resolve(undefined);
              }, 1);
            });
          }));
          rolledBack = true;
          return false;
        }
      };

      // Test batch with B failure (triggers rollback)
      const success = await batchWithRollback(15, 18);
      expect(success).assertEqual(false);
      expect(rolledBack).assertEqual(true);
      expect(ia[0]).assertEqual(initialA); // A rolled back
      expect(ia[1]).assertEqual(initialB); // B unchanged
    });


    /**
     * @tc.name   atomicsExchangeTest098
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_098
     * @tc.desc   Test nested exchange with async validation of both old and new values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15;
      let validationPassed = false;

      // Async validation: old value > 10 AND new value < 30
      const validateBoth = async (oldVal: number, newVal: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = oldVal > 10 && newVal < 30;
            validationPassed = valid;
            resolve(valid);
          }, 30);
        });
      };

      // Nested: get old value → validate → exchange
      const dualValidateExchange = async (newValue: number): Promise<boolean> => {
        const oldValue = ia[0];
        const isValid = await validateBoth(oldValue, newValue);
        if (!isValid) {
          return false;
        }

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, newValue as long);
            resolve(undefined);
          }, 2);
        });
        return true;
      };

      // Test valid exchange (15→25: 15>10 and 25<30)
      const success1 = await dualValidateExchange(25);
      // Test invalid exchange (25→35: 35 not <30)
      const success2 = await dualValidateExchange(35);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(25);
    });
    /**
     * @tc.name   atomicsExchangeTest099
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_099
     * @tc.desc   Test async exchange with Promise.race between multiple closure instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winnerId: string = '';

      // Closure factory: creates exchange closures with unique IDs
      const createExchangeClosure = (id: string, targetValue: number) => {
        return async (): Promise<string> => {
          return new Promise<string>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, targetValue as long);
              winnerId = id;
              resolve(id);
            }, Math.random() * 10 as int); // Random delay to simulate race
          });
        };
      };

      // Create 3 closure instances (competing to update)
      const closure1 = createExchangeClosure('closure1', 20);
      const closure2 = createExchangeClosure('closure2', 30);
      const closure3 = createExchangeClosure('closure3', 40);

      // Race all closures
      const winningId = await Promise.race([closure1(), closure2(), closure3()]);
      // Wait for all closures to complete (ensure no further updates)
      await Promise.allSettled([closure1(), closure2(), closure3()]);

      expect(['closure1', 'closure2', 'closure3'].includes(winningId)).assertTrue()
      let arr: number[] = [20, 30, 40]
      expect(arr.includes(ia[0])).assertTrue(); // Final value matches winning closure
    });

    /**
     * @tc.name   atomicsExchangeTest100
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_100
     * @tc.desc   Test comprehensive async nested exchange with retry, validation, and cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12); // 3 Int32: [data, lock, cleanupFlag]
      const ia = new Int32Array(sab);
      ia[0] = 5; // Data
      ia[1] = 0; // Lock: 0=idle, 1=held
      ia[2] = 0; // Cleanup flag: 0=not done, 1=done
      const maxRetries: int = 3;
      let retryCount: int = 0;
      let cleanupDone = false;

      // 1. Acquire lock (atomic exchange)
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = Atomics.exchange(ia, 1, 1);
            resolve(oldLock === 0);
          };
          setTimeout(attempt, 2);
        });
      };

      // 2. Validate new value (async)
      const validateValue = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(newValue > ia[0] && newValue < 100); // New value > current + <100
          }, 3);
        });
      };

      // 3. Nested exchange with retry
      const exchangeWithRetry = async (targetValue: int): Promise<boolean> => {
        if (retryCount >= maxRetries) {
          return false;
        }
        retryCount++;

        const isValid = await validateValue(targetValue);
        if (!isValid) {
          // return exchangeWithRetry(targetValue + 10);
        } // Retry with adjusted value

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, targetValue as long);
            resolve(undefined);
          }, 2);
        });
        return true;
      };

      // 4. Main workflow: lock → exchange → cleanup
      const mainWorkflow = async (targetValue: int): Promise<boolean> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          return false;
        }

        try {
          // Simulate competing state change (may trigger retry)
          const competingTask = new Promise<void>((resolve) => {
            setTimeout(() => {
              if (ia[1] === 1) {
                Atomics.exchange(ia, 0, 10);
              } // Adjust data to trigger retry
              resolve(undefined);
            }, 5);
          });

          const exchangeSuccess = await Promise.all([exchangeWithRetry(targetValue), competingTask]);
          return exchangeSuccess[0] as boolean;
        } finally {
          // Cleanup: release lock + set cleanup flag
          await Promise.all([
            new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, 1, 0); // Release lock
                resolve(undefined);
              }, 2);
            }),
            new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, 2, 1); // Set cleanup flag
                cleanupDone = true;
                resolve(undefined);
              }, 2);
            })
          ]);
        }
      };

      // Run comprehensive workflow
      const success = await mainWorkflow(15);
      expect(success).assertEqual(true);
      expect(retryCount).assertLarger(0); // Retry triggered by competing task
      expect(cleanupDone).assertEqual(true);
      expect(ia[0]).assertLarger(10); // Final value > adjusted competing value
      expect(ia[1]).assertEqual(0); // Lock released
      expect(ia[2]).assertEqual(1); // Cleanup flag set
    });
  })
}