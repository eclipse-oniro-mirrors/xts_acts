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

export const getFormsInfoFuzzTest = (describeName, filterParameter) => {
  const ERR_GET_BUNDLE_FAILED_CODE = 5;
  const ERR_GET_BUNDLE_FAILED = `failed to obtain the bundle information`;
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_fuzzTest_getinfomodule_callback`;
    const promiseName = `FMS_fuzzTest_getinfomodule_promise`;
    const length = DATA_TYPE_LIST.length;

    for (let i = 0; i < length; ++i) {
      const tcNumber = `0${(i + 1) * 100}`;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_getinfobundle_0100 ~ FMS_fuzzTest_getinfobundle_0800
       * @tc.desc Check whether the getFormsInfo interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`FMS_fuzzTest_getinfobundle_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const bundleName = getFuzzData(dataType);
        console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} bundleName typeof: ${typeof bundleName}`);
        try {
          formHost.getFormsInfo(bundleName, (error, data) => {
            console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            if (`string` === typeof bundleName) {
              expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
              expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
            } else {
              expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
              expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
            }
            done();
          });
        } catch (error) {
          console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} should not reach here`);
          expect().assertFail();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      let tcNumber: any = (i + 1 + length) * 100;
      tcNumber = tcNumber < 1000 ? `0${tcNumber}` : tcNumber;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_getinfobundle_0900 ~ FMS_fuzzTest_getinfobundle_1600
       * @tc.desc Check whether the getFormsInfo interface can pass the fuzzy test (by Promise)
       */
      it(`FMS_fuzzTest_getinfobundle_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const bundleName = getFuzzData(dataType);
        console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} ${describeName} bundleName typeof: ${typeof bundleName}`);
        try {
          const data = await formHost.getFormsInfo(bundleName);
          console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} getFormsInfo data: ${JSON.stringify(data)}`);
          console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`FMS_fuzzTest_getinfobundle ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`string` === typeof bundleName) {
            expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
            expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          } else {
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          }
          done();
        }
      });
    }

    for (let i = 0; i < length; ++i) {
      const tcNumber = `0${(i + 1) * 100}`;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_getinfomodule_0100 ~ FMS_fuzzTest_getinfomodule_0800
       * @tc.desc Check whether the getFormsInfo interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const bundleName = getFuzzData(dataType);
        const moduleName = `com.test.module_name_${tcNumber}`;
        console.log(`${callbackName} ${tcNumber} bundleName typeof: ${typeof bundleName}`);
        console.log(`${callbackName} ${tcNumber} moduleName typeof: ${typeof moduleName}`);
        try {
          formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
            console.log(`${callbackName} ${tcNumber} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            if (`string` === typeof bundleName) {
              expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
              expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
            } else {
              expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
              expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
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
      let tcNumber: any = (i + 1 + length) * 100;
      tcNumber = tcNumber < 1000 ? `0${tcNumber}` : tcNumber;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_getinfomodule_0900 ~ FMS_fuzzTest_getinfomodule_1600
       * @tc.desc Check whether the getFormsInfo interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const bundleName = getFuzzData(dataType);
        const moduleName = `com.test.module_name_${tcNumber}`;
        console.log(`${promiseName} ${tcNumber} ${describeName} bundleName typeof: ${typeof bundleName}`);
        console.log(`${promiseName} ${tcNumber} ${describeName} moduleName typeof: ${typeof moduleName}`);
        try {
          const data = await formHost.getFormsInfo(bundleName, moduleName);
          console.log(`${promiseName} ${tcNumber} getFormsInfo data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`string` === typeof bundleName) {
            expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
            expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
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
       * @tc.number FMS_fuzzTest_getinfomodule_1700 ~ FMS_fuzzTest_getinfomodule_2400
       * @tc.desc Check whether the getFormsInfo interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const bundleName = `com.test.bundle_name_${tcNumber}`;
        const moduleName = getFuzzData(dataType);
        console.log(`${callbackName} ${tcNumber} bundleName typeof: ${typeof bundleName}`);
        console.log(`${callbackName} ${tcNumber} moduleName typeof: ${typeof moduleName}`);
        try {
          formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
            console.log(`${callbackName} ${tcNumber} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            expect(data).assertUndefined();
            if (`string` === typeof moduleName) {
              expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
              expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
            } else {
              expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
              expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
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
      const tcNumber: any = (i + 1 + length * 3) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_getinfomodule_2500 ~ FMS_fuzzTest_getinfomodule_3200
       * @tc.desc Check whether the getFormsInfo interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done) => {
        const dataType = DATA_TYPE_LIST[i];
        const bundleName = `com.test.bundle_name_${tcNumber}`;
        const moduleName = getFuzzData(dataType);
        console.log(`${promiseName} ${tcNumber} ${describeName} bundleName typeof: ${typeof bundleName}`);
        console.log(`${promiseName} ${tcNumber} ${describeName} moduleName typeof: ${typeof moduleName}`);
        try {
          const data = await formHost.getFormsInfo(bundleName, moduleName);
          console.log(`${promiseName} ${tcNumber} getFormsInfo data: ${JSON.stringify(data)}`);
          console.log(`${promiseName} ${tcNumber} should not reach here`);
          expect().assertFail();
        } catch (error) {
          console.log(`${promiseName} ${tcNumber} exception caught: ${JSON.stringify(error)}`);
          if (`string` === typeof moduleName) {
            expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
            expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          } else {
            expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
            expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          }
          done();
        }
      });
    }
  })
};
