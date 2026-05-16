/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  testAssignmentLikeContexts0001,
  testAssignmentLikeContexts0002,
  testAssignmentLikeContexts0003,
  testAssignmentLikeContexts0004,
  testAssignmentLikeContexts0005,
  testAssignmentLikeContexts0006,
  testAssignmentLikeContexts0007,
  testAssignmentLikeContexts0008,
  testAssignmentLikeContexts0009,
  testAssignmentLikeContexts0010,
  testAssignmentLikeContexts0011,
  testAssignmentLikeContexts0012,
  testAssignmentLikeContexts0013,
  testAssignmentLikeContexts0014,
  testAssignmentLikeContexts0015,
  testAssignmentLikeContexts0016,
  testAssignmentLikeContexts0017,
  testAssignmentLikeContexts0018,
  testAssignmentLikeContexts0019,
  testAssignmentLikeContexts0020,
  testAssignmentLikeContexts0021,
  testAssignmentLikeContexts0022,
  testAssignmentLikeContexts0023,
  testAssignmentLikeContexts0024,
  testAssignmentLikeContexts0025,
  testAssignmentLikeContexts0026,
  testAssignmentLikeContexts0027,
  testAssignmentLikeContexts0028,
  testAssignmentLikeContexts0029,
  testAssignmentLikeContexts0030,
  testAssignmentLikeContexts0031,
  testAssignmentLikeContexts0032,
  testAssignmentLikeContexts0033,
  testAssignmentLikeContexts0034,
  testAssignmentLikeContexts0035,
  testAssignmentLikeContexts0036,
  testAssignmentLikeContexts0037,
  testAssignmentLikeContexts0038,
  testAssignmentLikeContexts0039,
  testAssignmentLikeContexts0040,
  testAssignmentLikeContexts0041,
  testAssignmentLikeContexts0042,
  testAssignmentLikeContexts0043,
  testAssignmentLikeContexts0044,
  testAssignmentLikeContexts0045,
  testAssignmentLikeContexts0046,
  testAssignmentLikeContexts0047,
  testAssignmentLikeContexts0048,
  testAssignmentLikeContexts0049,
  testAssignmentLikeContexts0050,
  testAssignmentLikeContexts0051,
  testAssignmentLikeContexts0052,
  testAssignmentLikeContexts0053,
  testAssignmentLikeContexts0054,
  testAssignmentLikeContexts0055,
  testAssignmentLikeContexts0056,
  testAssignmentLikeContexts0057,
  testAssignmentLikeContexts0059,
  testAssignmentLikeContexts0060,
  testAssignmentLikeContexts0061,
  testAssignmentLikeContexts0062,
  testAssignmentLikeContexts0063,
  testAssignmentLikeContexts0064,
  testAssignmentLikeContexts0065,
  testAssignmentLikeContexts0066,
  testAssignmentLikeContexts0067,
  testAssignmentLikeContexts0068,
  testAssignmentLikeContexts0069,
  testAssignmentLikeContexts0070,
  testAssignmentLikeContexts0071,
  testAssignmentLikeContexts0072,
  testAssignmentLikeContexts0073,
  testAssignmentLikeContexts0074,
  testAssignmentLikeContexts0075,
  testAssignmentLikeContexts0076,
  testAssignmentLikeContexts0077,
  testAssignmentLikeContexts0078,
  testAssignmentLikeContexts0079,
  testAssignmentLikeContexts0080,
  testAssignmentLikeContexts0081,
  testAssignmentLikeContexts0082,
  testAssignmentLikeContexts0083,
  testAssignmentLikeContexts0084,
  testAssignmentLikeContexts0085,
  testAssignmentLikeContexts0086,
  testAssignmentLikeContexts0087,
  testAssignmentLikeContexts0088,
  testAssignmentLikeContexts0089,
  testAssignmentLikeContexts0090,
  testAssignmentLikeContexts0091,
  testAssignmentLikeContexts0092,
  testAssignmentLikeContexts0093,
  testAssignmentLikeContexts0094,
  testAssignmentLikeContexts0095,
  testAssignmentLikeContexts0096,
  testAssignmentLikeContexts0097,
  testAssignmentLikeContexts0098,
  testAssignmentLikeContexts0099,
  testAssignmentLikeContexts0100,
  testAssignmentLikeContexts0101,
  testAssignmentLikeContexts0102,
  testAssignmentLikeContexts0103,
  testAssignmentLikeContexts0104,
  testAssignmentLikeContexts0105,
  testAssignmentLikeContexts0106,
  testAssignmentLikeContexts0107,
  testAssignmentLikeContexts0108,
  testAssignmentLikeContexts0109,
  testAssignmentLikeContexts0110,
  testAssignmentLikeContexts0111,
  testAssignmentLikeContexts0112,
  testAssignmentLikeContexts0113,
  testAssignmentLikeContexts0114,
  testAssignmentLikeContexts0115,
  testAssignmentLikeContexts0119,
  testAssignmentLikeContexts0120,
  testAssignmentLikeContexts0121,
  testAssignmentLikeContexts0122,
  testAssignmentLikeContexts0123,
  testAssignmentLikeContexts0124,
  testAssignmentLikeContexts0125,
  testAssignmentLikeContexts0126,
  testAssignmentLikeContexts0127,
  testAssignmentLikeContexts0128,
  testAssignmentLikeContexts0129,
  testAssignmentLikeContexts0130,
  testAssignmentLikeContexts0131,
  testAssignmentLikeContexts0132,
  testAssignmentLikeContexts0133,
  testAssignmentLikeContexts0134,
  testAssignmentLikeContexts0135,
  testAssignmentLikeContexts0136,
  testAssignmentLikeContexts0137,
  testAssignmentLikeContexts0138,
  testAssignmentLikeContexts0139,
  testAssignmentLikeContexts0140,
  testAssignmentLikeContexts0141,
  testAssignmentLikeContexts0142,
  testAssignmentLikeContexts0143,
  testAssignmentLikeContexts0144,
  testAssignmentLikeContexts0145,
  testAssignmentLikeContexts0146,
  testAssignmentLikeContexts0147,
  testAssignmentLikeContexts0148
} from './assignmentlikecontextstestfunction/AssignmentLikeContextsTestFunc';

