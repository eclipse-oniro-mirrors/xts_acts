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
import { test2021_05_ans } from './test2021_05'

export default function es2021Test() {
  describe('ES2021Test', () => {
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2021NewFeatures_0001
     * @tc.name      : testReplaceAll
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testReplaceAll', 0, () => {
      expect('abbbaab'.replaceAll('b', 'x')).assertEqual("axxxaax");
      expect('abbbaab'.replaceAll(/b/g, 'x')).assertEqual("axxxaax");
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2021NewFeatures_0002
     * @tc.name      : testPromise.any Success
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPromise.any Success', 0, () => {
      const Promise1: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => resolve('Promise 1'), 100)
      });
      const Promise2: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => reject('Promise 2 error'), 200)
      });
      const Promise3: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => reject('Promise 3 error'), 300)
      });

      Promise.any([Promise1, Promise2, Promise3])
        .then((value: string) => {
          expect(value).assertEqual("Promise 1")
        })
        .catch((error: string) => {
        })
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2021NewFeatures_0003
     * @tc.name      : testPromise.any Error
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPromise.any Error', 0, () => {
      const Promise1: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => reject('Promise 1 error'), 100)
      });
      const Promise2: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => reject('Promise 2 error'), 200)
      });
      const Promise3: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => reject('Promise 3 error'), 300)
      });

      Promise.any([Promise1, Promise2, Promise3])
        .then((value: string) => {
          expect(value).assertEqual("Promise 1")
        })
        .catch((error: AggregateError) => {
          expect(error.errors).assertDeepEquals(["Promise 1 error", "Promise 2 error", "Promise 3 error"])
        })
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2021NewFeatures_0004
     * @tc.name      : testLogicalAssignment
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLogicalAssignment', 0, () => {
      let a = 0;
      let b = 10;
      a &&= b;
      expect(a).assertEqual(0);
      a ||= b;
      expect(a).assertEqual(10);
      let c: string | null = null;
      let d = "hello";
      c ??= d;
      expect(c).assertEqual("hello")
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2021NewFeatures_0005
     * @tc.name      : testNumberSeparator
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNumberSeparator', 0, () => {
      expect(1_1).assertEqual(11)
      expect(1_1n).assertEqual(11n)
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ES2021NewFeatures_0006
     * @tc.name      : testWeakRef
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWeakRef', 0, () => {
      expect(test2021_05_ans).assertEqual("21")
    })
  })
}