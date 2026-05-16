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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import {
  sleep,
  UnionTest001,
  UnionTest002,
  UnionTest004,
  UnionTest007,
  UnionTest008,
  UnionTest009,
  UnionTest010,
  UnionTest011,
  UnionTest012,
  UnionTest013,
  UnionTest014,
  UnionTest015,
  UnionTest016
} from './unionnormalizationfunction/UnionnormalizationFunc';
let concurrentNum: int = 100;

export default function concurrent_UnionTest() {
  describe('concurrent_UnionTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_UNION_0100
     * @tc.name concurrent_UnionTest001
     * @tc.desc concurrent_UnionTest001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_UnionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest001'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest001)
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
     * @tc.number SUB_UNION_0200
     * @tc.name concurrent_UnionTest002
     * @tc.desc concurrent_UnionTest002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrent_UnionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest002'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest002)
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
     * @tc.number SUB_UNION_0400
     * @tc.name concurrent_UnionTest004
     * @tc.desc Test union type operations with arrays
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest004'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest004)
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
     * @tc.number SUB_UNION_0700
     * @tc.name concurrent_UnionTest007
     * @tc.desc Test class literal assignment between class and Record
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest007'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest007)
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
     * @tc.number SUB_UNION_0800
     * @tc.name concurrent_UnionTest008
     * @tc.desc Test class literal assignment between base-derived class
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest008'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest008)
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
     * @tc.number SUB_UNION_0900
     * @tc.name concurrent_UnionTest009
     * @tc.desc Test class literal assignment with same name field
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest009'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest009)
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
     * @tc.number SUB_UNION_1000
     * @tc.name concurrent_UnionTest010
     * @tc.desc Test object literal assign to Record union
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest010'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest010)
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
     * @tc.number SUB_UNION_1100
     * @tc.name concurrent_UnionTest011
     * @tc.desc Test padding function with union types
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest011'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest011)
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
     * @tc.number SUB_UNION_1200
     * @tc.name concurrent_UnionTest012
     * @tc.desc Test Record with recursive lambda
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest012'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest012)
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
     * @tc.number SUB_UNION_1300
     * @tc.name concurrent_UnionTest013
     * @tc.desc Test Record with lambda function
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest013'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest013)
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
     * @tc.number SUB_UNION_1400
     * @tc.name concurrent_UnionTest014
     * @tc.desc Test Record with lambda and number
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest014'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest014)
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
     * @tc.number SUB_UNION_1500
     * @tc.name concurrent_UnionTest015
     * @tc.desc Test Record with nested lambda and number
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest015'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest015)
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
     * @tc.number SUB_UNION_1600
     * @tc.name concurrent_UnionTest016
     * @tc.desc Test complex Record with nested structures
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('concurrent_UnionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let caseName = 'concurrent_UnionTest016'
      let result: int = 0
      
      try {
        let group = new taskpool.TaskGroup(caseName)
        for (let i: int = 0; i < concurrentNum; i++) {
          group.addTask(UnionTest016)
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
