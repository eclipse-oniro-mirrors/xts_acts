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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { collections } from '@kit.ArkTS';
import type { BusinessError } from '@ohos.base';
import {
  Int16_test_0001,
  Int16_test_0002,
  Int16_test_0003,
  Int16_test_0004,
  Int16_test_0005,
  Int16_test_0006,
  Int16_test_0007,
  Int16_test_0008,
  Int16_test_0009,
  Int16_test_0010,
  Int16_test_0011,
  Int16_test_0012,
  Int16_test_0013,
  Int16_test_0014,
  Int16_test_0015,
  Int16_test_0016,
  Int16_test_0017,
  Int16_test_0018,
  Int16_test_0019,
  Int16_test_0020,
  Int16_test_0021,
  Int16_test_0022,
  Int16_test_0023,
  Int16_test_0024,
  Int16_test_0025,
  Int16_test_0026,
  Int16_test_0027
} from '../testability/pages/Int16TaskPool';


let concurrentNum = 100
let arrCount = 1000

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Int16ArrayGlobalTest() {
  describe('Int16ArrayGlobalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   Int16array_test_0001
     * @tc.number SUB_INT16ARRAY_TEST_0001
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0001';
        console.info(`${caseName} test start`);
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 1000 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0001, array, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(array.length).assertEqual(arrCount)
          expect(array).assertContain(999)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0003
     * @tc.number SUB_INT16ARRAY_TEST_0002
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0003';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0002, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('0,0,1,1,2,2,3,3,4,4');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0004
     * @tc.number SUB_INT16ARRAY_TEST_0003
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0004';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0003, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('0,0,1,1,2,2,3,3,4,4');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0005
     * @tc.number SUB_INT16ARRAY_TEST_0004
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0005';
        console.info(`${caseName} test start`);
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 1000 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0004, array, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(array.length).assertEqual(arrCount)
          expect(array).assertContain(127)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0006
     * @tc.number SUB_INT16ARRAY_TEST_0005
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0006';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 1000 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0005, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res[0]).assertTrue();
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(array.length).assertEqual(arrCount)
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0007
     * @tc.number SUB_INT16ARRAY_TEST_0006
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0007';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 50 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0006, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res[0].toString()).assertContain('40,42,44,46,48')
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0008
     * @tc.number SUB_INT16ARRAY_TEST_0007
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0008';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 100 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0007, array, caseName, i)
          }
          await taskpool.execute(group).then((result) => {
            expect(result).assertContain(31)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0009
     * @tc.number SUB_INT16ARRAY_TEST_0008
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0009';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 100 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0008, array, caseName, i)
          }
          await taskpool.execute(group).then((result) => {
            expect(result).assertContain(0)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0010
     * @tc.number SUB_INT16ARRAY_TEST_009
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0010';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let count: number = 0;
        let array: collections.Int16Array = collections.Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0009, array, caseName, i)
            count++;
          }
          await taskpool.execute(group).then((res) => {
            expect(res.toString()).assertContain('2,4,6,8,10')
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0011
     * @tc.number SUB_INT16ARRAY_TEST_0010
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0011';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 100 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0010, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain(99)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0012
     * @tc.number SUB_INT16ARRAY_TEST_0011
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0012';
        console.info(`${caseName} test start`);
        let flag:boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          { length: 100 }, (v: Object, k: number) => k);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0011, array, caseName, i)
          }
          await taskpool.execute(group).then((result) => {
            expect(result).assertContain(90)
            flag = true
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${array.length}`);
          console.info(`${caseName} Task result: ${array}`);
          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0013
     * @tc.number SUB_INT16ARRAY_TEST_0012
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0013';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0012, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res.toString()).assertContain('7-8-9-10');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0014
     * @tc.number SUB_INT16ARRAY_TEST_0013
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0014';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([25, 36, 49]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0013, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res.toString()).assertContain('5,6,7')
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.name   Int16array_test_0016
     * @tc.number SUB_INT16ARRAY_TEST_0014
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0016';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0014, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain(17)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0017
     * @tc.number SUB_INT16ARRAY_TEST_0015
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0017';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0015, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain(17)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0018
     * @tc.number SUB_INT16ARRAY_TEST_0016
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0018';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0016, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain(18)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0019
     * @tc.number SUB_INT16ARRAY_TEST_0017
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0019';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0017, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain(16)
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0021
     * @tc.number SUB_INT16ARRAY_TEST_0018
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0021';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let buffer: collections.ArrayBuffer = new collections.ArrayBuffer(100);
        let array: collections.Int16Array = new collections.Int16Array(buffer);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0018, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then(() => {
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
          expect(array.toString()).assertContain('1,2,3,0,0')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0022
     * @tc.number SUB_INT16ARRAY_TEST_0019
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0022';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0019, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then(() => {
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
          expect(array.toString()).assertEqual('1,3,4,4,5')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0023
     * @tc.number SUB_INT16ARRAY_TEST_0020
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0023';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 3, 5, 4, 2]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0020, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then(() => {
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
          expect(array.toString()).assertEqual('1,2,3,4,5')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0024
     * @tc.number SUB_INT16ARRAY_TEST_0021
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0024';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 3, 5, 4, 2, 6, 7, 8]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0021, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('1,3,5,4')
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

  /**
   * @tc.name   Int16array_test_0025
   * @tc.number SUB_INT16ARRAY_TEST_0022
   * @tc.desc   Test Int16array
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('Int16array_test_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0025';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 3, 5, 4, 2, 6, 7, 8]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0022, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res.toString()).assertContain('true')
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.name   Int16array_test_0026
     * @tc.number SUB_INT16ARRAY_TEST_0023
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0026';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 3, 5, 4, 2, 6, 7, 8]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0023, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res.toString()).assertContain('true');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(flag).assertTrue();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0027
     * @tc.number SUB_INT16ARRAY_TEST_0024
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0027';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 3, 5, 4, 2, 6, 7, 8]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0024, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then((res) => {
            expect(res.toString()).assertContain('true');
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          let iterator: IterableIterator<[number, number]> = array.entries();
          expect(iterator.next().value.toString()).assertEqual('0,1')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0028
     * @tc.number SUB_INT16ARRAY_TEST_0025
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0028';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let buffer: collections.ArrayBuffer = new collections.ArrayBuffer(100);
        let array: collections.Int16Array = new collections.Int16Array(buffer);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0025, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then(() => {
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          expect(flag).assertTrue();
          expect(array.toString()).assertContain('1,2,3,1,2,3,0,0')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Int16array_test_0029
     * @tc.number SUB_INT16ARRAY_TEST_0026
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0029';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let flag: boolean = false;
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0026, array, caseName, i)
            count++
          }
          await taskpool.execute(group).then(() => {
            flag = true;
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })

          expect(flag).assertTrue();
          expect(array.toString()).assertEqual('1,1,1,2,3')
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.name   Int16array_test_0030
     * @tc.number SUB_INT16ARRAY_TEST_0027
     * @tc.desc   Test Int16array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('Int16array_test_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Int16array_test_0030';
        console.info(`${caseName} test start`);
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(Int16_test_0027, array, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            expect(res).assertContain('5,4,3,2,1')
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}
