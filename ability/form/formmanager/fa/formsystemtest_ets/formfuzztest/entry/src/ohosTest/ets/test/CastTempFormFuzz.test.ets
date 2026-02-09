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
import { DATA_TYPE_LIST, getFuzzData } from './getParam.ets';

export const castTempFormFuzzTest = (describeName:string, filterParameter:number) => {
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_fuzzTest_casttempform`;
    const promiseName = `FMS_fuzzTest_casttempform`;
    const length:number = DATA_TYPE_LIST.length;

    for (let i = 0; i < length; ++i) {
      const tcNumber = `0${(i + 1) * 100}`;
      /**
       * @tc.name   ${callbackName}_${tcNumber}
       * @tc.number FMS_fuzzTest_casttempform_0100 ~ FMS_fuzzTest_casttempform_0800
       * @tc.desc   Check whether the castTempForm interface can pass the fuzzy test (by AsyncCallback)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it(`${callbackName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId: string= getFuzzData(dataType) as string;
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        try {
          formHost.castTempForm(formId, (error, data) => {
            console.log(`${callbackName} ${tcNumber} castTempForm data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
            done();
          });
        } catch (error) {
          console.log(`${callbackName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          console.log(`${callbackName} ${tcNumber} should not reach here`);
          expect().assertFail();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      let tcNumber: string | number = (i + 1 + length) * 100;
      tcNumber = tcNumber < 1000 ? `0${tcNumber}` : tcNumber;
      /**
       * @tc.name   ${promiseName}_${tcNumber}
       * @tc.number FMS_fuzzTest_casttempform_0900 ~ FMS_fuzzTest_casttempform_1600
       * @tc.desc   Check whether the castTempForm interface can pass the fuzzy test (by Promise)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it(`${promiseName}_${tcNumber}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId: string= getFuzzData(dataType) as string;
        console.log(`${promiseName} ${tcNumber} ${describeName} formId typeof: ${typeof formId}`);
        try {
          const data = await formHost.castTempForm(formId);
          console.log(`${promiseName} ${tcNumber} castTempForm data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
        }
      });
    }
  });
};
