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
function isEqual(d1: string, d2: string) {
  if (d1 === d2) {
    return true;
  } else if (Math.abs(Date.parse(d1) - Date.parse(d2)) <= 1000) {
    return true;
  } else {
    return false;
  }
}
export default function EsDateTest(){
  describe('EsDateTest', ():void => {
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
     * @tc.number ES_BUILTINS_DATE_0001
     * @tc.name ESDateTest0001
     * @tc.desc Test ES Builtins-Api in Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDateTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDateTest0001';
      console.info(`${caseName}, test start`);
      let dateValue = 1438560000000;
      let oldDate = new Date(dateValue);
      let newDate = new Date(oldDate);
      expect(newDate.getTime()).assertEqual(dateValue);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATE_0002
     * @tc.name ESDateTest0002
     * @tc.desc Test ES Builtins-Api in Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDateTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDateTest0002';
      console.info(`${caseName}, test start`);
      expect(typeof Date()).assertEqual("string")
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATE_0003
     * @tc.name ESDateTest0003
     * @tc.desc Test ES Builtins-Api in Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDateTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDateTest0003';
      console.info(`${caseName}, test start`);
      expect(isEqual(Date(), (new Date()).toString())).assertEqual(true)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATE_0004
     * @tc.name ESDateTest0004
     * @tc.desc Test ES Builtins-Api in Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDateTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDateTest0004';
      console.info(`${caseName}, test start`);
      let date = new Date(-0);
      expect(date.getTime()).assertEqual(+0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATE_0005
     * @tc.name ESDateTest0005
     * @tc.desc Test ES Builtins-Api in Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDateTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDateTest0005';
      console.info(`${caseName}, test start`);
      let d1 = new Date(6);
      expect(d1.valueOf()).assertEqual(6);
      let d2 = new Date(-6);
      expect(d2.valueOf()).assertEqual(-6);
      let d3 = new Date(654);
      expect(d3.valueOf()).assertEqual(654);
      let d4 = new Date(-654);
      expect(d4.valueOf()).assertEqual(-654);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATE_0006
     * @tc.name ESDateTest0006
     * @tc.desc Test ES Builtins-Api in Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDateTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDateTest0006';
      console.info(`${caseName}, test start`);
      let d4 = new Date(0);
      expect(d4.valueOf()).assertEqual(0);
      let d5 = new Date(-0);
      expect(d5.valueOf()).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

  })
}
