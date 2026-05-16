/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function EsNaNTest(){
  describe('EsNaNTest', ():void => {
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
     * @tc.number ES_BUILTINS_NAN_0001
     * @tc.name ESNaNTest0001
     * @tc.desc Test ES Builtins-Api in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESNaNTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESNaNTest0001';
      console.info(`${caseName}, test start`);
      expect(NaN == NaN).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_NAN_0002
     * @tc.name ESNaNTest0002
     * @tc.desc Test ES Builtins-Api in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESNaNTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESNaNTest0002';
      console.info(`${caseName}, test start`);
      expect(typeof(NaN) === "boolean").assertEqual(false);
      console.info(`${caseName}, test end`);
    });
  })
}
