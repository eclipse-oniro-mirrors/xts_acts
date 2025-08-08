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
import { taskpool } from '@kit.ArkTS';
import {
  sleep,
  testCollectionsArray0001,
  testCollectionsArray0002,
  testCollectionsArray0003,
  testCollectionsArray0004,
  testCollectionsArray0005,
  testCollectionsArray0006,
  testCollectionsArray0007,
  testCollectionsArray0008,
  testCollectionsArray0009,
  testCollectionsArray0010,
  testCollectionsArray0011,
  testCollectionsArray0012,
  testCollectionsArray0013,
  testCollectionsArray0014,
  testCollectionsArray0015,
  testCollectionsArray0016,
  testCollectionsArray0017,
  testCollectionsArray0018,
  testCollectionsArray0019,
  testCollectionsArray0020,
  testCollectionsArray0021,
  testCollectionsArray0022,
  testCollectionsArray0023,
  testCollectionsArray0024,
  testCollectionsArray0025,
  testCollectionsArray0026,
  testCollectionsArray0027,
  testCollectionsArray0028,
  testCollectionsArray0029,
  testCollectionsArray0030,
  testCollectionsArray0031,
  testCollectionsArray0032,
  testCollectionsArray0033,
  testCollectionsArray0034,
  testCollectionsArray0035,
  testCollectionsArray0036,
  testCollectionsArray0037,
  testCollectionsArray0038,
  testCollectionsArray0039,
  testCollectionsArray0040,
  testCollectionsArray0041,
  testCollectionsArray0042,
  testCollectionsArray0043,
  testCollectionsArray0044,
  testCollectionsArray0045,
  testCollectionsArray0046,
  testCollectionsArray0047,
  testCollectionsArray0048,
  testCollectionsArray0049,
  testCollectionsArray0050,
  testCollectionsArray0051,
  testCollectionsArray0052,
  testCollectionsArray0053,
  testCollectionsArray0054,
  testCollectionsArray0055,
  testCollectionsArray0056,
  testCollectionsArray0057,
  testCollectionsArray0058,
  testCollectionsArray0059,
  testCollectionsArray0060,
  testCollectionsArray0061,
  testCollectionsArray0062,
  testCollectionsArray0063,
  testCollectionsArray0064,
  testCollectionsArray0065,
  testCollectionsArray0066,
  testCollectionsArray0067,
  testCollectionsArray0068,
  testCollectionsArray0069,
  testCollectionsArray0070,
  testCollectionsArray0071,
  testCollectionsArray0072,
  testCollectionsArray0073,
  testCollectionsArray0074,
  testCollectionsArray0075,
  testCollectionsArray0076,
  testCollectionsArray0077,
  testCollectionsArray0078,
  testCollectionsArray0079,
  testCollectionsArray0080,
  testCollectionsArray0081,
  testCollectionsArray0082,
  testCollectionsArray0083,
  testCollectionsArray0084,
  testCollectionsArray0085,
  testCollectionsArray0086,
  testCollectionsArray0087,
  testCollectionsArray0088,
  testCollectionsArray0089,
  testCollectionsArray0090,
  testCollectionsArray0091,
  testCollectionsArray0092,
  testCollectionsArray0093,
  testCollectionsArray0094,
  testCollectionsArray0095,
  testCollectionsArray0096,
  testCollectionsArray0097,
  testCollectionsArray0098,
  testCollectionsArray0099,
  testCollectionsArray0100,
  testCollectionsArray0101,
  testCollectionsArray0102,
  testCollectionsArray0103,
  testCollectionsArray0104,
  testCollectionsArray0105,
  testCollectionsArray0106,
  testCollectionsArray0107,
  testCollectionsArray0108,
  testCollectionsArray0109,
  testCollectionsArray0110,
  testCollectionsArray0111,
  testCollectionsArray0112,
  testCollectionsArray0113,
  testCollectionsArray0114,
  testCollectionsArray0115,
  testCollectionsArray0116,
  testCollectionsArray0117,
  testCollectionsArray0118,
  testCollectionsArray0119,
  testCollectionsArray0120,
  testCollectionsArray0121,
  testCollectionsArray0122,
  testCollectionsArray0123,
  testCollectionsArray0124,
  testCollectionsArray0125,
  testCollectionsArray0126,
  testCollectionsArray0127,
  testCollectionsArray0128,
  testCollectionsArray0129,
  testCollectionsArray0130,
  testCollectionsArray0131,
  testCollectionsArray0132,
  testCollectionsArray0133,
  testCollectionsArray0134,
  testCollectionsArray0135,
  testCollectionsArray0136,
  testCollectionsArray0137,
  testCollectionsArray0138,
  testCollectionsArray0139,
  testCollectionsArray0140,
  testCollectionsArray0141,
  testCollectionsArray0142,
  testCollectionsArray0143,
  testCollectionsArray0144,
  testCollectionsArray0145,
  testCollectionsArray0146,
  testCollectionsArray0147,
  testCollectionsArray0148,
  testCollectionsArray0149,
  testCollectionsArray0150,
  testCollectionsArray0151,
  testCollectionsArray0152,
  testCollectionsArray0153,
  testCollectionsArray0154,
  testCollectionsArray0155,
  testCollectionsArray0156,
  testCollectionsArray0157,
  testCollectionsArray0158,
  testCollectionsArray0159,
  testCollectionsArray0160,
  testCollectionsArray0161,
  testCollectionsArray0162,
  testCollectionsArray0163,
  testCollectionsArray0164,
  testCollectionsArray0165,
  testCollectionsArray0166,
  testCollectionsArray0167,
  testCollectionsArray0168,
  testCollectionsArray0169,
  testCollectionsArray0170,
  testCollectionsArray0171,
  testCollectionsArray0172,
  testCollectionsArray0173,
  testCollectionsArray0174,
  testCollectionsArray0175,
  testCollectionsArray0176,
  testCollectionsArray0177,
  testCollectionsArray0178,
  testCollectionsArray0179,
  testCollectionsArray0180,
  testCollectionsArray0181,
  testCollectionsArray0182,
  testCollectionsArray0183,
  testCollectionsArray0184,
  testCollectionsArray0185,
  testCollectionsArray0186,
  testCollectionsArray0187,
  testCollectionsArray0188,
  testCollectionsArray0189,
  testCollectionsArray0190,
  testCollectionsArray0191,
  testCollectionsArray0192,
  testCollectionsArray0193,
  testCollectionsArray0194,
  testCollectionsArray0195,
  testCollectionsArray0196,
  testCollectionsArray0197,
  testCollectionsArray0198,
  testCollectionsArray0199,
  testCollectionsArray0200,
  testCollectionsArray0201,
  testCollectionsArray0202,
  testCollectionsArray0203,
  testCollectionsArray0204,
  testCollectionsArray0205,
  testCollectionsArray0206,
  testCollectionsArray0207,
  testCollectionsArray0208,
  testCollectionsArray0209,
  testCollectionsArray0210,
  testCollectionsArray0211,
} from './Array_function';

