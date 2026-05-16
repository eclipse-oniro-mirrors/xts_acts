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

type MixedTypedArray = Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array
  | Float64Array;

interface TypedArrayWrapper {
  data: Int32Array;
  metadata: string;
}

interface SimpleObject {
  id: int;
  name: string;
}

interface EmptyObject {}

interface InnerObject {
  value: int;
}

interface OuterObject {
  inner: InnerObject;
  name: string;
}

interface ObjectWithArray {
  data: int[];
  count: int;
}

export default function atomicsParamTest(): void {
  describe('atomicsParamTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicsParamTest001
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0001
     * @tc.desc   Verify AtomicReference with Int8Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const int8Array: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const atom = new AtomicReference<Int8Array>(int8Array);
      expect(atom.load() === int8Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(1);
      expect(atom.load()[4]).assertEqual(5);

      const newInt8Array: Int8Array = new Int8Array([6, 7, 8]);
      atom.store(newInt8Array);
      expect(atom.load() === newInt8Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(int8Array);
      expect(exchanged === newInt8Array).assertTrue();
      expect(atom.load() === int8Array).assertTrue();

      const casResult = atom.compareAndSwap(int8Array, newInt8Array);
      expect(casResult === int8Array).assertTrue();
      expect(atom.load() === newInt8Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest002
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0002
     * @tc.desc   Verify AtomicReference with Uint8Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const uint8Array: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const atom = new AtomicReference<Uint8Array>(uint8Array);
      expect(atom.load() === uint8Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(10);
      expect(atom.load()[4]).assertEqual(50);

      const newUint8Array: Uint8Array = new Uint8Array([60, 70, 80]);
      atom.store(newUint8Array);
      expect(atom.load() === newUint8Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(uint8Array);
      expect(exchanged === newUint8Array).assertTrue();
      expect(atom.load() === uint8Array).assertTrue();

      const casResult = atom.compareAndSwap(uint8Array, newUint8Array);
      expect(casResult === uint8Array).assertTrue();
      expect(atom.load() === newUint8Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest003
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0003
     * @tc.desc   Verify AtomicReference with Int16Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const int16Array: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      const atom = new AtomicReference<Int16Array>(int16Array);
      expect(atom.load() === int16Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(100);
      expect(atom.load()[4]).assertEqual(500);

      const newInt16Array: Int16Array = new Int16Array([600, 700, 800]);
      atom.store(newInt16Array);
      expect(atom.load() === newInt16Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(int16Array);
      expect(exchanged === newInt16Array).assertTrue();
      expect(atom.load() === int16Array).assertTrue();

      const casResult = atom.compareAndSwap(int16Array, newInt16Array);
      expect(casResult === int16Array).assertTrue();
      expect(atom.load() === newInt16Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest004
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0004
     * @tc.desc   Verify AtomicReference with Uint16Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const uint16Array: Uint16Array = new Uint16Array([1000, 2000, 3000, 4000, 5000]);
      const atom = new AtomicReference<Uint16Array>(uint16Array);
      expect(atom.load() === uint16Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(1000);
      expect(atom.load()[4]).assertEqual(5000);

      const newUint16Array: Uint16Array = new Uint16Array([6000, 7000, 8000]);
      atom.store(newUint16Array);
      expect(atom.load() === newUint16Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(uint16Array);
      expect(exchanged === newUint16Array).assertTrue();
      expect(atom.load() === uint16Array).assertTrue();

      const casResult = atom.compareAndSwap(uint16Array, newUint16Array);
      expect(casResult === uint16Array).assertTrue();
      expect(atom.load() === newUint16Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest005
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0005
     * @tc.desc   Verify AtomicReference with Int32Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const int32Array: Int32Array = new Int32Array([100000, 200000, 300000, 400000, 500000]);
      const atom = new AtomicReference<Int32Array>(int32Array);
      expect(atom.load() === int32Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(100000);
      expect(atom.load()[4]).assertEqual(500000);

      const newInt32Array: Int32Array = new Int32Array([600000, 700000, 800000]);
      atom.store(newInt32Array);
      expect(atom.load() === newInt32Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(int32Array);
      expect(exchanged === newInt32Array).assertTrue();
      expect(atom.load() === int32Array).assertTrue();

      const casResult = atom.compareAndSwap(int32Array, newInt32Array);
      expect(casResult === int32Array).assertTrue();
      expect(atom.load() === newInt32Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest006
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0006
     * @tc.desc   Verify AtomicReference with Uint32Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const uint32Array: Uint32Array = new Uint32Array([1000000, 2000000, 3000000, 4000000, 5000000]);
      const atom = new AtomicReference<Uint32Array>(uint32Array);
      expect(atom.load() === uint32Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(1000000);
      expect(atom.load()[4]).assertEqual(5000000);

      const newUint32Array: Uint32Array = new Uint32Array([6000000, 7000000, 8000000]);
      atom.store(newUint32Array);
      expect(atom.load() === newUint32Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(uint32Array);
      expect(exchanged === newUint32Array).assertTrue();
      expect(atom.load() === uint32Array).assertTrue();

      const casResult = atom.compareAndSwap(uint32Array, newUint32Array);
      expect(casResult === uint32Array).assertTrue();
      expect(atom.load() === newUint32Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest007
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0007
     * @tc.desc   Verify AtomicReference with Float32Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const float32Array: Float32Array = new Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
      const atom = new AtomicReference<Float32Array>(float32Array);
      expect(atom.load() === float32Array).assertTrue();
      expect(atom.load().length).assertEqual(5);
      // expect(Math.abs(value - 1.1) < 0.0001).assertTrue()
      expect(Math.abs(atom.load()[0] - 1.1)).assertLessOrEqual(0.0001);
      expect(atom.load()[4]).assertEqual(5.5);

      const newFloat32Array: Float32Array = new Float32Array([6.6, 7.7, 8.8]);
      atom.store(newFloat32Array);
      expect(atom.load() === newFloat32Array).assertTrue();
      expect(atom.load().length).assertEqual(3);

      const exchanged = atom.exchange(float32Array);
      expect(exchanged === newFloat32Array).assertTrue();
      expect(atom.load() === float32Array).assertTrue();

      const casResult = atom.compareAndSwap(float32Array, newFloat32Array);
      expect(casResult === float32Array).assertTrue();
      expect(atom.load() === newFloat32Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest008
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0008
     * @tc.desc   Verify AtomicReference with Float64Array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const float64Array: Float64Array = new Float64Array([1.11, 2.22, 3.33, 4.44, 5.55]);
      const atom = new AtomicReference<Float64Array>(float64Array);
      expect(atom.load() === float64Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest009
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0009
     * @tc.desc   Verify AtomicReference with Int8Array boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const int8Array: Int8Array = new Int8Array([-128, 0, 127]);
      const atom = new AtomicReference<Int8Array>(int8Array);
      expect(atom.load() === int8Array).assertTrue();
      expect(atom.load()[0]).assertEqual(-128);
      expect(atom.load()[1]).assertEqual(0);
      expect(atom.load()[2]).assertEqual(127);
    });

    /**
     * @tc.name   atomicsParamTest010
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0010
     * @tc.desc   Verify AtomicReference with Uint8Array boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const uint8Array: Uint8Array = new Uint8Array([0, 127, 255]);
      const atom = new AtomicReference<Uint8Array>(uint8Array);
      expect(atom.load() === uint8Array).assertTrue();
      expect(atom.load()[0]).assertEqual(0);
      expect(atom.load()[1]).assertEqual(127);
      expect(atom.load()[2]).assertEqual(255);
    });

    /**
     * @tc.name   atomicsParamTest011
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0011
     * @tc.desc   Verify AtomicReference with Int16Array boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const int16Array: Int16Array = new Int16Array([-32768, 0, 32767]);
      const atom = new AtomicReference<Int16Array>(int16Array);
      expect(atom.load() === int16Array).assertTrue();
      expect(atom.load()[0]).assertEqual(-32768);
      expect(atom.load()[1]).assertEqual(0);
      expect(atom.load()[2]).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsParamTest012
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0012
     * @tc.desc   Verify AtomicReference with Uint16Array boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const uint16Array: Uint16Array = new Uint16Array([0, 32767, 65535]);
      const atom = new AtomicReference<Uint16Array>(uint16Array);
      expect(atom.load() === uint16Array).assertTrue();
      expect(atom.load()[0]).assertEqual(0);
      expect(atom.load()[1]).assertEqual(32767);
      expect(atom.load()[2]).assertEqual(65535);
    });

    /**
     * @tc.name   atomicsParamTest013
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0013
     * @tc.desc   Verify AtomicReference with Int32Array boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const int32Array: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      const atom = new AtomicReference<Int32Array>(int32Array);
      expect(atom.load() === int32Array).assertTrue();
      expect(atom.load()[0]).assertEqual(-2147483648);
      expect(atom.load()[1]).assertEqual(0);
      expect(atom.load()[2]).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicsParamTest014
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0014
     * @tc.desc   Verify AtomicReference with Uint32Array boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const uint32Array: Uint32Array = new Uint32Array([0, 2147483647, 4294967295]);
      const atom = new AtomicReference<Uint32Array>(uint32Array);
      expect(atom.load() === uint32Array).assertTrue();
      expect(atom.load()[0]).assertEqual(0);
      expect(atom.load()[1]).assertEqual(2147483647);
      expect(atom.load()[2]).assertEqual(4294967295);
    });

    /**
     * @tc.name   atomicsParamTest015
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0015
     * @tc.desc   Verify AtomicReference with Float32Array special values (NaN, Infinity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const float32Array: Float32Array = new Float32Array([NaN, Infinity, -Infinity, 0.0, 1.0]);
      const atom = new AtomicReference<Float32Array>(float32Array);
      expect(atom.load() === float32Array).assertTrue();
      expect(Number.isNaN(atom.load()[0])).assertTrue();
      expect(atom.load()[1]).assertEqual(Infinity);
      expect(atom.load()[2]).assertEqual(-Infinity);
      expect(atom.load()[3]).assertEqual(0.0);
      expect(atom.load()[4]).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicsParamTest016
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0016
     * @tc.desc   Verify AtomicReference with Float64Array special values (NaN, Infinity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const float64Array: Float64Array = new Float64Array([NaN, Infinity, -Infinity, 0.0, 1.0]);
      const atom = new AtomicReference<Float64Array>(float64Array);
      expect(atom.load() === float64Array).assertTrue();
      expect(Number.isNaN(atom.load()[0])).assertTrue();
      expect(atom.load()[1]).assertEqual(Infinity);
      expect(atom.load()[2]).assertEqual(-Infinity);
      expect(atom.load()[3]).assertEqual(0.0);
      expect(atom.load()[4]).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicsParamTest017
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TESTari_0017
     * @tc.desc   Verify AtomicReference with empty TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const emptyInt8Array: Int8Array = new Int8Array(0);
      const atom = new AtomicReference<Int8Array>(emptyInt8Array);
      expect(atom.load() === emptyInt8Array).assertTrue();
      expect(atom.load().length).assertEqual(0);

      const emptyUint32Array: Uint32Array = new Uint32Array(0);
      const atom2 = new AtomicReference<Uint32Array>(emptyUint32Array);
      atom2.store(emptyUint32Array);
      expect(atom2.load() === emptyUint32Array).assertTrue();
      expect(atom2.load().length).assertEqual(0);
    });

    /**
     * @tc.name   atomicsParamTest018
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0018
     * @tc.desc   Verify AtomicReference with large TypedArray
     * @tc.type   FUNCTION
     * @ @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const largeArray: Int32Array = new Int32Array(1000);
      for (let i = 0; i < 1000; i++) {
        largeArray[i] = i;
      }
      const atom = new AtomicReference<Int32Array>(largeArray);
      expect(atom.load() === largeArray).assertTrue();
      expect(atom.load().length).assertEqual(1000);
      expect(atom.load()[0]).assertEqual(0);
      expect(atom.load()[999]).assertEqual(999);
    });

    /**
     * @tc.name   atomicsParamTest019
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0019
     * @tc.desc   Verify AtomicReference with TypedArray reference integrity after replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsParamTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const array1: Int32Array = new Int32Array([1, 2, 3]);
      const array2: Int32Array = new Int32Array([4, 5, 6]);
      const atom = new AtomicReference<Int32Array>(array1);

      atom.store(array2);
      expect(atom.load() === array2).assertTrue();
      expect(atom.load()[0]).assertEqual(4);

      array1[0] = 999;
      expect(atom.load()[0]).assertEqual(4);

      atom.store(array1);
      expect(atom.load() === array1).assertTrue();
      expect(atom.load()[0]).assertEqual(999);
    });

    /**
     * @tc.name   atomicsParamTest020
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0020
     * @tc.desc   Verify AtomicReference with mixed TypedArray types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsParamTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const int8Array: Int8Array = new Int8Array([1, 2, 3]);
      const uint8Array: Uint8Array = new Uint8Array([4, 5, 6]);
      const int16Array: Int16Array = new Int16Array([7, 8, 9]);
      const float32Array: Float32Array = new Float32Array([10.1, 11.2, 12.3]);

      const atom = new AtomicReference<MixedTypedArray>(int8Array);
      expect(atom.load() === int8Array).assertTrue();

      atom.store(uint8Array);
      expect(atom.load() === uint8Array).assertTrue();

      atom.store(int16Array);
      expect(atom.load() === int16Array).assertTrue();

      atom.store(float32Array);
      expect(atom.load() === float32Array).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest021
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0021
     * @tc.desc   Verify AtomicReference with TypedArray buffer sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsParamTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const int8View: Int8Array = new Int8Array(buffer);
      const int16View: Int16Array = new Int16Array(buffer);

      int8View[0] = 1;
      int8View[1] = 2;

      const atom = new AtomicReference<Int8Array>(int8View);
      expect(atom.load() === int8View).assertTrue();
      expect(atom.load()[0]).assertEqual(1);
      expect(atom.load()[1]).assertEqual(2);

      int16View[0] = 256;
      expect(atom.load()[0]).assertEqual(0);
      expect(atom.load()[1]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsParamTest022
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0022
     * @tc.desc   Verify AtomicReference with TypedArray in object wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsParamTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const wrapper1: TypedArrayWrapper = {
        data: new Int32Array([1, 2, 3]),
        metadata: 'first'
      };

      const wrapper2: TypedArrayWrapper = {
        data: new Int32Array([4, 5, 6]),
        metadata: 'second'
      };

      const atom = new AtomicReference<TypedArrayWrapper>(wrapper1);
      expect(atom.load() === wrapper1).assertTrue();
      expect(atom.load().data[0]).assertEqual(1);
      expect(atom.load().metadata).assertEqual('first');

      atom.store(wrapper2);
      expect(atom.load() === wrapper2).assertTrue();
      expect(atom.load().data[0]).assertEqual(4);
      expect(atom.load().metadata).assertEqual('second');
    });

    /**
     * @tc.name   atomicsParamTest023
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0023
     * @tc.desc   Verify AtomicReference with string type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const str1: string = 'hello';
      const atom = new AtomicReference<string>(str1);
      expect(atom.load() === str1).assertTrue();
      expect(atom.load()).assertEqual('hello');

      const str2: string = 'world';
      atom.store(str2);
      expect(atom.load() === str2).assertTrue();
      expect(atom.load()).assertEqual('world');

      const exchanged = atom.exchange(str1);
      expect(exchanged === str2).assertTrue();
      expect(atom.load() === str1).assertTrue();

      const casResult = atom.compareAndSwap(str1, str2);
      expect(casResult === str1).assertTrue();
      expect(atom.load() === str2).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest024
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0024
     * @tc.desc   Verify AtomicReference with string special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const emptyStr: string = '';
      const atom = new AtomicReference<string>(emptyStr);
      expect(atom.load() === emptyStr).assertTrue();
      expect(atom.load()).assertEqual('');

      const spaceStr: string = ' ';
      atom.store(spaceStr);
      expect(atom.load() === spaceStr).assertTrue();
      expect(atom.load()).assertEqual(' ');

      const unicodeStr: string =
        '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      atom.store(unicodeStr);
      expect(atom.load() === unicodeStr).assertTrue();
      expect(atom.load())
        .assertEqual('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');

      const specialStr: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      atom.store(specialStr);
      expect(atom.load() === specialStr).assertTrue();
      expect(atom.load()).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
    });

    /**
     * @tc.name   atomicsParamTest025
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0025
     * @tc.desc   Verify AtomicReference with number type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const num1: number = 42;
      const atom = new AtomicReference<number>(num1);
      expect(atom.load() === num1).assertTrue();
      expect(atom.load()).assertEqual(42);

      const num2: number = 100;
      atom.store(num2);
      expect(atom.load() === num2).assertTrue();
      expect(atom.load()).assertEqual(100);

      const exchanged = atom.exchange(num1);
      expect(exchanged === num2).assertTrue();
      expect(atom.load() === num1).assertTrue();

      const casResult = atom.compareAndSwap(num1, num2);
      expect(casResult === num1).assertTrue();
      expect(atom.load() === num1).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest026
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0026
     * @tc.desc   Verify AtomicReference with number boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicReference<number>(0);

      atom.store(Number.MAX_VALUE);
      expect(atom.load()).assertEqual(Number.MAX_VALUE);

      atom.store(Number.MIN_VALUE);
      expect(atom.load()).assertEqual(Number.MIN_VALUE);

      atom.store(0);
      expect(atom.load()).assertEqual(0);

      atom.store(-1);
      expect(atom.load()).assertEqual(-1);

      atom.store(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicsParamTest027
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0027
     * @tc.desc   Verify AtomicReference with number special values (NaN, Infinity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicReference<number>(0);

      atom.store(NaN);
      expect(Number.isNaN(atom.load())).assertTrue();

      atom.store(Infinity);
      expect(atom.load()).assertEqual(Infinity);

      atom.store(-Infinity);
      expect(atom.load()).assertEqual(-Infinity);

      atom.store(0.0);
      expect(atom.load()).assertEqual(0.0);

      atom.store(-0.0);
      expect(atom.load()).assertEqual(-0.0);
    });

    /**
     * @tc.name   atomicsParamTest028
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0028
     * @tc.desc   Verify AtomicReference with boolean type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const bool1: boolean = true;
      const atom = new AtomicReference<boolean>(bool1);
      expect(atom.load() === bool1).assertTrue();
      expect(atom.load()).assertEqual(true);

      const bool2: boolean = false;
      atom.store(bool2);
      expect(atom.load() === bool2).assertTrue();
      expect(atom.load()).assertEqual(false);

      const exchanged = atom.exchange(bool1);
      expect(exchanged === bool2).assertTrue();
      expect(atom.load() === bool1).assertTrue();

      const casResult = atom.compareAndSwap(bool1, bool2);
      expect(casResult === bool1).assertTrue();
      expect(atom.load() === bool1).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest029
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0029
     * @tc.desc   Verify AtomicReference with array type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const arr1: int[] = [1, 2, 3];
      const atom = new AtomicReference<int[]>(arr1);
      expect(atom.load() === arr1).assertTrue();
      expect(atom.load().length).assertEqual(3);
      expect(atom.load()[0]).assertEqual(1);
      expect(atom.load()[2]).assertEqual(3);

      const arr2: int[] = [4, 5, 6];
      atom.store(arr2);
      expect(atom.load() === arr2).assertTrue();
      expect(atom.load().length).assertEqual(3);
      expect(atom.load()[0]).assertEqual(4);

      const exchanged = atom.exchange(arr1);
      expect(exchanged === arr2).assertTrue();
      expect(atom.load() === arr1).assertTrue();

      const casResult = atom.compareAndSwap(arr1, arr2);
      expect(casResult === arr1).assertTrue();
      expect(atom.load() === arr2).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest030
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0030
     * @tc.desc   Verify AtomicReference with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const emptyArr: int[] = [];
      const atom = new AtomicReference<int[]>(emptyArr);
      expect(atom.load() === emptyArr).assertTrue();
      expect(atom.load().length).assertEqual(0);

      const emptyStrArr: string[] = [];
      const atom1 = new AtomicReference<string[]>(emptyStrArr);
      atom1.store(emptyStrArr);
      expect(atom1.load() === emptyStrArr).assertTrue();
      expect(atom1.load().length).assertEqual(0);
    });

    /**
     * @tc.name   atomicsParamTest031
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0031
     * @tc.desc   Verify AtomicReference with nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const nestedArr: int[][] = [[1, 2], [3, 4], [5, 6]];
      const atom = new AtomicReference<int[][]>(nestedArr);
      expect(atom.load() === nestedArr).assertTrue();
      expect(atom.load().length).assertEqual(3);
      expect(atom.load()[0].length).assertEqual(2);
      expect(atom.load()[0][0]).assertEqual(1);
      expect(atom.load()[2][1]).assertEqual(6);
    });

    /**
     * @tc.name   atomicsParamTest032
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0032
     * @tc.desc   Verify AtomicReference with mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsParamTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const mixedArr: (int | string)[] = [1, 'hello', 2, 'world', 3];
      const atom = new AtomicReference<(int | string)[]>(mixedArr);
      expect(atom.load() === mixedArr).assertTrue();
      expect(atom.load().length).assertEqual(5);
      expect(atom.load()[0]).assertEqual(1);
      expect(atom.load()[1]).assertEqual('hello');
      expect(atom.load()[4]).assertEqual(3);
    });

    /**
     * @tc.name   atomicsParamTest033
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0033
     * @tc.desc   Verify AtomicReference with object type data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsParamTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const obj1: SimpleObject = { id: 1, name: 'test1' };
      const atom = new AtomicReference<SimpleObject>(obj1);
      expect(atom.load() === obj1).assertTrue();
      expect(atom.load().id).assertEqual(1);
      expect(atom.load().name).assertEqual('test1');

      const obj2: SimpleObject = { id: 2, name: 'test2' };
      atom.store(obj2);
      expect(atom.load() === obj2).assertTrue();
      expect(atom.load().id).assertEqual(2);
      expect(atom.load().name).assertEqual('test2');

      const exchanged = atom.exchange(obj1);
      expect(exchanged === obj2).assertTrue();
      expect(atom.load() === obj1).assertTrue();

      const casResult = atom.compareAndSwap(obj1, obj2);
      expect(casResult === obj1).assertTrue();
      expect(atom.load() === obj2).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest034
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0034
     * @tc.desc   Verify AtomicReference with empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const emptyObj: EmptyObject = {};
      const atom = new AtomicReference<EmptyObject>(emptyObj);
      expect(atom.load() === emptyObj).assertTrue();
    });

    /**
     * @tc.name   atomicsParamTest035
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0035
     * @tc.desc   Verify AtomicReference with nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsParamTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const inner: InnerObject = { value: 42 };
      const outer1: OuterObject = { inner: inner, name: 'outer1' };
      const atom = new AtomicReference<OuterObject>(outer1);
      expect(atom.load() === outer1).assertTrue();
      expect(atom.load().inner.value).assertEqual(42);
      expect(atom.load().name).assertEqual('outer1');

      const outer2: OuterObject = { inner: inner, name: 'outer2' };
      atom.store(outer2);
      expect(atom.load() === outer2).assertTrue();
      expect(atom.load().name).assertEqual('outer2');
    });

    /**
     * @tc.name   atomicsParamTest036
     * @tc.number SUB_BUILTINS_ATOMICS_PARAM_TEST_0036
     * @tc.desc   Verify AtomicReference with object containing array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsParamTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const obj1: ObjectWithArray = { data: [1, 2, 3], count: 3 };
      const atom = new AtomicReference<ObjectWithArray>(obj1);
      expect(atom.load() === obj1).assertTrue();
      expect(atom.load().data.length).assertEqual(3);
      expect(atom.load().data[0]).assertEqual(1);
      expect(atom.load().count).assertEqual(3);

      const obj2: ObjectWithArray = { data: [4, 5, 6], count: 3 };
      atom.store(obj2);
      expect(atom.load() === obj2).assertTrue();
      expect(atom.load().data[0]).assertEqual(4);
    });
  });
}
