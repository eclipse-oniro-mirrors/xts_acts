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
  testBitVectorConstructor0001,
  testBitVectorConstructor0002,
  testBitVectorConstructor0003,
  testBitVectorConstructor0004,
  testBitVectorFlipBitByIndex0001,
  testBitVectorFlipBitByIndex0002,
  testBitVectorFlipBitByIndex0003,
  testBitVectorFlipBitsByRange0001,
  testBitVectorFlipBitsByRange0002,
  testBitVectorFlipBitsByRange0003,
  testBitVectorFlipBitsByRange0004,
  testBitVectorFlipBitsByRange0005,
  testBitVectorFlipBitsByRange0006,
  testBitVectorGetBitCountByRange0001,
  testBitVectorGetBitCountByRange0002,
  testBitVectorGetBitCountByRange0003,
  testBitVectorGetBitCountByRange0004,
  testBitVectorGetBitCountByRange0005,
  testBitVectorGetBitCountByRange0006,
  testBitVectorGetBitsByRange0001,
  testBitVectorGetBitsByRange0002,
  testBitVectorGetBitsByRange0003,
  testBitVectorGetBitsByRange0004,
  testBitVectorGetBitsByRange0005,
  testBitVectorGetBitsByRange0006,
  testBitVectorGetIndexOf0001,
  testBitVectorGetIndexOf0002,
  testBitVectorGetIndexOf0003,
  testBitVectorGetIndexOf0004,
  testBitVectorGetIndexOf0005,
  testBitVectorGetIndexOf0006,
  testBitVectorGetIndexOf0007,
  testBitVectorGetIndexOf0008,
  testBitVectorGetLastIndexOf0001,
  testBitVectorGetLastIndexOf0002,
  testBitVectorGetLastIndexOf0003,
  testBitVectorGetLastIndexOf0004,
  testBitVectorGetLastIndexOf0005,
  testBitVectorGetLastIndexOf0006,
  testBitVectorGetLastIndexOf0007,
  testBitVectorGetLastIndexOf0008,
  testBitVectorHas0001,
  testBitVectorHas0002,
  testBitVectorHas0003,
  testBitVectorHas0004,
  testBitVectorHas0005,
  testBitVectorHas0006,
  testBitVectorHas0007,
  testBitVectorHas0008,
  testBitVectorPop0001,
  testBitVectorPop0002,
  testBitVectorPop0003,
  testBitVectorPop0004,
  testBitVectorPop0005,
  testBitVectorPush0001,
  testBitVectorPush0002,
  testBitVectorPush0003,
  testBitVectorPush0004,
  testBitVectorPush0005,
  testBitVectorPush0006,
  testBitVectorPush0007,
  testBitVectorPush0008,
  testBitVectorResize0001,
  testBitVectorResize0002,
  testBitVectorResize0003,
  testBitVectorSetAllBits0001,
  testBitVectorSetAllBits0002,
  testBitVectorSetAllBits0003,
  testBitVectorSetAllBits0004,
  testBitVectorSetAllBits0005,
  testBitVectorSetBitsByRange0001,
  testBitVectorSetBitsByRange0002,
  testBitVectorSetBitsByRange0003,
  testBitVectorSetBitsByRange0004,
  testBitVectorSetBitsByRange0005,
  testBitVectorSetBitsByRange0006,
  testBitVectorSetBitsByRange0007,
  testBitVectorSetBitsByRange0008,
  testBitVectorSetBitsByRange0009,
  testBitVectorValues0001,
  testBitVectorValues0002,
  testBitVectorValues0003,
} from './BitVector_function';

