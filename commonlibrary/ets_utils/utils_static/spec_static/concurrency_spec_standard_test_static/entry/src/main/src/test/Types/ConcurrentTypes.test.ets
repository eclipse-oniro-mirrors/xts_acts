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
import hilog from '@ohos.hilog'
import {
  PrimitiveTypesTest001,
  PrimitiveTypesTest002,
  PrimitiveTypesTest003,
  PrimitiveTypesTest004,
  PrimitiveTypesTest005,
  PrimitiveTypesTest006,
  PrimitiveTypesTest007,
  PrimitiveTypesTest008,
  PrimitiveTypesTest009,
  PrimitiveTypesTest010,
  PrimitiveTypesTest011,
  PrimitiveTypesTest012,
  PrimitiveTypesTest013,
  PrimitiveTypesTest014,
  PrimitiveTypesTest015,
  PrimitiveTypesTest016,
  PrimitiveTypesTest017,
  PrimitiveTypesTest018,
  PrimitiveTypesTest019,
  PrimitiveTypesTest020,
  PrimitiveTypesTest021,
  PrimitiveTypesTest022,
  PrimitiveTypesTest023,
  PrimitiveTypesTest024,
  PrimitiveTypesTest025,
  PrimitiveTypesTest026,
  PrimitiveTypesTest027,
  PrimitiveTypesTest028,
  PrimitiveTypesTest029,
  PrimitiveTypesTest031,
  PrimitiveTypesTest032,
  PrimitiveTypesTest033,
  PrimitiveTypesTest034,
  PrimitiveTypesTest035,
  PrimitiveTypesTest036,
  PrimitiveTypesTest037,
  PrimitiveTypesTest038,
  PrimitiveTypesTest039,
  PrimitiveTypesTest040,
  PrimitiveTypesTest041,
  PrimitiveTypesTest042,
  PrimitiveTypesTest043,
  PrimitiveTypesTest044,
  PrimitiveTypesTest045,
  PrimitiveTypesTest046,
  PrimitiveTypesTest047,
  PrimitiveTypesTest048,
  PrimitiveTypesTest049,
  PrimitiveTypesTest050
} from './typesfunction/TypesFunc';
let concurrentNum: int = 100;

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ConcurrentSpecTypeTest() {
  describe('ConcurrentSpecTypeTest', (): void => {
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0100
     * @tc.name concurrent_PrimitiveTypesTest001
     * @tc.desc test Type primitive conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest001)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0200
     * @tc.name concurrent_PrimitiveTypesTest002
     * @tc.desc test Type primitive conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest002'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest002)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0300
     * @tc.name concurrent_PrimitiveTypesTest003
     * @tc.desc test Type arithmetic operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest003'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest003)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0400
     * @tc.name concurrent_PrimitiveTypesTest004
     * @tc.desc test Type conditional operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest004'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest004)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0500
     * @tc.name concurrent_PrimitiveTypesTest005
     * @tc.desc test Type any conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest005'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest005)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0600
     * @tc.name concurrent_PrimitiveTypesTest006
     * @tc.desc test Type object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest006'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest006)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0700
     * @tc.name concurrent_PrimitiveTypesTest007
     * @tc.desc test Type object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest007'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest007)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0800
     * @tc.name concurrent_PrimitiveTypesTest008
     * @tc.desc test Type void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest008'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest008)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0900
     * @tc.name concurrent_PrimitiveTypesTest009
     * @tc.desc test Type undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest009'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest009)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1000
     * @tc.name concurrent_PrimitiveTypesTest010
     * @tc.desc test Type undefined function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest010'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest010)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1100
     * @tc.name concurrent_PrimitiveTypesTest011
     * @tc.desc test Type undefined in union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest011'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest011)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1200
     * @tc.name concurrent_PrimitiveTypesTest012
     * @tc.desc test Type null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest012'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest012)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1300
     * @tc.name concurrent_PrimitiveTypesTest013
     * @tc.desc test Type String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest013'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest013)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1400
     * @tc.name concurrent_PrimitiveTypesTest014
     * @tc.desc test Type bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest014'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest014)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1500
     * @tc.name concurrent_PrimitiveTypesTest015
     * @tc.desc test Type bigint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest015'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest015)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1600
     * @tc.name concurrent_PrimitiveTypesTest016
     * @tc.desc test Type union bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest016'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest016)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1700
     * @tc.name concurrent_PrimitiveTypesTest017
     * @tc.desc test Type literal types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest017'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest017)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1800
     * @tc.name concurrent_PrimitiveTypesTest018
     * @tc.desc test Type default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest018'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest018)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1900
     * @tc.name concurrent_PrimitiveTypesTest019
     * @tc.desc test literal type assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest019'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest019)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2000
     * @tc.name concurrent_PrimitiveTypesTest020
     * @tc.desc test union literal type assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest020'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest020)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2100
     * @tc.name concurrent_PrimitiveTypesTest021
     * @tc.desc test Type multi-dimensional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest021'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest021)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2200
     * @tc.name concurrent_PrimitiveTypesTest022
     * @tc.desc test Type array assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest022'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest022)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2300
     * @tc.name concurrent_PrimitiveTypesTest023
     * @tc.desc test Enum numeric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest023'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest023)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2400
     * @tc.name concurrent_PrimitiveTypesTest024
     * @tc.desc test Enum string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest024'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest024)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2500
     * @tc.name concurrent_PrimitiveTypesTest025
     * @tc.desc test Tuple type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest025'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest025)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2600
     * @tc.name concurrent_PrimitiveTypesTest026
     * @tc.desc test Char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest026'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest026)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2700
     * @tc.name concurrent_PrimitiveTypesTest027
     * @tc.desc test Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest027'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest027)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2800
     * @tc.name concurrent_PrimitiveTypesTest028
     * @tc.desc test Union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest028'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest028)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2900
     * @tc.name concurrent_PrimitiveTypesTest029
     * @tc.desc test Function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest029'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest029)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3100
     * @tc.name concurrent_PrimitiveTypesTest031
     * @tc.desc test Readonly tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest031'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest031)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3200
     * @tc.name concurrent_PrimitiveTypesTest032
     * @tc.desc test Enum operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest032'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest032)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3300
     * @tc.name concurrent_PrimitiveTypesTest033
     * @tc.desc test Type narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest033'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest033)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3400
     * @tc.name concurrent_PrimitiveTypesTest034
     * @tc.desc test Type aliases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest034'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest034)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3500
     * @tc.name concurrent_PrimitiveTypesTest035
     * @tc.desc test Default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest035'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest035)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3600
     * @tc.name concurrent_PrimitiveTypesTest036
     * @tc.desc test Class member default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest036'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest036)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3700
     * @tc.name concurrent_PrimitiveTypesTest037
     * @tc.desc test BigInt type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest037'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest037)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3800
     * @tc.name concurrent_PrimitiveTypesTest038
     * @tc.desc test Array length modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest038'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest038)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3900
     * @tc.name concurrent_PrimitiveTypesTest039
     * @tc.desc test Union type normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest039'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest039)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4000
     * @tc.name concurrent_PrimitiveTypesTest040
     * @tc.desc test Keyof type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest040'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest040)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4100
     * @tc.name concurrent_PrimitiveTypesTest041
     * @tc.desc test Numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest041'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest041)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4200
     * @tc.name concurrent_PrimitiveTypesTest042
     * @tc.desc test Floating point special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest042'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest042)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4300
     * @tc.name concurrent_PrimitiveTypesTest043
     * @tc.desc test Boolean operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest043'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest043)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4400
     * @tc.name concurrent_PrimitiveTypesTest044
     * @tc.desc test Array operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest044'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest044)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4500
     * @tc.name concurrent_PrimitiveTypesTest045
     * @tc.desc test Tuple operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest045'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest045)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4600
     * @tc.name concurrent_PrimitiveTypesTest046
     * @tc.desc test Type aliases with functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest046'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest046)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4700
     * @tc.name concurrent_PrimitiveTypesTest047
     * @tc.desc test Union type with class types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest047'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest047)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4800
     * @tc.name concurrent_PrimitiveTypesTest048
     * @tc.desc test Type conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest048'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest048)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4900
     * @tc.name concurrent_PrimitiveTypesTest049
     * @tc.desc test String operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest049'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest049)
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_5000
     * @tc.name concurrent_PrimitiveTypesTest050
     * @tc.desc test Array and Object compatibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_PrimitiveTypesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_PrimitiveTypesTest050'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(PrimitiveTypesTest050)
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
