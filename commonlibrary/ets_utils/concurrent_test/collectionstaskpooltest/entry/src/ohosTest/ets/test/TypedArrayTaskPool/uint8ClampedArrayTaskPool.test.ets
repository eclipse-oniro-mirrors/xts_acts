/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import {
  sleep,
  testUint8ClampedArrayTaskPool0001,
  testUint8ClampedArrayTaskPool0002,
  testUint8ClampedArrayTaskPool0003,
  testUint8ClampedArrayTaskPool0004,
  testUint8ClampedArrayTaskPool0005,
  testUint8ClampedArrayTaskPool0006,
  testUint8ClampedArrayTaskPool0007,
  testUint8ClampedArrayTaskPool0008,
  testUint8ClampedArrayTaskPool0009,
  testUint8ClampedArrayTaskPool0010,
  testUint8ClampedArrayTaskPool0011,
  testUint8ClampedArrayTaskPool0012,
  testUint8ClampedArrayTaskPool0013,
  testUint8ClampedArrayTaskPool0014,
  testUint8ClampedArrayTaskPool0015,
  testUint8ClampedArrayTaskPool0016,
  testUint8ClampedArrayTaskPool0017,
  testUint8ClampedArrayTaskPool0018,
  testUint8ClampedArrayTaskPool0019,
  testUint8ClampedArrayTaskPool0020,
  testUint8ClampedArrayTaskPool0021,
  testUint8ClampedArrayTaskPool0022,
  testUint8ClampedArrayTaskPool0023,
  testUint8ClampedArrayTaskPool0024,
  testUint8ClampedArrayTaskPool0025,
  testUint8ClampedArrayTaskPool0026,
  testUint8ClampedArrayTaskPool0027,
  testUint8ClampedArrayTaskPool0028,
  testUint8ClampedArrayTaskPool0029,
  testUint8ClampedArrayTaskPool0030,
  testUint8ClampedArrayTaskPool0031,
  testUint8ClampedArrayTaskPool0032,
  testUint8ClampedArrayTaskPool0033,
  testUint8ClampedArrayTaskPool0034,
  testUint8ClampedArrayTaskPool0035,
  testUint8ClampedArrayTaskPool0036,
  testUint8ClampedArrayTaskPool0037,
  testUint8ClampedArrayTaskPool0038,
  testUint8ClampedArrayTaskPool0039,
  testUint8ClampedArrayTaskPool0040,
  testUint8ClampedArrayTaskPool0041,
  testUint8ClampedArrayTaskPool0042,
  testUint8ClampedArrayTaskPool0043,
  testUint8ClampedArrayTaskPool0044,
  testUint8ClampedArrayTaskPool0045,
  testUint8ClampedArrayTaskPool0046,
  testUint8ClampedArrayTaskPool0047,
  testUint8ClampedArrayTaskPool0048,
  testUint8ClampedArrayTaskPool0049,
  testUint8ClampedArrayTaskPool0050,
  testUint8ClampedArrayTaskPool0051,
  testUint8ClampedArrayTaskPool0052,
  testUint8ClampedArrayTaskPool0053,
  testUint8ClampedArrayTaskPool0054,
  testUint8ClampedArrayTaskPool0055,
  testUint8ClampedArrayTaskPool0056,
  testUint8ClampedArrayTaskPool0057,
  testUint8ClampedArrayTaskPool0058,
  testUint8ClampedArrayTaskPool0059,
  testUint8ClampedArrayTaskPool0060,
  testUint8ClampedArrayTaskPool0061,
  testUint8ClampedArrayTaskPool0062,
  testUint8ClampedArrayTaskPool0063,
  testUint8ClampedArrayTaskPool0064,
  testUint8ClampedArrayTaskPool0065,
  testUint8ClampedArrayTaskPool0066,
  testUint8ClampedArrayTaskPool0067,
  testUint8ClampedArrayTaskPool0068,
  testUint8ClampedArrayTaskPool0069,
  testUint8ClampedArrayTaskPool0070,
  testUint8ClampedArrayTaskPool0071,
  testUint8ClampedArrayTaskPool0072,
  testUint8ClampedArrayTaskPool0073,
  testUint8ClampedArrayTaskPool0074,
  testUint8ClampedArrayTaskPool0075,
  testUint8ClampedArrayTaskPool0076,
  testUint8ClampedArrayTaskPool0077,
  testUint8ClampedArrayTaskPool0078,
  testUint8ClampedArrayTaskPool0079,
  testUint8ClampedArrayTaskPool0080,
  testUint8ClampedArrayTaskPool0081,
  testUint8ClampedArrayTaskPool0082,
  testUint8ClampedArrayTaskPool0083,
  testUint8ClampedArrayTaskPool0084,
  testUint8ClampedArrayTaskPool0085,
  testUint8ClampedArrayTaskPool0086,
  testUint8ClampedArrayTaskPool0087,
  testUint8ClampedArrayTaskPool0088,
  testUint8ClampedArrayTaskPool0089,
  testUint8ClampedArrayTaskPool0090,
  testUint8ClampedArrayTaskPool0091,
  testUint8ClampedArrayTaskPool0092,
  testUint8ClampedArrayTaskPool0093,
  testUint8ClampedArrayTaskPool0094,
  testUint8ClampedArrayTaskPool0095,
  testUint8ClampedArrayTaskPool0096,
  testUint8ClampedArrayTaskPool0097,
  testUint8ClampedArrayTaskPool0098,
  testUint8ClampedArrayTaskPool0099,
  testUint8ClampedArrayTaskPool0100,
  testUint8ClampedArrayTaskPool0101,
  testUint8ClampedArrayTaskPool0102,
  testUint8ClampedArrayTaskPool0103,
  testUint8ClampedArrayTaskPool0104,
  testUint8ClampedArrayTaskPool0105,
  testUint8ClampedArrayTaskPool0106,
  testUint8ClampedArrayTaskPool0107,
  testUint8ClampedArrayTaskPool0108,
  testUint8ClampedArrayTaskPool0109,
  testUint8ClampedArrayTaskPool0110,
  testUint8ClampedArrayTaskPool0111,
  testUint8ClampedArrayTaskPool0112,
  testUint8ClampedArrayTaskPool0113,
  testUint8ClampedArrayTaskPool0114,
  testUint8ClampedArrayTaskPool0115,
  testUint8ClampedArrayTaskPool0116,
  testUint8ClampedArrayTaskPool0117,
  testUint8ClampedArrayTaskPool0118,
  testUint8ClampedArrayTaskPool0119,
  testUint8ClampedArrayTaskPool0120,
  testUint8ClampedArrayTaskPool0121,
  testUint8ClampedArrayTaskPool0122,
  testUint8ClampedArrayTaskPool0123,
  testUint8ClampedArrayTaskPool0124,
  testUint8ClampedArrayTaskPool0125,
  testUint8ClampedArrayTaskPool0126,
  testUint8ClampedArrayTaskPool0127,
  testUint8ClampedArrayTaskPool0128,
  testUint8ClampedArrayTaskPool0129,
  testUint8ClampedArrayTaskPool0130,
  testUint8ClampedArrayTaskPool0131,
  testUint8ClampedArrayTaskPool0132,
  testUint8ClampedArrayTaskPool0133,
  testUint8ClampedArrayTaskPool0134,
  testUint8ClampedArrayTaskPool0135,
  testUint8ClampedArrayTaskPool0136,
  testUint8ClampedArrayTaskPool0137,
  testUint8ClampedArrayTaskPool0138,
  testUint8ClampedArrayTaskPool0139,
  testUint8ClampedArrayTaskPool0140,
  testUint8ClampedArrayTaskPool0141,
  testUint8ClampedArrayTaskPool0142,
  testUint8ClampedArrayTaskPool0143,
  testUint8ClampedArrayTaskPool0144,
  testUint8ClampedArrayTaskPool0145,
  testUint8ClampedArrayTaskPool0146,
  testUint8ClampedArrayTaskPool0147,
  testUint8ClampedArrayTaskPool0148,
  testUint8ClampedArrayTaskPool0149,
  testUint8ClampedArrayTaskPool0150,
  testUint8ClampedArrayTaskPool0151,
  testUint8ClampedArrayTaskPool0152,
  testUint8ClampedArrayTaskPool0153,
  testUint8ClampedArrayTaskPool0154,
  testUint8ClampedArrayTaskPool0155,
  testUint8ClampedArrayTaskPool0156,
  testUint8ClampedArrayTaskPool0157,
  testUint8ClampedArrayTaskPool0158,
  testUint8ClampedArrayTaskPool0159,
  testUint8ClampedArrayTaskPool0160,
  testUint8ClampedArrayTaskPool0161,
  testUint8ClampedArrayTaskPool0162,
  testUint8ClampedArrayTaskPool0163,
  testUint8ClampedArrayTaskPool0164,
  testUint8ClampedArrayTaskPool0165,
  testUint8ClampedArrayTaskPool0166,
  testUint8ClampedArrayTaskPool0167,
  testUint8ClampedArrayTaskPool0168,
  testUint8ClampedArrayTaskPool0169,
  testUint8ClampedArrayTaskPool0170,
  testUint8ClampedArrayTaskPool0171,
  testUint8ClampedArrayTaskPool0172,
  testUint8ClampedArrayTaskPool0173,
  testUint8ClampedArrayTaskPool0174,
  testUint8ClampedArrayTaskPool0175,
  testUint8ClampedArrayTaskPool0176,
  testUint8ClampedArrayTaskPool0177,
  testUint8ClampedArrayTaskPool0178,
  testUint8ClampedArrayTaskPool0179,
  testUint8ClampedArrayTaskPool0180,
  testUint8ClampedArrayTaskPool0181,
  testUint8ClampedArrayTaskPool0182,
  testUint8ClampedArrayTaskPool0183,
  testUint8ClampedArrayTaskPool0184,
  testUint8ClampedArrayTaskPool0185,
  testUint8ClampedArrayTaskPool0186,
  testUint8ClampedArrayTaskPool0187,
} from '../TypedArray_function/uint8ClampedArray_function';