export default function BitVectorTaskPoolTest() {
  describe('BitVectorTaskPoolTest', () => {
    /**
     * @tc.name   testBitVectorConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0100
     * @tc.desc   Testing the constructor of bitVector, length is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorConstructor0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorConstructor0001).then((value) => {
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
     * @tc.name   testBitVectorConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0200
     * @tc.desc   Testing the constructor of bitVector, length is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorConstructor0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorConstructor0002).then((value) => {
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
     * @tc.name   testBitVectorConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0300
     * @tc.desc   Testing the constructor of bitVector, length is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorConstructor0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorConstructor0003).then((value) => {
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
     * @tc.name   testBitVectorConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0400
     * @tc.desc   Testing the constructor of bitVector, length is 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorConstructor0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorConstructor0004).then((value) => {
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
     * @tc.name   testBitVectorPush0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0500
     * @tc.desc   Testing the Push of bitVector, push 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0001).then((value) => {
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
     * @tc.name   testBitVectorPush0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0600
     * @tc.desc   Testing the Push of bitVector, push 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0002).then((value) => {
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
     * @tc.name   testBitVectorPush0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0700
     * @tc.desc   Testing the Push of bitVector, push -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0003).then((value) => {
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
     * @tc.name   testBitVectorPush0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0800
     * @tc.desc   Testing the Push of bitVector, push 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0004).then((value) => {
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
     * @tc.name   testBitVectorPush0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_0900
     * @tc.desc   Testing the Push of bitVector, push -65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0005).then((value) => {
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
     * @tc.name   testBitVectorPush0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1000
     * @tc.desc   Testing the Push of bitVector, push 2.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0006).then((value) => {
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
     * @tc.name   testBitVectorPush0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1100
     * @tc.desc   Testing the Push of bitVector, push 10 times 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0007).then((value) => {
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
     * @tc.name   testBitVectorPush0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1200
     * @tc.desc   Testing the Push of bitVector, push 100000 times 0 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPush0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPush0008).then((value) => {
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
     * @tc.name   testBitVectorPop0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1300
     * @tc.desc   Testing the pop of bitVector, pop 10 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPop0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPop0001).then((value) => {
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
     * @tc.name   testBitVectorPop0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1400
     * @tc.desc   Testing the pop of bitVector, pop 100000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPop0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPop0002).then((value) => {
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
     * @tc.name   testBitVectorPop0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1500
     * @tc.desc   Testing the pop of bitVector, pop succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPop0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPop0003).then((value) => {
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
     * @tc.name   testBitVectorPop0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1600
     * @tc.desc   Testing the pop of bitVector, pop succeed and return length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPop0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPop0004).then((value) => {
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
     * @tc.name   testBitVectorPop0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1700
     * @tc.desc   Testing the pop of bitVector, bitVector is null, pop failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorPop0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorPop0005).then((value) => {
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
     * @tc.name   testBitVectorHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1800
     * @tc.desc   Testing the has of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0001).then((value) => {
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
     * @tc.name   testBitVectorHas0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_1900
     * @tc.desc   Testing the has of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0002).then((value) => {
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
     * @tc.name   testBitVectorHas0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2000
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0003).then((value) => {
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
     * @tc.name   testBitVectorHas0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2100
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0004).then((value) => {
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
     * @tc.name   testBitVectorHas0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2200
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0005).then((value) => {
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
     * @tc.name   testBitVectorHas0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2300
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0006).then((value) => {
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
     * @tc.name   testBitVectorHas0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2400
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0007).then((value) => {
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
     * @tc.name   testBitVectorHas0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2500
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorHas0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorHas0008).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2600
     * @tc.desc   Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0001).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2700
     * @tc.desc   Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0002).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2800
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0003).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_2900
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0004).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3000
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0005).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3100
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0006).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3200
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0007).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3300
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0008).then((value) => {
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
     * @tc.name   testBitVectorSetBitsByRange0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3400
     * @tc.desc   Testing the setBitsByRange of bitVector, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetBitsByRange0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetBitsByRange0009).then((value) => {
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
     * @tc.name   testBitVectorSetAllBits0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3500
     * @tc.desc   Testing the SetAllBits of bitVector, set 0, return 0(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetAllBits0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetAllBits0001).then((value) => {
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
     * @tc.name   testBitVectorSetAllBits0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3600
     * @tc.desc   Testing the SetAllBits of bitVector, set 1, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetAllBits0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetAllBits0002).then((value) => {
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
     * @tc.name   testBitVectorSetAllBits0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3700
     * @tc.desc   Testing the SetAllBits of bitVector, set -1, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetAllBits0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetAllBits0003).then((value) => {
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
     * @tc.name   testBitVectorSetAllBits0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3800
     * @tc.desc   Testing the SetAllBits of bitVector, set 65535, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetAllBits0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetAllBits0004).then((value) => {
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
     * @tc.name   testBitVectorSetAllBits0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_3900
     * @tc.desc   Testing the SetAllBits of bitVector, set 2.5, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorSetAllBits0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorSetAllBits0005).then((value) => {
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
     * @tc.name   testBitVectorGetBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4000
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=0,toIndex=6, return 000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitsByRange0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitsByRange0001).then((value) => {
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
     * @tc.name   testBitVectorGetBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4100
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=10, return 011111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitsByRange0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitsByRange0002).then((value) => {
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
     * @tc.name   testBitVectorGetBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4200
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitsByRange0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitsByRange0003).then((value) => {
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
     * @tc.name   testBitVectorGetBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4300
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitsByRange0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitsByRange0004).then((value) => {
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
     * @tc.name   testBitVectorGetBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4400
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitsByRange0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitsByRange0005).then((value) => {
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
     * @tc.name   testBitVectorGetBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4500
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitsByRange0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitsByRange0006).then((value) => {
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
     * @tc.name   testBitVectorResize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4600
     * @tc.desc   Testing the resize of bitVector, size is -1, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorResize0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorResize0001).then((value) => {
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
     * @tc.name   testBitVectorResize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4700
     * @tc.desc   Testing the resize of bitVector, size is 5, return 01000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorResize0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorResize0002).then((value) => {
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
     * @tc.name   testBitVectorResize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4800
     * @tc.desc   Testing the resize of bitVector, size is 1, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorResize0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorResize0003).then((value) => {
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
     * @tc.name   testBitVectorGetBitCountByRange0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_4900
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 0~6, return 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitCountByRange0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitCountByRange0001).then((value) => {
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
     * @tc.name   testBitVectorGetBitCountByRange0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5000
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 4~10, return 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitCountByRange0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitCountByRange0002).then((value) => {
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
     * @tc.name   testBitVectorGetBitCountByRange0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5100
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 4~11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitCountByRange0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitCountByRange0003).then((value) => {
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
     * @tc.name   testBitVectorGetBitCountByRange0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5200
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is -1~10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitCountByRange0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitCountByRange0004).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetBitCountByRange0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5300
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 5~4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitCountByRange0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitCountByRange0005).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetBitCountByRange0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5400
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 5~5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetBitCountByRange0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetBitCountByRange0006).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5500
     * @tc.desc   Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0001).then((value) => {
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
     * @tc.name   testBitVectorGetIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5600
     * @tc.desc   Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0002).then((value) => {
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
     * @tc.name   testBitVectorGetIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5700
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0003).then((value) => {
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
     * @tc.name   testBitVectorGetIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5800
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0004).then((value) => {
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
     * @tc.name   testBitVectorGetIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_5900
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0005).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6000
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0006).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6100
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0007).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6200
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetIndexOf0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetIndexOf0008).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6300
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0001).then((value) => {
            num++;
            expect(value).assertEqual(4);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6400
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0002).then((value) => {
            num++;
            expect(value).assertEqual(4);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6500
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0003).then((value) => {
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
     * @tc.name   testBitVectorGetLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6600
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0004).then((value) => {
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
     * @tc.name   testBitVectorGetLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6700
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0005).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6800
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0006).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_6900
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0007).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorGetLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7000
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorGetLastIndexOf0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorGetLastIndexOf0008).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorFlipBitByIndex0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7100
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitByIndex0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitByIndex0001).then((value) => {
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
     * @tc.name   testBitVectorFlipBitByIndex0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7200
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is 5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitByIndex0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitByIndex0002).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorFlipBitByIndex0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7300
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is -1, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitByIndex0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitByIndex0003).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorFlipBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7400
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=0,toIndex=6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitsByRange0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitsByRange0001).then((value) => {
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
     * @tc.name   testBitVectorFlipBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7500
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitsByRange0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitsByRange0002).then((value) => {
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
     * @tc.name   testBitVectorFlipBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7600
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitsByRange0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitsByRange0003).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorFlipBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7700
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitsByRange0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitsByRange0004).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorFlipBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7800
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitsByRange0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitsByRange0005).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorFlipBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_7900
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorFlipBitsByRange0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorFlipBitsByRange0006).then((value) => {
            num++;
            expect(value)
              .assertEqual("error");
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testBitVectorValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_8000
     * @tc.desc   Testing the values of bitVector, bitvector is null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorValues0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorValues0001).then((value) => {
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
     * @tc.name   testBitVectorValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_8100
     * @tc.desc   Testing the values of bitVector, bitvector is not null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorValues0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorValues0002).then((value) => {
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
     * @tc.name   testBitVectorValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BITVECTOR_8200
     * @tc.desc   Testing the values of bitVector, bitvector is not null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testBitVectorValues0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testBitVectorValues0003).then((value) => {
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