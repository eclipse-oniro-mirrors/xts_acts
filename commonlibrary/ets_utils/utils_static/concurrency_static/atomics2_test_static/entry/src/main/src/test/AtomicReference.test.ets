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

interface RefC {
  c: int;
}

interface ObjectARef {
  a: int;
}

interface ObjectBRef {
  b: int;
}

interface EmptyObjectRef {
}

interface NestedObjectL1Ref {
  a: NestedObjectL1InnerRef;
}

interface NestedObjectL1InnerRef {
  b: NestedObjectL1LeafRef;
}

interface NestedObjectL1LeafRef {
  c: int;
}

interface NestedObjectL2Ref {
  a: NestedObjectL2InnerRef;
}

interface NestedObjectL2InnerRef {
  b: NestedObjectL2LeafRef;
}

interface NestedObjectL2LeafRef {
  c: NestedObjectL2DeepRef;
}

interface NestedObjectL2DeepRef {
  d: NestedObjectL2LastRef;
}

interface NestedObjectL2LastRef {
  e: int;
}

interface ReplaceObjectRef {
  x: int;
}

interface CircularRefObject {
  name: string;
  self?: CircularRefObject;
}

type MixedReferenceType = int | string | boolean | ObjectARef;
type EmptyOrArrayType = EmptyObjectRef | int[];
type DateNullableType = Date | null;
type RegExpNullableType = RegExp | null;
type MapOrSetType = Map<string, int> | Set<int>;
type FuncRef = () => int;

class AtomicReferenceSampleClass {
  public value: int;

  constructor(value: int) {
    this.value = value;
  }
}

function namedFunctionRef(): int {
  return 1;
}

const arrowFunctionRef: FuncRef = (): int => {
  return 2;
};

const otherFunctionRef: FuncRef = (): int => {
  return 3;
};

function assertIntArrayValues(actual: int[], expected: int[]): void {
  expect(actual.length).assertEqual(expected.length);
  for (let i = 0; i < expected.length; i++) {
    expect(actual[i]).assertEqual(expected[i]);
  }
}

function assertNestedIntArrayValues(actual: int[][], expected: int[][]): void {
  expect(actual.length).assertEqual(expected.length);
  for (let i = 0; i < expected.length; i++) {
    assertIntArrayValues(actual[i], expected[i]);
  }
}

function createObjectARef(value: int): ObjectARef {
  const result: ObjectARef = { a: value };
  return result;
}

function createObjectBRef(value: int): ObjectBRef {
  const result: ObjectBRef = { b: value };
  return result;
}

function createRefC(value: int): RefC {
  const result: RefC = { c: value };
  return result;
}

function createNestedObjectL1(value: int): NestedObjectL1Ref {
  const result: NestedObjectL1Ref = {
    a: {
      b: {
        c: value,
      },
    },
  };
  return result;
}

function createNestedObjectL2(value: int): NestedObjectL2Ref {
  const result: NestedObjectL2Ref = {
    a: {
      b: {
        c: {
          d: {
            e: value,
          },
        },
      },
    },
  };
  return result;
}

function createReplaceObject(value: int): ReplaceObjectRef {
  const result: ReplaceObjectRef = { x: value };
  return result;
}

function createMixedArray(): Object[] {
  const obj: ObjectBRef = createObjectBRef(2);
  const nested: int[] = [3];
  const result: Object[] = [1, 'a', obj, nested];
  return result;
}

