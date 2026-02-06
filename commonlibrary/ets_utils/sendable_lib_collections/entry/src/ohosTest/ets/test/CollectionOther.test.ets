/*
 *  Copyright (C) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import collections from '@arkts.collections';
import taskpool from '@ohos.taskpool';
import {
  arrayAt,
  arrayFill,
  arrayIndexOf,
  arrayJoin,
  arrayPop,
  arrayPush,
  arrayShift,
  arraySlice,
  arrayUnshift,
  mapClear,
  mapDelete,
  mapGet,
  setAdd,
  setClear,
  setDelete
} from '../util/ComcurrentFunction';
import { JSON } from '@kit.ArkTS';


export default function collectionsOtherTest() {
  describe('CollectionsOtherTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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


    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayPop_0500
    * @tc.name  : testArrayPop0500
    * @tc.desc  : Removes and returns the last element from the ArkTS Array.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 0
    */
    it('testArrayPop0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayPop0500';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array pop before ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arrayPop, array);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} array pop after  ${array.length}`);
          expect(3).assertEqual(array.length);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayPush_0300
    * @tc.name  : testArrayPush0300
    * @tc.desc  : Add one or more elements to the end of the ArkTS Array and return the new Array length.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 0
    */
    it('testArrayPush0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayPush0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array push before ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arrayPush, array);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} array push after   ${array.length}`);
          expect(6).assertEqual(array.length);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayJoin_0400
    * @tc.name  : testArrayJoin0400
    * @tc.desc  : Concatenates all elements of ArkTS Array into a string that can be separated by a specified delimiter.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArrayJoin0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayJoin0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array join before ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arrayJoin, array);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} array join after   ${e}`);
          expect('1-2-3-4').assertEqual(e);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayShift_0500
    * @tc.name  : testArrayShift0500
    * @tc.desc  : Removes and returns the first element from the ArkTS Array.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArrayShift0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayShift0500';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array shift before ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arrayShift, array);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} array shift after ${array.length}  firstElement  ${e}`);
          expect(3).assertEqual(array.length);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayUnshift_0300
    * @tc.name  : testArrayUnshift0300
    * @tc.desc  : Inserts one or more elements at the head of the ArkTS Array and returns the new Array length.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArrayUnshift0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayUnshift0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arrayUnshift, array);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} array Unshift after ${array.length}  pushLength ${e}`);
          expect(6).assertEqual(array.length);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArraySlice_1100
    * @tc.name  : testArraySlice1100
    * @tc.desc  : Returns a new Array, which is a slice of the original ArkTS Array.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArraySlice1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice1100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arraySlice, array);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} array slice after newArray ${e}`);
          expect(2).assertEqual(e);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayIndexOf_0500
    * @tc.name  : testArrayIndexOf0500
    * @tc.desc  : Returns the index where the search element first appears in ArkTS Array, or-1 if it does not exist.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArrayIndexOf0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayIndexOf0500';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c', 'd');
        let task1: taskpool.Task = new taskpool.Task(arrayIndexOf, array);
        taskpool.execute(task1).then((e: Object) => {
          let index: number = array.indexOf('a');
          console.log(`${caseName} index ${index}`);
          console.log(`${caseName} array indexOf after value ${e}`);
          expect(-1).assertEqual(index);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayAt_0500
    * @tc.name  : testArrayAt0500
    * @tc.desc  : Returns the index where the search element first appears in ArkTS Array, or-1 if it does not exist.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArrayAt0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayAt0500';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c', 'd');
        let task1: taskpool.Task = new taskpool.Task(arrayAt, array);
        taskpool.execute(task1).then((e: Object) => {
          let index: string | undefined = array.at(0);
          console.log(`${caseName} at ${index}`);
          console.log(`${caseName} array at after value ${e}`);
          expect('b').assertEqual(array[0]);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_ArrayFill_1100
    * @tc.name  : testArrayFill1100
    * @tc.desc  : Fills all elements in the specified range of Array with the specified values.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testArrayFill1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFill1100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        console.log(`${caseName} array ${array.length}`);
        let task1: taskpool.Task = new taskpool.Task(arrayFill, array);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} array fill after value ${e}`);
          expect(0).assertEqual(e);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_MapClear_0400
    * @tc.name  : testMapClear0400
    * @tc.desc  : Delete all elements in the Map.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testMapClear0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testMapClear0400';
      console.log(`${caseName} test start `);
      try {
        let map: collections.Map<number, string> = new collections.Map<number, string>([[1, '1']]);
        console.log(`${caseName} map.size ${map.size}`);
        let task1: taskpool.Task = new taskpool.Task(mapClear, map);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} array map after value ${map.size}`);
          expect(0).assertEqual(map.size);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_MapDelete_0400
    * @tc.name  : testMapDelete0400
    * @tc.desc  : Deletes the specified element in the Map.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testMapDelete0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testMapDelete0400';
      console.log(`${caseName} test start `);
      try {
        let map: collections.Map<number, string> = new collections.Map<number, string>([[0, '1'], [1, '1'], [2, '2']]);
        console.log(`${caseName} map.size ${map.size}`);
        let task1: taskpool.Task = new taskpool.Task(mapDelete, map);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} deleteFlg ${map.size}`);
          expect(2).assertEqual(map.size);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_MapGet_0400
    * @tc.name  : testMapGet0400
    * @tc.desc  : Returns the specified element in the Map.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testMapGet0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testMapGet0400';
      console.log(`${caseName} test start `);
      try {
        let map: collections.Map<number, string> = new collections.Map<number, string>([[0, '1'], [1, '1'], [2, '2']]);
        console.log(`${caseName} map.size ${map.size}`);
        let task1: taskpool.Task = new taskpool.Task(mapGet, map);
        taskpool.execute(task1).then((e: Object) => {
          let value: string | undefined = map.get(0);
          console.log(`${caseName} get ${value}`);
          expect(undefined).assertEqual(value);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_MapHas_0400
    * @tc.name  : testMapHas0400
    * @tc.desc  : Determines whether the specified element exists in the Map.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testMapHas0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testMapHas0400';
      console.log(`${caseName} test start `);
      try {
        let map: collections.Map<number, string> = new collections.Map<number, string>([[0, '1'], [1, '1'], [2, '2']]);
        console.log(`${caseName} map.size ${map.size}`);
        let task1: taskpool.Task = new taskpool.Task(mapGet, map);
        taskpool.execute(task1).then((e: Object) => {
          let flg: boolean = map.has(0);
          console.log(`${caseName} has ${flg}`);
          expect(false).assertEqual(flg);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_MapHas_0500
    * @tc.name  : testMapSet0500
    * @tc.desc  : Adds or updates a specified key-value pair to the Map.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testMapSet0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testMapSet0500';
      console.log(`${caseName} test start `);
      try {
        let map: collections.Map<number, string> = new collections.Map<number, string>();
        console.log(`${caseName} map.size ${map.size}`);
        let task1: taskpool.Task = new taskpool.Task(mapGet, map);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} set ${map.size}`);
          expect(0).assertEqual(map.size);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_SetClear_0500
    * @tc.name  : testSetClear0500
    * @tc.desc  : Returns an Set iterator object that contains the value of each element in this Set.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testSetClear0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetClear0500';
      console.log(`${caseName} test start `);
      try {
        let set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
        console.log(`${caseName} set.size ${set.size}`);
        let task1: taskpool.Task = new taskpool.Task(setClear, set);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} clear ${set.size}`);
          expect(0).assertEqual(set.size);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_SetDelete_0400
    * @tc.name  : testSetDelete0400
    * @tc.desc  : Deletes the specified element in the Set.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testSetDelete0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetDelete0400';
      console.log(`${caseName} test start `);
      try {
        let set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
        console.log(`${caseName} set.size ${set.size}`);
        let task1: taskpool.Task = new taskpool.Task(setDelete, set);
        taskpool.execute(task1).then((e: Object) => {
          let flg: boolean = set.has(1);
          console.log(`${caseName} delete ${set.size} ${flg}`);
          expect(false).assertEqual(flg);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Runtime_Language_Backend_SetAdd_0400
    * @tc.name  : testSetAdd0400
    * @tc.desc  : If there is no same element, a new element is inserted into the Set.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 1
    */
    it('testSetAdd0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetAdd0400';
      console.log(`${caseName} test start `);
      try {
        let set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
        console.log(`${caseName} set.size ${set.size}`);
        let task1: taskpool.Task = new taskpool.Task(setAdd, set);
        taskpool.execute(task1).then((e: Object) => {
          console.log(`${caseName} delete ${set.size}`);
          expect(5).assertEqual(set.size);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          expect(false);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(false);
        done();
      }
      console.log(`${caseName} test end `);
    });
  });
}