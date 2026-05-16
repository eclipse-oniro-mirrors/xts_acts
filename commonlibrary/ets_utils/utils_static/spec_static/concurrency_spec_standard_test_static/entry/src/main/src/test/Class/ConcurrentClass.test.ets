/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import hilog from '@ohos.hilog'
import {
  ClassLateInitizationTest001,
  ClassLateInitizationTest002,
  ClassLateInitizationTest003,
  ClassLateInitizationTest004,
  ClassLateInitizationTest005,
  ClassLateInitizationTest006,
  ClassLateInitizationTest007,
  ClassLateInitizationTest008,
  ClassLateInitizationTest009,
  ClassLateInitizationTest010,
  ClassLateInitizationTest011,
  ClassLateInitizationTest012,
  ClassLateInitizationTest013,
  ClassLateInitizationTest014,
  ClassLateInitizationTest015,
  ClassLateInitizationTest016,
  ClassLateInitizationTest018
} from './classfunction/classFunc';
let concurrentNum: int = 100;

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ClassLateInitizationTest() {
  describe('ClassLateInitizationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0100
     * @tc.name concurrent_ClassLateInitizationTest001
     * @tc.desc test NullPointerError when accessing uninitialized class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest001'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest001)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0200
     * @tc.name concurrent_ClassLateInitizationTest002
     * @tc.desc test closure capturing initialized vs uninitialized class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest002'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest002)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0300
     * @tc.name concurrent_ClassLateInitizationTest003
     * @tc.desc test NullPointerError when accessing uninitialized nested class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest003'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest003)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0400
     * @tc.name concurrent_ClassLateInitizationTest004
     * @tc.desc test NullPointerError when accessing uninitialized field in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest004'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest004)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0500
     * @tc.name concurrent_ClassLateInitizationTest005
     * @tc.desc test assignment and access of class member in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest005'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest005)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0600
     * @tc.name concurrent_ClassLateInitizationTest006
     * @tc.desc test initialized vs uninitialized class members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest006'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest006)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0700
     * @tc.name concurrent_ClassLateInitizationTest007
     * @tc.desc test ClassCastError when accessing uninitialized generic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest007'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest007)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0800
     * @tc.name concurrent_ClassLateInitizationTest008
     * @tc.desc test ClassCastError when accessing initialized generic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest008'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest008)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_0900
     * @tc.name concurrent_ClassLateInitizationTest009
     * @tc.desc test NullPointerError when accessing missing property on object literal cast to class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest009'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest009)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1000
     * @tc.name concurrent_ClassLateInitizationTest010
     * @tc.desc test access of property on object literal cast to class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest010'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest010)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1100
     * @tc.name concurrent_ClassLateInitizationTest011
     * @tc.desc test NullPointerError when accessing method of uninitialized union field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest011'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest011)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1200
     * @tc.name concurrent_ClassLateInitizationTest012
     * @tc.desc test NullPointerError when accessing uninitialized field via getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest012'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest012)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1300
     * @tc.name concurrent_ClassLateInitizationTest013
     * @tc.desc test assignment of fields in different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest013'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest013)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1400
     * @tc.name concurrent_ClassLateInitizationTest014
     * @tc.desc test NullPointerError when accessing field initialized asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest014'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest014)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1500
     * @tc.name concurrent_ClassLateInitizationTest015
     * @tc.desc test NullPointerError when accessing uninitialized array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest015'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest015)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1600
     * @tc.name concurrent_ClassLateInitizationTest016
     * @tc.desc test NullPointerError when accessing uninitialized field via parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest016'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest016)
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
     * @tc.number SUB_CLASS_LATE_INITIZATION_1800
     * @tc.name concurrent_ClassLateInitizationTest018
     * @tc.desc test NullPointerError when accessing uninitialized interface implementation field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_ClassLateInitizationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_ClassLateInitizationTest018'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(ClassLateInitizationTest018)
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


  });
}
