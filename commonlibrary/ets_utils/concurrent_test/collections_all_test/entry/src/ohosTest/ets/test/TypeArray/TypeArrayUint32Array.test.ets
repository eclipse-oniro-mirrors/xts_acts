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
import { arrayLike } from './TypeArrayConst'
import { collections } from '@kit.ArkTS';



interface GeneratedObjectLiteralInterface_1 {
  id: number;
  values: collections.Uint32Array;
}

export default function typeArrayUint32ArrayTest() {
  describe('TypeArrayUint32ArrayTest', () => {
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
     * @tc.name   TypeArrayUint32Array001
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_001
     * @tc.desc   用长度参数创建空Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.length).assertEqual(5);
        expect(arr.byteLength).assertEqual(20);
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array002
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_002
     * @tc.desc   从普通数字数组创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4]);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr.toString()).assertEqual('1,2,3,4');
      })

    /**
     * @tc.name   TypeArrayUint32Array003
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_003
     * @tc.desc   从ArrayBuffer创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr = new collections.Uint32Array(buffer);
        expect(arr.length).assertEqual(4);
        expect(arr.buffer).assertEqual(buffer);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array004
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_004
     * @tc.desc   从ArrayBuffer和偏移量、长度创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(20);
        const arr = new collections.Uint32Array(buffer, 4, 3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteOffset).assertEqual(4);
        expect(arr.byteLength).assertEqual(12);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array005
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_005
     * @tc.desc   从其他TypedArray创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const source = new Uint16Array([100, 200, 300]);
        const arr = new collections.Uint32Array(source);
        expect(arr.length).assertEqual(3);
        expect(arr.toString()).assertEqual('100,200,300');
        expect(arr[0]).assertEqual(100);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(300);
      })

    /**
     * @tc.name   TypeArrayUint32Array006
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_006
     * @tc.desc   从类数组对象创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(arrayLike);
        expect(arr.toString()).assertEqual('10,20,30');
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
      })

    /**
     * @tc.name   TypeArrayUint32Array007
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_007
     * @tc.desc   验证BYTES_PER_ELEMENT静态属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array008
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_008
     * @tc.desc   验证实例的byteLength属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.byteLength).assertEqual(20);
        expect(arr.length).assertEqual(5)
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array009
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_009
     * @tc.desc   验证buffer属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(3);
        expect(arr.buffer instanceof collections.ArrayBuffer).assertEqual(true);
        expect(arr.buffer.byteLength).assertEqual(12);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array010
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_010
     * @tc.desc   验证byteOffset属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(20);
        const arr = new collections.Uint32Array(buffer, 8);
        expect(arr.byteOffset).assertEqual(8);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array011
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_011
     * @tc.desc   设置和获取元素值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(3);
        arr[0] = 123456;
        arr[1] = 78901234;
        arr[2] = 987654321;
        expect(arr[0]).assertEqual(123456);
        expect(arr[1]).assertEqual(78901234);
        expect(arr[2]).assertEqual(987654321);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array012
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_012
     * @tc.desc   设置超出最大值的元素（溢出处理）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(1);
        const maxVal = 4294967295;
        arr[0] = maxVal + 1;
        expect(arr[0]).assertEqual(0);
        expect(arr.length).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayUint32Array013
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_013
     * @tc.desc   设置负值元素（溢出处理）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(2);
        arr[0] = -1;
        arr[1] = -100;
        expect(arr[0]).assertEqual(4294967295);
        expect(arr[1]).assertEqual(4294967196);
        expect(arr.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array014
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_014
     * @tc.desc   使用set方法复制数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(4);
        arr.set([10, 20, 30, 40]);
        expect(arr.toString()).assertEqual('10,20,30,40');
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
        expect(arr[3]).assertEqual(40);
      })

    /**
     * @tc.name   TypeArrayUint32Array015
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_015
     * @tc.desc   使用set方法带偏移量复制
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(5);
        arr.fill(0);
        arr.set([100, 200], 2);
        expect(arr.toString()).assertEqual('0,0,100,200,0');
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(100);
        expect(arr[3]).assertEqual(200);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array016
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_016
     * @tc.desc   使用subarray创建子数组视图
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5]);
        const sub = arr.subarray(1, 4);
        expect(sub.toString()).assertEqual('2,3,4');
        expect(sub.buffer).assertEqual(arr.buffer);
        expect(sub.length).assertEqual(3);
        expect(sub[0]).assertEqual(2);
        expect(sub[1]).assertEqual(3);
        expect(sub[2]).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array017
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_017
     * @tc.desc   修改subarray影响原始数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sub = arr.subarray(1, 3);
        sub[0] = 200;
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(30);
        expect(arr[3]).assertEqual(40);
        expect(arr.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array018
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_018
     * @tc.desc   使用slice创建新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sliced = arr.slice(1, 3);
        expect(sliced.toString()).assertEqual('20,30');
        expect(sliced.buffer === arr.buffer).assertFalse();
        expect(sliced[0]).assertEqual(20);
        expect(sliced[1]).assertEqual(30);
        expect(sliced.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array019
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_019
     * @tc.desc   修改slice结果不影响原始数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sliced = arr.slice(1, 3);
        sliced[0] = 200;
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
        expect(arr[3]).assertEqual(40);
        expect(arr.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array020
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_020
     * @tc.desc   使用fill方法填充数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(5);
        arr.fill(123456);
        expect(arr.every(v => v === 123456)).assertEqual(true);
        expect(arr[0]).assertEqual(123456);
        expect(arr[1]).assertEqual(123456);
        expect(arr[2]).assertEqual(123456);
        expect(arr[3]).assertEqual(123456);
        expect(arr[4]).assertEqual(123456);
        expect(arr.length).assertEqual(5);
      })
    /**
     * @tc.name   TypeArrayUint32Array021
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_021
     * @tc.desc   使用fill方法填充指定范围元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5, 6]);
        arr.fill(999, 2, 5);
        expect(arr.toString()).assertEqual('1,2,999,999,999,6');
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(999);
        expect(arr[3]).assertEqual(999);
        expect(arr[4]).assertEqual(999);
        expect(arr[5]).assertEqual(6);
        expect(arr.length).assertEqual(6);
      })

    /**
     * @tc.name   TypeArrayUint32Array022
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_022
     * @tc.desc   使用fill方法填充超出范围的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(3);
        arr.fill(5000000000);
        expect(arr.every(v => v === 705032704)).assertEqual(true);
        expect(arr[0]).assertEqual(705032704);
        expect(arr[1]).assertEqual(705032704);
        expect(arr[2]).assertEqual(705032704);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array023
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_023
     * @tc.desc   使用map方法转换元素（范围内）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 300]);
        const mapped = arr.map(v => v * 2);
        expect(mapped.toString()).assertEqual('200,400,600');
        expect(mapped[0]).assertEqual(200);
        expect(mapped[1]).assertEqual(400);
        expect(mapped[2]).assertEqual(600);
        expect(mapped.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array024
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_024
     * @tc.desc   使用map方法转换元素（范围外截断）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([2000000000, 3000000000]);
        const mapped = arr.map(v => v * 2);
        expect(mapped.toString()).assertEqual('4000000000,1705032704');
        expect(mapped[0]).assertEqual(4000000000);
        expect(mapped[1]).assertEqual(1705032704);
        expect(mapped.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array025
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_025
     * @tc.desc   使用filter方法筛选元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000000, 5000000, 10000000, 20000000]);
        const filtered = arr.filter(v => v > 5000000);
        expect(filtered.toString()).assertEqual('10000000,20000000');
        expect(filtered[0]).assertEqual(10000000);
        expect(filtered[1]).assertEqual(20000000);
        expect(filtered.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array026
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_026
     * @tc.desc   使用reduce方法计算总和
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sum = arr.reduce((acc, val) => acc + val, 0);
        expect(sum).assertEqual(100);
      })

    /**
     * @tc.name   TypeArrayUint32Array027
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_027
     * @tc.desc   使用reduce方法处理溢出值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([4294967290, 10]);
        const sum = arr.reduce((acc, val) => acc + val, 0);
        expect(sum).assertEqual(4294967300);
        expect(sum > 4294967295).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayUint32Array028
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_028
     * @tc.desc   使用every方法检查所有元素是否满足条件
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([1000, 2000, 3000]);
        const arr2 = new collections.Uint32Array([1000, 5000000000, 3000]);
        const allBelow4000 = (v: number) => v < 4000;
        expect(arr1.every(allBelow4000)).assertEqual(true);
        expect(arr2.every(allBelow4000)).assertEqual(false);
        expect(arr1[0]).assertEqual(1000);
        expect(arr1[1]).assertEqual(2000);
        expect(arr1[2]).assertEqual(3000);
        expect(arr1.length).assertEqual(3);
        expect(arr2[0]).assertEqual(1000);
        expect(arr2[1]).assertEqual(705032704);
        expect(arr2[2]).assertEqual(3000);
        expect(arr2.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array029
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_029
     * @tc.desc   使用some方法检查是否有元素满足条件
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([100, 200, 300]);
        const arr2 = new collections.Uint32Array([100, 200, 300]);
        const has200 = (v: number) => v === 200;
        const has400 = (v: number) => v === 400;
        expect(arr1.some(has200)).assertEqual(true);
        expect(arr1[0]).assertEqual(100);
        expect(arr1[1]).assertEqual(200);
        expect(arr1[2]).assertEqual(300);
        expect(arr1.length).assertEqual(3);
        expect(arr2.some(has400)).assertEqual(false);
        expect(arr2[0]).assertEqual(100);
        expect(arr2[1]).assertEqual(200);
        expect(arr2[2]).assertEqual(300);
        expect(arr2.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array030
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_030
     * @tc.desc   使用find方法查找满足条件的元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([500000, 1000000, 1500000, 2000000]);
        const found = arr.find(v => v > 1200000);
        expect(found).assertEqual(1500000);
      })

    /**
     * @tc.name   TypeArrayUint32Array031
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_031
     * @tc.desc   使用findIndex方法查找满足条件的元素索引
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([500000, 1000000, 1500000, 2000000]);
        const index = arr.findIndex(v => v > 1200000);
        expect(index).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array032
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_032
     * @tc.desc   使用includes方法检查元素是否存在
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([123456, 7890123, 4567890]);
        expect(arr.includes(7890123)).assertEqual(true);
        expect(arr.includes(111111)).assertEqual(false);
        expect(arr[0]).assertEqual(123456);
        expect(arr[1]).assertEqual(7890123);
        expect(arr[2]).assertEqual(4567890);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array033
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_033
     * @tc.desc   使用includes方法检查溢出值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([4294967295]);
        expect(arr.includes(-1)).assertEqual(false);
        expect(arr[0]).assertEqual(4294967295);
        expect(arr.length).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayUint32Array034
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_034
     * @tc.desc   使用indexOf方法查找元素首次出现位置
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 100, 300, 100]);
        expect(arr.indexOf(100)).assertEqual(0);
        expect(arr.indexOf(100, 1)).assertEqual(2);
        expect(arr.indexOf(400)).assertEqual(-1);
        expect(arr[0]).assertEqual(100);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(100);
        expect(arr[3]).assertEqual(300);
        expect(arr[4]).assertEqual(100);
        expect(arr.length).assertEqual(5);
      })

    /**
     * @tc.name   TypeArrayUint32Array035
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_035
     * @tc.desc   使用lastIndexOf方法查找元素最后出现位置
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 100, 300, 100]);
        expect(arr.lastIndexOf(100)).assertEqual(4);
        expect(arr.lastIndexOf(100, 3)).assertEqual(2);
        expect(arr.lastIndexOf(400)).assertEqual(-1);
        expect(arr[0]).assertEqual(100);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(100);
        expect(arr[3]).assertEqual(300);
        expect(arr[4]).assertEqual(100);
        expect(arr.length).assertEqual(5);
      })

    /**
     * @tc.name   TypeArrayUint32Array036
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_036
     * @tc.desc   使用join方法连接元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([123, 456, 789]);
        expect(arr.join(',')).assertEqual('123,456,789');
        expect(arr.join('|')).assertEqual('123|456|789');
        expect(arr[0]).assertEqual(123);
        expect(arr[1]).assertEqual(456);
        expect(arr[2]).assertEqual(789);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array037
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_037
     * @tc.desc   使用values迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10000, 20000, 30000]);
        const values: number[] = [];
        for (const val of arr.values()) {
          values.push(val);
        }
        expect(values.toString()).assertEqual('10000,20000,30000');
        expect(values[0]).assertEqual(10000);
        expect(values[1]).assertEqual(20000);
        expect(values[2]).assertEqual(30000);
        expect(values.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array038
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_038
     * @tc.desc   使用keys迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10000, 20000, 30000]);
        const keys: number[] = [];
        for (const key of arr.keys()) {
          keys.push(key);
        }
        expect(keys.toString()).assertEqual('0,1,2');
        expect(keys[0]).assertEqual(0);
        expect(keys[1]).assertEqual(1);
        expect(keys[2]).assertEqual(2);
        expect(keys.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array039
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_039
     * @tc.desc   使用entries迭代器
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10000, 20000, 30000]);
        const entries: [number, number][] = [];
        for (const entry of arr.entries()) {
          entries.push(entry);
        }
        expect(entries[0].toString()).assertEqual('0,10000');
        expect(entries[1].toString()).assertEqual('1,20000');
        expect(entries[2].toString()).assertEqual('2,30000');
        expect(entries.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array040
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_040
     * @tc.desc   使用Array.from转换为普通数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([12345, 67890, 123456]);
        const regArr = collections.Uint32Array.from(uint32Arr);
        expect(regArr instanceof collections.Uint32Array).assertEqual(true);
        expect(regArr.toString()).assertEqual('12345,67890,123456');
        expect(regArr[0]).assertEqual(12345);
        expect(regArr[1]).assertEqual(67890);
        expect(regArr[2]).assertEqual(123456);
        expect(regArr.length).assertEqual(3);
      })
    /**
     * @tc.name   TypeArrayUint32Array041
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_041
     * @tc.desc   使用扩展运算符转换为普通数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([98765, 43210, 54321]);
        const regArr = [...uint32Arr];
        expect(Array.isArray(regArr)).assertEqual(true);
        expect(regArr.toString()).assertEqual('98765,43210,54321');
        expect(regArr[0]).assertEqual(98765);
        expect(regArr[1]).assertEqual(43210);
        expect(regArr[2]).assertEqual(54321);
        expect(regArr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array042
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_042
     * @tc.desc   转换为Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([0x12345678]);
        const uint8Arr = new collections.Uint8Array(uint32Arr.buffer);
        expect(uint8Arr.length).assertEqual(4);
        expect(uint8Arr[0]).assertEqual(120);
        expect(uint8Arr[1]).assertEqual(86);
        expect(uint8Arr[2]).assertEqual(52);
        expect(uint8Arr[3]).assertEqual(18);
        expect(uint8Arr.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array043
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_043
     * @tc.desc   转换为Int32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([2147483647, 2147483648]);
        const int32Arr = new Int32Array(uint32Arr);
        expect(int32Arr[0]).assertEqual(2147483647);
        expect(int32Arr[1]).assertEqual(-2147483648);
        expect(int32Arr.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array044
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_044
     * @tc.desc   测试toString方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000, 2000, 3000]);
        expect(arr.toString()).assertEqual('1000,2000,3000');
        expect(arr[0]).assertEqual(1000);
        expect(arr[1]).assertEqual(2000);
        expect(arr[2]).assertEqual(3000);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array045
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_045
     * @tc.desc   测试toLocaleString方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1234567, 8901234]);
        const enStr = arr.toLocaleString();
        expect(enStr).assertEqual('1,234,567,8,901,234');
      })

    /**
     * @tc.name   TypeArrayUint32Array046
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_046
     * @tc.desc   测试JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 300]);
        const jsonStr = JSON.stringify(Array.from(arr));
        expect(jsonStr).assertEqual('[100,200,300]');
      })

    /**
     * @tc.name   TypeArrayUint32Array047
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_047
     * @tc.desc   测试嵌套在对象中的JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const data: GeneratedObjectLiteralInterface_1 = { id: 1, values: new collections.Uint32Array([1000, 2000, 3000]) };
        const jsonStr = JSON.stringify(data);
        expect(jsonStr).assertEqual('{"id":1,"values":{}}');
      })

    /**
     * @tc.name   TypeArrayUint32Array048
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_048
     * @tc.desc   处理非整数赋值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(3);
        arr[0] = 123.45;
        arr[1] = 456.999;
        arr[2] = -78.1;
        expect(arr.toString()).assertEqual('123,456,4294967218');
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(123);
        expect(arr[1]).assertEqual(456);
        expect(arr[2]).assertEqual(4294967218);
      })

    /**
     * @tc.name   TypeArrayUint32Array049
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_049
     * @tc.desc   验证buffer字节长度与元素数量匹配
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([5, 10, 15, 20]);
        const expectedByteLength = arr.length * collections.Uint32Array.BYTES_PER_ELEMENT;
        expect(arr.byteLength).assertEqual(expectedByteLength);
        expect(arr.buffer.byteLength).assertEqual(expectedByteLength);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(5);
        expect(arr[1]).assertEqual(10);
        expect(arr[2]).assertEqual(15);
        expect(arr[3]).assertEqual(20);
      })

    /**
     * @tc.name   TypeArrayUint32Array050
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_050
     * @tc.desc   使用负数索引的subarray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5]);
        const sub1 = arr.subarray(-3);
        const sub2 = arr.subarray(1, -1);
        expect(sub1.toString()).assertEqual('3,4,5');
        expect(sub2.toString()).assertEqual('2,3,4');
        expect(sub1.length).assertEqual(3);
        expect(sub1[0]).assertEqual(3);
        expect(sub1[1]).assertEqual(4);
        expect(sub1[2]).assertEqual(5);
        expect(sub2.length).assertEqual(3);
        expect(sub2[0]).assertEqual(2);
        expect(sub2[1]).assertEqual(3);
        expect(sub2[2]).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array051
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_051
     * @tc.desc   使用负数索引的slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5]);
        const sliced1 = arr.slice(-3);
        const sliced2 = arr.slice(1, -1);
        expect(sliced1.toString()).assertEqual('3,4,5');
        expect(sliced2.toString()).assertEqual('2,3,4');
        expect(sliced1.length).assertEqual(3);
        expect(sliced1[0]).assertEqual(3);
        expect(sliced1[1]).assertEqual(4);
        expect(sliced1[2]).assertEqual(5);
        expect(sliced2.length).assertEqual(3);
        expect(sliced2[0]).assertEqual(2);
        expect(sliced2[1]).assertEqual(3);
        expect(sliced2[2]).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array052
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_052
     * @tc.desc   使用负数起始索引的fill
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5]);
        arr.fill(99, -3);
        expect(arr.toString()).assertEqual('1,2,99,99,99');
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(99);
        expect(arr[3]).assertEqual(99);
        expect(arr[4]).assertEqual(99);
      })

    /**
     * @tc.name   TypeArrayUint32Array053
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_053
     * @tc.desc   测试map处理负值转换
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 300]);
        const mapped = arr.map(v => -v);
        expect(mapped[0]).assertEqual(4294967196);
        expect(mapped[1]).assertEqual(4294967096);
        expect(mapped.length).assertEqual(3);
        expect(mapped[2]).assertEqual(4294966996);
      })

    /**
     * @tc.name   TypeArrayUint32Array054
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_054
     * @tc.desc   测试filter筛选值范围
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000000000, 2000000000, 3000000000, 4000000000]);
        const filtered = arr.filter(v => v >= 2500000000 && v <= 3500000000);
        expect(filtered.toString()).assertEqual('3000000000');
        expect(filtered.length).assertEqual(1);
        expect(filtered[0]).assertEqual(3000000000);
      })

    /**
     * @tc.name   TypeArrayUint32Array055
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_055
     * @tc.desc   测试reduce处理值转换
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000, 2000, 3000, 4000]);
        const sum = arr.reduce((acc, val) => acc + (val / 1000), 0);
        expect(sum).assertEqual(10);
      })

    /**
     * @tc.name   TypeArrayUint32Array056
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_056
     * @tc.desc   测试every验证值类型
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 300]);
        const allIntegers = arr.every(v => Number.isInteger(v));
        const allStrings = arr.every(v => typeof v === 'string');
        expect(allIntegers).assertEqual(true);
        expect(allStrings).assertEqual(false);
      })

    /**
     * @tc.name   TypeArrayUint32Array057
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_057
     * @tc.desc   测试some验证值类型
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 300]);
        const hasInteger = arr.some(v => Number.isInteger(v));
        const hasString = arr.some(v => typeof v === 'string');
        expect(hasInteger).assertEqual(true);
        expect(hasString).assertEqual(false);
      })

    /**
     * @tc.name   TypeArrayUint32Array058
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_058
     * @tc.desc   测试find查找转换后的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([5000000, 10000000, 15000000, 20000000]);
        const found = arr.find(v => v / 1000000 > 12);
        expect(found).assertEqual(15000000);
      })

    /**
     * @tc.name   TypeArrayUint32Array059
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_059
     * @tc.desc   测试findIndex查找转换后的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([5000000, 10000000, 15000000, 20000000]);
        const index = arr.findIndex(v => v / 1000000 > 12);
        expect(index).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array060
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_060
     * @tc.desc   测试includes查找转换后的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000000, 2000000, 3000000]);
        const hasValue = arr.includes(2000000);
        const hasTransformed = arr.includes(3000000 / 3 * 2);
        expect(hasValue).assertEqual(true);
        expect(hasTransformed).assertEqual(true);
      })
    /**
     * @tc.name   TypeArrayUint32Array061
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_061
     * @tc.desc   测试indexOf查找转换后的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000000, 2000000, 3000000]);
        const index = arr.indexOf(3000000 / 3 * 2);
        expect(index).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayUint32Array062
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_062
     * @tc.desc   测试lastIndexOf查找转换后的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([2000000, 1000000, 2000000, 3000000]);
        const index = arr.lastIndexOf(4000000 / 2);
        expect(index).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array063
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_063
     * @tc.desc   测试join方法连接大量元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(100);
        for (let i = 0; i < arr.length; i++) {
          arr[i] = i;
        }
        const joined = arr.join(';');
        const parts = joined.split(';');
        expect(parts.length).assertEqual(100);
        expect(parts[99]).assertEqual('99');
      })

    /**
     * @tc.name   TypeArrayUint32Array064
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_064
     * @tc.desc   测试values迭代器处理大量元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(1000);
        for (let i = 0; i < arr.length; i++) {
          arr[i] = i * 10;
        }
        let count = 0;
        for (const val of arr.values()) {
          expect(val).assertEqual(count * 10);
          count++;
        }
        expect(count).assertEqual(1000);
      })

    /**
     * @tc.name   TypeArrayUint32Array065
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_065
     * @tc.desc   测试keys迭代器处理大量元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(1000);
        let index = 0;
        for (const key of arr.keys()) {
          expect(key).assertEqual(index);
          index++;
        }
        expect(index).assertEqual(1000);
      })

    /**
     * @tc.name   TypeArrayUint32Array066
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_066
     * @tc.desc   测试entries迭代器处理大量元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(1000);
        for (let i = 0; i < arr.length; i++) {
          arr[i] = i * 100;
        }
        let count = 0;
        for (const item of arr.entries()) {
          expect(item[0]).assertEqual(count);
          expect(item[1]).assertEqual(count * 100);
          count++;
        }
        expect(count).assertEqual(1000);
      })

    /**
     * @tc.name   TypeArrayUint32Array067
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_067
     * @tc.desc   测试Array.from带映射函数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([10, 20, 30, 40]);
        const mapped = collections.Uint32Array.from(uint32Arr, v => v * 2);
        expect(mapped.toString()).assertEqual('20,40,60,80');
      })

    /**
     * @tc.name   TypeArrayUint32Array068
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_068
     * @tc.desc   测试扩展运算符与数组操作结合
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([100, 200, 300]);
        const newArr = [50, ...uint32Arr, 400];
        expect(newArr.toString()).assertEqual('50,100,200,300,400');
      })

    /**
     * @tc.name   TypeArrayUint32Array069
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_069
     * @tc.desc   测试转换为Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([0, 16777216, 4294967295]);
        const float32Arr = new Float32Array(uint32Arr);
        expect(float32Arr[0]).assertEqual(0);
        expect(float32Arr[1]).assertEqual(16777216);
        expect(float32Arr[2]).assertEqual(4294967296);
        expect(uint32Arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array070
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_070
     * @tc.desc   测试转换为Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([0, 2147483647, 4294967295]);
        const float64Arr = new Float64Array(uint32Arr);
        expect(float64Arr[0]).assertEqual(0);
        expect(float64Arr[1]).assertEqual(2147483647);
        expect(float64Arr[2]).assertEqual(4294967295);
        expect(float64Arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array071
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_071
     * @tc.desc   测试toString处理大数值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([2147483648, 4294967295]);
        expect(arr.toString()).assertEqual('2147483648,4294967295');
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(2147483648);
        expect(arr[1]).assertEqual(4294967295);
      })


    /**
     * @tc.name   TypeArrayUint32Array073
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_073
     * @tc.desc   测试JSON.stringify处理大数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(100);
        for (let i = 0; i < arr.length; i++) {
          arr[i] = i * 1000000;
        }
        const jsonStr = JSON.stringify(arr);
        const parsed: collections.Uint32Array = JSON.parse(jsonStr);
        expect(parsed.length).assertEqual(undefined);
        expect(parsed[99]).assertEqual(undefined);
      })

    /**
     * @tc.name   TypeArrayUint32Array076
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_076
     * @tc.desc   测试缓冲区共享与不同类型数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayUint32Array076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
        const buffer = new collections.ArrayBuffer(8);
        const uint32Arr = new collections.Uint32Array(buffer);
        const uint16Arr = new collections.Uint16Array(buffer);
        uint32Arr[0] = 0x12345678;
        uint32Arr[1] = 0x9ABCDEF0;
        expect(uint16Arr.length).assertEqual(4);
        expect(uint16Arr[0]).assertEqual(22136);
        expect(uint16Arr[1]).assertEqual(4660);
        expect(uint16Arr[2]).assertEqual(57072);
        expect(uint16Arr[3]).assertEqual(39612);
      })

    /**
     * @tc.name   TypeArrayUint32Array077
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_077
     * @tc.desc   测试slice起始索引等于数组长度
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30]);
        const sliced = arr.slice(3);
        expect(sliced.length).assertEqual(0);
        expect(sliced.byteLength).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array078
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_078
     * @tc.desc   测试fill结束索引小于起始索引
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5]);
        arr.fill(9, 3, 1);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3)
        ;
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);
      })

    /**
     * @tc.name   TypeArrayUint32Array079
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_079
     * @tc.desc   测试map返回值超出Uint32范围多次
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([2000000000, 3000000000]);
        const mapped = arr.map(v => v * 2);
        expect(mapped.toString()).assertEqual('4000000000,1705032704');
        expect(mapped.length).assertEqual(2);
        expect(mapped[0]).assertEqual(4000000000);
        expect(mapped[1]).assertEqual(1705032704);
      })

    /**
     * @tc.name   TypeArrayUint32Array080
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_080
     * @tc.desc   测试filter返回空结果
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000000, 2000000, 3000000]);
        const filtered = arr.filter(v => v > 5000000);
        expect(filtered.length).assertEqual(0);
        expect(filtered instanceof collections.Uint32Array).assertEqual(true);
      })
    /**
     * @tc.name   TypeArrayUint32Array081
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_081
     * @tc.desc   测试reduceRight方法
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sum = arr.reduceRight((acc, val) => acc + val, 0);
        expect(sum).assertEqual(100);
      })

    /**
     * @tc.name   TypeArrayUint32Array082
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_082
     * @tc.desc   测试every方法验证所有元素为0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([0, 0, 0]);
        const arr2 = new collections.Uint32Array([0, 1, 0]);
        expect(arr1.every(v => v === 0)).assertEqual(true);
        expect(arr2.every(v => v === 0)).assertEqual(false);
        expect(arr1.length).assertEqual(3);
        expect(arr1[0]).assertEqual(0);
        expect(arr1[1]).assertEqual(0);
        expect(arr1[2]).assertEqual(0);
        expect(arr2.length).assertEqual(3);
        expect(arr2[0]).assertEqual(0);
        expect(arr2[1]).assertEqual(1);
        expect(arr2[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array083
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_083
     * @tc.desc   测试some方法验证是否有0元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([1, 2, 3]);
        const arr2 = new collections.Uint32Array([1, 0, 3]);
        expect(arr1.some(v => v === 0)).assertEqual(false);
        expect(arr2.some(v => v === 0)).assertEqual(true);
        expect(arr1.length).assertEqual(3);
        expect(arr1[0]).assertEqual(1);
        expect(arr1[1]).assertEqual(2);
        expect(arr1[2]).assertEqual(3);
        expect(arr2.length).assertEqual(3);
        expect(arr2[0]).assertEqual(1);
        expect(arr2[1]).assertEqual(0);
        expect(arr2[2]).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array084
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_084
     * @tc.desc   测试find方法查找最大值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1500000, 3500000, 2500000, 4500000]);
        let max = 0;
        const found = arr.find(v => {
          max = Math.max(max, v);
          return false;
        });
        expect(max).assertEqual(4500000);
        expect(found).assertEqual(undefined);
      })

    /**
     * @tc.name   TypeArrayUint32Array085
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_085
     * @tc.desc   测试findIndex方法查找最小值索引
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1500000, 3500000, 500000, 4500000]);
        let min = Infinity;
        let minIndex = -1;
        arr.findIndex((v, i) => {
          if (v < min) {
            min = v;
            minIndex = i;
          }
          return false;
        });
        expect(minIndex).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array086
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_086
     * @tc.desc   测试includes方法检查最大值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const maxVal = 4294967295;
        const arr1 = new collections.Uint32Array([100, 200, maxVal]);
        const arr2 = new collections.Uint32Array([100, 200, 300]);
        expect(arr1.includes(maxVal)).assertEqual(true);
        expect(arr2.includes(maxVal)).assertEqual(false);
        expect(arr1.length).assertEqual(3);
        expect(arr1[0]).assertEqual(100);
        expect(arr1[1]).assertEqual(200);
        expect(arr1[2]).assertEqual(maxVal);
        expect(arr2.length).assertEqual(3);
        expect(arr2[0]).assertEqual(100);
        expect(arr2[1]).assertEqual(200);
        expect(arr2[2]).assertEqual(300);
      })

    /**
     * @tc.name   TypeArrayUint32Array087
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_087
     * @tc.desc   测试indexOf方法查找重复元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([500, 300, 500, 700, 500]);
        expect(arr.indexOf(500)).assertEqual(0);
        expect(arr.indexOf(500, 1)).assertEqual(2);
        expect(arr.indexOf(500, 3)).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array088
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_088
     * @tc.desc   测试lastIndexOf方法查找重复元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([500, 300, 500, 700, 500]);
        expect(arr.lastIndexOf(500)).assertEqual(4);
        expect(arr.lastIndexOf(500, 3)).assertEqual(2);
        expect(arr.lastIndexOf(500, 1)).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array089
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_089
     * @tc.desc   测试join方法使用空字符串分隔符
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4]);
        expect(arr.join('')).assertEqual('1234');
      })

    /**
     * @tc.name   TypeArrayUint32Array093
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_093
     * @tc.desc   测试Array.from创建新数组并转换值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const uint32Arr = new collections.Uint32Array([1000000, 2000000, 3000000]);
        const formatted = collections.Array.from(uint32Arr, v => `$${v.toLocaleString()}`);
        expect(formatted[0]).assertEqual('$1,000,000');
        expect(formatted[1]).assertEqual('$2,000,000');
        expect(formatted[2]).assertEqual('$3,000,000');
      })

    /**
     * @tc.name   TypeArrayUint32Array094
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_094
     * @tc.desc   测试扩展运算符与数组方法结合
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([10, 20, 30]);
        const arr2 = new collections.Uint32Array([40, 50, 60]);
        const combined = [...arr1, ...arr2].sort((a, b) => b - a);
        expect(combined.toString()).assertEqual('60,50,40,30,20,10');
      })

    /**
     * @tc.name   TypeArrayUint32Array096
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_096
     * @tc.desc   测试toString处理空数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(0);
        expect(arr.toString()).assertEqual('');
      })

    /**
     * @tc.name   TypeArrayUint32Array097
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_097
     * @tc.desc   测试toLocaleString处理空数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(0);
        expect(arr.toLocaleString()).assertEqual('');
      })

    /**
     * @tc.name   TypeArrayUint32Array098
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_098
     * @tc.desc   测试JSON.stringify处理空数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(0);
        expect(JSON.stringify(arr)).assertEqual('{}');
      })

    /**
     * @tc.name   TypeArrayUint32Array099
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_099
     * @tc.desc   测试处理特殊值NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(2);
        arr[0] = NaN;
        arr[1] = 123;
        expect(arr.toString()).assertEqual('0,123');
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(123);
      })

    /**
     * @tc.name   TypeArrayUint32Array100
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_100
     * @tc.desc   测试处理特殊值Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(2);
        arr[0] = Infinity;
        arr[1] = -Infinity;
        expect(arr.toString()).assertEqual('0,0');
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
      })
    /**
     * @tc.name   TypeArrayUint32Array101
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_101
     * @tc.desc   Create Uint32Array from ArrayBuffer with offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const view = new collections.Uint8Array(buffer);
        for (let i = 0; i < 16; i++) {
          view[i] = i;
        }

        const uint32Arr = new collections.Uint32Array(buffer, 4, 3);
        expect(uint32Arr.length).assertEqual(3);
        expect(uint32Arr.byteOffset).assertEqual(4);
        expect(uint32Arr[0]).assertEqual(0x07060504);
        expect(uint32Arr[1]).assertEqual(0x0B0A0908);
        expect(uint32Arr[2]).assertEqual(0x0F0E0D0C);
      })

    /**
     * @tc.name   TypeArrayUint32Array102
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_102
     * @tc.desc   Modify ArrayBuffer through multiple views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(8);
        const uint32Arr = new collections.Uint32Array(buffer);
        const uint8Arr = new collections.Uint8Array(buffer);
        uint32Arr[0] = 0x12345678;
        expect(uint8Arr[0]).assertEqual(0x78);
        expect(uint8Arr[3]).assertEqual(0x12);
        uint8Arr[1] = 0xAB;
        expect(uint32Arr[0]).assertEqual(0x1234AB78);
      })

    /**
     * @tc.name   TypeArrayUint32Array103
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_103
     * @tc.desc   Share ArrayBuffer between Uint32Array and Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(8);
        const uint32Arr = new collections.Uint32Array(buffer);
        const float32Arr = new collections.Float32Array(buffer);

        uint32Arr[0] = 0x41480000;
        expect(float32Arr[0]).assertEqual(12.5);
      })

    /**
     * @tc.name   TypeArrayUint32Array104
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_104
     * @tc.desc   Create overlapping views from same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(12);
        const arr1 = new collections.Uint32Array(buffer, 0, 3);
        const arr2 = new collections.Uint32Array(buffer, 4, 2);
        arr1.set([1, 2, 3]);
        expect(arr2[0]).assertEqual(2);
        expect(arr2[1]).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array105
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_105
     * @tc.desc   Verify ArrayBuffer byteLength after Uint32Array operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.buffer.byteLength).assertEqual(20);

        const subarray = arr.subarray(1, 3);
        expect(subarray.buffer.byteLength).assertEqual(20);
        expect(subarray.buffer).assertEqual(arr.buffer);
        expect(subarray.length).assertEqual(2);
        expect(subarray[0]).assertEqual(0);
        expect(subarray[1]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array106
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_106
     * @tc.desc   Create Uint32Array from SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(16);
        const arr = new Uint32Array(sab);
        expect(arr.length).assertEqual(4);
        expect(arr.buffer instanceof SharedArrayBuffer).assertEqual(true);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array107
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_107
     * @tc.desc   Modify SharedArrayBuffer through Uint32Array view
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(8);
        const arr1 = new Uint32Array(sab);
        const arr2 = new Uint32Array(sab);
        arr1[0] = 12345;
        arr1[1] = 67890;
        expect(arr2[0]).assertEqual(12345);
        expect(arr2[1]).assertEqual(67890);
        expect(arr2.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array108
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_108
     * @tc.desc   Create multiple views on SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(12);
        const uint32Arr = new Uint32Array(sab);
        const uint16Arr = new Uint16Array(sab);
        uint32Arr[0] = 0x12345678;
        expect(uint16Arr[0]).assertEqual(0x5678);
        expect(uint16Arr[1]).assertEqual(0x1234);
        expect(uint16Arr.length).assertEqual(6);
      })

    /**
     * @tc.name   TypeArrayUint32Array111
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_111
     * @tc.desc   Create Uint32Array with maximum possible ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(1024 * 1024);
        const arr = new collections.Uint32Array(buffer);
        expect(arr.length).assertEqual(262144);
        expect(arr.byteLength).assertEqual(1024 * 1024);
        expect(arr[0]).assertEqual(0);
        expect(arr[262143]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array112
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_112
     * @tc.desc   Create subarray view from SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(16);
        const arr = new Uint32Array(sab);
        arr.set([10, 20, 30, 40]);
        const sub = arr.subarray(1, 3);
        expect(sub.toString()).assertEqual('20,30');
        expect(sub.buffer).assertEqual(sab);
        expect(sub.length).assertEqual(2);
        expect(sub[0]).assertEqual(20);
        expect(sub[1]).assertEqual(30);
      })

    /**
     * @tc.name   TypeArrayUint32Array113
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_113
     * @tc.desc   Slice creates new ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4]);
        const sliced = arr.slice(1, 3);
        expect(sliced.toString()).assertEqual('2,3');
        expect(sliced.buffer === arr.buffer).assertFalse();
        expect(sliced.buffer.byteLength).assertEqual(8);
        expect(sliced.length).assertEqual(2);
        expect(sliced[0]).assertEqual(2);
        expect(sliced[1]).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array114
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_114
     * @tc.desc   Modify sliced array doesn't affect original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4]);
        const sliced = arr.slice(1, 3);

        sliced[0] = 200;
        expect(arr[1]).assertEqual(2);
        expect(sliced[0]).assertEqual(200);
        expect(arr.length).assertEqual(4);
        expect(sliced.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array117
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_117
     * @tc.desc   Use set method with different buffer source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const source = new collections.Uint32Array([1, 2, 3]);
        const dest = new collections.Uint32Array(5);

        dest.set(source, 1);
        expect(dest.toString()).assertEqual('0,1,2,3,0');
        expect(source.buffer === dest.buffer).assertFalse();
        expect(source.length).assertEqual(3);
        expect(dest.length).assertEqual(5);
        expect(dest[0]).assertEqual(0);
        expect(dest[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array118
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_118
     * @tc.desc   Create Uint32Array with offset beyond buffer length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.buffer.byteLength).assertEqual(20);

        const subarray = arr.subarray(1, 3);
        expect(subarray.buffer.byteLength).assertEqual(20);
        expect(subarray.buffer).assertEqual(arr.buffer);
        expect(subarray.length).assertEqual(2);
        expect(subarray[0]).assertEqual(0);
        expect(subarray[1]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array119
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_119
     * @tc.desc   Create Uint32Array with length exceeding buffer capacity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr1 = new collections.Uint32Array(buffer);
        const arr2 = new collections.Uint32Array(buffer, 4, 3);
        const arr3 = new collections.Uint32Array(new collections.ArrayBuffer(16));
        expect(arr1.buffer).assertEqual(arr2.buffer);
        expect(arr1.buffer == arr3.buffer).assertFalse();
        expect(arr1.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array120
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_120
     * @tc.desc   Verify buffer properties across views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const uint32Arr = new collections.Uint32Array(buffer, 4, 3);
        expect(uint32Arr.buffer).assertEqual(buffer);
        expect(uint32Arr.byteOffset).assertEqual(4);
        expect(uint32Arr.byteLength).assertEqual(12);
        expect(buffer.byteLength).assertEqual(16);
        expect(uint32Arr.length).assertEqual(3);
        expect(uint32Arr[0]).assertEqual(0);
        expect(uint32Arr[1]).assertEqual(0);
        expect(uint32Arr[2]).assertEqual(0);
      })
    /**
     * @tc.name   TypeArrayUint32Array121
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_121
     * @tc.desc   Copy data between ArrayBuffer views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const srcBuffer = new collections.ArrayBuffer(12);
        const srcArr = new collections.Uint32Array(srcBuffer);
        srcArr.set([10, 20, 30]);
        const destBuffer = new collections.ArrayBuffer(12);
        const destArr = new collections.Uint32Array(destBuffer);
        destArr.set(srcArr);
        expect(destArr.toString()).assertEqual('10,20,30');
        expect(srcBuffer == destBuffer).assertFalse();
        expect(destArr.length).assertEqual(3);
        expect(destArr[0]).assertEqual(10);
        expect(destArr[1]).assertEqual(20);
        expect(destArr[2]).assertEqual(30);
      })

    /**
     * @tc.name   TypeArrayUint32Array122
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_122
     * @tc.desc   Create nested views from SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(20);
        const mainArr = new Uint32Array(sab);
        mainArr.set([1, 2, 3, 4, 5]);
        const view1 = new Uint32Array(sab, 0, 2);
        const view2 = new Uint32Array(sab, 8, 3);
        expect(view1.toString()).assertEqual('1,2');
        expect(view2.toString()).assertEqual('3,4,5');
        expect(view1.length).assertEqual(2);
        expect(view2.length).assertEqual(3);
        expect(view1[0]).assertEqual(1);
        expect(view1[1]).assertEqual(2);
        expect(view2[0]).assertEqual(3);
        expect(view2[1]).assertEqual(4);
        expect(view2[2]).assertEqual(5);
      })

    /**
     * @tc.name   TypeArrayUint32Array123
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_123
     * @tc.desc   Test buffer sharing with different element sizes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(8);
        const uint32Arr = new collections.Uint32Array(buffer);
        const uint16Arr = new collections.Uint16Array(buffer);
        uint32Arr[0] = 0x11223344;
        uint32Arr[1] = 0x55667788;
        expect(uint16Arr.length).assertEqual(4);
        expect(uint16Arr[0]).assertEqual(0x3344);
        expect(uint16Arr[1]).assertEqual(0x1122);
        expect(uint16Arr[2]).assertEqual(0x7788);
        expect(uint16Arr[3]).assertEqual(0x5566);
      })

    /**
     * @tc.name   TypeArrayUint32Array124
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_124
     * @tc.desc   Create Uint32Array from portion of larger buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(32);
        const fullView = new collections.Uint32Array(buffer);
        fullView.fill(0xDEADBEEF);
        const partialView = new collections.Uint32Array(buffer, 8, 4);
        expect(partialView.length).assertEqual(4);
        expect(partialView.byteOffset).assertEqual(8);
        expect(partialView[0]).assertEqual(0xDEADBEEF);
        expect(partialView[1]).assertEqual(0xDEADBEEF);
        expect(partialView[2]).assertEqual(0xDEADBEEF);
        expect(partialView[3]).assertEqual(0xDEADBEEF);
      })

    /**
     * @tc.name   TypeArrayUint32Array125
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_125
     * @tc.desc   Check buffer bounds when modifying through view
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(12);
        const arr = new collections.Uint32Array(buffer);

        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        () => {
          arr[3] = 4;
        }
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(undefined);
      })

    /**
     * @tc.name   TypeArrayUint32Array126
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_126
     * @tc.desc   Create SharedArrayBuffer with maximum view size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(4 * 1024);
        const arr = new Uint32Array(sab);
        expect(arr.length).assertEqual(1024);
        expect(arr.byteLength).assertEqual(4 * 1024);
        expect(arr[0]).assertEqual(0);
        expect(arr[1023]).assertEqual(0);
      })
    /**
     * @tc.name   TypeArrayUint32Array128
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_128
     * @tc.desc   Share buffer between Uint32Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new ArrayBuffer(8);
        const uint32Arr = new Uint32Array(buffer);
        const dataView = new DataView(buffer);

        uint32Arr[0] = 0x12345678;
        uint32Arr[1] = 0x87654321;
        expect(dataView.getUint32(0, true)).assertEqual(0x12345678);
        expect(dataView.getUint32(4, true)).assertEqual(0x87654321);
        expect(uint32Arr.length).assertEqual(2);
        expect(uint32Arr[0]).assertEqual(0x12345678);
        expect(uint32Arr[1]).assertEqual(0x87654321);
      })

    /**
     * @tc.name   TypeArrayUint32Array129
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_129
     * @tc.desc   Modify buffer through DataView and check Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new ArrayBuffer(8);
        const uint32Arr = new Uint32Array(buffer);
        const dataView = new DataView(buffer);

        dataView.setUint32(0, 0xABCDEF12, true);
        dataView.setUint32(4, 0x12EFCDAB, true);
        expect(uint32Arr[0]).assertEqual(0xABCDEF12);
        expect(uint32Arr[1]).assertEqual(0x12EFCDAB);
        expect(uint32Arr.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array130
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_130
     * @tc.desc   Create overlapping views with different element types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(12);
        const uint32Arr = new collections.Uint32Array(buffer);
        const uint8Arr = new collections.Uint8Array(buffer, 2, 8);
        uint32Arr.set([0x00010203, 0x04050607, 0x08090A0B]);
        expect(uint8Arr.length).assertEqual(8);
        expect(uint8Arr[0]).assertEqual(0x01);
        expect(uint8Arr[7]).assertEqual(0x0a);
        expect(uint8Arr[1]).assertEqual(0x00);
        expect(uint8Arr[2]).assertEqual(0x07);
        expect(uint8Arr[3]).assertEqual(0x06);
        expect(uint8Arr[4]).assertEqual(0x05);
        expect(uint8Arr[5]).assertEqual(0x04);
        expect(uint8Arr[6]).assertEqual(0x0B);
      })

    /**
     * @tc.name   TypeArrayUint32Array131
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_131
     * @tc.desc   Test buffer equality across views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr1 = new collections.Uint32Array(buffer);
        const arr2 = new collections.Uint32Array(buffer, 4, 3);
        const arr3 = new collections.Uint32Array(new collections.ArrayBuffer(16));
        expect(arr1.buffer).assertEqual(arr2.buffer);
        expect(arr1.buffer == arr3.buffer).assertFalse();
        expect(arr1.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array132
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_132
     * @tc.desc   Check byte alignment of views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr1 = new collections.Uint32Array(buffer, 0, 4);
        expect(arr1.byteOffset % 4).assertEqual(0);
        try {
          const arr2 = new collections.Uint32Array(buffer, 1, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertContain('The offset cannot be an integral multiple of elementSize.');
        }
        expect(arr1.length).assertEqual(4);
        expect(arr1[0]).assertEqual(0);
        expect(arr1[1]).assertEqual(0);
        expect(arr1[2]).assertEqual(0);
        expect(arr1[3]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array135
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_135
     * @tc.desc   Create Uint32Array from sliced ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const originalBuffer = new collections.ArrayBuffer(16);
        const slicedBuffer = originalBuffer.slice(4, 12);

        const arr = new collections.Uint32Array(slicedBuffer);
        expect(arr.length).assertEqual(2);
        expect(arr.buffer.byteLength).assertEqual(8);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array136
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_136
     * @tc.desc   Share sliced buffer between views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const originalBuffer = new collections.ArrayBuffer(20);
        const slicedBuffer = originalBuffer.slice(4, 16);

        const arr1 = new collections.Uint32Array(slicedBuffer);
        const arr2 = new collections.Uint32Array(slicedBuffer, 4, 2);

        arr1.set([10, 20, 30]);
        expect(arr2.toString()).assertEqual('20,30');
        expect(arr2.length).assertEqual(2);
        expect(arr2[0]).assertEqual(20);
        expect(arr2[1]).assertEqual(30);
      })

    /**
     * @tc.name   TypeArrayUint32Array137
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_137
     * @tc.desc   Check buffer slice doesn't affect original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const originalBuffer = new collections.ArrayBuffer(12);
        const originalArr = new collections.Uint32Array(originalBuffer);
        originalArr.set([1, 2, 3]);

        const slicedBuffer = originalBuffer.slice(0);
        const slicedArr = new collections.Uint32Array(slicedBuffer);
        slicedArr[0] = 100;
        expect(originalArr[0]).assertEqual(1);
        expect(slicedArr[0]).assertEqual(100);
        expect(originalArr.length).assertEqual(3);
        expect(slicedArr.length).assertEqual(3);
        expect(originalArr[1]).assertEqual(2);
        expect(originalArr[2]).assertEqual(3);
        expect(slicedArr[1]).assertEqual(2);
        expect(slicedArr[2]).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array138
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_138
     * @tc.desc   Create view with maximum possible offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(20);
        const maxOffset = buffer.byteLength - 4;
        const arr = new collections.Uint32Array(buffer, maxOffset, 1);
        arr[0] = 0xDEADBEEF;
        expect(arr.byteOffset).assertEqual(16);
        expect(arr[0]).assertEqual(0xDEADBEEF);
        expect(arr.length).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayUint32Array139
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_139
     * @tc.desc   Test buffer sharing between workers (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const sab = new SharedArrayBuffer(8);
        const mainThreadArr = new Uint32Array(sab);
        const workerArr = new Uint32Array(sab);
        workerArr[0] = 0x11223344;
        workerArr[1] = 0x55667788;
        expect(mainThreadArr[0]).assertEqual(0x11223344);
        expect(mainThreadArr[1]).assertEqual(0x55667788);
        expect(mainThreadArr.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array140
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_140
     * @tc.desc   Create zero-length view from buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr = new collections.Uint32Array(buffer, 0, 0);
        expect(arr.length).assertEqual(0);
        expect(arr.byteLength).assertEqual(0);
        expect(arr.buffer).assertEqual(buffer);
      })
  })
}