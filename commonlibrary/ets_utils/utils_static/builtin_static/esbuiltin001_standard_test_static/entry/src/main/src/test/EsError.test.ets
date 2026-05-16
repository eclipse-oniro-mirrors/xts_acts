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

export default function EsErrorTest(){
  describe('EsErrorTest', ():void => {
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
     * @tc.number ES_BUILTINS_ERROR_0001
     * @tc.name ESErrorTest0001
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0001';
      console.info(`${caseName}, test start`);
      let errObj = new Error("ErrorMessage");
      errObj.name = "ErrorName";
      expect(errObj.toString()).assertEqual("ErrorName: ErrorMessage");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ERROR_0002
     * @tc.name ESErrorTest0002
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0002';
      console.info(`${caseName}, test start`);
      let errObj = new Error();
      expect(errObj.toString()).assertEqual("Error");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ERROR_0003
     * @tc.name ESErrorTest0003
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0003';
      console.info(`${caseName}, test start`);
      let errObj = new Error("ErrorMessage");
      expect(errObj.toString()).assertEqual("Error: ErrorMessage");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ERROR_0004
     * @tc.name ESErrorTest0004
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0004';
      console.info(`${caseName}, test start`);
      let errObj = new Error("ErrorMessage");
      errObj.name = "";
      expect(errObj.toString()).assertEqual("ErrorMessage");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ERROR_0005
     * @tc.name ESErrorTest0005
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0005';
      console.info(`${caseName}, test start`);
      let errObj = new Error();
      errObj.name = "";
      expect(errObj.name).assertEqual("");
      expect(errObj.toString()).assertEqual("");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ERROR_0006
     * @tc.name ESErrorTest0006
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0006';
      console.info(`${caseName}, test start`);
      let errObj = new Error();
      errObj.name = "ErrorName";
      expect(errObj.toString()).assertEqual("ErrorName");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ERROR_0007
     * @tc.name ESErrorTest0007
     * @tc.desc Test ES Builtins-Api in Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESErrorTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESErrorTest0007';
      console.info(`${caseName}, test start`);
      expect(new Error("Error").toString() === undefined).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
  })
}
