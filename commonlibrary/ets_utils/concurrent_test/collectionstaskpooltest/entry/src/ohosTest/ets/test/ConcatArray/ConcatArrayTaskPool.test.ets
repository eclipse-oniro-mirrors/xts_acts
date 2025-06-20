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
  testCollectionsConcatArray0001,
  testCollectionsConcatArray0002,
  testCollectionsConcatArray0003,
  testCollectionsConcatArray0004,
  testCollectionsConcatArray0005,
  testCollectionsConcatArray0006,
  testCollectionsConcatArray0007,
  testCollectionsConcatArray0008,
  testCollectionsConcatArray0009,
  testCollectionsConcatArray0010,
  testCollectionsConcatArray0011,
  testCollectionsConcatArray0012,
  testCollectionsConcatArray0013,
  testCollectionsConcatArray0014,
  testCollectionsConcatArray0015,
  testCollectionsConcatArray0016,
  testCollectionsConcatArray0017,
  testCollectionsConcatArray0018,
  testCollectionsConcatArray0019,
  testCollectionsConcatArray0020,
  testCollectionsConcatArray0021,
  testCollectionsConcatArray0022,
  testCollectionsConcatArray0023,
  testCollectionsConcatArray0024,
  testCollectionsConcatArray0025,
} from './ConcatArray_function';

export default function ConcatArrayTaskPoolTest() {
  describe('ConcatArrayTaskPoolTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0100
     * @tc.name       : testCollectionsConcatArray0001
     * @tc.desc       : Testing Collections of ConcatArray without param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0001).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0200
     * @tc.name       : testCollectionsConcatArray0002
     * @tc.desc       : Testing Collections of ConcatArray without param -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0002).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0300
     * @tc.name       : testCollectionsConcatArray0003
     * @tc.desc       : Testing Collections of ConcatArray without param 5.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0003).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0400
     * @tc.name       : testCollectionsConcatArray0004
     * @tc.desc       : Testing Collections of ConcatArray join without param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0004).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0500
     * @tc.name       : testCollectionsConcatArray0005
     * @tc.desc       : Testing Collections of ConcatArray join ''.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0005).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0600
     * @tc.name       : testCollectionsConcatArray0006
     * @tc.desc       : Testing Collections of ConcatArray join undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0006).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0700
     * @tc.name       : testCollectionsConcatArray0007
     * @tc.desc       : Testing Collections of ConcatArray join 'ww'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0007).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0800
     * @tc.name       : testCollectionsConcatArray0008
     * @tc.desc       : Testing Collections of ConcatArray join '分隔符'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0008).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_0900
     * @tc.name       : testCollectionsConcatArray0009
     * @tc.desc       : Testing Collections of ConcatArray join ', '.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0009).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1000
     * @tc.name       : testCollectionsConcatArray0010
     * @tc.desc       : Testing Collections of ConcatArray join '|'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0010).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1100
     * @tc.name       : testCollectionsConcatArray0011
     * @tc.desc       : Testing Collections of ConcatArray join ',。\￥·'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0011).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1200
     * @tc.name       : testCollectionsConcatArray0012
     * @tc.desc       : Testing Collections of ConcatArray join '😊'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0012).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1300
     * @tc.name       : testCollectionsConcatArray0013
     * @tc.desc       : Testing Collections of ConcatArray join '녕하こんйте'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0013).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1400
     * @tc.name       : testCollectionsConcatArray0014
     * @tc.desc       : Testing Collections of ConcatArray slice no start, no end.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0014).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1500
     * @tc.name       : testCollectionsConcatArray0015
     * @tc.desc       : Testing Collections of ConcatArray slice start index 0, no end.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0015).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1600
     * @tc.name       : testCollectionsConcatArray0016
     * @tc.desc       : Testing Collections of ConcatArray slice start index -1, no end.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0016).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1700
     * @tc.name       : testCollectionsConcatArray0017
     * @tc.desc       : Testing Collections of ConcatArray slice start index 2, no end.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0017).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1800
     * @tc.name       : testCollectionsConcatArray0018
     * @tc.desc       : Testing Collections of ConcatArray slice start index 10, no end.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0018).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_1900
     * @tc.name       : testCollectionsConcatArray0019
     * @tc.desc       : Testing Collections of ConcatArray slice no start, end index -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0019).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2000
     * @tc.name       : testCollectionsConcatArray0020
     * @tc.desc       : Testing Collections of ConcatArray slice slice no start, end index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0020).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2100
     * @tc.name       : testCollectionsConcatArray0021
     * @tc.desc       : Testing Collections of ConcatArray slice slice no start, end index 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0021).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2200
     * @tc.name       : testCollectionsConcatArray0022
     * @tc.desc       : Testing Collections of ConcatArray slice slice no start, end index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0022).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2300
     * @tc.name       : testCollectionsConcatArray0023
     * @tc.desc       : Testing Collections of ConcatArray slice slice start index 2, end index 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0023).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2400
     * @tc.name       : testCollectionsConcatArray0024
     * @tc.desc       : Testing Collections of ConcatArray slice slice start index 2, end index 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0024).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_CONCATARRAY_2500
     * @tc.name       : testCollectionsConcatArray0025
     * @tc.desc       : Testing Collections of ConcatArray slice slice start index 2, end index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCollectionsConcatArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsConcatArray0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsConcatArray0025).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
        while (num < 10) {
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