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
import { describe, expect, it } from '@ohos/hypium'
import { DATA_TYPE_LIST, getFuzzData } from './getParam.ets';

export const releaseFormFuzzTest = (describeName, filterParameter) => {
  const ERR_COMMON_CODE = 1;
  const ERR_COMMON = `internal error`;
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;
  const ERR_NOT_EXIST_ID_CODE = 9;
  const ERR_NOT_EXIST_ID = `the ID of the form to be operated does not exist`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_fuzzTest_releaseform`;
    const promiseName = `FMS_fuzzTest_releaseform`;
    const length = DATA_TYPE_LIST.length;

    for (let i = 0; i < length; ++i) {
      const tcNumber = `0${(i + 1) * 100}`;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_releaseform_0100 ~ FMS_fuzzTest_releaseform_0800
       * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const formId = getFuzzData(dataType);
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        try {
          formHost.releaseForm(formId, (error, data) => {
            console.log(`${callbackName} ${tcNumber} releaseForm data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
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
      let tcNumber: any = (i + 1 + length) * 100;
      tcNumber = tcNumber < 1000 ? `0${tcNumber}` : tcNumber;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_releaseform_0900 ~ FMS_fuzzTest_releaseform_1600
       * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const formId = getFuzzData(dataType);
        console.log(`${promiseName} ${tcNumber} ${describeName} formId typeof: ${typeof formId}`);
        try {
          const data = await formHost.releaseForm(formId);
          console.log(`${promiseName} ${tcNumber} releaseForm data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`string` === typeof formId) {
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          } else {
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          }
          done();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      const tcNumber: any = (i + 1 + length * 2) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_releaseform_1700 ~ FMS_fuzzTest_releaseform_2400
       * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const formId = getFuzzData(dataType);
        const isReleaseCache = true;
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${callbackName} ${tcNumber} isReleaseCache typeof: ${typeof isReleaseCache}`);
        try {
          formHost.releaseForm(formId, isReleaseCache, (error, data) => {
            console.log(`${callbackName} ${tcNumber} releaseForm data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
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
      const tcNumber: any = (i + 1 + length * 3) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_releaseform_2500 ~ FMS_fuzzTest_releaseform_3200
       * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const formId = getFuzzData(dataType);
        const isReleaseCache = true;
        console.log(`${promiseName} ${tcNumber} ${describeName} formId typeof: ${typeof formId}`);
        console.log(`${promiseName} ${tcNumber} ${describeName} isReleaseCache typeof: ${typeof isReleaseCache}`);
        try {
          const data = await formHost.releaseForm(formId, isReleaseCache);
          console.log(`${promiseName} ${tcNumber} releaseForm data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`string` === typeof formId) {
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          } else {
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          }
          done();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      const tcNumber: any = (i + 1 + length * 4) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_releaseform_3300 ~ FMS_fuzzTest_releaseform_4000
       * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const formId = `${tcNumber}`;
        const isReleaseCache = getFuzzData(dataType);
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${callbackName} ${tcNumber} isReleaseCache typeof: ${typeof isReleaseCache}`);
        try {
          formHost.releaseForm(formId, isReleaseCache, (error, data) => {
            console.log(`${callbackName} ${tcNumber} releaseForm data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            if (`boolean` === typeof isReleaseCache) {
              expect(error.code).assertEqual(ERR_NOT_EXIST_ID_CODE);
              expect(error.message).assertEqual(ERR_NOT_EXIST_ID);
            } else {
              expect(error.code).assertEqual(ERR_COMMON_CODE);
              expect(error.message).assertEqual(ERR_COMMON);
            }
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
      const tcNumber: any = (i + 1 + length * 5) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_releaseform_4100 ~ FMS_fuzzTest_releaseform_4800
       * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const formId = `${tcNumber}`;
        const isReleaseCache = getFuzzData(dataType);
        console.log(`${promiseName} ${tcNumber} ${describeName} formId typeof: ${typeof formId}`);
        console.log(`${promiseName} ${tcNumber} ${describeName} isReleaseCache typeof: ${typeof isReleaseCache}`);
        try {
          const data = await formHost.releaseForm(formId, isReleaseCache);
          console.log(`${promiseName} ${tcNumber} releaseForm data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`boolean` === typeof isReleaseCache) {
            expect(error.code).assertEqual(ERR_NOT_EXIST_ID_CODE);
            expect(error.message).assertEqual(ERR_NOT_EXIST_ID);
          } else {
            expect(error.code).assertEqual(ERR_COMMON_CODE);
            expect(error.message).assertEqual(ERR_COMMON);
          }
          done();
        }
      });
    }
  });
};
