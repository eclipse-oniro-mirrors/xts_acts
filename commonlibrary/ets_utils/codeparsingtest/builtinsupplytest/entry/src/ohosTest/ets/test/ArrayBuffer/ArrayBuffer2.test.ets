/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayBuffer2Test() {
  describe('ArrayBuffer2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   arraybuffer2Test001
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8Array = new Uint8Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(uint8Array)).assertEqual(true);
    });
    /**
     * @tc.name   arraybuffer2Test002
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16Array = new Uint16Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(uint16Array)).assertEqual(true);
    });
    /**
     * @tc.name   arraybuffer2Test003
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32Array = new Uint32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(uint32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test004
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(uint8ClampedArray)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test005
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8Array = new Int8Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(int8Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test006
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Array = new Int16Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(int16Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test007
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32Array = new Int32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(int32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test008
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32Array = new Float32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(float32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test009
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_0900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64Array = new Float64Array(new ArrayBuffer(8));
      expect(ArrayBuffer.isView(float64Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test010
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUint64Array = new BigUint64Array(new ArrayBuffer(8));
      expect(ArrayBuffer.isView(bigUint64Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test011
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigInt64Array = new BigInt64Array(new ArrayBuffer(8));
      expect(ArrayBuffer.isView(bigInt64Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test012
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataView = new DataView(new ArrayBuffer(8));
      expect(ArrayBuffer.isView(dataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test013
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyUint8Array = new Uint8Array(0);
      expect(ArrayBuffer.isView(emptyUint8Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test014
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyDataView = new DataView(new ArrayBuffer(0));
      expect(ArrayBuffer.isView(emptyDataView)).assertEqual(true);

    });

    /**
     * @tc.name   arraybuffer2Test015
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalUint16Array = new Uint16Array(new ArrayBuffer(8));
      const subarrayView = originalUint16Array.subarray(1, 3);
      expect(ArrayBuffer.isView(subarrayView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test016
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      expect(ArrayBuffer.isView(buffer)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test017
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const normalArray = [1, 2, 3, 4];
      expect(ArrayBuffer.isView(normalArray)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test018
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface NormalObj {
        options?: Record<string, number | string | boolean>;
      }

      const normalObj: NormalObj = {
        options: Object({ id: 1, value: "test" }) // options 是一个具有属性的对象
      };
      expect(ArrayBuffer.isView(normalObj)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test019
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_1900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "ArrayBuffer View";
      expect(ArrayBuffer.isView(str)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test020
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num = 12345;
      expect(ArrayBuffer.isView(num)).assertEqual(false);
    });
    /**
     * @tc.name   arraybuffer2Test021
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolTrue = true;
      expect(ArrayBuffer.isView(boolTrue)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test022
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolFalse = false;
      expect(ArrayBuffer.isView(boolFalse)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test023
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ArrayBuffer.isView(null)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test024
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ArrayBuffer.isView(undefined)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test025
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigInt = 12345n;
      expect(ArrayBuffer.isView(bigInt)).assertEqual(false);

    });

    /**
     * @tc.name   arraybuffer2Test026
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ReduxAction {
        type: String,
        payload: Array<Int8Array>
      }

      const reduxAction: ReduxAction = Object({ type: "SET_DATA", payload: new Int32Array(new ArrayBuffer(4)) });
      expect(ArrayBuffer.isView(reduxAction.payload)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test027
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => console.log("test");
      expect(ArrayBuffer.isView(func)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test028
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date();
      expect(ArrayBuffer.isView(date)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test029
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_2900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regExp = /view/gi;
      expect(ArrayBuffer.isView(regExp)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test030
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, "a"], [2, "b"]]);
      expect(ArrayBuffer.isView(map)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test031
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([1, 2, 3]);
      expect(ArrayBuffer.isView(set)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test032
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const includesArr = [1, 2, new Uint32Array(new ArrayBuffer(4))];
      expect(ArrayBuffer.isView(includesArr.find(item => item instanceof Uint32Array))).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test033
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const indexOfArr = [new DataView(new ArrayBuffer(4)), 3, 4];
      const viewIndex = indexOfArr.indexOf(indexOfArr[0]);
      expect(ArrayBuffer.isView(indexOfArr[viewIndex])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test034
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const promise = Promise.resolve("resolved");
      expect(ArrayBuffer.isView(promise)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test035
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class CustomUint32Array extends Uint32Array {
      }

      const customUint32Array = new CustomUint32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(customUint32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test036
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class CustomDataView extends DataView {
      }

      const customDataView = new CustomDataView(new ArrayBuffer(8));
      expect(ArrayBuffer.isView(customDataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test037
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface FakeView {
        buffer: ArrayBuffer,
        byteLength: number,
        byteOffset: number
      }

      const fakeView: FakeView = { buffer: new ArrayBuffer(4), byteLength: 4, byteOffset: 0 };
      expect(ArrayBuffer.isView(fakeView)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test038
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const indexOfArr = [new DataView(new ArrayBuffer(4)), 3, 4];
      const viewIndex = indexOfArr.indexOf(indexOfArr[0]);
      expect(ArrayBuffer.isView(indexOfArr[viewIndex])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test039
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_3900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewStrRepr = new DataView(new ArrayBuffer(4)).toString();
      expect(ArrayBuffer.isView(viewStrRepr)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test040
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUint8Array = new Uint8Array(new ArrayBuffer(1024 * 1024));
      expect(ArrayBuffer.isView(bigUint8Array)).assertEqual(true);
    });
    /**
     * @tc.name   arraybuffer2Test041
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const resizableBuffer = new ArrayBuffer(8);
      const resizableUint32Array = new Uint32Array(resizableBuffer);
      expect(ArrayBuffer.isView(resizableUint32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test042
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalUint8 = new Uint8Array(new ArrayBuffer(4));
      const arrFromView = Array.from(originalUint8);
      expect(ArrayBuffer.isView(arrFromView)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test043
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalInt8Array = new Int8Array(new ArrayBuffer(8));
      const slicedInt8Array = originalInt8Array.slice(2, 5);
      expect(ArrayBuffer.isView(slicedInt8Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test044
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const singleElemUint8Array = new Uint8Array(new ArrayBuffer(1));
      expect(ArrayBuffer.isView(singleElemUint8Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test045
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const singleElemDataView = new DataView(new ArrayBuffer(1));
      expect(ArrayBuffer.isView(singleElemDataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test046
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nestedArrayWithView = [1, new Uint16Array(new ArrayBuffer(4)), 3];
      expect(ArrayBuffer.isView(nestedArrayWithView[1])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test047
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjWithDataView {
        view: DataView
      }

      const objWithDataView: ObjWithDataView = { view: new DataView(new ArrayBuffer(8)) };
      expect(ArrayBuffer.isView(objWithDataView.view)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test048
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class ViewHolder {
        view: Float32Array;

        constructor() {
          this.view = new Float32Array(new ArrayBuffer(8));
        }
      }

      const viewHolder = new ViewHolder();
      expect(ArrayBuffer.isView(viewHolder.view)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test049
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_4900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class ViewGenerator {
        getView(): DataView {
          return new DataView(new ArrayBuffer(4));
        }
      }

      const viewGenerator = new ViewGenerator();
      expect(ArrayBuffer.isView(viewGenerator.getView())).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test050
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const getUint32Array = () => new Uint32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(getUint32Array())).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test052
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fromUint8Array = Uint8Array.from([1, 2, 3]);
      expect(ArrayBuffer.isView(fromUint8Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test053
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ofInt32Array = Int32Array.of(10, 20, 30);
      expect(ArrayBuffer.isView(ofInt32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test054
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalBigInt64Array = new BigInt64Array(new ArrayBuffer(16));
      const bigInt64Subarray = originalBigInt64Array.subarray(1, 3);
      expect(ArrayBuffer.isView(bigInt64Subarray)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test055
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalBigUint64Array = new BigUint64Array(new ArrayBuffer(16));
      const bigUint64Slice = originalBigUint64Array.slice(1, 3);
      expect(ArrayBuffer.isView(bigUint64Slice)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test056
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjWithBuffer {
        buffer: ArrayBuffer
      }

      const objWithBuffer: ObjWithBuffer = { buffer: new ArrayBuffer(4) };
      expect(ArrayBuffer.isView(objWithBuffer)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test057
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flatMapArr = [1, 2].flatMap(() => [new Int32Array(new ArrayBuffer(4))]);
      expect(ArrayBuffer.isView(flatMapArr[0])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test058
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewLocaleStr = new Uint32Array(new ArrayBuffer(4)).toLocaleString();
      expect(ArrayBuffer.isView(viewLocaleStr)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test059
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_5900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewValueOf = new Uint8Array(new ArrayBuffer(4)).valueOf();
      expect(ArrayBuffer.isView(viewValueOf)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test060
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const copyView = new Uint16Array([1, 2, 3, 4]);
      copyView.copyWithin(0, 2);
      expect(ArrayBuffer.isView(copyView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test061
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fillView = new Int8Array(4);
      fillView.fill(5);
      expect(ArrayBuffer.isView(fillView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test062
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const doubleViewBuffer = new ArrayBuffer(8);
      const firstDataView = new DataView(doubleViewBuffer);
      expect(ArrayBuffer.isView(firstDataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test063
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Empty {}

      const emptyObj: Empty = {};
      expect(ArrayBuffer.isView(emptyObj)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test064
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjWithByteLength {
        byteLength: number
      }

      const objWithByteLength: ObjWithByteLength = { byteLength: 4 };
      expect(ArrayBuffer.isView(objWithByteLength)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test065
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjWithByteOffset {
        byteOffset: number,
        buffer: ArrayBuffer
      }

      const objWithByteOffset: ObjWithByteOffset = { byteOffset: 0, buffer: new ArrayBuffer(4) };
      expect(ArrayBuffer.isView(objWithByteOffset)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test066
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const protoBuffer = new ArrayBuffer(10);
      const protoView = new DataView(protoBuffer);
      protoView.setUint8(0, 0x01); // 协议标识
      expect(ArrayBuffer.isView(protoView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test067
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const idbView = new Uint16Array(new ArrayBuffer(8));
      expect(ArrayBuffer.isView(idbView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test068
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ObjView {
        view: Int8Array
      }

      const GeneratedDestructObj_1: ObjView = { view: new Int8Array(new ArrayBuffer(4)) };
      const destructuredObjView = GeneratedDestructObj_1.view;
      expect(ArrayBuffer.isView(destructuredObjView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test069
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_6900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const someArr = [1, new Uint8Array(new ArrayBuffer(4)), 3];
      const hasView = someArr.some(item => ArrayBuffer.isView(item));
      expect(hasView).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test070
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const everyArr = [new DataView(new ArrayBuffer(4)), 2];
      const allViews = everyArr.every(item => ArrayBuffer.isView(item));
      expect(allViews).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test071
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceBuffer = new ArrayBuffer(8).slice(2, 6);
      const sliceBasedUint8Array = new Uint8Array(sliceBuffer);
      expect(ArrayBuffer.isView(sliceBasedUint8Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test072
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(16);
      const sliceBuffer = originalBuffer.slice(4, 12);
      const sliceBasedDataView = new DataView(sliceBuffer);
      expect(ArrayBuffer.isView(sliceBasedDataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test073
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBigInt64Array = new BigInt64Array(0);
      expect(ArrayBuffer.isView(emptyBigInt64Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test074
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBigUint64Array = new BigUint64Array(0);
      expect(ArrayBuffer.isView(emptyBigUint64Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test075
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mapKeyView = new Uint16Array(new ArrayBuffer(4));
      const viewMap = new Map([[mapKeyView, "value"]]);
      expect(ArrayBuffer.isView(viewMap.keys().next().value)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test076
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const setElemView = new DataView(new ArrayBuffer(4));
      const viewSet = new Set([setElemView]);
      expect(ArrayBuffer.isView(viewSet.values().next().value)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test077
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface level {
        level2: Int32Array
      }

      interface NestedObjWithView {
        level1: level
      }

      const nestedObjWithView: NestedObjWithView = { level1: { level2: new Int32Array(new ArrayBuffer(8)) } };
      expect(ArrayBuffer.isView(nestedObjWithView.level1.level2)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test078
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nestedArrWithView = [[new DataView(new ArrayBuffer(4))]];
      expect(ArrayBuffer.isView(nestedArrWithView[0][0])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test079
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_7900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ViewObj {
        a: Uint8Array,
        b: DataView
      }

      const viewObj: ViewObj = { a: new Uint8Array(new ArrayBuffer(4)), b: new DataView(new ArrayBuffer(4)) };
      expect(ArrayBuffer.isView(Object.values(viewObj)[0])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test080
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const int32Array = new Int32Array(buffer);

      interface ViewObj {
        name: string;
        view1: DataView;
        view2: Int32Array;
      }

      const viewObj: ViewObj = {
        name: 'bufferViews',
        view1: dataView,
        view2: int32Array
      };
      expect(ArrayBuffer.isView(Object.entries(viewObj)[1][1])).assertEqual(true);
    });
    /**
     * @tc.name   arraybuffer2Test081
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface ViewObj {
        a: Uint8Array
      }

      const viewObj: ViewObj = { a: new Uint8Array(new ArrayBuffer(4)) };
      const objKey = Object.keys(viewObj)[0];
      expect(ArrayBuffer.isView(objKey)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test082
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const copiedUint32Array = new Uint32Array(new Uint32Array(new ArrayBuffer(4)));
      expect(ArrayBuffer.isView(copiedUint32Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test083
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const writtenDataView = new DataView(new ArrayBuffer(4));
      writtenDataView.setUint8(0, 255);
      expect(ArrayBuffer.isView(writtenDataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test084
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const modifiedUint16Array = new Uint16Array(new ArrayBuffer(4));
      modifiedUint16Array[0] = 0xABCD;
      expect(ArrayBuffer.isView(modifiedUint16Array)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test085
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cacheView = new Uint32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(cacheView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test086
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalView = new Int16Array(new ArrayBuffer(8));
      const subView = originalView.subarray(1, 3);
      expect(ArrayBuffer.isView(subView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test087
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isViewResult = ArrayBuffer.isView(new Uint8Array(4));
      expect(ArrayBuffer.isView(isViewResult)).assertEqual(false);

    });

    /**
     * @tc.name   arraybuffer2Test088
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const imageData = new ImageData(10, 10);
      expect(ArrayBuffer.isView(imageData)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test089
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_8900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const offscreenCanvas = new OffscreenCanvas(100, 100);
      expect(ArrayBuffer.isView(offscreenCanvas)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test090
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewStr = new DataView(new ArrayBuffer(4)).toString();
      expect(ArrayBuffer.isView(viewStr)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test091
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9100
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class StaticViewClass {
        static staticView = new DataView(new ArrayBuffer(4));
      }

      expect(ArrayBuffer.isView(StaticViewClass.staticView)).assertEqual(true);

    });

    /**
     * @tc.name   arraybuffer2Test092
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9200
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewIterator = new Uint8Array(new ArrayBuffer(4))[Symbol.iterator]();
      expect(ArrayBuffer.isView(viewIterator)).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer2Test093
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9300
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBufferView = new Uint8Array(new ArrayBuffer(0));
      expect(ArrayBuffer.isView(emptyBufferView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test094
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9400
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBufferDataView = new DataView(new ArrayBuffer(0));
      expect(ArrayBuffer.isView(emptyBufferDataView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test095
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9500
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mapViewArr = [new Uint32Array(new ArrayBuffer(4))].map(view => ArrayBuffer.isView(view));
      expect(mapViewArr[0]).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test096
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9600
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const filterViewArr = [1, new DataView(new ArrayBuffer(4))].filter(item => ArrayBuffer.isView(item));
      expect(ArrayBuffer.isView(filterViewArr[0])).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test097
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9700
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const reduceViewResult =
        [new Uint8Array(new ArrayBuffer(4))].reduce((acc, view) => ArrayBuffer.isView(view), false);
      expect(reduceViewResult).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test098
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9800
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const conditionView = true ? new Uint16Array(new ArrayBuffer(4)) : new ArrayBuffer(4);
      expect(ArrayBuffer.isView(conditionView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test099
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_9900
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nullishView = undefined ?? new Int8Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(nullishView)).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer2Test100
     * @tc.number SUB_BUILTINS_arraybuffer2_TEST_10000
     * @tc.desc   test arraybuffer isView()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer2Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const andView = new DataView(new ArrayBuffer(4)) && new Uint32Array(new ArrayBuffer(4));
      expect(ArrayBuffer.isView(andView)).assertEqual(true);

    });

  })
}

