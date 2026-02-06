/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'

export default function typeArrayBigUint64ArrayTest() {
  describe('TypeArrayBigUint64ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
       await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0000
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0000
     * @tc.desc   验证BigUint64Array基本构造和初始化
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array(2);
      expect(arr1.length).assertEqual(2);
      expect(arr1.byteLength).assertEqual(16);
      expect(arr1[0]).assertEqual(0n);
      expect(arr1[1]).assertEqual(0n);

      const arr2 = new BigUint64Array([10n, 20n, 30n]);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(10n);
      expect(arr2[1]).assertEqual(20n);
      expect(arr2[2]).assertEqual(30n);

      const buf = new ArrayBuffer(16);
      const arr3 = new BigUint64Array(buf);
      expect(arr3.length).assertEqual(2);
      expect(arr3.buffer).assertEqual(buf);
      expect(arr3[0]).assertEqual(0n);
      expect(arr3[1]).assertEqual(0n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0001
     * @tc.desc   验证BigUint64Array与DataView的基础同步
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);

      uintArr[0] = 0x123456789ABCDEF0n;
      expect(dv.getBigUint64(0, true)).assertEqual(0x123456789ABCDEF0n);

      dv.setBigUint64(0, 0xFEDCBA9876543210n, true);
      expect(uintArr[0]).assertEqual(0xFEDCBA9876543210n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0002
     * @tc.desc   验证BigUint64Array的索引访问和修改
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);

      arr[1] = 100n;
      expect(arr[1]).assertEqual(100n);
      expect(arr[3]).assertEqual(undefined);

      arr[5] = 200n;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(100n);
      expect(arr[2]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0003
     * @tc.desc   验证BigUint64Array与SharedArrayBuffer的同步性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(16);
      const view1 = new BigUint64Array(sab);
      const view2 = new BigUint64Array(sab);

      view1[0] = 12345n;
      view1[1] = 67890n;
      expect(view2[0]).assertEqual(12345n);
      expect(view2[1]).assertEqual(67890n);

      view2[0] = 98765n;
      expect(view1[0]).assertEqual(98765n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0004
     * @tc.desc   验证BigUint64Array的set方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(5);
      const source = new BigUint64Array([10n, 20n, 30n]);

      arr.set(source, 1);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(30n);
      expect(arr[4]).assertEqual(0n);

      arr.set([40n], 3);
      expect(arr[3]).assertEqual(40n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0005
     * @tc.desc   验证BigUint64Array的subarray方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);

      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2n);
      expect(sub[1]).assertEqual(3n);
      expect(sub[2]).assertEqual(4n);

      sub[1] = 30n;
      expect(arr[2]).assertEqual(30n);

      arr[3] = 40n;
      expect(sub[2]).assertEqual(40n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0006
     * @tc.desc   验证BigUint64Array的slice方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);

      const slice = arr.slice(1, 4);
      expect(slice.length).assertEqual(3);
      expect(slice[0]).assertEqual(2n);
      expect(slice[1]).assertEqual(3n);
      expect(slice[2]).assertEqual(4n);

      slice[1] = 30n;
      expect(arr[2]).assertEqual(3n);

      arr[3] = 40n;
      expect(slice[2]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0007
     * @tc.desc   验证BigUint64Array与DataView的8位值交互
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);

      dv.setUint8(0, 0xFF);
      dv.setUint8(7, 0xAA);

      const expected = 0xAA000000000000FFn;
      expect(uintArr[0]).assertEqual(expected);

      uintArr[0] = 0x1122334455667788n;
      expect(dv.getUint8(0)).assertEqual(0x88);
      expect(dv.getUint8(1)).assertEqual(0x77);
      expect(dv.getUint8(6)).assertEqual(0x22);
      expect(dv.getUint8(7)).assertEqual(0x11);
    })
    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0008
     * @tc.desc   验证BigUint64Array与DataView的16位值交互
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setUint16(0, 0x1234, true);
      dv.setUint16(6, 0xABCD, true);
      const expected = 0xabcd000000001234n;
      expect(uintArr[0]).assertEqual(expected);

      expect(uintArr.length).assertEqual(1);

      uintArr[0] = 0xAABBCCDD11223344n;


      expect(dv.getUint16(0, true)).assertEqual(0x3344);
      expect(dv.getUint16(2, true)).assertEqual(0x1122);
      expect(dv.getUint16(4, true)).assertEqual(0xCCDD);
      expect(dv.getUint16(6, true)).assertEqual(0xAABB);
      expect(uintArr[0]).assertEqual(0xAABBCCDD11223344n);
      expect(uintArr.length).assertEqual(1);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0009
     * @tc.desc   验证BigUint64Array与DataView的32位值交互
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setUint32(0, 0x12345678, true);
      dv.setUint32(4, 0x9ABCDEF0, true);
      const expected = 0x9ABCDEF012345678n;
      expect(uintArr[0]).assertEqual(expected);
      expect(uintArr.length).assertEqual(1);

      uintArr[0] = 0x0011223344556677n;
      expect(uintArr[0]).assertEqual(0x0011223344556677n);

      expect(dv.getUint32(0, true)).assertEqual(0x44556677);
      expect(dv.getUint32(4, true)).assertEqual(0x00112233);
      expect(uintArr.length).assertEqual(1);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0010
     * @tc.desc   验证BigUint64Array的fill方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
      arr.fill(10n);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(10n);
      }
      expect(arr.length).assertEqual(5);
      arr.fill(20n, 1, 4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(10n);

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0011
     * @tc.desc   验证BigUint64Array的copyWithin方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
      arr.copyWithin(0, 3, 5);
      expect(arr.toString()).assertEqual([4n, 5n, 3n, 4n, 5n].toString());
      expect(arr[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(5n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
      expect(arr.length).assertEqual(5);
      arr.set([1n, 2n, 3n, 4n, 5n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual([1n, 2n, 1n, 2n, 5n].toString());
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(5n);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0012
     * @tc.desc   验证BigUint64Array的indexOf方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n, 40n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
      expect(arr.indexOf(20n)).assertEqual(1);
      expect(arr.indexOf(25n)).assertEqual(-1);
      expect(arr.indexOf(20n, 2)).assertEqual(3);
      expect(arr.indexOf(10n, 10)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0013
     * @tc.desc   验证BigUint64Array的lastIndexOf方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n, 40n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
      expect(arr.lastIndexOf(20n)).assertEqual(3);
      expect(arr.lastIndexOf(25n)).assertEqual(-1);

      expect(arr.lastIndexOf(20n, 2)).assertEqual(1);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0014
     * @tc.desc   验证BigUint64Array的includes方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 10n, 15n, 20n]);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(15n);
      expect(arr[3]).assertEqual(20n);
      expect(arr.includes(10n)).assertEqual(true);

      expect(arr.includes(12n)).assertEqual(false);
      expect(arr.includes(10n, 2)).assertEqual(false);
      expect(arr.includes(15n, 2)).assertEqual(true);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(15n);
      expect(arr[3]).assertEqual(20n);
    });

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0015
     * @tc.desc   验证BigUint64Array的entries迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(3);
      expect(entries[0].toString()).assertEqual([0, 1n].toString());
      expect(entries[1].toString()).assertEqual([1, 2n].toString());
      expect(entries[2].toString()).assertEqual([2, 3n].toString());
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });
    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0016
     * @tc.desc   验证BigUint64Array的keys迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(3);
      const keys = Array.from(arr.keys());
      expect(keys.toString()).assertEqual([0, 1, 2].toString());
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0017
     * @tc.desc   验证BigUint64Array的values迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const values = Array.from(arr.values());
      expect(values.toString()).assertEqual([10n, 20n, 30n].toString());
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(10n);
      expect(values[1]).assertEqual(20n);
      expect(values[2]).assertEqual(30n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0018
     * @tc.desc   验证BigUint64Array的forEach方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result: bigint[] = [];

      arr.forEach((value) => {
        result.push(value * 2n);
      });
      expect(result.toString()).assertEqual([2n, 4n, 6n].toString());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2n);
      expect(result[1]).assertEqual(4n);
      expect(result[2]).assertEqual(6n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0019
     * @tc.desc   验证BigUint64Array的every方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array([2n, 4n, 6n, 8n]);
      const arr2 = new BigUint64Array([2n, 3n, 6n, 8n]);
      const allEven = (val: bigint) => val % 2n === 0n;
      expect(arr1.every(allEven)).assertEqual(true);
      expect(arr2.every(allEven)).assertEqual(false);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0020
     * @tc.desc   验证BigUint64Array的some方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array([1n, 3n, 5n, 7n]);
      const arr2 = new BigUint64Array([1n, 3n, 6n, 7n]);
      const isEven = (val: bigint) => val % 2n === 0n;
      expect(arr1.some(isEven)).assertEqual(false);
      expect(arr2.some(isEven)).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0021
     * @tc.desc   验证BigUint64Array的reduce方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sum = arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(10n);
      const product = arr.reduce((acc, val) => acc * val, 1n);
      expect(product).assertEqual(24n);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0022
     * @tc.desc   验证BigUint64Array的reduceRight方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const str = arr.reduceRight((acc, val) => acc + val.toString(), '');
      expect(str).assertEqual('321');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0023
     * @tc.desc   验证BigUint64Array的map方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const mapped = arr.map((val) => val * val);
      expect(mapped.toString()).assertEqual(new BigUint64Array([1n, 4n, 9n, 16n]).toString());
      expect(mapped.length).assertEqual(4);
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(4n);
      expect(mapped[2]).assertEqual(9n);
      expect(mapped[3]).assertEqual(16n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0024
     * @tc.desc   验证BigUint64Array的filter方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      const filtered = arr.filter((val) => val % 2n === 0n);
      expect(filtered.toString()).assertEqual(new BigUint64Array([2n, 4n, 6n]).toString());
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(2n);
      expect(filtered[1]).assertEqual(4n);
      expect(filtered[2]).assertEqual(6n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0025
     * @tc.desc   验证BigUint64Array与DataView的字节序差异
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      const value = 0x0123456789ABCDEFn;
      uintArr[0] = value;
      expect(dv.getBigUint64(0, true)).assertEqual(value);
      expect(dv.getBigUint64(0, false).toString()).assertEqual('17279655951921914625');
      dv.setBigUint64(0, value, false);
      expect(uintArr[0].toString()).assertEqual('17279655951921914625');
      expect(buf.byteLength).assertEqual(8);
      expect(uintArr.length).assertEqual(1);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0026
     * @tc.desc   验证BigUint64Array处理超出32位范围的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(1);
      const largeValue = 0x123456789ABCDEF0n;
      arr[0] = largeValue;
      expect(arr[0]).assertEqual(largeValue);
      const dv = new DataView(arr.buffer);
      expect(dv.getUint32(4, true)).assertEqual(0x12345678);
      expect(dv.getUint32(0, true)).assertEqual(0x9ABCDEF0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0x123456789ABCDEF0n);
      expect(arr.buffer.byteLength).assertEqual(8);
      expect(dv.byteLength).assertEqual(8);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0027
     * @tc.desc   验证BigUint64Array的最大可能值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(1);
      const maxValue = 0xFFFFFFFFFFFFFFFFn;
      arr[0] = maxValue;
      expect(arr[0]).assertEqual(maxValue);
      const dv = new DataView(arr.buffer);
      expect(dv.getBigUint64(0, true)).assertEqual(maxValue);
      expect(arr.buffer.byteLength).assertEqual(8);
      expect(dv.byteLength).assertEqual(8);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0xFFFFFFFFFFFFFFFFn);
      expect(dv.getUint32(0, true)).assertEqual(0xFFFFFFFF);
      expect(dv.getUint32(4, true)).assertEqual(0xFFFFFFFF);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0028
     * @tc.desc   验证BigUint64Array与普通数组的转换
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = [1n, 2n, 3n, 4n];
      const uintArr = new BigUint64Array(original);
      const converted = Array.from(uintArr);
      expect(converted.toString()).assertEqual(original.toString());
      expect(converted.length).assertEqual(4);
      expect(converted[0]).assertEqual(1n);
      expect(converted[1]).assertEqual(2n);
      expect(converted[2]).assertEqual(3n);
      expect(converted[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0029
     * @tc.desc   验证BigUint64Array的byteOffset和byteLength属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(32);
      const fullArr = new BigUint64Array(buf);
      expect(fullArr.byteOffset).assertEqual(0);
      expect(fullArr.byteLength).assertEqual(32);
      const offsetArr = new BigUint64Array(buf, 8, 1);
      expect(offsetArr.byteOffset).assertEqual(8);
      expect(offsetArr.byteLength).assertEqual(8);
      const subArr = fullArr.subarray(1, 3);
      expect(subArr.byteOffset).assertEqual(8);
      expect(subArr.byteLength).assertEqual(16);
      expect(fullArr.length).assertEqual(4);
      expect(offsetArr.length).assertEqual(1);
      expect(subArr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0030
     * @tc.desc   验证BigUint64Array使用不同偏移量创建视图
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(24);
      const baseArr = new BigUint64Array(buf);
      baseArr.set([10n, 20n, 30n]);
      const view1 = new BigUint64Array(buf, 8);
      expect(view1.length).assertEqual(2);
      expect(view1[0]).assertEqual(20n);
      expect(view1[1]).assertEqual(30n);
      const view2 = new BigUint64Array(buf, 8, 1);
      expect(view2.length).assertEqual(1);
      expect(view2[0]).assertEqual(20n);
      view2[0] = 25n;
      expect(baseArr[1]).assertEqual(25n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0031
     * @tc.desc   验证BigUint64Array对无效偏移量的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      let errorThrown = false;
      try {
        new BigUint64Array(buf, 4);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      errorThrown = false;
      try {
        new BigUint64Array(buf, 20);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      expect(buf.byteLength).assertEqual(16);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0032
     * @tc.desc   验证BigUint64Array与DataView处理特殊数值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      uintArr[0] = 0n;
      expect(dv.getBigUint64(0, true)).assertEqual(0n);
      const maxVal = 0xFFFFFFFFFFFFFFFFn;
      uintArr[0] = maxVal;
      expect(dv.getBigUint64(0, true)).assertEqual(maxVal);
      const boundaryVal = 0x8000000000000000n;
      uintArr[0] = boundaryVal;
      expect(dv.getBigUint64(0, true)).assertEqual(boundaryVal);
      expect(uintArr.length).assertEqual(1);
      expect(uintArr[0]).assertEqual(0x8000000000000000n);
      expect(dv.getUint32(0, true)).assertEqual(0x00000000);
      expect(dv.getUint32(4, true)).assertEqual(0x80000000);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0033
     * @tc.desc   验证BigUint64Array的find方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      const found = arr.find(val => val > 15n);
      expect(found).assertEqual(20n);
      const notFound = arr.find(val => val === 30n);
      expect(notFound).assertEqual(undefined);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0034
     * @tc.desc   验证BigUint64Array的findIndex方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      const index = arr.findIndex(val => val > 15n);
      expect(index).assertEqual(3);
      const notFoundIndex = arr.findIndex(val => val === 30n);
      expect(notFoundIndex).assertEqual(-1);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0035
     * @tc.desc   验证BigUint64Array与DataView混合类型读写
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setInt32(0, -1, true);
      dv.setUint32(4, 0x12345678, true);
      const expected = 0x12345678FFFFFFFFn;
      expect(uintArr[0]).assertEqual(expected);
      uintArr[0] = 0xABCDEF1234567890n;
      expect(dv.getInt32(0, true)).assertEqual(0x34567890);
      expect(dv.getUint32(4, true)).assertEqual(0xABCDEF12);
      expect(uintArr.length).assertEqual(1);
      expect(uintArr[0]).assertEqual(0xABCDEF1234567890n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0036
     * @tc.desc   验证BigUint64Array的join方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      expect(arr.join()).assertEqual('1,2,3,4');
      expect(arr.join('-')).assertEqual('1-2-3-4');
      expect(arr.join('')).assertEqual('1234');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0037
     * @tc.desc   验证BigUint64Array的reverse方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const reversed = arr.reverse();
      expect(reversed.toString()).assertEqual(new BigUint64Array([4n, 3n, 2n, 1n]).toString());
      expect(arr.toString()).assertEqual(new BigUint64Array([4n, 3n, 2n, 1n]).toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(1n);
      expect(reversed.length).assertEqual(4);
      expect(reversed[0]).assertEqual(4n);
      expect(reversed[1]).assertEqual(3n);
      expect(reversed[2]).assertEqual(2n);
      expect(reversed[3]).assertEqual(1n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0038
     * @tc.desc   验证BigUint64Array的sort方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([3n, 1n, 4n, 2n]);
      const sorted = arr.sort((a, b) => Number(a - b));
      expect(sorted.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n]).toString());
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n]).toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(sorted.length).assertEqual(4);
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[2]).assertEqual(3n);
      expect(sorted[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0039
     * @tc.desc   验证BigUint64Array与SharedArrayBuffer的并发模拟
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayBigUint64ArrayBufferDv0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (Done: Function) => {
        const sab = new SharedArrayBuffer(8);
        const view1 = new BigUint64Array(sab);
        const view2 = new BigUint64Array(sab);
        view1[0] = 100n;
        expect(view2[0]).assertEqual(100n);
        const promise1 = new Promise<void>(resolve => {
          setTimeout(() => {
            view1[0] = 200n;
            resolve();
          }, 10);
        });
        const promise2 = new Promise<void>(resolve => {
          setTimeout(() => {
            view2[0] = 300n;
            resolve();
          }, 20);
        });
        await Promise.all([promise1, promise2]);
        expect(view1[0]).assertEqual(300n);
        expect(view2[0]).assertEqual(300n);
        expect(view1.length).assertEqual(1);
        expect(view2.length).assertEqual(1);
        expect(view1[0]).assertEqual(300n);
        expect(view2[0]).assertEqual(300n);
        expect(sab.byteLength).assertEqual(8);
        Done();
      })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0040
     * @tc.desc   验证BigUint64Array的slice方法边界情况
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const slice3 = arr.slice(-3, -1);
      expect(slice3.toString()).assertEqual(new BigUint64Array([3n, 4n]).toString());
      const slice4 = arr.slice(undefined, 3);
      expect(slice4.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n]).toString());
      expect(slice3.length).assertEqual(2);
      expect(slice3[0]).assertEqual(3n);
      expect(slice3[1]).assertEqual(4n);
      expect(slice4.length).assertEqual(3);
      expect(slice4[0]).assertEqual(1n);
      expect(slice4[1]).assertEqual(2n);
      expect(slice4[2]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0041
     * @tc.desc   验证BigUint64Array的subarray方法边界情况
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub3 = arr.subarray(-3, -1);
      expect(sub3.toString()).assertEqual(new BigUint64Array([3n, 4n]).toString());
      expect(sub3.length).assertEqual(2);
      expect(sub3[0]).assertEqual(3n);
      expect(sub3[1]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0042
     * @tc.desc   验证BigUint64Array的set方法边界情况
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      const source = new BigUint64Array([10n, 20n, 30n]);
      try {
        arr.set(source, 3);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
      arr.fill(0n);
      arr.set(source);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
      expect(arr.length).assertEqual(5);
      expect(source.length).assertEqual(3);
      expect(source[0]).assertEqual(10n);
      expect(source[1]).assertEqual(20n);
      expect(source[2]).assertEqual(30n);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0043
     * @tc.desc   验证BigUint64Array的fill方法边界情况
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const fillVal = 9n;
      arr.fill(fillVal, -3);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 9n, 9n, 9n]).toString());
      arr.set([1n, 2n, 3n, 4n, 5n]);
      arr.fill(fillVal, 1, -1);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 9n, 9n, 9n, 5n]).toString());
      arr.fill(fillVal, 10, 20);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 9n, 9n, 9n, 5n]).toString());
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(9n);
      expect(arr[2]).assertEqual(9n);
      expect(arr[3]).assertEqual(9n);
      expect(arr[4]).assertEqual(5n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0044
     * @tc.desc   验证BigUint64Array的copyWithin方法边界情况
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3, 10);
      expect(arr.toString()).assertEqual(new BigUint64Array([4n, 5n, 3n, 4n, 5n]).toString());
      arr.set([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(4, 0, 2);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n, 1n]).toString());
      arr.set([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(-2, -4, -2);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 2n, 3n]).toString());
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0045
     * @tc.desc   验证BigUint64Array与DataView处理浮点数表示
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      const floatVal = 12345.6789;
      dv.setFloat64(0, floatVal, true);
      const uintVal = uintArr[0];
      dv.setBigUint64(0, uintVal, true);
      expect(dv.getFloat64(0, true)).assertEqual(floatVal);
      expect(uintArr.length).assertEqual(1);
      expect(uintArr[0]).assertEqual(uintVal);

    })


    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0047
     * @tc.desc   验证BigUint64Array的of方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = BigUint64Array.of(1n, 2n, 3n, 4n);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n]).toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0049
     * @tc.desc   验证BigUint64Array与其他TypedArray的交互
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const uint64Arr = new BigUint64Array(buf);
      const uint32Arr = new Uint32Array(buf);
      uint64Arr[0] = 0x0001020304050607n;
      uint64Arr[1] = 0x08090A0B0C0D0E0Fn;
      expect(uint32Arr.toString()).assertEqual(new Uint32Array([
        0x04050607,
        0x00010203,
        0x0C0D0E0F,
        0x08090A0B
      ]).toString());
      uint32Arr[0] = 0x11111111;
      uint32Arr[3] = 0x22222222;
      expect(uint64Arr[0]).assertEqual(0x0001020311111111n);
      expect(uint64Arr[1]).assertEqual(0x222222220C0D0E0Fn);
      expect(uint64Arr.length).assertEqual(2);
      expect(uint64Arr[0]).assertEqual(0x0001020311111111n);
      expect(uint64Arr[1]).assertEqual(0x222222220C0D0E0Fn);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0056
     * @tc.desc   验证BigUint64Array与DataView处理NaN和Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(16);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setFloat64(0, NaN, true);
      const nanBits = uintArr[0];
      dv.setFloat64(8, Infinity, true);
      const infBits = uintArr[1];
      expect(nanBits.toString()).assertEqual('9221120237041090560');
      expect(infBits.toString()).assertEqual('9218868437227405312');
      expect(uintArr.length).assertEqual(2);
      expect(uintArr[0]).assertEqual(0x7FF8000000000000n);
      expect(uintArr[1]).assertEqual(0x7FF0000000000000n);


    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0057
     * @tc.desc   验证BigUint64Array的reduce方法在中途修改数组的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sum = arr.reduce((acc, val, index) => {
        if (index === 0) {
          arr[3] = 40n;
        }
        return acc + val;
      }, 0n);
      expect(sum.toString()).assertEqual('46');
      expect(arr.toString()).assertEqual('1,2,3,40');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(40n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0062
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0062
     * @tc.desc   验证BigUint64Array与JSON的转换
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      try {
        JSON.stringify(Array.from(arr));
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0063
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0063
     * @tc.desc   验证BigUint64Array的values迭代器在数组修改后的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const values = Array.from(arr.values());
      arr[1] = 20n;
      arr[2] = 30n;
      expect(values.toString()).assertEqual('1,2,3,4');
      expect(arr.toString()).assertEqual('1,20,30,4');
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(1n);
      expect(values[1]).assertEqual(2n);
      expect(values[2]).assertEqual(3n);
      expect(values[3]).assertEqual(4n);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0064
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0064
     * @tc.desc   验证BigUint64Array的迭代器在数组长度变化时的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const iterator = arr[Symbol.iterator]();
      expect(iterator.next().value.toString()).assertEqual('1');
      const newArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let errorThrown = false;
      try {
        arr.set(newArr);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      expect(iterator.next().value.toString()).assertEqual('2');
      expect(iterator.next().value.toString()).assertEqual('3');
      expect(iterator.next().value).assertEqual(undefined);
      expect(iterator.next().value).assertEqual(undefined);
      expect(iterator.next().done).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0065
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0065
     * @tc.desc   验证BigUint64Array的includes方法对NaN的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setFloat64(0, NaN, true);
      dv.setFloat64(8, 123, true);
      expect(uintArr.includes(uintArr[0])).assertEqual(true);
      expect(uintArr.includes(uintArr[1])).assertEqual(true);
      expect(uintArr.includes(0n)).assertEqual(false);
      expect(uintArr.length).assertEqual(2);

    })


    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0069
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0069
     * @tc.desc   验证BigUint64Array与SharedArrayBuffer的原子操作
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const arr = new BigUint64Array(sab);
      arr[0] = 10n;
      let value = Atomics.load(arr, 0);
      expect(value.toString()).assertEqual('10');
      Atomics.store(arr, 0, 20n);
      expect(arr[0].toString()).assertEqual('20');
      const oldValue = Atomics.exchange(arr, 0, 30n);
      expect(oldValue.toString()).assertEqual('20');
      expect(arr[0].toString()).assertEqual('30');
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0070
     * @tc.desc   验证BigUint64Array的forEach方法对稀疏数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      arr[0] = 1n;
      arr[2] = 3n;
      arr[4] = 5n;
      const visited: number[] = [];
      arr.forEach((_val, index) => {
        visited.push(index);
      });
      expect(visited.toString()).assertEqual('0,1,2,3,4');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(5n);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0071
     * @tc.desc   验证BigUint64Array的reduceRight方法在中途修改数组的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sum = arr.reduceRight((acc, val, index) => {
        if (index === 3) {
          arr[0] = 10n;
        }
        return acc + val;
      }, 0n);
      expect(sum.toString()).assertEqual('19');
      expect(arr.toString()).assertEqual('10,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0073
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0073
     * @tc.desc   验证BigUint64Array的indexOf方法对重复值的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 3n, 5n, 7n, 5n, 9n]);
      expect(arr.indexOf(5n)).assertEqual(0);
      expect(arr.indexOf(5n, 1)).assertEqual(2);
      expect(arr.indexOf(5n, 3)).assertEqual(4);
      expect(arr.indexOf(5n, 5)).assertEqual(-1);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0074
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0074
     * @tc.desc   验证BigUint64Array的lastIndexOf方法对重复值的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 3n, 5n, 7n, 5n, 9n]);
      expect(arr.lastIndexOf(5n)).assertEqual(4);
      expect(arr.lastIndexOf(5n, 3)).assertEqual(2);
      expect(arr.lastIndexOf(5n, 1)).assertEqual(0);
      expect(arr.lastIndexOf(5n, -3)).assertEqual(2);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0076
     * @tc.desc   验证BigUint64Array的find方法对重复值的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 10n, 30n, 10n]);
      const result = arr.find(val => val > 15n);
      expect(result?.toString()).assertEqual('20');
      const firstTen = arr.find(val => val === 10n);
      expect(firstTen?.toString()).assertEqual('10');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0077
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0077
     * @tc.desc   验证BigUint64Array的findIndex方法对重复值的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 10n, 30n, 10n]);
      const index = arr.findIndex(val => val > 15n);
      expect(index).assertEqual(1);
      let lastTenIndex = -1;
      arr.findIndex((val, i) => {
        if (val === 10n) {
          lastTenIndex = i;
        }
        return false;
      });
      expect(lastTenIndex).assertEqual(4);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0078
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0078
     * @tc.desc   验证BigUint64Array与ArrayBuffer的slice方法交互
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new BigUint64Array([1n, 2n, 3n, 4n]);
      const bufferSlice = original.buffer.slice(8, 24);
      const slicedArr = new BigUint64Array(bufferSlice);
      expect(slicedArr.toString()).assertEqual('2,3');
      slicedArr[0] = 20n;
      expect(original.toString()).assertEqual('1,2,3,4');
      expect(original.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0079
     * @tc.desc   验证BigUint64Array的keys迭代器在数组修改后的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const keys = Array.from(arr.keys());
      arr[1] = 20n;
      expect(keys.toString()).assertEqual('0,1,2');
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0080
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0080
     * @tc.desc   验证BigUint64Array的entries迭代器在数组修改后的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const entries = Array.from(arr.entries());
      arr[1] = 20n;
      expect(entries.toString()).assertEqual('0,1,1,2,2,3');
      expect(entries.length).assertEqual(3);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0081
     * @tc.desc   验证BigUint64Array的every方法对空数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new BigUint64Array(0);
      const result = emptyArr.every(val => val > 0n);
      expect(result).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0082
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0082
     * @tc.desc   验证BigUint64Array的some方法对空数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new BigUint64Array(0);
      const result = emptyArr.some(val => val > 0n);
      expect(result).assertEqual(false);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0083
     * @tc.desc   验证BigUint64Array的reduce方法对空数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new BigUint64Array(0);
      const withInitial = emptyArr.reduce((acc, val) => acc + val, 0n);
      expect(withInitial.toString()).assertEqual('0');
      let errorThrown = false;
      try {
        emptyArr.reduce((acc, val) => acc + val);
      } catch (e) {
        errorThrown = (e instanceof TypeError);
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0087
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0087
     * @tc.desc   验证BigUint64Array的fill方法对不同填充值的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(3);
      arr.fill(20n);
      expect(arr.toString()).assertEqual('20,20,20');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(20n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0088
     * @tc.desc   验证BigUint64Array的set方法对不同源类型的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(3);
      arr.set([10n, 20n, 30n]);
      expect(arr.toString()).assertEqual('10,20,30');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0089
     * @tc.desc   验证BigUint64Array的sort方法对不同比较函数的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([3n, 1n, 4n, 2n]);
      arr.sort((a, b) => Number(a - b));
      expect(arr.toString()).assertEqual('1,2,3,4');
      arr.sort((a, b) => Number(b - a));
      expect(arr.toString()).assertEqual('4,3,2,1');
      arr.sort((a, b) => `${a}`.localeCompare(`${b}`));
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0090
     * @tc.desc   验证BigUint64Array的copyWithin方法对重叠区域的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr1.copyWithin(3, 0, 2);
      expect(arr1.toString()).assertEqual('1,2,3,1,2');
      const arr2 = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr2.copyWithin(1, 2, 4);
      expect(arr2.toString()).assertEqual('1,3,4,4,5');
      expect(arr1.length).assertEqual(5);
      expect(arr1[0]).assertEqual(1n);
      expect(arr1[1]).assertEqual(2n);
      expect(arr1[2]).assertEqual(3n);
      expect(arr1[3]).assertEqual(1n);
      expect(arr1[4]).assertEqual(2n);
      expect(arr2.length).assertEqual(5);
      expect(arr2[0]).assertEqual(1n);
      expect(arr2[1]).assertEqual(3n);
      expect(arr2[2]).assertEqual(4n);
      expect(arr2[3]).assertEqual(4n);
      expect(arr2[4]).assertEqual(5n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0091
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0091
     * @tc.desc   验证BigUint64Array的slice方法对整个数组的复制
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const copy = arr.slice();
      expect(copy.toString()).assertEqual(arr.toString());
      copy[0] = 10n;
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(copy.toString()).assertEqual('10,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(copy.length).assertEqual(4);
      expect(copy[0]).assertEqual(10n);
      expect(copy[1]).assertEqual(2n);
      expect(copy[2]).assertEqual(3n);
      expect(copy[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0092
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0092
     * @tc.desc   验证BigUint64Array的subarray方法对整个数组的引用
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sub = arr.subarray();
      expect(sub.toString()).assertEqual(arr.toString());
      sub[0] = 10n;
      expect(arr.toString()).assertEqual('10,2,3,4');
      expect(sub.toString()).assertEqual('10,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(10n);
      expect(sub[1]).assertEqual(2n);
      expect(sub[2]).assertEqual(3n);
      expect(sub[3]).assertEqual(4n);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0093
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0093
     * @tc.desc   验证BigUint64Array的values方法与for...of循环的兼容性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const values: bigint[] = [];
      for (const val of arr.values()) {
        values.push(val);
      }
      expect(new BigUint64Array(values).toString()).assertEqual(arr.toString());
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(1n);
      expect(values[1]).assertEqual(2n);
      expect(values[2]).assertEqual(3n);
      expect(values[3]).assertEqual(4n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0094
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0094
     * @tc.desc   验证BigUint64Array的entries方法与for...of循环的兼容性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const entries: [number, bigint][] = [];
      for (const entry of arr.entries()) {
        entries.push(entry);
      }
      expect(entries.length).assertEqual(4);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1].toString()).assertEqual('1');
      expect(entries[3][0]).assertEqual(3);
      expect(entries[3][1].toString()).assertEqual('4');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0095
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0095
     * @tc.desc   验证BigUint64Array与ArrayBuffer的byteLength匹配
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const length = 5;
      const arr = new BigUint64Array(length);
      expect(arr.byteLength).assertEqual(length * 8);
      expect(arr.buffer.byteLength).assertEqual(length * 8);
      const sub = arr.subarray(1, 3);
      expect(sub.byteLength).assertEqual(2 * 8);
      expect(sub.buffer.byteLength).assertEqual(length * 8);
      expect(sub.length).assertEqual(2);

    })
    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0096
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0096
     * @tc.desc   验证BigUint64Array的BYTES_PER_ELEMENT常量
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
      expect(new BigUint64Array(1).BYTES_PER_ELEMENT).assertEqual(8);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0100
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0100
     * @tc.desc   验证BigUint64Array的构造函数对无效参数的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let errorThrown = false;
      errorThrown = false;
      try {
        new BigUint64Array(-5);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0102
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0102
     * @tc.desc   验证BigUint64Array的map方法返回新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const mapped = arr.map(x => x * 2n);
      expect(mapped.toString()).assertEqual('2,4,6');
      expect(arr.toString()).assertEqual('1,2,3');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(4n);
      expect(mapped[2]).assertEqual(6n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0103
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0103
     * @tc.desc   验证BigUint64Array的filter方法返回新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const filtered = arr.filter(x => x % 2n === 0n);
      expect(filtered.toString()).assertEqual('2,4');
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2n);
      expect(filtered[1]).assertEqual(4n);
    })


    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0107
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0107
     * @tc.desc   验证BigUint64Array的slice方法返回新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sliced = arr.slice(1, 3);

      expect(sliced.toString()).assertEqual('2,3');
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(2n);
      expect(sliced[1]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0109
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0109
     * @tc.desc   验证BigUint64Array的from方法返回新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [1n, 2n, 3n];
      const arr = BigUint64Array.from(source);
      expect(arr.toString()).assertEqual('1,2,3');
      expect(Array.isArray(arr)).assertEqual(false);
      expect(arr instanceof BigUint64Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0110
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0110
     * @tc.desc   验证BigUint64Array的of方法返回新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      expect(Array.isArray(arr)).assertEqual(false);
      expect(arr instanceof BigUint64Array).assertEqual(true);
      expect(arr.toString()).assertEqual('1,2,3');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0111
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0111
     * @tc.desc   验证BigUint64Array的every方法短路行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([2n, 4n, 6n, 3n, 8n]);
      let checks = 0;
      const result = arr.every(val => {
        checks++;
        return val % 2n === 0n;
      });
      expect(result).assertEqual(false);
      expect(checks).assertEqual(4);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0112
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0112
     * @tc.desc   验证BigUint64Array的some方法短路行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 3n, 5n, 4n, 7n]);
      let checks = 0;
      const result = arr.some(val => {
        checks++;
        return val % 2n === 0n;
      });
      expect(result).assertEqual(true);
      expect(checks).assertEqual(4);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0113
     * @tc.desc   验证BigUint64Array的forEach方法无法中断
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let checks = 0;

      arr.forEach(val => {
        checks++;
        if (val === 2n) {
          return;
        }
      });
      expect(checks).assertEqual(4);

    })


    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0115
     * @tc.desc   验证BigUint64Array的splice方法返回被删除元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const removed = arr.slice(1, 2);
      expect(removed.toString()).assertEqual('2');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0116
     * @tc.desc   验证BigUint64Array的indexOf方法对NaN的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const dv = new DataView(buf);
      const arr = new BigUint64Array(buf);
      dv.setFloat64(0, NaN, true);
      dv.setFloat64(8, 123, true);
      expect(arr.indexOf(arr[0])).assertEqual(0);
      expect(arr.indexOf(BigInt(0))).assertEqual(-1);
      expect(arr.length).assertEqual(2);
      expect(arr[0].toString()).assertEqual('9221120237041090560');
      expect(arr[1].toString()).assertEqual('4638355772470722560');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0117
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0117
     * @tc.desc   验证BigUint64Array的lastIndexOf方法对NaN的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(24);
      const dv = new DataView(buf);
      const arr = new BigUint64Array(buf);
      dv.setFloat64(0, NaN, true);
      dv.setFloat64(8, 123, true);
      dv.setFloat64(16, NaN, true);
      expect(arr.lastIndexOf(arr[0])).assertEqual(2);
      expect(arr.length).assertEqual(3);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0118
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0118
     * @tc.desc   验证BigUint64Array的find方法对稀疏数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      arr[0] = 10n;
      arr[3] = 40n;
      const result = arr.find(val => val > 20n);
      expect(result?.toString()).assertEqual('40');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0119
     * @tc.desc   验证BigUint64Array的findIndex方法对稀疏数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      arr[0] = 10n;
      arr[3] = 40n;
      const index = arr.findIndex(val => val > 20n);
      expect(index).assertEqual(3);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0120
     * @tc.desc   验证BigUint64Array的sort方法稳定性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([2n, 1n, 2n, 3n, 1n, 3n]);
      const sorted = arr.slice().sort((a, b) => Number(a - b));
      expect(sorted.toString()).assertEqual('1,1,2,2,3,3');
      expect(sorted.length).assertEqual(6);
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(1n);
      expect(sorted[2]).assertEqual(2n);
      expect(sorted[3]).assertEqual(2n);
      expect(sorted[4]).assertEqual(3n);
      expect(sorted[5]).assertEqual(3n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0121
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0121
     * @tc.desc   验证BigUint64Array的fill方法对整个数组的填充
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      arr.fill(0n);
      expect(arr.toString()).assertEqual('0,0,0,0');
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0122
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0122
     * @tc.desc   验证BigUint64Array的fill方法对部分数组的填充
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.fill(0n, 1, 4);
      expect(arr.toString()).assertEqual('1,0,0,0,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0123
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0123
     * @tc.desc   验证BigUint64Array的copyWithin方法对整个数组的复制
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);

      arr.copyWithin(0, 2);
      expect(arr.toString()).assertEqual('3,4,5,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0124
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0124
     * @tc.desc   验证BigUint64Array的set方法对超出范围的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(3);
      const source = new BigUint64Array([10n, 20n, 30n, 40n]);
      let errorThrown = false;
      try {
        arr.set(source);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      errorThrown = false;
      try {
        arr.set(source, 1);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0125
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0125
     * @tc.desc   验证BigUint64Array的set方法对负偏移量的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      const source = new BigUint64Array([10n, 20n]);

      let errorThrown = false;
      try {
        arr.set(source, -2);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);

      errorThrown = false;
      try {
        arr.set(source, -1);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0126
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0126
     * @tc.desc   验证BigUint64Array的slice方法对负索引的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const slice1 = arr.slice(-3);
      expect(slice1.toString()).assertEqual('3,4,5');
      const slice2 = arr.slice(1, -1);
      expect(slice2.toString()).assertEqual('2,3,4');
      const slice3 = arr.slice(-4, -2);
      expect(slice3.toString()).assertEqual('2,3');
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0127
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0127
     * @tc.desc   验证BigUint64Array的subarray方法对负索引的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub1 = arr.subarray(-3);
      expect(sub1.toString()).assertEqual('3,4,5');
      const sub2 = arr.subarray(1, -1);
      expect(sub2.toString()).assertEqual('2,3,4');
      const sub3 = arr.subarray(-4, -2);
      expect(sub3.toString()).assertEqual('2,3');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0128
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0128
     * @tc.desc   验证BigUint64Array的join方法对空数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new BigUint64Array(0);
      expect(emptyArr.join()).assertEqual('');
      expect(emptyArr.join('-')).assertEqual('');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0129
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0129
     * @tc.desc   验证BigUint64Array的reverse方法对空数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new BigUint64Array(0);
      const reversed = emptyArr.reverse();
      expect(reversed.toString()).assertEqual('');
      expect(reversed.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0130
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0130
     * @tc.desc   验证BigUint64Array的sort方法对空数组的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new BigUint64Array(0);
      const sorted = emptyArr.sort();
      expect(sorted.toString()).assertEqual('');
      expect(sorted.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0136
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0136
     * @tc.desc   验证BigUint64Array的join方法使用不同分隔符
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);

      expect(arr.join()).assertEqual('1,2,3,4');

      expect(arr.join('-')).assertEqual('1-2-3-4');

      expect(arr.join('')).assertEqual('1234');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0137
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0137
     * @tc.desc   验证BigUint64Array的includes方法对边界值的处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxVal = 0xFFFFFFFFFFFFFFFFn;
      const arr = new BigUint64Array([0n, 1n, maxVal - 1n, maxVal]);
      expect(arr.includes(0n)).assertEqual(true);
      expect(arr.includes(maxVal)).assertEqual(true);
      expect(arr.includes(maxVal + 1n)).assertEqual(false);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0138
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0138
     * @tc.desc   验证BigUint64Array的includes方法从指定位置搜索
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 1n, 3n, 1n]);

      expect(arr.includes(1n, 2)).assertEqual(true);

      expect(arr.includes(1n, 4)).assertEqual(true);

      expect(arr.includes(1n, 5)).assertEqual(false);

      expect(arr.includes(1n, -2)).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0139
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0139
     * @tc.desc   验证BigUint64Array的indexOf方法对超出范围的起始索引处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      expect(arr.indexOf(1n, 5)).assertEqual(-1);

      expect(arr.indexOf(2n, -5)).assertEqual(1);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0140
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0140
     * @tc.desc   验证BigUint64Array的lastIndexOf方法对超出范围的起始索引处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 1n, 3n]);

      expect(arr.lastIndexOf(1n, 10)).assertEqual(2);

      expect(arr.lastIndexOf(1n, -10)).assertEqual(-1);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0141
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0141
     * @tc.desc   验证BigUint64Array的fill方法对超出范围的索引处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);

      arr.fill(0n, 1, 10);
      expect(arr.toString()).assertEqual('1,0,0,0');
      expect(arr.length).assertEqual(4);
      arr.fill(5n, 10, 15);
      expect(arr.toString()).assertEqual('1,0,0,0');
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0142
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0142
     * @tc.desc   验证BigUint64Array的copyWithin方法对超出范围的索引处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3, 10);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
      arr.copyWithin(0, 10, 15);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0143
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0143
     * @tc.desc   验证BigUint64Array的splice方法对超出范围的索引处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      const removed = arr.slice(10, 2);
      expect(removed.toString()).assertEqual('');
      expect(arr.toString()).assertEqual('1,2,3');
      expect(arr.length).assertEqual(3);
      arr.slice(-10, 1);
      expect(arr.toString()).assertEqual('1,2,3');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0144
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0144
     * @tc.desc   验证BigUint64Array的splice方法删除数量超出范围
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);

      const removed = arr.slice(2, 10);
      expect(removed.toString()).assertEqual('3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(removed.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0145
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0145
     * @tc.desc   验证BigUint64Array的from方法对映射函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let errorThrown = false;
      try {
        BigUint64Array.from([1n, 2n, 3n], () => {
          throw new Error('Test error');
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0146
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0146
     * @tc.desc   验证BigUint64Array的map方法对映射函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.map((val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return val;
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0147
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0147
     * @tc.desc   验证BigUint64Array的filter方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.filter((val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return val > 1n;
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0148
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0148
     * @tc.desc   验证BigUint64Array的reduce方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.reduce((acc, val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return acc + val;
        }, 0n);
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0149
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0149
     * @tc.desc   验证BigUint64Array的every方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.every((val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return val > 0n;
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0150
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0150
     * @tc.desc   验证BigUint64Array的some方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.some((val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return val > 5n;
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0151
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0151
     * @tc.desc   验证BigUint64Array的forEach方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.forEach((_val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0152
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0152
     * @tc.desc   验证BigUint64Array的find方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.find((val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return val > 5n;
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0153
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0153
     * @tc.desc   验证BigUint64Array的findIndex方法对回调函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      let errorThrown = false;
      try {
        arr.findIndex((val, index) => {
          if (index === 1) {
            throw new Error('Test error');
          }
          return val > 5n;
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0155
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0155
     * @tc.desc   验证BigUint64Array的sort方法对比较函数的异常处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([3n, 1n, 2n]);

      let errorThrown = false;
      try {
        arr.sort((a, b) => {
          if (a === 1n && b === 2n) {
            throw new Error('Test error');
          }
          return Number(a - b);
        });
      } catch (e) {
        errorThrown = (e instanceof Error && e.message === 'Test error');
      }
      expect(errorThrown).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0156
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0156
     * @tc.desc   验证BigUint64Array与其他类型化数组共享缓冲区
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const uint64Arr = new BigUint64Array(buffer);
      const uint8Arr = new Uint8Array(buffer);

      uint64Arr[0] = 0x123456789ABCDEF0n;
      expect(uint8Arr[0]).assertEqual(0xF0);
      expect(uint8Arr[1]).assertEqual(0xDE);
      expect(uint8Arr[2]).assertEqual(0xBC);
      expect(uint8Arr[3]).assertEqual(0x9A);
      expect(uint8Arr.length).assertEqual(16);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0157
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0157
     * @tc.desc   验证BigUint64Array的byteOffset属性正确反映偏移量
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const arr1 = new BigUint64Array(buffer);
      const arr2 = new BigUint64Array(buffer, 8);
      const arr3 = new BigUint64Array(buffer, 16, 1);
      expect(arr1.byteOffset).assertEqual(0);
      expect(arr2.byteOffset).assertEqual(8);
      expect(arr3.byteOffset).assertEqual(16);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0158
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0158
     * @tc.desc   验证BigUint64Array的set方法正确处理偏移量
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(5);
      const source = new BigUint64Array([10n, 20n, 30n]);
      arr.set(source, 2);
      expect(arr.toString()).assertEqual('0,0,10,20,30');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0159
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0159
     * @tc.desc   验证BigUint64Array的subarray方法创建视图
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      expect(sub.length).assertEqual(3);
      sub[0] = 20n;
      expect(arr.toString()).assertEqual('1,20,3,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0160
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0160
     * @tc.desc   验证BigUint64Array的slice方法创建新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const slice = arr.slice(1, 4);
      expect(slice.toString()).assertEqual('2,3,4');
      expect(slice.length).assertEqual(3);
      slice[0] = 20n;
      expect(arr.toString()).assertEqual('1,2,3,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0161
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0161
     * @tc.desc   验证BigUint64Array的reverse方法反转数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      arr.reverse();
      expect(arr.toString()).assertEqual('4,3,2,1');
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0162
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0162
     * @tc.desc   验证BigUint64Array的sort方法正确排序
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([3n, 1n, 4n, 2n]);
      arr.sort((a, b) => Number(a - b));
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0163
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0163
     * @tc.desc   验证BigUint64Array的fill方法部分填充
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.fill(0n, 1, 4);
      expect(arr.toString()).assertEqual('1,0,0,0,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0164
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0164
     * @tc.desc   验证BigUint64Array的copyWithin方法复制范围内元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3, 5);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0165
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0165
     * @tc.desc   验证BigUint64Array的indexOf方法查找元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n, 10n]);
      expect(arr.indexOf(20n)).assertEqual(1);
      expect(arr.indexOf(40n)).assertEqual(-1);
      expect(arr.indexOf(10n, 2)).assertEqual(4);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0166
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0166
     * @tc.desc   验证BigUint64Array的lastIndexOf方法查找元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n, 10n]);
      expect(arr.lastIndexOf(20n)).assertEqual(3);
      expect(arr.lastIndexOf(40n)).assertEqual(-1);
      expect(arr.lastIndexOf(10n, 3)).assertEqual(0);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0167
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0167
     * @tc.desc   验证BigUint64Array的includes方法检查元素存在
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(arr.includes(3n)).assertEqual(true);
      expect(arr.includes(6n)).assertEqual(false);
      expect(arr.includes(2n, 2)).assertEqual(false);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0168
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0168
     * @tc.desc   验证BigUint64Array的forEach方法遍历元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);

      interface InSum { value: bigint }

      const sum: InSum = { value: 0n };

      arr.forEach(val => {
        sum.value += val;
      });
      expect(sum.value.toString()).assertEqual('6');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0169
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0169
     * @tc.desc   验证BigUint64Array的map方法映射元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const mapped = arr.map(val => val * 2n);
      expect(mapped.toString()).assertEqual('2,4,6');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0170
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0170
     * @tc.desc   验证BigUint64Array的filter方法过滤元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const filtered = arr.filter(val => val % 2n === 0n);
      expect(filtered.toString()).assertEqual('2,4');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0171
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0171
     * @tc.desc   验证BigUint64Array的every方法检查所有元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array([2n, 4n, 6n, 8n]);
      const arr2 = new BigUint64Array([2n, 3n, 6n, 8n]);
      expect(arr1.every(val => val % 2n === 0n)).assertEqual(true);
      expect(arr2.every(val => val % 2n === 0n)).assertEqual(false);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0172
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0172
     * @tc.desc   验证BigUint64Array的some方法检查存在元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array([1n, 3n, 5n, 7n]);
      const arr2 = new BigUint64Array([1n, 3n, 6n, 7n]);
      expect(arr1.some(val => val % 2n === 0n)).assertEqual(false);
      expect(arr2.some(val => val % 2n === 0n)).assertEqual(true);

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0173
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0173
     * @tc.desc   验证BigUint64Array的reduce方法累加元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);

      const sum = arr.reduce((acc, val) => acc + val, 0n);
      expect(sum.toString()).assertEqual('10');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0175
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0175
     * @tc.desc   验证BigUint64Array的values迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigUint64ArrayBufferDv0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const values: bigint[] = [];

      for (const val of arr.values()) {
        values.push(val);
      }
      expect(new BigUint64Array(values).toString()).assertEqual('1,2,3');

    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0176
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0176
     * @tc.desc   Verify BigUint64Array with DataView writing float values (interpreted as unsigned)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const floatVal: number = 123.456;
      dv.setFloat64(0, floatVal, true);
      const floatAsBigUint: bigint = dv.getBigUint64(0, true);
      expect(bigUint64Arr[0]).assertEqual(floatAsBigUint);
      bigUint64Arr[0] = 456n;
      const bigUintAsFloat: number = dv.getFloat64(0, true);
      expect(bigUintAsFloat).assertEqual(2.253e-321);
      dv.setFloat32(0, 789.123, true);
      const float32AsBigUint: bigint = dv.getBigUint64(0, true);
      expect(bigUint64Arr[0]).assertEqual(float32AsBigUint);
      expect(bigUint64Arr.length).assertEqual(1);
      expect(bigUint64Arr[0]).assertEqual(float32AsBigUint);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0177
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0177
     * @tc.desc   Verify BigUint64Array subarray with max length (covers remaining elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const parentArr: BigUint64Array = new BigUint64Array(buf);
      parentArr.set([10n, 20n, 30n, 40n]);
      const dv: DataView = new DataView(buf);
      const subArr1: BigUint64Array = parentArr.subarray(1, 1 + 100);
      expect(subArr1.length).assertEqual(3);
      expect(subArr1.toString()).assertEqual([20n, 30n, 40n].toString());
      const subArr2: BigUint64Array = parentArr.subarray(2, 2 + 0);
      expect(subArr2.length).assertEqual(0);
      const subArr3: BigUint64Array = parentArr.subarray(3, 3 + 5);
      expect(subArr3.length).assertEqual(1);
      expect(subArr3[0]).assertEqual(40n);
      dv.setBigUint64(8, 25n, true);
      expect(subArr1[0]).assertEqual(25n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0178
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0178
     * @tc.desc   Verify BigUint64Array slice with max length (covers remaining elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const parentArr: BigUint64Array = new BigUint64Array(buf);
      parentArr.set([5n, 15n, 25n, 35n]);
      const dv: DataView = new DataView(buf);
      const sliced1: BigUint64Array = parentArr.slice(1, 100);
      expect(sliced1.length).assertEqual(3);
      expect(sliced1.toString()).assertEqual([15n, 25n, 35n].toString());
      const sliced2: BigUint64Array = parentArr.slice(2, 2);
      expect(sliced2.length).assertEqual(0);
      const sliced3: BigUint64Array = parentArr.slice(3, 5);
      expect(sliced3.length).assertEqual(1);
      expect(sliced3[0]).assertEqual(35n);
      dv.setBigUint64(8, 20n, true);
      expect(sliced1[0]).assertEqual(15n);
    })
    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0181
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0181
     * @tc.desc   Verify BigUint64Array with DataView reading signed 32-bit values (interpreted as unsigned)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const int32Val: number = -123456;
      dv.setInt32(0, int32Val, true);
      const uint32Equivalent = int32Val >>> 0;
      const expectedBigUint: bigint = BigInt(uint32Equivalent);
      expect(bigUint64Arr[0]).assertEqual(expectedBigUint);
      dv.setInt32(4, -1, true);
      const expectedFull64: bigint = (0xFFFFFFFFn << 32n) | expectedBigUint;
      expect(bigUint64Arr[0]).assertEqual(expectedFull64);
      bigUint64Arr[0] = 0xFFFFFFFFFFFFFFFFn;
      const readInt32: number = dv.getInt32(0, true);
      expect(readInt32).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0182
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0182
     * @tc.desc   Verify BigUint64Array copyWithin with target beyond array length (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([5n, 15n, 25n]);
      const originalStr = bigUint64Arr.toString();
      const dv: DataView = new DataView(buf);
      bigUint64Arr.copyWithin(5, 0, 2);
      expect(bigUint64Arr.toString()).assertEqual(originalStr);
      bigUint64Arr.copyWithin(3, 0, 2);
      expect(bigUint64Arr.toString()).assertEqual(originalStr);
      bigUint64Arr.copyWithin(2, 0, 1);
      expect(bigUint64Arr.toString()).assertEqual([5n, 15n, 5n].toString());
      expect(dv.getBigUint64(16, true)).assertEqual(5n);
      bigUint64Arr.set([5n, 15n, 25n]);
      expect(bigUint64Arr.toString()).assertEqual(originalStr);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0183
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0183
     * @tc.desc   Verify BigUint64Array fill with target beyond array length (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([10n, 20n, 30n]);
      const originalStr = bigUint64Arr.toString();
      const fillVal: bigint = 99n;
      const dv: DataView = new DataView(buf);
      bigUint64Arr.fill(fillVal, 5);
      expect(bigUint64Arr.toString()).assertEqual(originalStr);
      bigUint64Arr.fill(fillVal, 3);
      expect(bigUint64Arr.toString()).assertEqual(originalStr);
      bigUint64Arr.fill(fillVal, 1, 3);
      expect(bigUint64Arr.toString()).assertEqual([10n, 99n, 99n].toString());
      expect(dv.getBigUint64(8, true)).assertEqual(99n);
      expect(dv.getBigUint64(16, true)).assertEqual(99n);
      bigUint64Arr.set([10n, 20n, 30n]);
      expect(bigUint64Arr.toString()).assertEqual(originalStr);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0184
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0184
     * @tc.desc   Verify BigUint64Array with SharedArrayBuffer (multi-thread simulation: lock-free read)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(8);
      const thread1Arr: BigUint64Array = new BigUint64Array(sab);
      const thread2Arr: BigUint64Array = new BigUint64Array(sab);
      const dv: DataView = new DataView(sab);
      thread1Arr[0] = 100n;
      expect(thread2Arr[0]).assertEqual(100n);

      thread1Arr[0] = 200n;
      const thread2Read = thread2Arr[0];
      expect(thread2Read).assertEqual(200n);
      dv.setBigUint64(0, 300n, true);
      expect(thread1Arr[0]).assertEqual(300n);
      expect(thread1Arr[0]).assertEqual(thread2Arr[0]);
      expect(thread2Arr[0]).assertEqual(dv.getBigUint64(0, true));
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0185
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0185
     * @tc.desc   Verify BigUint64Array indexOf with non-integer start (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([5n, 10n, 5n]);
      const dv: DataView = new DataView(buf);

      expect(bigUint64Arr.indexOf(5n, 1.9)).assertEqual(2);

      expect(bigUint64Arr.indexOf(5n, 2.1)).assertEqual(2);

      expect(bigUint64Arr.indexOf(5n, -1.5)).assertEqual(2);

      dv.setBigUint64(16, 15n, true);
      expect(bigUint64Arr.indexOf(5n, 1.9)).assertEqual(-1);

      expect(bigUint64Arr.indexOf(5n, 0.0)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0186
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0186
     * @tc.desc   Verify BigUint64Array lastIndexOf with non-integer start (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([5n, 10n, 5n]);
      const dv: DataView = new DataView(buf);

      expect(bigUint64Arr.lastIndexOf(5n, 1.9)).assertEqual(0);

      expect(bigUint64Arr.lastIndexOf(5n, 2.1)).assertEqual(2);

      expect(bigUint64Arr.lastIndexOf(5n, -1.5)).assertEqual(2);

      dv.setBigUint64(0, 15n, true);
      expect(bigUint64Arr.lastIndexOf(5n, 1.9)).assertEqual(-1);

      expect(bigUint64Arr.lastIndexOf(5n, 0.0)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0187
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0187
     * @tc.desc   Verify BigUint64Array includes with non-integer start (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(sab);
      bigUint64Arr.set([20n, 30n, 40n]);
      const dv: DataView = new DataView(sab);
      expect(bigUint64Arr.includes(30n, 1.9)).assertEqual(true);
      expect(bigUint64Arr.includes(20n, 1.9)).assertEqual(false);

      expect(bigUint64Arr.includes(40n, 2.1)).assertEqual(true);
      expect(bigUint64Arr.includes(30n, 2.1)).assertEqual(false);

      expect(bigUint64Arr.includes(40n, -1.5)).assertEqual(true);

      dv.setBigUint64(16, 45n, true);
      expect(bigUint64Arr.includes(40n, 2.1)).assertEqual(false);
      expect(bigUint64Arr.includes(45n, 2.1)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0188
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0188
     * @tc.desc   Verify BigUint64Array with DataView writing 8-bit unsigned values (partial byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x0000000000000000n;
      bigUint64Arr[0] = initialVal;
      dv.setUint8(0, 0x12);
      let expectedVal: bigint = 0x0000000000000012n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);
      dv.setUint8(3, 0x34);
      expectedVal = 0x0000000034000012n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);
      dv.setUint8(7, 0x78);
      expectedVal = 0x7800000034000012n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);
      expect(dv.getUint8(0)).assertEqual(0x12);
      expect(dv.getUint8(3)).assertEqual(0x34);
      expect(dv.getUint8(7)).assertEqual(0x78);
      expect(bigUint64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0189
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0189
     * @tc.desc   Verify BigUint64Array with DataView writing 16-bit unsigned values (partial bytes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x0000000000000000n;

      bigUint64Arr[0] = initialVal;

      dv.setUint16(0, 0x1234, true);
      let expectedVal: bigint = 0x0000000000001234n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);

      dv.setUint16(2, 0x5678, true);
      expectedVal = 0x0000000056781234n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);

      dv.setUint16(4, 0x9ABC, true);
      expectedVal = 0x9ABC56781234n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);

      expect(dv.getUint16(0, true)).assertEqual(0x1234);
      expect(dv.getUint16(2, true)).assertEqual(0x5678);
      expect(dv.getUint16(4, true)).assertEqual(0x9ABC);
      expect(bigUint64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0192
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0192
     * @tc.desc   Verify BigUint64Array with DataView reading 64-bit values in big-endian
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const testVal: bigint = 0x0011223344556677n;

      bigUint64Arr[0] = testVal;
      const bigEndianRead: bigint = dv.getBigUint64(0, false);
      const expectedBigEndian: bigint = 0x7766554433221100n;
      expect(bigEndianRead).assertEqual(expectedBigEndian);

      dv.setBigUint64(0, testVal, false);
      const littleEndianRead: bigint = bigUint64Arr[0];
      expect(littleEndianRead).assertEqual(expectedBigEndian);

      expect(dv.getBigUint64(0, true)).assertEqual(littleEndianRead);
      expect(bigUint64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0193
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0193
     * @tc.desc   Verify BigUint64Array copyWithin with non-integer target/start/end (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([1n, 2n, 3n]);
      const dv: DataView = new DataView(buf);

      bigUint64Arr.copyWithin(0.9, 1.1, 2.9);
      expect(bigUint64Arr.toString()).assertEqual([2n, 2n, 3n].toString());

      bigUint64Arr.set([1n, 2n, 3n]);

      bigUint64Arr.copyWithin(1.5, 0.2, 1.8);
      expect(bigUint64Arr.toString()).assertEqual([1n, 1n, 3n].toString());
      expect(dv.getBigUint64(8, true)).assertEqual(1n);

      bigUint64Arr.set([1n, 2n, 3n]);

      bigUint64Arr.copyWithin(-0.5, -1.2, -0.1);
      expect(bigUint64Arr.toString()).assertEqual([1n, 2n, 3n].toString());
      expect(bigUint64Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0194
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0194
     * @tc.desc   Verify BigUint64Array fill with non-integer start/end (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([10n, 20n, 30n]);
      const fillVal: bigint = 5n;
      const dv: DataView = new DataView(buf);

      bigUint64Arr.fill(fillVal, 0.9, 2.1);
      expect(bigUint64Arr.toString()).assertEqual([5n, 5n, 30n].toString());

      bigUint64Arr.set([10n, 20n, 30n]);

      bigUint64Arr.fill(fillVal, 1.2, -0.5);
      expect(bigUint64Arr.toString()).assertEqual([10n, 20n, 30n].toString());
      expect(dv.getBigUint64(8, true)).assertEqual(20n);

      bigUint64Arr.set([10n, 20n, 30n]);

      bigUint64Arr.fill(fillVal, -1.8, 3.5);
      expect(bigUint64Arr.toString()).assertEqual([10n, 20n, 5n].toString());
      expect(bigUint64Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0195
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0195
     * @tc.desc   Verify BigUint64Array with SharedArrayBuffer (empty buffer, multi-view consistency)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptySab: SharedArrayBuffer = new SharedArrayBuffer(0);
      const view1: BigUint64Array = new BigUint64Array(emptySab);
      const view2: BigUint64Array = new BigUint64Array(emptySab);
      const dv: DataView = new DataView(emptySab);

      expect(view1.length).assertEqual(0);
      expect(view2.length).assertEqual(0);
      expect(view1.byteLength).assertEqual(0);
      expect(view2.byteLength).assertEqual(0);

      expect(view1.buffer).assertEqual(emptySab);
      expect(view2.buffer).assertEqual(emptySab);
      expect(dv.buffer).assertEqual(emptySab);

      let isRangeError = false;
      try {
        view1.set([1n]);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      view2.fill(2n);
      expect(view1.length).assertEqual(0);
      expect(view2.length).assertEqual(0);

      try {
        dv.getBigUint64(0, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);

      try {
        dv.setBigUint64(0, 1n, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })


    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0196
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0196
     * @tc.desc   Verify BigUint64Array slice with non-integer start/end (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigUint64Array = new BigUint64Array(buf);
      originalArr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(buf);

      const sliced1: BigUint64Array = originalArr.slice(0.9, 2.1);
      expect(sliced1.toString()).assertEqual([5n, 15n].toString());

      const sliced2: BigUint64Array = originalArr.slice(1.2, -0.5);
      expect(sliced2.toString()).assertEqual([].toString());

      const sliced3: BigUint64Array = originalArr.slice(-1.8, 3.5);
      expect(sliced3.toString()).assertEqual([25n].toString());

      dv.setBigUint64(8, 20n, true);
      expect(sliced1.toString()).assertEqual([5n, 15n].toString());
      expect(sliced2.toString()).assertEqual([].toString());
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0197
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0197
     * @tc.desc   Verify BigUint64Array with DataView reading 64-bit values in mixed endianness
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const littleEndianVal: bigint = 0x0011223344556677n;
      const bigEndianVal: bigint = 0x7766554433221100n;

      bigUint64Arr[0] = littleEndianVal;
      expect(dv.getBigUint64(0, true)).assertEqual(littleEndianVal);
      expect(dv.getBigUint64(0, false)).assertEqual(bigEndianVal);

      dv.setBigUint64(0, littleEndianVal, false);
      expect(bigUint64Arr[0]).assertEqual(bigEndianVal);
      expect(dv.getBigUint64(0, false)).assertEqual(littleEndianVal);

      const bytes: number[] = [];
      for (let i = 0; i < 8; i++) {
        bytes.push(dv.getUint8(i));
      }
      expect(bytes.toString()).assertEqual([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77].toString());
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0198
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0198
     * @tc.desc   Verify BigUint64Array with DataView writing 32-bit unsigned values (partial bytes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x0000000000000000n;

      bigUint64Arr[0] = initialVal;

      dv.setUint32(0, 0xFFFFFFFF, true);
      let expectedVal: bigint = 0x00000000FFFFFFFFn;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);

      dv.setUint32(4, 0x12345678, true);
      expectedVal = 0x12345678FFFFFFFFn;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);

      expect(dv.getUint32(0, true)).assertEqual(0xFFFFFFFF);
      expect(dv.getUint32(4, true)).assertEqual(0x12345678);

      dv.setUint32(0, 0x100000000, true);
      expect(dv.getUint32(0, true)).assertEqual(0);
      expectedVal = 0x1234567800000000n;
      expect(bigUint64Arr[0]).assertEqual(expectedVal);
      expect(bigUint64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0199
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0199
     * @tc.desc   Verify BigUint64Array with DataView reading unsigned 32-bit values (coerced to BigUint)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      const dv: DataView = new DataView(buf);
      const uint32Val: number = 0x12345678;

      dv.setUint32(0, uint32Val, true);
      const expectedBigUint: bigint = BigInt(uint32Val);
      expect(bigUint64Arr[0]).assertEqual(expectedBigUint);

      dv.setUint32(4, 0x789ABCDE, true);
      const expectedBigUint2: bigint = (BigInt(0x789ABCDE) << 32n) | BigInt(uint32Val);
      expect(bigUint64Arr[0]).assertEqual(expectedBigUint2);

      bigUint64Arr[0] = 0x123456789ABCDEF0n;
      const readUint32: number = dv.getUint32(0, true);
      expect(readUint32).assertEqual(0x9ABCDEF0);
      expect(bigUint64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0200
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0200
     * @tc.desc   Verify BigUint64Array forEach stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([5n, 10n, 15n]);
      let iterationCount = 0;
      const errorMsg = 'Test error at index 1';

      try {
        bigUint64Arr.forEach((_val, idx) => {
          iterationCount++;
          if (idx === 1) {
            throw new Error(errorMsg);
          }
        });
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }

      expect(iterationCount).assertEqual(2);

      const dv: DataView = new DataView(buf);
      dv.setBigUint64(8, 20n, true);
      iterationCount = 0;
      try {
        bigUint64Arr.forEach((_val, idx) => {
          iterationCount++;
          if (idx === 1) {
            throw new Error(errorMsg);
          }
        });
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }
      expect(iterationCount).assertEqual(2);
      expect(bigUint64Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0201
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0201
     * @tc.desc   Verify BigUint64Array map stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigUint64Array = new BigUint64Array(buf);
      originalArr.set([2n, 4n, 6n]);
      let mappedValues: bigint[] = [];
      const errorMsg = 'Test error at index 1';

      try {
        originalArr.map((val, idx) => {
          const result = val * 2n;
          mappedValues.push(result);
          if (idx === 1) {
            throw new Error(errorMsg);
          }
          return result;
        });
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }

      expect(mappedValues.toString()).assertEqual([4n, 8n].toString());

      const dv: DataView = new DataView(buf);
      dv.setBigUint64(8, 5n, true);
      mappedValues = [];
      try {
        originalArr.map((val, idx) => {
          const result = val * 2n;
          mappedValues.push(result);
          if (idx === 1) {
            throw new Error(errorMsg);
          }
          return result;
        });
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }
      expect(mappedValues.toString()).assertEqual([4n, 10n].toString());
      expect(originalArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0202
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0202
     * @tc.desc   Verify BigUint64Array filter stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const originalArr: BigUint64Array = new BigUint64Array(sab);
      originalArr.set([10n, 20n, 30n]);
      let checkedValues: bigint[] = [];
      const errorMsg = 'Test error at index 1';

      try {
        originalArr.filter((val, idx) => {
          checkedValues.push(val);
          if (idx === 1) {
            throw new Error(errorMsg);
          }
          return val > 15n;
        });
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }

      expect(checkedValues.toString()).assertEqual([10n, 20n].toString());

      const dv: DataView = new DataView(sab);
      dv.setBigUint64(8, 25n, true);
      checkedValues = [];
      try {
        originalArr.filter((val, idx) => {
          checkedValues.push(val);
          if (idx === 1) {
            throw new Error(errorMsg);
          }
          return val > 15n;
        });
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }
      expect(checkedValues.toString()).assertEqual([10n, 25n].toString());
      expect(originalArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0203
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0203
     * @tc.desc   Verify BigUint64Array reduce stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([5n, 10n, 15n]);
      let lastAccumulator: bigint | null = null;
      const errorMsg = 'Test error at index 1';

      try {
        bigUint64Arr.reduce((acc, val, idx) => {
          const newAcc = acc + val;
          if (idx === 1) {
            lastAccumulator = newAcc;
            throw new Error(errorMsg);
          }
          lastAccumulator = newAcc;
          return newAcc;
        }, 0n);
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }

      expect(lastAccumulator).assertEqual(15n);

      const dv: DataView = new DataView(buf);
      dv.setBigUint64(8, 12n, true);
      lastAccumulator = null;
      try {
        bigUint64Arr.reduce((acc, val, idx) => {
          const newAcc = acc + val;
          if (idx === 1) {
            lastAccumulator = newAcc;
            throw new Error(errorMsg);
          }
          lastAccumulator = newAcc;
          return newAcc;
        }, 0n);
      } catch (e) {
        expect((e as Error).message).assertEqual(errorMsg);
      }
      expect(lastAccumulator).assertEqual(17n);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0204
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0204
     * @tc.desc   Verify BigUint64Array every stops early if callback returns false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(buf);
      bigUint64Arr.set([10n, 20n, 30n]);
      let checkedCount = 0;
      const condition = (val: bigint) => {
        checkedCount++;
        return val < 25n;
      };

      const result1 = bigUint64Arr.every(condition);
      expect(result1).assertEqual(false);
      expect(checkedCount).assertEqual(3);

      const dv: DataView = new DataView(buf);
      dv.setBigUint64(8, 35n, true);
      checkedCount = 0;
      const result2 = bigUint64Arr.every(condition);
      expect(result2).assertEqual(false);
      expect(checkedCount).assertEqual(2);

      dv.setBigUint64(8, 20n, true);
      dv.setBigUint64(16, 25n, true);
      checkedCount = 0;
      const newCondition = (val: bigint) => {
        checkedCount++;
        return val <= 25n;
      };
      const result3 = bigUint64Arr.every(newCondition);
      expect(result3).assertEqual(true);
      expect(checkedCount).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayBigUint64ArrayBufferDv0205
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0205
     * @tc.desc   Verify BigUint64Array some stops early if callback returns true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigUint64ArrayBufferDv0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigUint64Arr: BigUint64Array = new BigUint64Array(sab);
      bigUint64Arr.set([10n, 20n, 30n]);
      let checkedCount = 0;
      const condition = (val: bigint) => {
        checkedCount++;
        return val > 25n;
      };

      const result1 = bigUint64Arr.some(condition);
      expect(result1).assertEqual(true);
      expect(checkedCount).assertEqual(3);

      const dv: DataView = new DataView(sab);
      dv.setBigUint64(0, 35n, true);
      checkedCount = 0;
      const result2 = bigUint64Arr.some(condition);
      expect(result2).assertEqual(true);
      expect(checkedCount).assertEqual(1);

      dv.setBigUint64(0, 10n, true);
      dv.setBigUint64(8, 35n, true);
      checkedCount = 0;
      const result3 = bigUint64Arr.some(condition);
      expect(result3).assertEqual(true);
      expect(checkedCount).assertEqual(2);
    })
  })
}