let concurrentNum: int = 100;

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function AssignmentLikeContextsTest() {

  describe("AssignmentLikeContextsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0100
     * @tc.name      concurrent_testAssignmentLikeContexts0001
     * @tc.desc      Assignment contexts allow using aliases: from 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0001'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0001)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0200
     * @tc.name      concurrent_testAssignmentLikeContexts0002
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0002'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0002)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0300
     * @tc.name      concurrent_testAssignmentLikeContexts0003
     * @tc.desc      Assignment contexts: Conversion from boolean to Boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0003'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0003)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0400
     * @tc.name      concurrent_testAssignmentLikeContexts0004
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'boolean' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0004'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0004)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0500
     * @tc.name      concurrent_testAssignmentLikeContexts0005
     * @tc.desc      A widening reference conversion exists from any reference type S to any reference type T (S is subtype of T)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0005'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0005)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0600
     * @tc.name      concurrent_testAssignmentLikeContexts0006
     * @tc.desc      Widening reference conversion: Object[][] to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0006'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0006)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0700
     * @tc.name      concurrent_testAssignmentLikeContexts0007
     * @tc.desc      Assignment contexts allow conversion followed by a widening reference conversion (from 'boolean' to 'Object')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0007'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0007)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0800
     * @tc.name      concurrent_testAssignmentLikeContexts0008
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'string' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0008'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0008)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0900
     * @tc.name      concurrent_testAssignmentLikeContexts0009
     * @tc.desc      A conversion from a type to that same type is permitted for any type: enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0009'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0009)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1000
     * @tc.name      concurrent_testAssignmentLikeContexts0010
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0010'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0010)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1100
     * @tc.name      concurrent_testAssignmentLikeContexts0011
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0011'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0011)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1200
     * @tc.name      concurrent_testAssignmentLikeContexts0012
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0012'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0012)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1300
     * @tc.name      concurrent_testAssignmentLikeContexts0013
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0013'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0013)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1400
     * @tc.name      concurrent_testAssignmentLikeContexts0014
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0014'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0014)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1500
     * @tc.name      concurrent_testAssignmentLikeContexts0015
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0015'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0015)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1600
     * @tc.name      concurrent_testAssignmentLikeContexts0016
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0016'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0016)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1700
     * @tc.name      concurrent_testAssignmentLikeContexts0017
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0017'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0017)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1800
     * @tc.name      concurrent_testAssignmentLikeContexts0018
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0018'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0018)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1900
     * @tc.name      concurrent_testAssignmentLikeContexts0019
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0019'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0019)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2000
     * @tc.name      concurrent_testAssignmentLikeContexts0020
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0020'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0020)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2100
     * @tc.name      concurrent_testAssignmentLikeContexts0021
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0021'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0021)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2200
     * @tc.name      concurrent_testAssignmentLikeContexts0022
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0022'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0022)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2300
     * @tc.name      concurrent_testAssignmentLikeContexts0023
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0023'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0023)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2400
     * @tc.name      concurrent_testAssignmentLikeContexts0024
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Float' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0024'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0024)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2500
     * @tc.name      concurrent_testAssignmentLikeContexts0025
     * @tc.desc      Assignment contexts allow using aliases: from 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0025'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0025)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2600
     * @tc.name      concurrent_testAssignmentLikeContexts0026
     * @tc.desc      Assignment contexts allow using aliases: from 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0026'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0026)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2700
     * @tc.name      concurrent_testAssignmentLikeContexts0027
     * @tc.desc      Assignment contexts allow using aliases: from 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0027'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0027)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2800
     * @tc.name      concurrent_testAssignmentLikeContexts0028
     * @tc.desc      Assignment contexts allow using aliases: from 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0028'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0028)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2900
     * @tc.name      concurrent_testAssignmentLikeContexts0029
     * @tc.desc      Assignment contexts allow using aliases: from 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0029'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0029)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3000
     * @tc.name      concurrent_testAssignmentLikeContexts0030
     * @tc.desc      Assignment contexts allow using aliases: from 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0030'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0030)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3100
     * @tc.name      concurrent_testAssignmentLikeContexts0031
     * @tc.desc      Assignment contexts allow using aliases: from 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0031'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0031)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3200
     * @tc.name      concurrent_testAssignmentLikeContexts0032
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0032'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0032)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3300
     * @tc.name      concurrent_testAssignmentLikeContexts0033
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0033'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0033)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3400
     * @tc.name      concurrent_testAssignmentLikeContexts0034
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0034'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0034)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3500
     * @tc.name      concurrent_testAssignmentLikeContexts0035
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0035'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0035)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3600
     * @tc.name      concurrent_testAssignmentLikeContexts0036
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0036'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0036)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3700
     * @tc.name      concurrent_testAssignmentLikeContexts0037
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0037'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0037)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3800
     * @tc.name      concurrent_testAssignmentLikeContexts0038
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0038'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0038)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3900
     * @tc.name      concurrent_testAssignmentLikeContexts0039
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0039'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0039)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4000
     * @tc.name      concurrent_testAssignmentLikeContexts0040
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0040'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0040)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4100
     * @tc.name      concurrent_testAssignmentLikeContexts0041
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0041'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0041)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4200
     * @tc.name      concurrent_testAssignmentLikeContexts0042
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0042'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0042)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4300
     * @tc.name      concurrent_testAssignmentLikeContexts0043
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0043'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0043)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4400
     * @tc.name      concurrent_testAssignmentLikeContexts0044
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0044'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0044)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4500
     * @tc.name      concurrent_testAssignmentLikeContexts0045
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0045'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0045)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4600
     * @tc.name      concurrent_testAssignmentLikeContexts0046
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0046'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0046)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4700
     * @tc.name      concurrent_testAssignmentLikeContexts0047
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0047'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0047)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4800
     * @tc.name      concurrent_testAssignmentLikeContexts0048
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0048'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0048)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4900
     * @tc.name      concurrent_testAssignmentLikeContexts0049
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0049'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0049)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5000
     * @tc.name      concurrent_testAssignmentLikeContexts0050
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0050'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0050)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5100
     * @tc.name      concurrent_testAssignmentLikeContexts0051
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Long' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0051'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0051)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5200
     * @tc.name      concurrent_testAssignmentLikeContexts0052
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Long' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0052'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0052)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5300
     * @tc.name      concurrent_testAssignmentLikeContexts0053
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Float' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0053'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0053)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5400
     * @tc.name      concurrent_testAssignmentLikeContexts0054
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0054'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0054)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5500
     * @tc.name      concurrent_testAssignmentLikeContexts0055
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0055'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0055)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5600
     * @tc.name      concurrent_testAssignmentLikeContexts0056
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0056'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0056)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5700
     * @tc.name      concurrent_testAssignmentLikeContexts0057
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0057'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0057)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5900
     * @tc.name      concurrent_testAssignmentLikeContexts0059
     * @tc.desc      Assignment contexts of a primitive types: Assignment from Boolean to boolean (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0059'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0059)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6000
     * @tc.name      concurrent_testAssignmentLikeContexts0060
     * @tc.desc      Assignment contexts of a primitive types: Assignment from Byte to byte (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0060'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0060)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6100
     * @tc.name      concurrent_testAssignmentLikeContexts0061
     * @tc.desc      Assignment contexts of a primitive types: Assignment from char to Char (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0061'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0061)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6200
     * @tc.name      concurrent_testAssignmentLikeContexts0062
     * @tc.desc     Assignment contexts of a primitive types: Assignment from short to Short (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0062'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0062)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6300
     * @tc.name      concurrent_testAssignmentLikeContexts0063
     * @tc.desc     Assignment contexts of a primitive types: Assignment from int to Int (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0063'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0063)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6400
     * @tc.name      concurrent_testAssignmentLikeContexts0064
     * @tc.desc     Assignment contexts of a primitive types: Assignment from long to Long (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0064'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0064)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6500
     * @tc.name      concurrent_testAssignmentLikeContexts0065
     * @tc.desc     Assignment contexts of a primitive types: Assignment from float to Float (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0065'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0065)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6600
     * @tc.name      concurrent_testAssignmentLikeContexts0066
     * @tc.desc     Assignment contexts of a primitive types: Assignment from double to Double (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0066'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0066)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6700
     * @tc.name      concurrent_testAssignmentLikeContexts0067
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Char to char (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0067'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0067)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6800
     * @tc.name      concurrent_testAssignmentLikeContexts0068
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Short to short (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0068'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0068)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6900
     * @tc.name      concurrent_testAssignmentLikeContexts0069
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Int to int (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0069'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0069)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7000
     * @tc.name      concurrent_testAssignmentLikeContexts0070
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Long to long (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0070'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0070)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7100
     * @tc.name      concurrent_testAssignmentLikeContexts0071
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Float to float (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0071'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0071)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7200
     * @tc.name      concurrent_testAssignmentLikeContexts0072
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Double to double (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0072'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0072)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7300
     * @tc.name      concurrent_testAssignmentLikeContexts0073
     * @tc.desc     Assignment contexts of a primitive types: Assignment from boolean to Boolean (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0073'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0073)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7400
     * @tc.name      concurrent_testAssignmentLikeContexts0074
     * @tc.desc     Assignment contexts of a primitive types: Assignment from byte to Byte (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it('concurrent_testAssignmentLikeContexts0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0074'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0074)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7500
     * @tc.name      concurrent_testAssignmentLikeContexts0075
     * @tc.desc     Assignment contexts: Conversion from byte to Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0075'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0075)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7600
     * @tc.name      concurrent_testAssignmentLikeContexts0076
     * @tc.desc     Assignment contexts: Conversion from char to Char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0076'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0076)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7700
     * @tc.name      concurrent_testAssignmentLikeContexts0077
     * @tc.desc     Assignment contexts: Conversion from short to Short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0077'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0077)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7800
     * @tc.name      concurrent_testAssignmentLikeContexts0078
     * @tc.desc     Assignment contexts: Conversion from int to Int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0078'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0078)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7900
     * @tc.name      concurrent_testAssignmentLikeContexts0079
     * @tc.desc     Assignment contexts: Conversion from long to Long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0079'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0079)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8000
     * @tc.name      concurrent_testAssignmentLikeContexts0080
     * @tc.desc     Assignment contexts: Conversion from float to Float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0080'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0080)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8100
     * @tc.name      concurrent_testAssignmentLikeContexts0081
     * @tc.desc     Assignment contexts: Conversion from double to Double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0081'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0081)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8200
     * @tc.name      concurrent_testAssignmentLikeContexts0082
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'boolean' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0082'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0082)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8300
     * @tc.name      concurrent_testAssignmentLikeContexts0083
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'byte' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0083'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0083)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8400
     * @tc.name      concurrent_testAssignmentLikeContexts0084
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'float' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0084'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0084)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8500
     * @tc.name      concurrent_testAssignmentLikeContexts0085
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'float' to 'Floating'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0085'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0085)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8600
     * @tc.name      concurrent_testAssignmentLikeContexts0086
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'double' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0086'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0086)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8700
     * @tc.name      concurrent_testAssignmentLikeContexts0087
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'double' to 'Floating'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0087'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0087)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8800
     * @tc.name      concurrent_testAssignmentLikeContexts0088
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'char' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0088'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0088)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8900
     * @tc.name      concurrent_testAssignmentLikeContexts0089
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'short' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0089'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0089)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9000
     * @tc.name      concurrent_testAssignmentLikeContexts0090
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'short' to 'Integral'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0090'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0090)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9100
     * @tc.name      concurrent_testAssignmentLikeContexts0091
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'int' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0091'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0091)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9200
     * @tc.name      concurrent_testAssignmentLikeContexts0092
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'int' to 'Integral'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0092'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0092)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9300
     * @tc.name      concurrent_testAssignmentLikeContexts0093
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'long' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0093'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0093)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9400
     * @tc.name      concurrent_testAssignmentLikeContexts0094
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'long' to 'Integral'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0094'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0094)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9500
     * @tc.name      concurrent_testAssignmentLikeContexts0095
     * @tc.desc     Invocation call contexts: call assignment from 'boolean' to 'Boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0095'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0095)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9600
     * @tc.name      concurrent_testAssignmentLikeContexts0096
     * @tc.desc     Invocation call contexts: call assignment from 'byte' to 'Byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0096'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0096)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9700
     * @tc.name      concurrent_testAssignmentLikeContexts0097
     * @tc.desc     Invocation call contexts: call assignment from 'char' to 'Char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0097'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0097)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9800
     * @tc.name      concurrent_testAssignmentLikeContexts0098
     * @tc.desc     Invocation call contexts: call assignment from 'short' to 'Short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0098'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0098)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9900
     * @tc.name      concurrent_testAssignmentLikeContexts0099
     * @tc.desc     Invocation call contexts: call assignment from 'int' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0099'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0099)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10000
     * @tc.name      concurrent_testAssignmentLikeContexts0100
     * @tc.desc     Invocation call contexts: call assignment from 'long' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0100'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0100)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10100
     * @tc.name      concurrent_testAssignmentLikeContexts0101
     * @tc.desc     Invocation call contexts: call assignment from 'float' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0101'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0101)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10200
     * @tc.name      concurrent_testAssignmentLikeContexts0102
     * @tc.desc     Invocation call contexts: call assignment from 'double' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0102'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0102)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10300
     * @tc.name      concurrent_testAssignmentLikeContexts0103
     * @tc.desc     Assignment contexts allow the use of the identity conversion (basic types and objects)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0103'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0103)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10400
     * @tc.name      concurrent_testAssignmentLikeContexts0104
     * @tc.desc     A conversion from a type to that same type is permitted for any type (extended cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0104'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0104)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10500
     * @tc.name      concurrent_testAssignmentLikeContexts0105
     * @tc.desc     A conversion from a type to that same type is permitted for any type (generic class with type parameter as class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0105'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0105)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10600
     * @tc.name      concurrent_testAssignmentLikeContexts0106
     * @tc.desc     A conversion from a type to that same type is permitted for any type (generic class with bounded type parameter)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0106'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0106)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10700
     * @tc.name      concurrent_testAssignmentLikeContexts0107
     * @tc.desc     Invocation contexts allow an identity conversion (multiple types including functions and arrays)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0107'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0107)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10800
     * @tc.name      concurrent_testAssignmentLikeContexts0108
     * @tc.desc     A value of the null type may be assigned to any reference type (basic reference types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0108'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0108)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10900
     * @tc.name      concurrent_testAssignmentLikeContexts0109
     * @tc.desc     A value of the null type may be assigned to any reference type (system classes and error types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0109'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0109)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11000
     * @tc.name      concurrent_testAssignmentLikeContexts0110
     * @tc.desc     A value of the null type may be assigned to any reference type (string and utility classes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0110'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0110)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11100
     * @tc.name      concurrent_testAssignmentLikeContexts0111
     * @tc.desc     Widening primitive type: byte to short/int/long/float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0111'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0111)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11200
     * @tc.name      concurrent_testAssignmentLikeContexts0112
     * @tc.desc     Widening primitive type: short to int/long/float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0112'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0112)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11300
     * @tc.name      concurrent_testAssignmentLikeContexts0113
     * @tc.desc     Widening primitive type: int to long/float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0113'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0113)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11400
     * @tc.name      concurrent_testAssignmentLikeContexts0114
     * @tc.desc     Widening primitive type: long to float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0114'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0114)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11500
     * @tc.name      concurrent_testAssignmentLikeContexts0115
     * @tc.desc     Widening primitive type: float to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0115'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0115)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11900
     * @tc.name      concurrent_testAssignmentLikeContexts0119
     * @tc.desc     Widening reference conversion: wrapper type to Object/Integral/Floating/Comparable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0119'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0119)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12000
     * @tc.name      concurrent_testAssignmentLikeContexts0120
     * @tc.desc     Widening reference conversion: function and function array to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0120'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0120)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12100
     * @tc.name      concurrent_testAssignmentLikeContexts0121
     * @tc.desc     Widening reference conversion: enum and enum array to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0121'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0121)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12200
     * @tc.name      concurrent_testAssignmentLikeContexts0122
     * @tc.desc     Widening reference conversion: interface implementation to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0122'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0122)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12300
     * @tc.name      concurrent_testAssignmentLikeContexts0123
     * @tc.desc     Widening reference conversion: multi-dimensional function array to Object array (nullable)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0123'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0123)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12400
     * @tc.name      concurrent_testAssignmentLikeContexts0124
     * @tc.desc     Widening reference conversion: generic class with interface type parameter to super generic class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0124'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0124)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12500
     * @tc.name      concurrent_testAssignmentLikeContexts0125
     * @tc.desc     Identity conversion for generic class with nested type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0125'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0125)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12600
     * @tc.name      concurrent_testAssignmentLikeContexts0126
     * @tc.desc     Identity conversion for nullable function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0126'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0126)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12700
     * @tc.name      concurrent_testAssignmentLikeContexts0127
     * @tc.desc     Widening reference conversion for nested generic class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0127'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0127)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12800
     * @tc.name      concurrent_testAssignmentLikeContexts0128
     * @tc.desc     Identity conversion for array of generic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0128'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0128)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12900
     * @tc.name      concurrent_testAssignmentLikeContexts0129
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Byte to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0129'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0129)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13000
     * @tc.name      concurrent_testAssignmentLikeContexts0130
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Short to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0130'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0130)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13100
     * @tc.name      concurrent_testAssignmentLikeContexts0131
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Int to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0131'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0131)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13200
     * @tc.name      concurrent_testAssignmentLikeContexts0132
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Long to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0132'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0132)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13300
     * @tc.name      concurrent_testAssignmentLikeContexts0133
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (boolean to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0133'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0133)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13400
     * @tc.name      concurrent_testAssignmentLikeContexts0134
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (byte to Integral)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0134'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0134)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13500
     * @tc.name      concurrent_testAssignmentLikeContexts0135
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (char to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0135'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0135)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13600
     * @tc.name      concurrent_testAssignmentLikeContexts0136
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (short to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0136'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0136)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13700
     * @tc.name      concurrent_testAssignmentLikeContexts0137
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (int to Integral)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0137'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0137)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13800
     * @tc.name      concurrent_testAssignmentLikeContexts0138
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (long to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0138'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0138)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13900
     * @tc.name      concurrent_testAssignmentLikeContexts0139
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (float to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0139'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0139)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14000
     * @tc.name      concurrent_testAssignmentLikeContexts0140
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (double to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0140'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0140)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14100
     * @tc.name      concurrent_testAssignmentLikeContexts0141
     * @tc.desc     Invocation contexts allow widening reference conversion followed by unboxing (Short to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0141'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0141)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14200
     * @tc.name      concurrent_testAssignmentLikeContexts0142
     * @tc.desc     Invocation contexts allow widening reference conversion followed by unboxing (Int to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0142'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0142)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14300
     * @tc.name      concurrent_testAssignmentLikeContexts0143
     * @tc.desc     Invocation contexts allow widening reference conversion followed by unboxing (Long to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0143'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0143)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14400
     * @tc.name      concurrent_testAssignmentLikeContexts0144
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (float to Floating)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0144'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0144)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14500
     * @tc.name      concurrent_testAssignmentLikeContexts0145
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (double to Floating)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0145'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0145)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14600
     * @tc.name      concurrent_testAssignmentLikeContexts0146
     * @tc.desc     Invocation contexts allow conversion followed by widening reference conversion (byte to Integral)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0146'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0146)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14700
     * @tc.name      concurrent_testAssignmentLikeContexts0147
     * @tc.desc     Invocation contexts allow conversion followed by widening reference conversion (char to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0147'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0147)
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14800
     * @tc.name      concurrent_testAssignmentLikeContexts0148
     * @tc.desc     Compile-time error for narrowing primitive conversion (int to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('concurrent_testAssignmentLikeContexts0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testTag', '%{public}s', 'it begin');
        let caseName = 'concurrent_testAssignmentLikeContexts0148'
        let result: int = 0
        
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i: int = 0; i < concurrentNum; i++) {
            group.addTask(testAssignmentLikeContexts0148)
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