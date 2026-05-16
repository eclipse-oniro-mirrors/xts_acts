/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import {
  DoubleEnumConstructorTest001,
  DoubleEnumConstructorTest002,
  DoubleEnumValuesTest001,
  DoubleEnumGetValueOfTest001,
  DoubleEnumFromValueTest001,
  DoubleEnumValueOfTest001,
  DoubleEnumGetNameTest001,
  DoubleEnumToStringTest001,
  DoubleEnumIndexTest001
} from './doubleenumfunction/DoubleEnumFunc';
let concurrentNum: int = 100;

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ConcurrentDoubleEnumTest() {
  describe('ConcurrentDoubleEnumTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0100
     * @tc.name concurrent_DoubleEnumConstructorTest001
     * @tc.desc test DoubleEnum Constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumConstructorTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumConstructorTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0200
     * @tc.name concurrent_DoubleEnumConstructorTest002
     * @tc.desc test DoubleEnum Constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumConstructorTest002'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumConstructorTest002)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0300
     * @tc.name concurrent_DoubleEnumValuesTest001
     * @tc.desc test DoubleEnum values method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumValuesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumValuesTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumValuesTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0400
     * @tc.name concurrent_DoubleEnumGetValueOfTest001
     * @tc.desc test DoubleEnum getValueOf method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumGetValueOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumGetValueOfTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumGetValueOfTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0500
     * @tc.name concurrent_DoubleEnumFromValueTest001
     * @tc.desc test DoubleEnum fromValue method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumFromValueTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumFromValueTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumFromValueTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0600
     * @tc.name concurrent_DoubleEnumValueOfTest001
     * @tc.desc test DoubleEnum valueOf method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumValueOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumValueOfTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumValueOfTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0700
     * @tc.name concurrent_DoubleEnumGetNameTest001
     * @tc.desc test DoubleEnum getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumGetNameTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumGetNameTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumGetNameTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0800
     * @tc.name concurrent_DoubleEnumToStringTest001
     * @tc.desc test DoubleEnum toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumToStringTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumToStringTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumToStringTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0900
     * @tc.name concurrent_DoubleEnumIndexTest001
     * @tc.desc test DoubleEnum index access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_DoubleEnumIndexTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_DoubleEnumIndexTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(DoubleEnumIndexTest001)
        }
        await taskpool.execute(group).then((res) => {
          console.info(`${caseName} Task execution success`);
          result = res.length
        }).catch((e: Error) => {
          console.info(`${caseName} Task execution catch: ${e.message}`);
          expect().assertFail()
        })
        expect(result).assertEqual(concurrentNum)
      } catch (e) {
        console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        expect().assertFail()
      }
      done();
    })
  })
}