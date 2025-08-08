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

import formBindingData from '@ohos.application.formBindingData';
import formProvider from '@ohos.application.formProvider';
import { describe, expect, it } from '@ohos/hypium'
import { DATA_TYPE_LIST, getFuzzData } from './getParam.ets';

export const updateFormFuzzTest = (describeName:string, filterParameter:number) => {
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_fuzzTest_updateform`;
    const promiseName = `FMS_fuzzTest_updateform`;
    const length:number = DATA_TYPE_LIST.length;

    for (let i = 0; i < length; ++i) {
      const tcNumber = `0${(i + 1) * 100}`;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_updateform_0100 ~ FMS_fuzzTest_updateform_0800
       * @tc.desc Check whether the updateForm interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = getFuzzData(dataType) as string;
        let bindingData:formBindingData.FormBindingData | null = formBindingData.createFormBindingData('');
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${callbackName} ${tcNumber} bindingData typeof: ${typeof bindingData}`);
        try {
          formProvider.updateForm(formId, bindingData, (error, data) => {
            console.log(`${callbackName} ${tcNumber} updateForm data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
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
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_updateform_0900 ~ FMS_fuzzTest_updateform_1600
       * @tc.desc Check whether the updateForm interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = getFuzzData(dataType) as string;
        let formBindingData:formBindingData.FormBindingData | null = null;
        console.log(`${promiseName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${promiseName} ${tcNumber} formBindingData typeof: ${typeof formBindingData}`);
        try {
          const data = await formProvider.updateForm(formId, formBindingData);
          console.log(`${promiseName} ${tcNumber} updateForm data: ${JSON.stringify(data)}`);
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

    for (let i = 0; i < length; ++i) {
      const tcNumber: number = (i + 1 + length * 2) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_updateform_1700 ~ FMS_fuzzTest_updateform_2400
       * @tc.desc Check whether the updateForm interface can pass the fuzzy test (by AsyncCallback)
       */
      it(`${callbackName}_${tcNumber}`, filterParameter, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = `${tcNumber}`;
        const formBindingData:formBindingData.FormBindingData = getFuzzData(dataType) as formBindingData.FormBindingData;
        console.log(`${callbackName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${callbackName} ${tcNumber} formBindingData typeof: ${typeof formBindingData}`);
        try {
          formProvider.updateForm(formId, formBindingData, (error, data) => {
            console.log(`${callbackName} ${tcNumber} updateForm data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
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
      const tcNumber: number = (i + 1 + length * 3) * 100;
      /**
       * @tc.name fuzzTest
       * @tc.number FMS_fuzzTest_updateform_2500 ~ FMS_fuzzTest_updateform_3200
       * @tc.desc Check whether the updateForm interface can pass the fuzzy test (by Promise)
       */
      it(`${promiseName}_${tcNumber}`, filterParameter, async (done:Function) => {
        const dataType:string = DATA_TYPE_LIST[i];
        const formId:string = `${tcNumber}`;
        const formBindingData:formBindingData.FormBindingData = getFuzzData(dataType) as formBindingData.FormBindingData;
        console.log(`${promiseName} ${tcNumber} formId typeof: ${typeof formId}`);
        console.log(`${promiseName} ${tcNumber} formBindingData typeof: ${typeof formBindingData}`);
        try {
          const data = await formProvider.updateForm(formId, formBindingData);
          console.log(`${promiseName} ${tcNumber} updateForm data: ${JSON.stringify(data)}`);
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
