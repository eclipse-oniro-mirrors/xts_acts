/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


import { describe, it, expect } from '@ohos/hypium';
import { asyncGenerator } from './test2018_01'
import { obj3 } from './test2018_02'
import { remaining } from './test2018_03'
import { test2018_05_ans } from './test2018_05'
import { test2018_06_ans } from './test2018_06'


export default function es2018Test() {
  describe('ES2018Test', () => {
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2018NewFeatures_0001
     * @tc.name      : testAsynchronousIteration
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testAsynchronousIteration', 0, async () => {
      let es2018_01_ans: number[] = [];
      for await (const value of asyncGenerator()) {
        es2018_01_ans.push(value);
      }
      expect(es2018_01_ans).assertDeepEquals([0, 1, 2, 3, 4])
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2018NewFeatures_0002
     * @tc.name      : testSpreadingIntoObjectLiterals
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSpreadingIntoObjectLiterals', 0, () => {
      expect(obj3).assertDeepEquals({
        one: 1, two: 2, three: 3, four: 4
      })
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2018NewFeatures_0003
     * @tc.name      : testRestProperty
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRestProperty', 0, () => {
      expect(remaining).assertDeepEquals({
        b: 2, c: 3
      })
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2018NewFeatures_0004
     * @tc.name      : testPromise.finally
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPromise.finally', 0, () => {
      let test2018_04_ans: number = 0;
      let promise1 = new Promise((resolve: (value: string) => void, rejcet: (value: string) => void) => {
        resolve("resolved");
      })
      let promise2 = new Promise((resolve: (value: string) => void, rejcet: (value: string) => void) => {
        resolve("resolved");
      })
      promise1.then(
        () => {
          throw (new Error("error"));
        }
      ).catch((err: string) => {
      }
      ).finally(() => {
        test2018_04_ans += 1;
        promise2.then(
          () => {
          }
        ).catch((err: string) => {
        }
        ).finally(() => {
          test2018_04_ans += 1;
          expect(test2018_04_ans).assertEqual(2);
        })
      })
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2018NewFeatures_0005
     * @tc.name      : testNewFeaturesOfRegExp
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNewFeaturesOfRegExp', 0, () => {
      expect(test2018_05_ans).assertEqual("756abcbcdeffalsetruetruetruetrue");
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2018NewFeatures_0006
     * @tc.name      : testFixTemplateString
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFixTemplateString', 0, () => {
      expect(test2018_06_ans).assertEqual("ES2018undefined");
    })
  })
}