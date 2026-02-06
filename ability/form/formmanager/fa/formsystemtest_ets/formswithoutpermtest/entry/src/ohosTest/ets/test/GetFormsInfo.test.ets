/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import formHost from '@ohos.application.formHost';
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';

export const getFormsInfoTest = (describeName:string, filterParameter:number) => {
  const ERR_PERMISSION_DENY_CODE = 2;
  const ERR_PERMISSION_DENY = `does not have permission to use forms`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_Callback_0800`;
    const promiseName = `FMS_getFormsInfo_Promise_0800`;
    const bundleName = `1`;
    const callbackName1 = `FMS_getFormsInfo_Callback_1300`;
    const promiseName1 = `FMS_getFormsInfo_Promise_1300`;
    const bundleName1 = `2`;
    const moduleName = `a`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0800
     * @tc.desc: Query specific form configuration information by bundle name without permission (by AsyncCallback)
     */
    it(`${callbackName}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_PERMISSION_DENY_CODE);
          expect(error.message).assertEqual(ERR_PERMISSION_DENY);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_0800
     * @tc.desc: Query specific form configuration information by bundle name without permission (by Promise)
     */
    it(`${promiseName}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_PERMISSION_DENY_CODE);
        expect(error.message).assertEqual(ERR_PERMISSION_DENY);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1300
     * @tc.desc: Query specific form configuration information by bundle name and module name without permission (by AsyncCallback)
     */
    it(`${callbackName1}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(`==========${callbackName1} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName1, moduleName, (error, data) => {
          console.log(`${callbackName1} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_PERMISSION_DENY_CODE);
          expect(error.message).assertEqual(ERR_PERMISSION_DENY);
          done();
          console.log(`==========${callbackName1} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName1} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName1} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1300
     * @tc.desc: Query specific form configuration information by bundle name and module name without permission (by Promise)
     */
    it(`${promiseName1}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(`==========${promiseName1} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName1, moduleName);
        console.log(`${promiseName1} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName1} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName1} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_PERMISSION_DENY_CODE);
        expect(error.message).assertEqual(ERR_PERMISSION_DENY);
        done();
        console.log(`==========${promiseName1} ${describeName} end==========`);
      }
    });
  });
};
