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
import { collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { test_map_001, test_map_002, test_map_003, test_map_004, test_map_005,
  test_map_006,
  test_map_007,
  test_map_008,
  test_map_009,
  test_map_010,
  test_set_001,
  test_set_002,
  test_set_003,
  test_set_004,
  test_set_005,
  test_set_006,
  test_set_007,
  test_set_008,
  test_set_009} from '../testability/pages/taskpool';

let concurrentNum = 100

function getInitMap1(): collections.Map<number, string> {
  let map = new collections.Map<number, string>([
    [1, 'one'],
    [2, 'two'],
    [3, 'three'],
    [4, 'four']
  ]);
  return map
}

function getInitMap2(): collections.Map<string, number> {
  let map = new collections.Map<string, number>([
    ['a', 1],
    ['b', 2],
    ['c', 3],
    ['d', 4]
  ]);
  return map
}

function getInitMap3(): collections.Map<number, number> {
  let map = new collections.Map<number, number>([
    [10, 100],
    [20, 200],
    [30, 300],
    [40, 400]
  ]);
  return map
}

function getInitSet1(): collections.Set<number> {
  let set = new collections.Set<number>([1, 2, 3, 4]);
  return set
}

function getInitSet2(): collections.Set<string> {
  let set = new collections.Set<string>(['a', 'b', 'c', 'd']);
  return set
}

function getInitSet3(): collections.Set<number> {
  let set = new collections.Set<number>([10, 20, 30, 40]);
  return set
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function MapAndSetTest() {
  describe('MapAndSetTest', () => {
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
     * @tc.name   test_concurrent_collections_map_001
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0100
     * @tc.desc   test_concurrent_collections_map_001 - test Map entries method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_001';
        console.info(`${caseName} test start`);
        let map = getInitMap1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_001, map, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,one')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_002
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0200
     * @tc.desc   test_concurrent_collections_map_002 - test Map keys method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_002';
        console.info(`${caseName} test start`);
        let map = getInitMap1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_002, map, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(1)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_003
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0300
     * @tc.desc   test_concurrent_collections_map_003 - test Map values method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_003';
        console.info(`${caseName} test start`);
        let map = getInitMap1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_003, map, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('one')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_004
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0400
     * @tc.desc   test_concurrent_collections_map_004 - test Map get method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_004';
        console.info(`${caseName} test start`);
        let map = getInitMap1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_004, map, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('two')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_005
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0500
     * @tc.desc   test_concurrent_collections_map_005 - test Map has method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_005';
        console.info(`${caseName} test start`);
        let map = getInitMap1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_005, map, caseName, i).then((res) => {
              expect(res as boolean)
                .assertTrue()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
          expect(map.size).assertEqual(100)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_006
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0600
     * @tc.desc   test_concurrent_collections_map_006 - test Map set method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_006';
        console.info(`${caseName} test start`);
        let map = getInitMap2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_map_006, map, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${map.size}`);
          expect(map.size).assertEqual(4 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_007
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0700
     * @tc.desc   test_concurrent_collections_map_007 - test Map delete method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_007';
        console.info(`${caseName} test start`);
        let map = getInitMap3()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_map_007, map, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${map.size}`);
          expect(map.size).assertEqual(1)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_008
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0800
     * @tc.desc   test_concurrent_collections_map_008 - test Map clear method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_008';
        console.info(`${caseName} test start`);
        let map = getInitMap1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_map_008, map, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${map.size}`);
          expect(map.size).assertEqual(0)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_009
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_0900
     * @tc.desc   test_concurrent_collections_map_009 - test Map forEach method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_009';
        console.info(`${caseName} test start`);
        let map = getInitMap2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_009, map, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('forEach_completed')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_map_010
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1000
     * @tc.desc   test_concurrent_collections_map_010 - test Map size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_map_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_map_010';
        console.info(`${caseName} test start`);
        let map = getInitMap3()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_map_010, map, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(4)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_011
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1100
     * @tc.desc   test_concurrent_collections_set_011 - test Set entries method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_011';
        console.info(`${caseName} test start`);
        let set = getInitSet1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_set_001, set, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('1,1')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_012
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1200
     * @tc.desc   test_concurrent_collections_set_012 - test Set keys method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_012';
        console.info(`${caseName} test start`);
        let set = getInitSet1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_set_002, set, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(1)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_013
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1300
     * @tc.desc   test_concurrent_collections_set_013 - test Set values method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_013';
        console.info(`${caseName} test start`);
        let set = getInitSet1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_set_003, set, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(1)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_014
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1400
     * @tc.desc   test_concurrent_collections_set_014 - test Set has method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_014';
        console.info(`${caseName} test start`);
        let set = getInitSet1()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_set_004, set, caseName, i).then((res) => {
              expect(res as boolean)
                .assertTrue()
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_015
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1500
     * @tc.desc   test_concurrent_collections_set_015 - test Set add method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_015';
        console.info(`${caseName} test start`);
        let set = getInitSet2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_set_005, set, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${set.size}`);
          expect(set.size).assertEqual(4 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_016
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1600
     * @tc.desc   test_concurrent_collections_set_016 - test Set delete method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_016';
        console.info(`${caseName} test start`);
        let set = getInitSet3()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_set_006, set, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${set.size}`);
          expect(set.size).assertEqual(0)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_017
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1700
     * @tc.desc   test_concurrent_collections_set_017 - test Set clear method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_017';
        console.info(`${caseName} test start`);
        let set = getInitSet1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_set_007, set, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${set.size}`);
          expect(set.size).assertEqual(0)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_018
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1800
     * @tc.desc   test_concurrent_collections_set_018 - test Set forEach method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_018';
        console.info(`${caseName} test start`);
        let set = getInitSet2()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_set_008, set, caseName, i).then((res) => {
              expect(res as string)
                .assertEqual('forEach_completed')
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_set_019
     * @tc.number SUB_CONCURRENT_MAP_AND_SET_TEST_1900
     * @tc.desc   test_concurrent_collections_set_019 - test Set size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_set_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_set_019';
        console.info(`${caseName} test start`);
        let set = getInitSet3()
        let count = 0;
        try {
          for (let i = 0; i < concurrentNum; i++) {
            await taskpool.execute(test_set_009, set, caseName, i).then((res) => {
              expect(res as number)
                .assertEqual(4)
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
              expect().assertFail()
            })
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }

        console.info(`${caseName} test end`);
        done()
      })
  })
}