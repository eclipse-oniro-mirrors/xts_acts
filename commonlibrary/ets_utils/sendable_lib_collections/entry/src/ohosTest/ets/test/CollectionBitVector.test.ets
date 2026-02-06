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
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import { test } from './CollectionBitVectorImport';

@Sendable
class Test {
  length_: number = 0;
  arr_: collections.BitVector = new collections.BitVector(0);
  lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
  async Has(element: number, fromIndex: number, toIndex: number): Promise<boolean> {
    return this.lock_.lockAsync((): boolean => {
      return this.arr_.has(element, fromIndex, toIndex);
    })
  }
  async Push(i: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.arr_.push(i);
      this.length_ += 1;
    })
  }
}

@Sendable
class SendableClass{
  value:collections.BitVector | ArkTSUtils.locks.AsyncLock;
  constructor(value:collections.BitVector | ArkTSUtils.locks.AsyncLock) {
    this.value = value;
  }
};

@Concurrent
async function test001(t: Test) {
  await t.Push(1);
}

@Concurrent
function taskpoolExecte(data:SendableClass) {
  return data.value;
}

function promiseCase():Promise<void | object> {
  let tmp:Promise<void | object> = new Promise((resolve:Function, reject:Function) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return tmp;
}

export default function collectionsBitVectorTest() {
  describe('collectionsBitVectorTest', () => {
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

    /**
     * @tc.name   CollectionsTestClass001
     * @tc.number CollectionsTestClass001
     * @tc.desc   ArkTS Collections bitvector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag:boolean = false;
      try {
        let bitvector:collections.BitVector = new collections.BitVector(0);
        let tmp = new SendableClass(bitvector);
        let task = new taskpool.Task(taskpoolExecte, tmp);

        taskpool.execute(task).then((res)=> {
          flag = true;
          console.log("Transfer bitvector success");
        })
        while(!flag){
          await promiseCase();
        }
      } catch(err) {
          console.log("Transfer bitvector fail:" + err);
      }
      expect(flag).assertEqual(true);
      done();
    });

    /**
     * @tc.name   CollectionsTestClass002
     * @tc.number CollectionsTestClass002
     * @tc.desc   ArkTS Collections bitvector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let t = new Test();
      await taskpool.execute(test001, t).catch((err: Error) => {
        console.log("taskpool execute fail" + err);
      })
      if (await t.Has(0, 0, 1)) {
          console.info("SendableTest: test success");
      } else {
          console.error("SendableTest: test fail");
      }
      done();
    });

    /**
     * @tc.name   CollectionsTestClass003
     * @tc.number CollectionsTestClass003
     * @tc.desc   ArkTS Collections bitvector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
       let bitvector = new collections.BitVector(0);
       let flag = test(bitvector);
       if(!flag){
          console.log("BitVector Cannot set property");
       }
       expect(flag).assertEqual(false);
       done();
    });
  });
}