export default function ArrayTaskPoolTest() {
  describe('ArrayTaskPoolTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_TASK_POOL_0100
     * @tc.name       : testCollectionsArray0001
     * @tc.desc       : Testing the iterative ability of Int8Array using a for loop in TaskPool.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0001).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_TASK_POOL_0200
     * @tc.name       : testCollectionsArray0002
     * @tc.desc       : Testing the iterative ability of Int8Array using a for loop in TaskPool.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 100; i++) {
          taskpool.execute(testCollectionsArray0002).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0300
     * @tc.name       : testCollectionsArray0003
     * @tc.desc       : Testing Collections of Array Constructor, not new.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0003).then((value) => {
            num++;
            expect(value).assertEqual('1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0400
     * @tc.name       : testCollectionsArray0004
     * @tc.desc       : Testing Collections of Array Constructor, param string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0004).then((value) => {
            num++;
            expect(value).assertEqual('a,b');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0500
     * @tc.name       : testCollectionsArray0005
     * @tc.desc       : Testing Collections of Array Constructor, param number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0005).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0600
     * @tc.name       : testCollectionsArray0006
     * @tc.desc       : Testing Collections of Array Constructor, param boolean.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0006).then((value) => {
            num++;
            expect(value).assertEqual('true,false,true');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0700
     * @tc.name       : testCollectionsArray0007
     * @tc.desc       : Testing Collections of Array Constructor, param undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0007).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0800
     * @tc.name       : testCollectionsArray0008
     * @tc.desc       : Testing Collections of Array Constructor, param null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0008).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_0900
     * @tc.name       : testCollectionsArray0009
     * @tc.desc       : Testing Collections of Array Constructor, param bigint.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0009).then((value) => {
            num++;
            expect(value).assertEqual('98765432109876543210,12345678901234567890');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1000
     * @tc.name       : testCollectionsArray0010
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array <collections.ConcatArray>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0010).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,6,8');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1100
     * @tc.name       : testCollectionsArray0011
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array <collections.ConcatArray>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0011).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1200
     * @tc.name       : testCollectionsArray0012
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array <collections.ConcatArray>. [index] element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0012).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1300
     * @tc.name       : testCollectionsArray0013
     * @tc.desc       : Testing Collections of Array Constructor, collections.Array<collections.Array>.push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0013).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1400
     * @tc.name       : testCollectionsArray0014
     * @tc.desc       : Testing Collections of Array Constructor, collections.Array<collections.Array>.pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0014).then((value) => {
            num++;
            expect(value).assertEqual('Before is 1,2,3,4,5,6 and After is 1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1500
     * @tc.name       : testCollectionsArray0015
     * @tc.desc       : Testing Collections of Array Constructor, collections.Array<collections.Array>.index element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0015).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1600
     * @tc.name       : testCollectionsArray0016
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.ArrayBuffer>.push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0016).then((value) => {
            num++;
            expect(value).assertEqual('10,20');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1700
     * @tc.name       : testCollectionsArray0017
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.ArrayBuffer>.pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0017).then((value) => {
            num++;
            expect(value).assertEqual('10,20,10');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1800
     * @tc.name       : testCollectionsArray0018
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.ArrayBuffer>.index element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0018).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_1900
     * @tc.name       : testCollectionsArray0019
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int8Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0019).then((value) => {
            num++;
            expect(value).assertEqual('-1,2,3,8,9');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2000
     * @tc.name       : testCollectionsArray0020
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int8Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0020).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2100
     * @tc.name       : testCollectionsArray0021
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int8Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0021).then((value) => {
            num++;
            expect(value).assertEqual('Before is true and After is 8,9');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2200
     * @tc.name       : testCollectionsArray0022
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint8Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0022).then((value) => {
            num++;
            expect(value).assertEqual('255,2,3,8,9');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2300
     * @tc.name       : testCollectionsArray0023
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint8Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0023).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2400
     * @tc.name       : testCollectionsArray0024
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint8Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0024).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2500
     * @tc.name       : testCollectionsArray0025
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint8ClampedArray>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0025).then((value) => {
            num++;
            expect(value).assertEqual('0,50,90,150,255');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2600
     * @tc.name       : testCollectionsArray0026
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint8ClampedArray>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0026).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2700
     * @tc.name       : testCollectionsArray0027
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint8ClampedArray>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0027).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2800
     * @tc.name       : testCollectionsArray0028
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int16Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0028).then((value) => {
            num++;
            expect(value).assertEqual('-10,50,100');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_2900
     * @tc.name       : testCollectionsArray0029
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int16Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0029).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3000
     * @tc.name       : testCollectionsArray0030
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int16Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0030).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3100
     * @tc.name       : testCollectionsArray0031
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint16Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0031).then((value) => {
            num++;
            expect(value).assertEqual('65526,50,100');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3200
     * @tc.name       : testCollectionsArray0032
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint16Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0032).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3300
     * @tc.name       : testCollectionsArray0033
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint16Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0033).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3400
     * @tc.name       : testCollectionsArray0034
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int32Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0034).then((value) => {
            num++;
            expect(value).assertEqual('-10,50,100');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3500
     * @tc.name       : testCollectionsArray0035
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int32Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0035).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3600
     * @tc.name       : testCollectionsArray0036
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Int32Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0036).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3700
     * @tc.name       : testCollectionsArray0037
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint32Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0037).then((value) => {
            num++;
            expect(value).assertEqual('4294967286,50,100');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3800
     * @tc.name       : testCollectionsArray0038
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint32Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0038).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_3900
     * @tc.name       : testCollectionsArray0039
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Uint32Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0039).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4000
     * @tc.name       : testCollectionsArray0040
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Float32Array>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0040).then((value) => {
            num++;
            expect(value).assertEqual('0,5,10');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4100
     * @tc.name       : testCollectionsArray0041
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Float32Array>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0041).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4200
     * @tc.name       : testCollectionsArray0042
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Float32Array>. index includes(element), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0042).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4300
     * @tc.name       : testCollectionsArray0043
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Map>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0043).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4400
     * @tc.name       : testCollectionsArray0044
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Map>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0044).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4500
     * @tc.name       : testCollectionsArray0045
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Map>. includes(element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0045).then((value) => {
            num++;
            expect(value).assertEqual('foo,bar');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4600
     * @tc.name       : testCollectionsArray0046
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Set>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0046).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4700
     * @tc.name       : testCollectionsArray0047
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Set>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0047).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4800
     * @tc.name       : testCollectionsArray0048
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.Set>. includes(element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0048).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_4900
     * @tc.name       : testCollectionsArray0049
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.BitVector>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0049).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5000
     * @tc.name       : testCollectionsArray0050
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.BitVector>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0050).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5100
     * @tc.name       : testCollectionsArray0051
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.BitVector>. includes(element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0051).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5200
     * @tc.name       : testCollectionsArray0052
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.ArkTSUtils.locks.AsyncLock>. push element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0052).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5300
     * @tc.name       : testCollectionsArray0053
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.ArkTSUtils.locks.AsyncLock>. pop element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0053).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5400
     * @tc.name       : testCollectionsArray0054
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<collections.ArkTSUtils.locks.AsyncLock>. includes(element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0054).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5500
     * @tc.name       : testCollectionsArray0055
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<@Sendable class>. push (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0055).then((value) => {
            num++;
            expect(value).assertEqual(30);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5600
     * @tc.name       : testCollectionsArray0056
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<@Sendable class>. pop (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0056).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5700
     * @tc.name       : testCollectionsArray0057
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<@Sendable class>. includes (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0057).then((value) => {
            num++;
            expect(value).assertEqual(22);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5800
     * @tc.name       : testCollectionsArray0058
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<@Sendable -> ISendable>. push (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0058).then((value) => {
            num++;
            expect(value).assertEqual(30);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_5900
     * @tc.name       : testCollectionsArray0059
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<@Sendable -> ISendable>. pop (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0059).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6000
     * @tc.name       : testCollectionsArray0060
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<@Sendable -> ISendable>. includes(element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0060).then((value) => {
            num++;
            expect(value).assertEqual('2,20');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6100
     * @tc.name       : testCollectionsArray0061
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<number|string>. push (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0061).then((value) => {
            num++;
            expect(value).assertEqual('1,a');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6200
     * @tc.name       : testCollectionsArray0062
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<number|string>. pop (element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0062).then((value) => {
            num++;
            expect(value).assertEqual('1,a,2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6300
     * @tc.name       : testCollectionsArray0063
     * @tc.desc       : Testing Collections of Array Constructor,
     * collections.Array<number|string>. includes(element).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0063).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6400
     * @tc.name       : testCollectionsArray0064
     * @tc.desc       : Testing Collections of Array create, arrayLength -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0064).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6500
     * @tc.name       : testCollectionsArray0065
     * @tc.desc       : Testing Collections of Array create, arrayLength 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0065).then((value) => {
            num++;
            expect(value).assertEqual(',0');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6600
     * @tc.name       : testCollectionsArray0066
     * @tc.desc       : Testing Collections of Array create, arrayLength 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0066).then((value) => {
            num++;
            expect(value).assertEqual('3,3,3,3,3,3,3,3,3,3,10');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6700
     * @tc.name       : testCollectionsArray0067
     * @tc.desc       : Testing Collections of Array create, arrayLength 100000.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0067).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6800
     * @tc.name       : testCollectionsArray0068
     * @tc.desc       : Testing Collections of Array create, arrayLength 1,initialValue RegExp.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0068).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_6900
     * @tc.name       : testCollectionsArray0069
     * @tc.desc       : Testing Collections of Array from, arrayLike Array<T>.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0069).then((value) => {
            num++;
            expect(value).assertEqual('d,e,f');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7000
     * @tc.name       : testCollectionsArray0070
     * @tc.desc       : Testing Collections of Array from, arrayLike [].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0070).then((value) => {
            num++;
            expect(value).assertEqual(',0');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7100
     * @tc.name       : testCollectionsArray0071
     * @tc.desc       : Testing Collections of Array from, arrayLike [null].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0071).then((value) => {
            num++;
            expect(value).assertEqual(',1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7200
     * @tc.name       : testCollectionsArray0072
     * @tc.desc       : Testing Collections of Array from, arrayLike [undefined].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0072).then((value) => {
            num++;
            expect(value).assertEqual(',1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7300
     * @tc.name       : testCollectionsArray0073
     * @tc.desc       : Testing Collections of Array from, arrayLike arrayLike abnormal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0073).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7400
     * @tc.name       : testCollectionsArray0074
     * @tc.desc       : Testing Collections of Array pop, non collectionsArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0074).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7500
     * @tc.name       : testCollectionsArray0075
     * @tc.desc       : Testing Collections of Array pop, collectionsArray is ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0075).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7600
     * @tc.name       : testCollectionsArray0076
     * @tc.desc       : Testing Collections of Array pop, collectionsArray is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0076).then((value) => {
            num++;
            expect(value).assertEqual(null);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7700
     * @tc.name       : testCollectionsArray0077
     * @tc.desc       : Testing Collections of Array pop, collectionsArray is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0077).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7800
     * @tc.name       : testCollectionsArray0078
     * @tc.desc       : Testing Collections of Array pop, collectionsArray is [1,2,3].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0078).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_7900
     * @tc.name       : testCollectionsArray0079
     * @tc.desc       : Testing Collections of Array push, push non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0079).then((value) => {
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
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8000
     * @tc.name       : testCollectionsArray0080
     * @tc.desc       : Testing Collections of Array push, push 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0080).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8100
     * @tc.name       : testCollectionsArray0081
     * @tc.desc       : Testing Collections of Array push, push ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0081).then((value) => {
            num++;
            expect(value).assertEqual('1,');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8200
     * @tc.name       : testCollectionsArray0082
     * @tc.desc       : Testing Collections of Array push, push null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0082';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0082).then((value) => {
            num++;
            expect(value).assertEqual('1,');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8300
     * @tc.name       : testCollectionsArray0083
     * @tc.desc       : Testing Collections of Array push, push undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0083';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0083).then((value) => {
            num++;
            expect(value).assertEqual('1,');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8400
     * @tc.name       : testCollectionsArray0084
     * @tc.desc       : Testing Collections of Array push, push 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0084';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0084).then((value) => {
            num++;
            expect(value).assertEqual('3,1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8500
     * @tc.name       : testCollectionsArray0085
     * @tc.desc       : Testing Collections of Array push, push abnormal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0085';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0085).then((value) => {
            num++;
            expect(value).assertEqual('3,1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8600
     * @tc.name       : testCollectionsArray0086
     * @tc.desc       : Testing Collections of Array join, collectionsArray non, join non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0086';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0086).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8700
     * @tc.name       : testCollectionsArray0087
     * @tc.desc       : Testing Collections of Array join, collectionsArray non, join '-'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0087';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0087).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8800
     * @tc.name       : testCollectionsArray0088
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0088';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0088).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_8900
     * @tc.name       : testCollectionsArray0089
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0089';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0089).then((value) => {
            num++;
            expect(value).assertEqual('135');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9000
     * @tc.name       : testCollectionsArray0090
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0090';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0090).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9100
     * @tc.name       : testCollectionsArray0091
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join 分隔符.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0091';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0091).then((value) => {
            num++;
            expect(value).assertEqual('1分隔符2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9200
     * @tc.name       : testCollectionsArray0092
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join ,。\￥·.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0092';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0092).then((value) => {
            num++;
            expect(value).assertEqual('1,。￥·2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9300
     * @tc.name       : testCollectionsArray0093
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join 녕하こんйте.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0093';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0093).then((value) => {
            num++;
            expect(value).assertEqual('1녕하こんйте2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9400
     * @tc.name       : testCollectionsArray0094
     * @tc.desc       : Testing Collections of Array join, collectionsArray has value,join ，.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0094';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0094).then((value) => {
            num++;
            expect(value).assertEqual('1，2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9500
     * @tc.name       : testCollectionsArray0095
     * @tc.desc       : Testing Collections of Array shift, collectionsArray non ,shift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0095';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0095).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9600
     * @tc.name       : testCollectionsArray0096
     * @tc.desc       : Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0096';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0096).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9700
     * @tc.name       : testCollectionsArray0097
     * @tc.desc       : Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0097';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0097).then((value) => {
            num++;
            expect(value).assertEqual(null);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9800
     * @tc.name       : testCollectionsArray0098
     * @tc.desc       : Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0098';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0098).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_9900
     * @tc.name       : testCollectionsArray0099
     * @tc.desc       : Testing Collections of Array shift, collectionsArray has value ,shift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0099';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0099).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10000
     * @tc.name       : testCollectionsArray0100
     * @tc.desc       : Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0100';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0100).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10100
     * @tc.name       : testCollectionsArray0101
     * @tc.desc       : Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0101';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0101).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10200
     * @tc.name       : testCollectionsArray0102
     * @tc.desc       : Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0102';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0102).then((value) => {
            num++;
            expect(value).assertEqual('1,');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10300
     * @tc.name       : testCollectionsArray0103
     * @tc.desc       : Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0103';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0103).then((value) => {
            num++;
            expect(value).assertEqual('1,');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10400
     * @tc.name       : testCollectionsArray0104
     * @tc.desc       : Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0104';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0104).then((value) => {
            num++;
            expect(value).assertEqual('1,');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10500
     * @tc.name       : testCollectionsArray0105
     * @tc.desc       : Testing Collections of Array unshift, collectionsArray non ,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0105';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0105).then((value) => {
            num++;
            expect(value).assertEqual('4,0,1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10600
     * @tc.name       : testCollectionsArray0106
     * @tc.desc       : Testing Collections of Array slice, collectionsArray non ,slice 0,3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0106';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0106).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10700
     * @tc.name       : testCollectionsArray0107
     * @tc.desc       : Testing Collections of Array slice, collectionsArray non ,slice non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0107';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0107).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10800
     * @tc.name       : testCollectionsArray0108
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0108';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0108).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_10900
     * @tc.name       : testCollectionsArray0109
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0109';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0109).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11000
     * @tc.name       : testCollectionsArray0110
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0110';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0110).then((value) => {
            num++;
            expect(value).assertEqual('2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11100
     * @tc.name       : testCollectionsArray0111
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice -1,-1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0111';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0111).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11200
     * @tc.name       : testCollectionsArray0112
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice -1,0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0112';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0112).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11300
     * @tc.name       : testCollectionsArray0113
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice 0,-1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0113';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0113).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11400
     * @tc.name       : testCollectionsArray0114
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0114';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0114).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11500
     * @tc.name       : testCollectionsArray0115
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0115';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0115).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11600
     * @tc.name       : testCollectionsArray0116
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice 2,4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0116';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0116).then((value) => {
            num++;
            expect(value).assertEqual('3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11700
     * @tc.name       : testCollectionsArray0117
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice 2,4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0117';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0117).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11800
     * @tc.name       : testCollectionsArray0118
     * @tc.desc       : Testing Collections of Array slice, collectionsArray has value ,slice 2,0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0118';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0118).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_11900
     * @tc.name       : testCollectionsArray0119
     * @tc.desc       : Testing Collections of Array sort, collectionsArray non ,sort a,b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0119';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0119).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12000
     * @tc.name       : testCollectionsArray0120
     * @tc.desc       : Testing Collections of Array sort, collectionsArray non ,sort non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0120';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0120).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12100
     * @tc.name       : testCollectionsArray0121
     * @tc.desc       : Testing Collections of Array sort, collectionsArray has value ,sort non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0121';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0121).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,5');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12200
     * @tc.name       : testCollectionsArray0122
     * @tc.desc       : Testing Collections of Array sort, collectionsArray has value ,sort undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0122';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0122).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,5');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12300
     * @tc.name       : testCollectionsArray0123
     * @tc.desc       : Testing Collections of Array sort, collectionsArray has value ,sort b-a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0123';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0123).then((value) => {
            num++;
            expect(value).assertEqual('5,3,2,1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12400
     * @tc.name       : testCollectionsArray0124
     * @tc.desc       : Testing Collections of Array sort, collectionsArray has value ,sort b-a,pop.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0124';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0124).then((value) => {
            num++;
            expect(value).assertEqual('5,3,2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12500
     * @tc.name       : testCollectionsArray0125
     * @tc.desc       : Testing Collections of Array sort, collectionsArray has value ,sort b-a,push.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0125';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0125).then((value) => {
            num++;
            expect(value).assertEqual('5,3,1,6,7');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12600
     * @tc.name       : testCollectionsArray0126
     * @tc.desc       : Testing Collections of Array sort, collectionsArray has value ,sort b-a,shift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0126';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0126).then((value) => {
            num++;
            expect(value).assertEqual('3,1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12700
     * @tc.name       : testCollectionsArray0127
     * @tc.desc       : Testing Collections ofArray sort, collectionsArray has value ,sort b-a,unshift.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0127';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0127).then((value) => {
            num++;
            expect(value).assertEqual('0,5,3,1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12800
     * @tc.name       : testCollectionsArray0128
     * @tc.desc       : Testing Collections of Array indexOf, collectionsArray non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0128';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0128).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_12900
     * @tc.name       : testCollectionsArray0129
     * @tc.desc       : Testing Collections of Array indexOf, collectionsArray ['a','b','c'], indexOf d does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0129';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0129).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13000
     * @tc.name       : testCollectionsArray0130
     * @tc.desc       : Testing Collections of Array indexOf, collectionsArray ['a','b','c'],
     * indexOf b, Index for starting search with -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0130';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0130).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13100
     * @tc.name       : testCollectionsArray0131
     * @tc.desc       : Testing Collections of Array indexOf, collectionsArray ['a','b','c','a','a'],
     * indexOf a, Index for starting search with 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0131';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0131).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13200
     * @tc.name       : testCollectionsArray0132
     * @tc.desc       : Testing Collections of Array indexOf, collectionsArray ['a','b','c','a','a'],
     * indexOf a, no starting index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0132';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0132).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13300
     * @tc.name       : testCollectionsArray0133
     * @tc.desc       : Testing Collections of Array indexOf, collectionsArray ['a','b','c','a','d','a'],
     * indexOf a, Index for starting search with 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0133';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0133).then((value) => {
            num++;
            expect(value).assertEqual(5);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13400
     * @tc.name       : testCollectionsArray0134
     * @tc.desc       : Testing Collections of Array forEach with an empty array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0134';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0134).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13500
     * @tc.name       : testCollectionsArray0135
     * @tc.desc       : Testing Collections of Array forEach with an array of numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0135';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0135).then((value) => {
            num++;
            expect(value).assertEqual("3,2,3,4");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13600
     * @tc.name       : testCollectionsArray0136
     * @tc.desc       : Testing Collections of Array pop function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0136';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0136).then((value) => {
            num++;
            expect(value).assertEqual("2,1,2");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13700
     * @tc.name       : testCollectionsArray0137
     * @tc.desc       : Testing Collections of Array push function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0137';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0137).then((value) => {
            num++;
            expect(value).assertEqual("4,1,2,3,8");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13800
     * @tc.name       : testCollectionsArray0138
     * @tc.desc       : Testing Collections of Array map function with empty array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0138';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0138).then((value) => {
            num++;
            expect(value).assertEqual("0,");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_13900
     * @tc.name       : testCollectionsArray0139
     * @tc.desc       : Testing Collections of Array map function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0139';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0139).then((value) => {
            num++;
            expect(value).assertEqual("3,2,3,4");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14000
     * @tc.name       : testCollectionsArray0140
     * @tc.desc       : Testing Collections of Array map function with pop.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0140';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0140).then((value) => {
            num++;
            expect(value).assertEqual("2,4,6");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14100
     * @tc.name       : testCollectionsArray0141
     * @tc.desc       : Testing Collections of Array map function with push.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0141';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0141).then((value) => {
            num++;
            expect(value).assertEqual("4,4,6,8,18");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14200
     * @tc.name       : testCollectionsArray0142
     * @tc.desc       : Testing Collections of Array filter function with empty array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0142';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0142).then((value) => {
            num++;
            expect(value).assertEqual("0,");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14300
     * @tc.name       : testCollectionsArray0143
     * @tc.desc       : Testing Collections of Array filter function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0143';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0143).then((value) => {
            num++;
            expect(value).assertEqual("2,2,4");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14400
     * @tc.name       : testCollectionsArray0144
     * @tc.desc       : Testing Collections of Array filter function with pop.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0144';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0144).then((value) => {
            num++;
            expect(value).assertEqual("0,");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14500
     * @tc.name       : testCollectionsArray0145
     * @tc.desc       : Testing Collections of Array filter function with push.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0145';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0145).then((value) => {
            num++;
            expect(value).assertEqual("4,1,3,5,7");
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14600
     * @tc.name       : testCollectionsArray0146
     * @tc.desc       : Testing Collections of Array reduce function with empty array, expecting an error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0146';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0146).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14700
     * @tc.name       : testCollectionsArray0147
     * @tc.desc       : Testing Collections of Array reduce function summing up all elements.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0147';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0147).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14800
     * @tc.name       : testCollectionsArray0148
     * @tc.desc       : Testing Collections of Array reduce function with initial value 10, summing up all elements.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0148';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0148).then((value) => {
            num++;
            expect(value).assertEqual(20);
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_14900
     * @tc.name       : testCollectionsArray0149
     * @tc.desc       : Testing Collections of Array reduce function with popping elements, summing up all elements.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0149';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0149).then((value) => {
            num++;
            expect(value).assertEqual('11,8');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15000
     * @tc.name       : testCollectionsArray0150
     * @tc.desc       : Testing Collections of Array reduce function with pushing elements, summing up all elements.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0150';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0150).then((value) => {
            num++;
            expect(value).assertEqual('16,21');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15100
     * @tc.name       : testCollectionsArray0151
     * @tc.desc       : Testing Collections of Array at, collectionsArray [], at(a) undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0151';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0151).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15200
     * @tc.name       : testCollectionsArray0152
     * @tc.desc       : Testing Collections of Array at, collectionsArray [1,2,3,4,5], at(5) undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0152';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0152).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15300
     * @tc.name       : testCollectionsArray0153
     * @tc.desc       : Testing Collections of Array at, collectionsArray [1,2,3,4,5], at(-2)  4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0153';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0153).then((value) => {
            num++;
            expect(value).assertEqual('4');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15400
     * @tc.name       : testCollectionsArray0154
     * @tc.desc       : Testing Collections of Array at, collectionsArray [1,2,3], at(5)  undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0154';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0154).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15500
     * @tc.name       : testCollectionsArray0155
     * @tc.desc       : Testing Collections of Array at, collectionsArray [1,2,3], at(1)  2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0155';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0155).then((value) => {
            num++;
            expect(value).assertEqual('2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15600
     * @tc.name       : testCollectionsArray0156
     * @tc.desc       : Testing Collections of Array entries, collectionsArray [], entries, undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0156';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0156).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15700
     * @tc.name       : testCollectionsArray0157
     * @tc.desc       : Testing Collections of Array entries, collectionsArray ['a','b','c'], entries key-value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0157';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0157).then((value) => {
            num++;
            expect(value).assertEqual('0,a,1,b,2,c');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15800
     * @tc.name       : testCollectionsArray0158
     * @tc.desc       : Testing Collections of Array keys, collectionsArray [], keys non.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0158';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0158).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_15900
     * @tc.name       : testCollectionsArray0159
     * @tc.desc       : Testing Collections of Array keys, collectionsArray ['a','b','c'], keys 0,1,2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0159';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0159).then((value) => {
            num++;
            expect(value).assertEqual('0,1,2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16000
     * @tc.name       : testCollectionsArray0160
     * @tc.desc       : Testing Collections of Array keys, collectionsArray ['a','b','c'], keys 0,1,2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0160';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0160).then((value) => {
            num++;
            expect(value).assertEqual('0,1,2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16100
     * @tc.name       : testCollectionsArray0161
     * @tc.desc       : Testing Collections of Array values, collectionsArray [], values  true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0161';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0161).then((value) => {
            num++;
            expect(value).assertEqual('true');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16200
     * @tc.name       : testCollectionsArray0162
     * @tc.desc       : Testing Collections of Array values, collectionsArray ['e','f','g'], values 'e','f','g'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0162';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0162).then((value) => {
            num++;
            expect(value).assertEqual('e,f,g');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16300
     * @tc.name       : testCollectionsArray0163
     * @tc.desc       : Testing Collections of Array values, collectionsArray ['e','f','g'],
     * get values -> pop, 'e','f', undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0163';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0163).then((value) => {
            num++;
            expect(value).assertEqual('e,f');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16400
     * @tc.name       : testCollectionsArray0164
     * @tc.desc       : Testing Collections of Array values, collectionsArray ['e','f','g'],
     * get values -> push 'h', 'e','f','g','h'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0164';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0164).then((value) => {
            num++;
            expect(value).assertEqual('e,f,g,h');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16500
     * @tc.name       : testCollectionsArray0165
     * @tc.desc       : Testing Collections of Array find, collectionsArray [], find undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0165';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0165).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16600
     * @tc.name       : testCollectionsArray0166
     * @tc.desc       : Testing Collections of Array find, collectionsArray [1,3,5], find undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0166';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0166).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16700
     * @tc.name       : testCollectionsArray0167
     * @tc.desc       : Testing Collections of Array find, collectionsArray [1,3,5], find index -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0167';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0167).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16800
     * @tc.name       : testCollectionsArray0168
     * @tc.desc       : Testing Collections of Array find, collectionsArray [1,3,5], find index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0168';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0168).then((value) => {
            num++;
            expect(value).assertEqual('1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_16900
     * @tc.name       : testCollectionsArray0169
     * @tc.desc       : Testing Collections of Array find, collectionsArray [1,3,5], find value % 2 === 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0169';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0169).then((value) => {
            num++;
            expect(value).assertEqual('3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17000
     * @tc.name       : testCollectionsArray0170
     * @tc.desc       : Testing Collections of Array includes, collectionsArray [], includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0170';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0170).then((value) => {
            num++;
            expect(value).assertEqual('false');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17100
     * @tc.name       : testCollectionsArray0171
     * @tc.desc       : Testing Collections of Array includes, collectionsArray [1,2,3],
     * searchElement 4, fromIndex -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0171';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0171).then((value) => {
            num++;
            expect(value).assertEqual('false');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17200
     * @tc.name       : testCollectionsArray0172
     * @tc.desc       : Testing Collections of Array includes, collectionsArray [1,2,3],
     * searchElement 2, fromIndex -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0172';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0172).then((value) => {
            num++;
            expect(value).assertEqual('false');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17300
     * @tc.name       : testCollectionsArray0173
     * @tc.desc       : Testing Collections of Array includes, collectionsArray [1,2,3],
     * searchElement 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0173';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0173).then((value) => {
            num++;
            expect(value).assertEqual('false');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17400
     * @tc.name       : testCollectionsArray0174
     * @tc.desc       : Testing Collections of Array includes, collectionsArray [1,2,3],
     * searchElement 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0174';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0174).then((value) => {
            num++;
            expect(value).assertEqual('true');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17500
     * @tc.name       : testCollectionsArray0175
     * @tc.desc       : Testing Collections of Array includes, collectionsArray [1,2,3],
     * searchElement 3, fromIndex 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0175';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0175).then((value) => {
            num++;
            expect(value).assertEqual('false');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17600
     * @tc.name       : testCollectionsArray0176
     * @tc.desc       : Testing Collections of Array findIndex, collectionsArray [],
     * findIndex value % 2 === 0, result -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0176';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0176).then((value) => {
            num++;
            expect(value).assertEqual('-1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17700
     * @tc.name       : testCollectionsArray0177
     * @tc.desc       : Testing Collections of Array findIndex, collectionsArray [2,3,4], Index  -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0177';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0177).then((value) => {
            num++;
            expect(value).assertEqual('-1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17800
     * @tc.name       : testCollectionsArray0178
     * @tc.desc       : Testing Collections of Array findIndex, collectionsArray [1,3,5], return -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0178';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0178).then((value) => {
            num++;
            expect(value).assertEqual('-1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_17900
     * @tc.name       : testCollectionsArray0179
     * @tc.desc       : Testing Collections of Array findIndex, collectionsArray [1,3,5].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0179';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0179).then((value) => {
            num++;
            expect(value).assertEqual('0');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18000
     * @tc.name       : testCollectionsArray0180
     * @tc.desc       : Testing Collections of Array findIndex, collectionsArray [1,3,5].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0180';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0180).then((value) => {
            num++;
            expect(value).assertEqual('-1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18100
     * @tc.name       : testCollectionsArray0181
     * @tc.desc       : Testing Collections of Array fill, start -1,end normal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0181';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0181).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18200
     * @tc.name       : testCollectionsArray0182
     * @tc.desc       : Testing Collections of Array fill, start normal,end -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0182';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0182).then((value) => {
            num++;
            expect(value).assertEqual('-1,-1,-1,-1,5');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18300
     * @tc.name       : testCollectionsArray0183
     * @tc.desc       : Testing Collections of Array fill, start out of range, end normal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0183';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0183).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18400
     * @tc.name       : testCollectionsArray0184
     * @tc.desc       : Testing Collections of Array fill, start normal, end error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0184';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0184).then((value) => {
            num++;
            expect(value).assertEqual('-1,-1,-1,-1,-1');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18500
     * @tc.name       : testCollectionsArray0185
     * @tc.desc       : Testing Collections of Array fill, fill null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0185';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0185).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18600
     * @tc.name       : testCollectionsArray0186
     * @tc.desc       : Testing Collections of Array fill, fill undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0186';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0186).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18700
     * @tc.name       : testCollectionsArray0187
     * @tc.desc       : Testing Collections of Array fill, fill 8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0187';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0187).then((value) => {
            num++;
            expect(value).assertEqual('8,8,8,8,8');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18800
     * @tc.name       : testCollectionsArray0188
     * @tc.desc       : Testing Collections of Array shrinkTo, arrayLength >= array.length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0188';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0188).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_18900
     * @tc.name       : testCollectionsArray0189
     * @tc.desc       : Testing Collections of Array shrinkTo, arrayLength<array.length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0189';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0189).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19000
     * @tc.name       : testCollectionsArray0190
     * @tc.desc       : Testing Collections of Array shrinkTo, arrayLength=-1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0190';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0190).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19100
     * @tc.name       : testCollectionsArray0191
     * @tc.desc       : Testing Collections of Array extendTo, arrayLength <= array.length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0191';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0191).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19200
     * @tc.name       : testCollectionsArray0192
     * @tc.desc       : Testing Collections of Array extendTo, arrayLength>array.length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0192';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0192).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,10,10');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19300
     * @tc.name       : testCollectionsArray0193
     * @tc.desc       : Testing Collections of Array extendTo, arrayLength -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0193';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0193).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19400
     * @tc.name       : testCollectionsArray0194
     * @tc.desc       : Testing Collections of Array concat, one array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0194';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0194).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19500
     * @tc.name       : testCollectionsArray0195
     * @tc.desc       : Testing Collections of Array concat, two array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0195';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0195).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19600
     * @tc.name       : testCollectionsArray0196
     * @tc.desc       : Testing Collections of Array concat, param is abnormal.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0196';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0196).then((value) => {
            num++;
            expect(value).assertEqual(',');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19700
     * @tc.name       : testCollectionsArray0197
     * @tc.desc       : Testing Collections of Array splice, array [].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0197';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0197).then((value) => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19800
     * @tc.name       : testCollectionsArray0198
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0198';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0198).then((value) => {
            num++;
            expect(value).assertEqual('1,2;3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_19900
     * @tc.name       : testCollectionsArray0199
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0199';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0199).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3;');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20000
     * @tc.name       : testCollectionsArray0200
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start< -array.length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0200';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0200).then((value) => {
            num++;
            expect(value).assertEqual(';1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20100
     * @tc.name       : testCollectionsArray0201
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0201';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0201).then((value) => {
            num++;
            expect(value).assertEqual(';1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20200
     * @tc.name       : testCollectionsArray0202
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0202';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0202).then((value) => {
            num++;
            expect(value).assertEqual('1,2;3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20300
     * @tc.name       : testCollectionsArray0203
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0, deleteCount -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0203';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0203).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3;');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20400
     * @tc.name       : testCollectionsArray0204
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0204';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0204).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3;');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20500
     * @tc.name       : testCollectionsArray0205
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0205';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0205).then((value) => {
            num++;
            expect(value).assertEqual('3;1,2');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20600
     * @tc.name       : testCollectionsArray0206
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0206';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0206).then((value) => {
            num++;
            expect(value).assertEqual(';1,2,3');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20700
     * @tc.name       : testCollectionsArray0207
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 0, items null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0207';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0207).then((value) => {
            num++;
            expect(value).assertEqual(',,,;');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20800
     * @tc.name       : testCollectionsArray0208
     * @tc.desc       : Testing Collections of Array splice, array [1,2,3], start 0, deleteCount 0, items undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0208';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0208).then((value) => {
            num++;
            expect(value).assertEqual(',,;');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_20900
     * @tc.name       : testCollectionsArray0209
     * @tc.desc       : Testing Collections of Array [index:number], index -5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0209';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0209).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_21000
     * @tc.name       : testCollectionsArray0210
     * @tc.desc       : Testing Collections of Array [index:number], index 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0210';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0210).then((value) => {
            num++;
            expect(value).assertEqual('undefined');
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAY_21100
     * @tc.name       : testCollectionsArray0211
     * @tc.desc       : Testing Collections of Array [index:number], index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsArray0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0211';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0211).then((value) => {
            num++;
            expect(value).assertEqual('2');
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
  })
}