export default function atomicReferenceTest(): void {
  describe('atomicReferenceTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicReferenceTest001
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0001
     * @tc.desc   Verify null load/store/exchange/compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atomNull = new AtomicReference<RefC | null>(null);
      expect(atomNull.load()).assertNull();

      atomNull.store(null);
      expect(atomNull.load()).assertNull();

      const c3: RefC = createRefC(3);
      const oldNull = atomNull.exchange(c3);
      expect(oldNull).assertNull();
      expect(atomNull.load() === c3).assertTrue();

      const atomNullForCas = new AtomicReference<RefC | null>(null);
      const c4: RefC = createRefC(4);
      const oldCasNull = atomNullForCas.compareAndSwap(null, c4);
      expect(oldCasNull).assertNull();
      expect(atomNullForCas.load() === c4).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest002
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0002
     * @tc.desc   Verify undefined store/load behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atomUndefined = new AtomicReference<int | undefined>(undefined);
      atomUndefined.store(undefined);
      expect(atomUndefined.load() === undefined).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest003
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0003
     * @tc.desc   Verify undefined load/exchange/compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atomUndefined = new AtomicReference<int | undefined>(undefined);
      expect(atomUndefined.load() === undefined).assertTrue();

      const oldUndefined = atomUndefined.exchange(123);
      expect(oldUndefined === undefined).assertTrue();
      expect(atomUndefined.load()).assertEqual(123);

      atomUndefined.store(undefined);
      const oldCasUndefined = atomUndefined.compareAndSwap(undefined, 100);
      expect(oldCasUndefined === undefined).assertTrue();
      expect(atomUndefined.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicReferenceTest004
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0004
     * @tc.desc   Verify number L0 load/store/exchange behavior and current compareAndSwap boxed-value semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(new AtomicReference<number>(0).load()).assertEqual(0);
      expect(new AtomicReference<number>(-1).load()).assertEqual(-1);
      expect(new AtomicReference<number>(1).load()).assertEqual(1);

      const atomStoreL0 = new AtomicReference<number>(0);
      atomStoreL0.store(0);
      expect(atomStoreL0.load()).assertEqual(0);
      atomStoreL0.store(-1);
      expect(atomStoreL0.load()).assertEqual(-1);
      atomStoreL0.store(1);
      expect(atomStoreL0.load()).assertEqual(1);

      const atomCasNull = new AtomicReference<number | null | undefined>(null);
      const oldNullCas = atomCasNull.compareAndSwap(undefined, 0);
      expect(oldNullCas).assertNull();
      expect(atomCasNull.load()).assertNull();

      const atomCasInt = new AtomicReference<number>(0);
      expect(atomCasInt.compareAndSwap(0, -1)).assertEqual(0);
      expect(atomCasInt.load()).assertEqual(0);
      expect(atomCasInt.compareAndSwap(-1, 1)).assertEqual(0);
      expect(atomCasInt.load()).assertEqual(0);
      expect(atomCasInt.compareAndSwap(1, 0)).assertEqual(0);
      expect(atomCasInt.load()).assertEqual(0);

      const atomExchangeL0 = new AtomicReference<number>(0);
      expect(atomExchangeL0.exchange(-1)).assertEqual(0);
      expect(atomExchangeL0.exchange(1)).assertEqual(-1);
      expect(atomExchangeL0.exchange(0)).assertEqual(1);
    });

    /**
     * @tc.name   atomicReferenceTest005
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0005
     * @tc.desc   Verify number boundary load/store and NaN/Infinity compareAndSwap/exchange behavior under current boxed-value semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(new AtomicReference<number>(Number.MAX_VALUE).load()).assertEqual(Number.MAX_VALUE);
      expect(new AtomicReference<number>(Number.MIN_VALUE).load()).assertEqual(Number.MIN_VALUE);
      expect(Number.isNaN(new AtomicReference<number>(NaN).load())).assertTrue();
      expect(new AtomicReference<number>(Infinity).load()).assertEqual(Infinity);
      expect(new AtomicReference<number>(-Infinity).load()).assertEqual(-Infinity);

      const atomStoreL1 = new AtomicReference<number>(0);
      atomStoreL1.store(Number.MAX_VALUE);
      expect(atomStoreL1.load()).assertEqual(Number.MAX_VALUE);
      atomStoreL1.store(Number.MIN_VALUE);
      expect(atomStoreL1.load()).assertEqual(Number.MIN_VALUE);
      atomStoreL1.store(123);
      expect(atomStoreL1.load()).assertEqual(123);

      const atomNaNCas = new AtomicReference<number>(NaN);
      const oldNaN = atomNaNCas.compareAndSwap(NaN, 1.5);
      expect(Number.isNaN(oldNaN)).assertTrue();
      expect(Number.isNaN(atomNaNCas.load())).assertTrue();

      const atomOtherNumber = new AtomicReference<number>(NaN);
      const oldNaNExchange = atomOtherNumber.exchange(1.5);
      expect(Number.isNaN(oldNaNExchange)).assertTrue();
      atomOtherNumber.store(Infinity);
      expect(atomOtherNumber.exchange(0)).assertEqual(Infinity);

      atomOtherNumber.store(NaN);
      const nanMismatch = atomOtherNumber.compareAndSwap(1, 2);
      expect(Number.isNaN(nanMismatch)).assertTrue();
      expect(Number.isNaN(atomOtherNumber.load())).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest006
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0006
     * @tc.desc   Verify float load/store/exchange behavior and current compareAndSwap boxed-value semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(new AtomicReference<number>(3.14).load()).assertEqual(3.14);
      expect(new AtomicReference<number>(-3.14).load()).assertEqual(-3.14);

      const atomFloatStore = new AtomicReference<number>(0);
      atomFloatStore.store(3.14);
      expect(atomFloatStore.load()).assertEqual(3.14);
      atomFloatStore.store(-3.14);
      expect(atomFloatStore.load()).assertEqual(-3.14);
      atomFloatStore.store(NaN);
      expect(Number.isNaN(atomFloatStore.load())).assertTrue();
      atomFloatStore.store(Infinity);
      expect(atomFloatStore.load()).assertEqual(Infinity);
      atomFloatStore.store(-Infinity);
      expect(atomFloatStore.load()).assertEqual(-Infinity);

      const atomFloat = new AtomicReference<number>(3.14);
      expect(atomFloat.exchange(2.71)).assertEqual(3.14);
      expect(atomFloat.load()).assertEqual(2.71);
      atomFloat.store(3.14);
      expect(atomFloat.compareAndSwap(3.14, 2.71)).assertEqual(3.14);
      expect(atomFloat.load()).assertEqual(3.14);
      atomFloat.store(3.14);
      expect(atomFloat.compareAndSwap(3.15, 2.71)).assertEqual(3.14);
      expect(atomFloat.load()).assertEqual(3.14);
    });

    /**
     * @tc.name   atomicReferenceTest007
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0007
     * @tc.desc   Verify boolean load/store/exchange behavior and current compareAndSwap boxed-value semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(new AtomicReference<boolean>(true).load()).assertEqual(true);
      expect(new AtomicReference<boolean>(false).load()).assertEqual(false);

      const atomBool = new AtomicReference<boolean>(true);
      atomBool.store(true);
      expect(atomBool.load()).assertEqual(true);
      atomBool.store(false);
      expect(atomBool.load()).assertEqual(false);
      expect(atomBool.compareAndSwap(false, true)).assertEqual(false);
      expect(atomBool.load()).assertEqual(false);
      expect(atomBool.compareAndSwap(true, false)).assertEqual(false);
      expect(atomBool.load()).assertEqual(false);

      const atomBoolExchange = new AtomicReference<boolean>(true);
      expect(atomBoolExchange.exchange(false)).assertEqual(true);
      expect(atomBoolExchange.exchange(true)).assertEqual(false);
    });

    /**
     * @tc.name   atomicReferenceTest008
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0008
     * @tc.desc   Verify string L0 load/store/exchange/compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atomString = new AtomicReference<string>('');
      expect(atomString.load()).assertEqual('');
      atomString.store('');
      expect(atomString.load()).assertEqual('');
      atomString.store('test');
      expect(atomString.load()).assertEqual('test');

      atomString.store('');
      expect(atomString.exchange('test')).assertEqual('');
      expect(atomString.load()).assertEqual('test');

      atomString.store('');
      expect(atomString.compareAndSwap('', 'test')).assertEqual('');
      expect(atomString.load()).assertEqual('test');
    });

    /**
     * @tc.name   atomicReferenceTest009
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0009
     * @tc.desc   Verify string L1 load/store/exchange/compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(new AtomicReference<string>('测试').load()).assertEqual('测试');

      const atomString = new AtomicReference<string>('');
      atomString.store('测试');
      expect(atomString.load()).assertEqual('测试');

      const atomOther = new AtomicReference<string>('old');
      expect(atomOther.exchange('new')).assertEqual('old');
      atomOther.store('测试');
      expect(atomOther.exchange('测试123')).assertEqual('测试');

      atomOther.store('abc');
      expect(atomOther.compareAndSwap('abc', 'def')).assertEqual('abc');
      expect(atomOther.load()).assertEqual('def');
      atomOther.store('abc');
      expect(atomOther.compareAndSwap('xyz', 'def')).assertEqual('abc');
      expect(atomOther.load()).assertEqual('abc');
    });

    /**
     * @tc.name   atomicReferenceTest010
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0010
     * @tc.desc   Verify mixed type L2 continuous exchange behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atomMixed = new AtomicReference<MixedReferenceType>(42);
      expect(atomMixed.exchange('switch')).assertEqual(42);
      expect(atomMixed.exchange(true)).assertEqual('switch');

      const objectValue: ObjectARef = createObjectARef(1);
      expect(atomMixed.exchange(objectValue)).assertEqual(true);
      expect(atomMixed.load() === objectValue).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest011
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0011
     * @tc.desc   Verify object L0 load/store/exchange and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const objA: ObjectARef = createObjectARef(1);
      const objB: ObjectBRef = createObjectBRef(2);
      expect(new AtomicReference<ObjectARef>(objA).load() === objA).assertTrue();

      const atomObject = new AtomicReference<ObjectARef | ObjectBRef>(objA);
      atomObject.store(objB);
      expect(atomObject.load() === objB).assertTrue();

      atomObject.store(objA);
      expect(atomObject.exchange(objB) === objA).assertTrue();
      expect(atomObject.load() === objB).assertTrue();

      const casSuccessCurrent: ObjectARef = createObjectARef(1);
      const casSuccessNew: ObjectBRef = createObjectBRef(2);
      atomObject.store(casSuccessCurrent);
      expect(atomObject.compareAndSwap(casSuccessCurrent, casSuccessNew) === casSuccessCurrent).assertTrue();
      expect(atomObject.load() === casSuccessNew).assertTrue();

      const casFailCurrent: ObjectARef = createObjectARef(1);
      const casFailExpected: ObjectARef = createObjectARef(1);
      const casFailNew: ObjectBRef = createObjectBRef(3);
      atomObject.store(casFailCurrent);
      expect(atomObject.compareAndSwap(casFailExpected, casFailNew) === casFailCurrent).assertTrue();
      expect(atomObject.load() === casFailCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest012
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0012
     * @tc.desc   Verify empty object L1 load/store/exchange and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const emptyObj: EmptyObjectRef = {};
      expect(new AtomicReference<EmptyObjectRef>(emptyObj).load() === emptyObj).assertTrue();

      const atomObject = new AtomicReference<EmptyOrArrayType>(emptyObj);
      atomObject.store(emptyObj);
      expect(atomObject.load() === emptyObj).assertTrue();

      const emptyArray: int[] = [];
      atomObject.store(emptyObj);
      const exchangedEmpty = atomObject.exchange(emptyArray);
      expect(exchangedEmpty === emptyObj).assertTrue();
      expect(atomObject.load() === emptyArray).assertTrue();

      const casEmptyCurrent: EmptyObjectRef = {};
      const casEmptyExpected: EmptyObjectRef = {};
      atomObject.store(casEmptyCurrent);
      expect(atomObject.compareAndSwap(casEmptyCurrent, emptyArray) === casEmptyCurrent).assertTrue();
      expect(atomObject.load() === emptyArray).assertTrue();

      atomObject.store(casEmptyCurrent);
      expect(atomObject.compareAndSwap(casEmptyExpected, emptyArray) === casEmptyCurrent).assertTrue();
      expect(atomObject.load() === casEmptyCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest013
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0013
     * @tc.desc   Verify nested object L2 exchange and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const deepOld: NestedObjectL1Ref = createNestedObjectL1(1);
      const deepNew: ReplaceObjectRef = createReplaceObject(1);
      const atomObject = new AtomicReference<NestedObjectL1Ref | ReplaceObjectRef>(deepOld);

      expect(atomObject.exchange(deepNew) === deepOld).assertTrue();
      expect(atomObject.load() === deepNew).assertTrue();

      const deepCasCurrent: NestedObjectL1Ref = createNestedObjectL1(1);
      const deepCasExpected: NestedObjectL1Ref = createNestedObjectL1(1);
      const deepCasNew: ReplaceObjectRef = createReplaceObject(2);
      atomObject.store(deepCasCurrent);
      expect(atomObject.compareAndSwap(deepCasCurrent, deepCasNew) === deepCasCurrent).assertTrue();
      expect(atomObject.load() === deepCasNew).assertTrue();

      atomObject.store(deepCasCurrent);
      expect(atomObject.compareAndSwap(deepCasExpected, deepCasNew) === deepCasCurrent).assertTrue();
      expect(atomObject.load() === deepCasCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest014
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0014
     * @tc.desc   Verify array L1 load/store/exchange and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const emptyArray: int[] = [];
      const array123: int[] = [1, 2, 3];
      const nestedArray: int[][] = [[1, 2], [3, 4]];

      expect(new AtomicReference<int[]>(emptyArray).load() === emptyArray).assertTrue();
      expect(new AtomicReference<int[]>(array123).load() === array123).assertTrue();
      expect(new AtomicReference<int[][]>(nestedArray).load() === nestedArray).assertTrue();

      const atomArray = new AtomicReference<int[]>(emptyArray);
      atomArray.store(emptyArray);
      expect(atomArray.load() === emptyArray).assertTrue();
      atomArray.store(array123);
      expect(atomArray.load() === array123).assertTrue();

      const exchangeOld: int[] = [1, 2, 3];
      const exchangeNew: int[] = [4, 5, 6];
      atomArray.store(exchangeOld);
      expect(atomArray.exchange(exchangeNew) === exchangeOld).assertTrue();
      expect(atomArray.load() === exchangeNew).assertTrue();
      assertIntArrayValues(atomArray.load(), exchangeNew);

      const casArrayCurrent: int[] = [1, 2, 3];
      const casArrayExpected: int[] = [1, 2, 3];
      const casArrayNew: int[] = [4, 5, 6];
      atomArray.store(casArrayCurrent);
      expect(atomArray.compareAndSwap(casArrayCurrent, casArrayNew) === casArrayCurrent).assertTrue();
      expect(atomArray.load() === casArrayNew).assertTrue();

      atomArray.store(casArrayCurrent);
      expect(atomArray.compareAndSwap(casArrayExpected, casArrayNew) === casArrayCurrent).assertTrue();
      expect(atomArray.load() === casArrayCurrent).assertTrue();

      const atomNestedArray = new AtomicReference<int[][]>(nestedArray);
      expect(atomNestedArray.load() === nestedArray).assertTrue();
      assertNestedIntArrayValues(atomNestedArray.load(), nestedArray);
    });

    /**
     * @tc.name   atomicReferenceTest015
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0015
     * @tc.desc   Verify array L2 load/store/exchange and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const mixedArray: Object[] = createMixedArray();
      expect(new AtomicReference<Object[]>(mixedArray).load() === mixedArray).assertTrue();

      const atomArray = new AtomicReference<Object[]>(mixedArray);
      atomArray.store(mixedArray);
      expect(atomArray.load() === mixedArray).assertTrue();

      const oldArray: Object[] = [1, 'a', createObjectBRef(2)];
      const newArray: Object[] = [3];
      atomArray.store(oldArray);
      expect(atomArray.exchange(newArray) === oldArray).assertTrue();
      expect(atomArray.load() === newArray).assertTrue();

      const l2OldArray: int[] = [1, 2];
      const l2NewArray: int[] = [3, 4];
      const atomIntArray = new AtomicReference<int[]>(l2OldArray);
      expect(atomIntArray.exchange(l2NewArray) === l2OldArray).assertTrue();
      expect(atomIntArray.load() === l2NewArray).assertTrue();

      const l2CasCurrent: Object[] = [1, 'a', createObjectBRef(2)];
      const l2CasExpected: Object[] = [1, 'a', createObjectBRef(2)];
      const l2CasNew: Object[] = [3];
      atomArray.store(l2CasCurrent);
      expect(atomArray.compareAndSwap(l2CasCurrent, l2CasNew) === l2CasCurrent).assertTrue();
      expect(atomArray.load() === l2CasNew).assertTrue();

      atomArray.store(l2CasCurrent);
      expect(atomArray.compareAndSwap(l2CasExpected, l2CasNew) === l2CasCurrent).assertTrue();
      expect(atomArray.load() === l2CasCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest016
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0016
     * @tc.desc   Verify sparse-array requirement via fixed-length optional array replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // ArkTS-Sta does not support omitted array elements, so this case uses
      // a fixed-length array with an explicit undefined placeholder instead.
      const pseudoSparseArray: (int | undefined)[] = [1, undefined, 3];
      const atomSparse = new AtomicReference<(int | undefined)[]>(pseudoSparseArray);
      const loadedSparse = atomSparse.load();
      expect(loadedSparse.length).assertEqual(3);
      expect(loadedSparse[0]).assertEqual(1);
      expect(loadedSparse[1] === undefined).assertTrue();
      expect(loadedSparse[2]).assertEqual(3);

      atomSparse.store(pseudoSparseArray);
      const storedSparse = atomSparse.load();
      expect(storedSparse === pseudoSparseArray).assertTrue();
      expect(storedSparse[1] === undefined).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest017
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0017
     * @tc.desc   Verify Date reference compareAndSwap mismatch behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Symbol is unavailable in current ArkTS-Sta, so this case covers
      // the same reference-comparison semantics with Date.
      const dateCurrent = new Date(1700000000000);
      const dateNew = new Date(1700000001000);
      const atomDate = new AtomicReference<Date>(dateCurrent);

      expect(atomDate.load() === dateCurrent).assertTrue();
      atomDate.store(dateCurrent);
      expect(atomDate.load() === dateCurrent).assertTrue();
      expect(atomDate.exchange(dateNew) === dateCurrent).assertTrue();
      expect(atomDate.load() === dateNew).assertTrue();

      atomDate.store(dateCurrent);
      expect(atomDate.compareAndSwap(dateCurrent, dateNew) === dateCurrent).assertTrue();
      expect(atomDate.load() === dateNew).assertTrue();

      atomDate.store(dateCurrent);
      const sameTimeDifferentRef = new Date(1700000000000);
      expect(atomDate.compareAndSwap(sameTimeDifferentRef, dateNew) === dateCurrent).assertTrue();
      expect(atomDate.load() === dateCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest018
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0018
     * @tc.desc   Verify RegExp reference compareAndSwap mismatch behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Symbol without description is unavailable in current ArkTS-Sta, so this
      // case covers the same reference-comparison semantics with RegExp.
      const regCurrent = new RegExp('test', 'g');
      const regNew = new RegExp('abc', 'i');
      const atomReg = new AtomicReference<RegExp>(regCurrent);

      expect(atomReg.load() === regCurrent).assertTrue();
      atomReg.store(regCurrent);
      expect(atomReg.load() === regCurrent).assertTrue();
      expect(atomReg.exchange(regNew) === regCurrent).assertTrue();
      expect(atomReg.load() === regNew).assertTrue();

      atomReg.store(regCurrent);
      expect(atomReg.compareAndSwap(regCurrent, regNew) === regCurrent).assertTrue();
      expect(atomReg.load() === regNew).assertTrue();

      atomReg.store(regCurrent);
      const samePatternDifferentRef = new RegExp('test', 'g');
      expect(atomReg.compareAndSwap(samePatternDifferentRef, regNew) === regCurrent).assertTrue();
      expect(atomReg.load() === regCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest019
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0019
     * @tc.desc   Verify BigInt L1 load/store/exchange behavior and current compareAndSwap boxed-value semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(new AtomicReference<bigint>(BigInt(0)).load()).assertEqual(0n);
      expect(new AtomicReference<bigint>(BigInt(1)).load()).assertEqual(1n);
      expect(new AtomicReference<bigint>(BigInt(-1)).load()).assertEqual(-1n);

      const atomStore = new AtomicReference<bigint>(0n);
      atomStore.store(0n);
      expect(atomStore.load()).assertEqual(0n);
      atomStore.store(1n);
      expect(atomStore.load()).assertEqual(1n);
      atomStore.store(-1n);
      expect(atomStore.load()).assertEqual(-1n);

      const atomBigCas = new AtomicReference<bigint>(0n);
      expect(atomBigCas.exchange(1n)).assertEqual(0n);
      expect(atomBigCas.load()).assertEqual(1n);

      atomBigCas.store(0n);
      expect(atomBigCas.compareAndSwap(0n, 1n)).assertEqual(0n);
      expect(atomBigCas.load()).assertEqual(0n);

      atomBigCas.store(0n);
      expect(atomBigCas.compareAndSwap(1n, 2n)).assertEqual(0n);
      expect(atomBigCas.load()).assertEqual(0n);
    });

    /**
     * @tc.name   atomicReferenceTest020
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0020
     * @tc.desc   Verify BigInt boundary L2 load/store/exchange behavior and current compareAndSwap boxed-value semantics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      expect(new AtomicReference<bigint>(BigInt(0)).load()).assertEqual(0n);
      expect(new AtomicReference<bigint>(BigInt(1)).load()).assertEqual(1n);
      expect(new AtomicReference<bigint>(BigInt(-1)).load()).assertEqual(-1n);
      expect(new AtomicReference<bigint>(BigInt(9007199254740991)).load()).assertEqual(9007199254740991n);
      expect(new AtomicReference<bigint>(BigInt(-9007199254740992)).load()).assertEqual(-9007199254740992n);

      const atomBig = new AtomicReference<bigint>(0n);
      atomBig.store(9007199254740991n);
      expect(atomBig.load()).assertEqual(9007199254740991n);
      atomBig.store(-9007199254740992n);
      expect(atomBig.load()).assertEqual(-9007199254740992n);

      atomBig.store(0n);
      expect(atomBig.exchange(1n)).assertEqual(0n);
      expect(atomBig.load()).assertEqual(1n);

      atomBig.store(9007199254740991n);
      expect(atomBig.exchange(-9007199254740992n)).assertEqual(9007199254740991n);
      expect(atomBig.load()).assertEqual(-9007199254740992n);

      atomBig.store(0n);
      expect(atomBig.compareAndSwap(1n, 2n)).assertEqual(0n);
      expect(atomBig.load()).assertEqual(0n);

      atomBig.store(9007199254740991n);
      expect(atomBig.compareAndSwap(9007199254740991n, -9007199254740992n)).assertEqual(9007199254740991n);
      expect(atomBig.load()).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   atomicReferenceTest021
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0021
     * @tc.desc   Verify function L1 load/store/exchange behavior and current compareAndSwap behavior in runtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atomFunction = new AtomicReference<FuncRef>(namedFunctionRef);

      expect(atomFunction.load() === namedFunctionRef).assertTrue();
      atomFunction.store(namedFunctionRef);
      expect(atomFunction.load() === namedFunctionRef).assertTrue();
      atomFunction.store(arrowFunctionRef);
      expect(atomFunction.load() === arrowFunctionRef).assertTrue();

      expect(atomFunction.exchange(namedFunctionRef) === arrowFunctionRef).assertTrue();
      expect(atomFunction.load() === namedFunctionRef).assertTrue();

      expect(atomFunction.compareAndSwap(namedFunctionRef, arrowFunctionRef) === namedFunctionRef).assertTrue();
      expect(atomFunction.load() === namedFunctionRef).assertTrue();

      atomFunction.store(namedFunctionRef);
      expect(atomFunction.compareAndSwap(otherFunctionRef, arrowFunctionRef) === namedFunctionRef).assertTrue();
      expect(atomFunction.load() === namedFunctionRef).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest022
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0022
     * @tc.desc   Verify Date L2 load/store/exchange behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const date1 = new Date(1700000000000);
      const date2 = new Date(1700000001000);
      const atomDate = new AtomicReference<Date>(date1);
      expect(atomDate.load() === date1).assertTrue();

      atomDate.store(date2);
      expect(atomDate.load() === date2).assertTrue();

      const date3 = new Date(1700000002000);
      expect(atomDate.exchange(date3) === date2).assertTrue();
      expect(atomDate.load() === date3).assertTrue();

      const atomDateCas = new AtomicReference<DateNullableType>(date1);
      const casDateSuccess = atomDateCas.compareAndSwap(date1, null);
      expect(casDateSuccess === date1).assertTrue();
      expect(atomDateCas.load()).assertNull();

      atomDateCas.store(date1);
      const casDateFail = atomDateCas.compareAndSwap(new Date(1700000000000), null);
      expect(casDateFail === date1).assertTrue();
      expect(atomDateCas.load() === date1).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest023
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0023
     * @tc.desc   Verify RegExp L2 load/store/exchange behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const reg1 = new RegExp('test', 'g');
      const reg2 = new RegExp('abc', 'i');
      const atomReg = new AtomicReference<RegExp>(reg1);
      expect(atomReg.load() === reg1).assertTrue();

      atomReg.store(reg1);
      expect(atomReg.load() === reg1).assertTrue();

      expect(atomReg.exchange(reg2) === reg1).assertTrue();
      expect(atomReg.load() === reg2).assertTrue();

      const atomRegCas = new AtomicReference<RegExpNullableType>(reg1);
      const casRegSuccess = atomRegCas.compareAndSwap(reg1, null);
      expect(casRegSuccess === reg1).assertTrue();
      expect(atomRegCas.load()).assertNull();

      atomRegCas.store(reg1);
      const casRegFail = atomRegCas.compareAndSwap(new RegExp('test', 'g'), null);
      expect(casRegFail === reg1).assertTrue();
      expect(atomRegCas.load() === reg1).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest024
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0024
     * @tc.desc   Verify Map L2 load/store/exchange and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const map1 = new Map<string, int>();
      const map2 = new Map<string, int>();
      map2.set('k', 1);
      const set1 = new Set<int>();
      const set2 = new Set<int>([1, 2]);

      const atomMap = new AtomicReference<MapOrSetType>(map1);
      expect(atomMap.load() === map1).assertTrue();

      atomMap.store(map2);
      expect(atomMap.load() === map2).assertTrue();

      const oldMap = atomMap.exchange(set1);
      expect(oldMap === map2).assertTrue();
      expect(atomMap.load() === set1).assertTrue();

      const mapCasCurrent = new Map<string, int>();
      atomMap.store(mapCasCurrent);
      expect(atomMap.compareAndSwap(mapCasCurrent, set2) === mapCasCurrent).assertTrue();
      expect(atomMap.load() === set2).assertTrue();

      atomMap.store(mapCasCurrent);
      const mapCasFail = atomMap.compareAndSwap(new Map<string, int>(), set2);
      expect(mapCasFail === mapCasCurrent).assertTrue();
      expect(atomMap.load() === mapCasCurrent).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest025
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0025
     * @tc.desc   Verify Set L2 load/store behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const set1 = new Set<int>();
      const set2 = new Set<int>([1, 2]);
      const atomSet = new AtomicReference<Set<int>>(set1);
      expect(atomSet.load() === set1).assertTrue();
      atomSet.store(set2);
      expect(atomSet.load() === set2).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest026
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0026
     * @tc.desc   Verify WeakMap L2 load/store behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const weakMap1 = new WeakMap<object, number>();
      const weakMap2 = new WeakMap<object, number>();
      const atomWeakMap = new AtomicReference<WeakMap<object, number>>(weakMap1);
      expect(atomWeakMap.load() === weakMap1).assertTrue();
      atomWeakMap.store(weakMap2);
      expect(atomWeakMap.load() === weakMap2).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest027
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0027
     * @tc.desc   Verify WeakSet L2 load/store behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const weakSet1 = new WeakSet<object>();
      const weakSet2 = new WeakSet<object>();
      const atomWeakSet = new AtomicReference<WeakSet<object>>(weakSet1);
      expect(atomWeakSet.load() === weakSet1).assertTrue();
      atomWeakSet.store(weakSet2);
      expect(atomWeakSet.load() === weakSet2).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest028
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0028
     * @tc.desc   Verify nested object L1 load/store behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicReferenceTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const nestedL1: NestedObjectL1Ref = createNestedObjectL1(1);
      const atomNested = new AtomicReference<NestedObjectL1Ref>(nestedL1);
      expect(atomNested.load() === nestedL1).assertTrue();
      atomNested.store(nestedL1);
      expect(atomNested.load() === nestedL1).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest029
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0029
     * @tc.desc   Verify deep nested object L2 load/store behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const nestedL2: NestedObjectL2Ref = createNestedObjectL2(1);
      const atomNested = new AtomicReference<NestedObjectL2Ref>(nestedL2);
      expect(atomNested.load() === nestedL2).assertTrue();
      atomNested.store(nestedL2);
      expect(atomNested.load() === nestedL2).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest030
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0030
     * @tc.desc   Verify circular reference object L2 load/store/compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const cycle1: CircularRefObject = { name: 'cycle1' };
      cycle1.self = cycle1;
      const cycle2: CircularRefObject = { name: 'cycle2' };
      cycle2.self = cycle2;

      const atomCycle = new AtomicReference<CircularRefObject | null>(cycle1);
      const loadedCycle1 = atomCycle.load();
      expect(loadedCycle1 === cycle1).assertTrue();
      if (loadedCycle1 === null) {
        expect().assertFail();
        return;
      }
      expect(loadedCycle1.self === loadedCycle1).assertTrue();

      atomCycle.store(cycle2);
      const loadedCycle2 = atomCycle.load();
      expect(loadedCycle2 === cycle2).assertTrue();
      if (loadedCycle2 === null) {
        expect().assertFail();
        return;
      }
      expect(loadedCycle2.self === loadedCycle2).assertTrue();

      expect(atomCycle.compareAndSwap(cycle2, null) === cycle2).assertTrue();
      expect(atomCycle.load()).assertNull();
    });

    /**
     * @tc.name   atomicReferenceTest031
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0031
     * @tc.desc   Verify class instance L2 load/store and reference compareAndSwap behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicReferenceTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const classObj1 = new AtomicReferenceSampleClass(1);
      const classObj2 = new AtomicReferenceSampleClass(2);
      const classObj3 = new AtomicReferenceSampleClass(2);
      const atomClass = new AtomicReference<AtomicReferenceSampleClass>(classObj1);

      expect(atomClass.load() === classObj1).assertTrue();
      atomClass.store(classObj2);
      expect(atomClass.load() === classObj2).assertTrue();

      expect(atomClass.compareAndSwap(classObj2, classObj1) === classObj2).assertTrue();
      expect(atomClass.load() === classObj1).assertTrue();

      atomClass.store(classObj2);
      expect(atomClass.compareAndSwap(classObj3, classObj1) === classObj2).assertTrue();
      expect(atomClass.load() === classObj2).assertTrue();
    });

    /**
     * @tc.name   atomicReferenceTest032
     * @tc.number SUB_BUILTINS_ATOMIC_REFERENCE_TEST_0032
     * @tc.desc   Verify AtomicReference.isLockFree return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicReferenceTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const result = AtomicReference.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });
  });
}