export default function uint8ClampedArrayTaskPoolTest() {
  describe('uint8ClampedArrayTaskPoolTest', () => {
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0100
     * @tc.desc   Testing the iterative ability of Uint8ClampedArray using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0001).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0200
     * @tc.desc   Testing the iterative ability of Uint8ClampedArray using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0002).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint8ClampedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })


    /**
     * @tc.name   testUint8ClampedArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0400
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0004).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0005).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0006).then((value) => {
            num++;
            expect(value).assertEqual(10);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0007).then((value) => {
            num++;
            expect(value).assertEqual(100000);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0800
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0008).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0009).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0010).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0011).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0012).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0013).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0014).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0015).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0016).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0017).then((value) => {
            num++;
            expect(value).assertEqual('1,2');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0018).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0019).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0020).then((value) => {
            num++;
            expect(value).assertEqual('3,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0021).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0022).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2300
     * @tc.desc   Testing the array-like map function created from an object in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0023).then((value) => {
            num++;
            expect(value).assertEqual('0,1,2,3,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2400
     * @tc.desc   Testing the array-like map function created from a character array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0024).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2500
     * @tc.desc   Testing the array-like map function created from a string in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0025).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2600
     * @tc.desc   Testing the array-like map function created from a num array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0026).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2700
     * @tc.desc   Testing the array-like map function created from a nesting array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0027).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0028).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0029).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0030).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,2,3,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0031).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0032).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0033).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0034).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0035).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0036).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0037).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0038).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0039).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0040).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0041).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0042).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0043).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0044).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0045).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0046).then((value) => {
            num++;
            expect(value).assertEqual('3,4,5,6,7,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0047).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0048).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0049).then((value) => {
            num++;
            expect(value).assertEqual('3,4,5,6,7,8,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0050).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0051).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0052).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0053).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0054).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0055).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0056).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0057).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0058).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0059).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0060).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0061).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0062).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0063).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0064).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6500
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0065).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0066).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0067).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0068).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,1,4,4,1,4,3');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0069).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0070).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0071).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0072).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0073).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,4,4,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0074).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7500
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0075).then((value) => {
            num++;
            expect(value).assertEqual('4,4,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7600
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0076).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,4,4,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7700
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0077).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,4,4,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0078).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_7900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0079).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0080).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,4,4,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0081).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0082';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0082).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0083';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0083).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0084';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0084).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8500
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0085';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0085).then((value) => {
            num++;
            expect(value).assertEqual('0,2,4');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8600
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0086';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0086).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8700
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0087';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0087).then((value) => {
            num++;
            expect(value).assertEqual(' after set is 5,6');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8800
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0088';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0088).then((value) => {
            num++;
            expect(value).assertEqual(3);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_8900
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0089';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0089).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9000
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0090';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0090).then((value) => {
            num++;
            expect(value).assertEqual('undefined,5');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9100
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0091';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0091).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9200
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0092';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0092).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9300
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0093';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0093).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9400
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0094';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0094).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9500
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0095';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0095).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9600
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0096';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0096).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9700
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0097';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0097).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9800
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0098';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0098).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_9900
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0099';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0099).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10000
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0100';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0100).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10100
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0101';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0101).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10200
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0102';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0102).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10300
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0103';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0103).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10400
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0104';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0104).then((value) => {
            num++;
            expect(value).assertEqual(9);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10500
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0105';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0105).then((value) => {
            num++;
            expect(value).assertEqual(6);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10600
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0106';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0106).then((value) => {
            num++;
            expect(value).assertEqual(2);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10700
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0107';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0107).then((value) => {
            num++;
            expect(value).assertEqual(3);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10800
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0108';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0108).then((value) => {
            num++;
            expect(value).assertEqual(-1);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_10900
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0109';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0109).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11000
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0110';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0110).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11100
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0111';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0111).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11200
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0112';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0112).then((value) => {
            num++;
            expect(value).assertEqual("12345");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11300
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0113';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0113).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11400
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0114';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0114).then((value) => {
            num++;
            expect(value).assertEqual("1/2/3/4/5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11500
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0115';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0115).then((value) => {
            num++;
            expect(value).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11600
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0116';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0116).then((value) => {
            num++;
            expect(value).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11700
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0117';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0117).then((value) => {
            num++;
            expect(value).assertEqual("1，2，3，4，5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11800
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0118';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0118).then((value) => {
            num++;
            expect(value).assertEqual("");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_11900
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0119';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0119).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12000
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0120';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0120).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0121';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0121).then((value) => {
            num++;
            expect(value).assertEqual('error');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12200
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0122';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0122).then((value) => {
            num++;
            expect(value).assertEqual(15);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12300
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0123';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0123).then((value) => {
            num++;
            expect(value).assertEqual(23);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12400
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0124';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0124).then((value) => {
            num++;
            expect(value).assertEqual('initialValue12345');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12500
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0125';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0125).then((value) => {
            num++;
            expect(value).assertEqual('');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12600
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0126';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0126).then((value) => {
            num++;
            expect(value).assertEqual('5,4,3,2,1');
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12700
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0127';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0127).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12800
     * @tc.desc   Testing the set of uint8ClampedArray, offset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0128';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0128).then((value) => {
            num++;
            expect(value).assertEqual("1,3,5,0,0,0,0,0");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_12900
     * @tc.desc   Testing the set of uint8ClampedArray, offset is null, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0129';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0129).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13000
     * @tc.desc   Testing the set of uint8ClampedArray, offset is -1, return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0130';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0130).then((value) => {
            num++;
            expect(value).assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13100
     * @tc.desc   Testing the set of uint8ClampedArray, offset is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0131';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0131).then((value) => {
            num++;
            expect(value).assertEqual("1,3,5,0,0,0,0,0");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13200
     * @tc.desc   Testing the set of uint8ClampedArray, offset is 0, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0132';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0132).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13300
     * @tc.desc   Testing the set of uint8ClampedArray, offset is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0133';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0133).then((value) => {
            num++;
            expect(value).assertEqual("0,0,1,3,5,0,0,0");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13400
     * @tc.desc   Testing the set of uint8ClampedArray, offset is 2, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0134';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0134).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13500
     * @tc.desc   Testing the set of uint8ClampedArray, offset is 10(overstep), return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0135';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0135).then((value) => {
            num++;
            expect(value).assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13600
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is null, start is 1, end is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0136';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0136).then((value) => {
            num++;
            expect(value).assertEqual("");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13700
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0137';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0137).then((value) => {
            num++;
            expect(value).assertEqual("");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13800
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0138';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0138).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_13900
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0139';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0139).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14000
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0140';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0140).then((value) => {
          num++;
          expect(value).assertEqual("5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14100
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, start is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0141';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0141).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14200
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, start is -1, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0142';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0142).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14300
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, start is 0, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0143';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0143).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14400
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0144';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0144).then((value) => {
          num++;
          expect(value).assertEqual("3,4,5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14500
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0145';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0145).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14600
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0146';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0146).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14700
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0147';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0147).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14800
     * @tc.desc   Testing the Slice of uint8ClampedArray, array is not null, start is 2, end is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0148';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0148).then((value) => {
          num++;
          expect(value).assertEqual("3,4");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_14900
     * @tc.desc   Testing the sort of uint8ClampedArray, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0149';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0149).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15000
     * @tc.desc   Testing the sort of uint8ClampedArray, array is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0150';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0150).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15100
     * @tc.desc   Testing the sort of uint8ClampedArray, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0151';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0151).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4,5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15200
     * @tc.desc   Testing the sort of uint8ClampedArray, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0152';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0152).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4,5");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15300
     * @tc.desc   Testing the sort of uint8ClampedArray, array is not null, parameter is grade down.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0153';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0153).then((value) => {
          num++;
          expect(value).assertEqual("5,4,3,2,1");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15400
     * @tc.desc   Testing the sort of uint8ClampedArray, array is not null, set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0154';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0154).then((value) => {
          num++;
          expect(value).assertEqual("2,5,7,8,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15500
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0155';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0155).then((value) => {
          num++;
          expect(value).assertEqual("1,3,5,7,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15600
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is -1, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0156';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0156).then((value) => {
          num++;
          expect(value).assertEqual("9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15700
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0157';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0157).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15800
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is -1, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0158';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0158).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_15900
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is -1, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0159';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0159).then((value) => {
          num++;
          expect(value).assertEqual("9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16000
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is 2, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0160';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0160).then((value) => {
          num++;
          expect(value).assertEqual("5,7,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16100
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is 2, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0161';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0161).then((value) => {
          num++;
          expect(value).assertEqual("5,7");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16200
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0162';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0162).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16300
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is 2, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0163';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0163).then((value) => {
          num++;
          expect(value).assertEqual("5,7,9");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16400
     * @tc.desc   Testing the subarray of uint8ClampedArray, array is not null, begin is overstep, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0164';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0164).then((value) => {
          num++;
          expect(value).assertEqual("");
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16500
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [], at(1), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0165';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0165).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16600
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], at(3), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0166';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0166).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16700
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], at(-1), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0167';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0167).then((value) => {
          num++;
          expect(value).assertEqual(3);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16800
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], at(5), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0168';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0168).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_16900
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], at(0), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0169';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0169).then((value) => {
          num++;
          expect(value).assertEqual(1);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17000
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [], includes(2), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0170';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0170).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17100
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], includes(5,-1), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0171';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0171).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17200
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], includes(3,-1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0172';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0172).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17300
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], includes(10), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0173';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0173).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17400
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], includes(1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0174';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0174).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17500
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], includes(1,5), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0175';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0175).then((value) => {
          num++;
          expect(value).assertEqual(false);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17600
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [], entries(), undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0176';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0176).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17700
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0177';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0177).then((value) => {
          num++;
          expect(value).assertEqual('0,1');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17800
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [], keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0178';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0178).then((value) => {
          num++;
          expect(value).assertEqual(0);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_17900
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], keys(),iterator.next().value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0179';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0179).then((value) => {
          num++;
          expect(value).assertEqual('0,1,2');
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18000
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], keys(),for iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0180';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0180).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18100
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [], values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0181';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0181).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18200
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], values(),iterator.next().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0182';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0182).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18300
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0183';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0183).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18400
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], set array,values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0184';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0184).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18500
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], index < 0, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0185';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0185).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0186
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18600
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], index > arrayLength, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0186';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0186).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint8ClampedArrayTaskPool0187
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_TASK_POOL_18700
     * @tc.desc   Testing Collections of Uint8ClampedArray, array is [1,2,3], 0 <= index < arrayLength, array[index] = array element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0187';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint8ClampedArrayTaskPool0187).then((value) => {
          num++;
          expect(value).assertEqual(true);
        });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
  })
}