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
import FormInfo from '@ohos.application.formInfo';

function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

export const getAllFormsInfoTest = (describeName, filterParameter) => {
  const ERR_OK_CODE = 0;
  const ERR_OK = `success`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_0500 callback`;
    const promiseName = `FMS_getFormsInfo_0500 promise`;
    var tempDataB = undefined;
    var tempDataC = undefined;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0500
     * @tc.desc: Query all form configuration information (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getAllFormsInfo((error, data) => {
          console.log(`${callbackName} getAllFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName} forms amount: ${data.length}`);

          const dataB = data.filter((form) => {
            return `com.ohos.st.formsystemproviderb` === form.bundleName;
          });
          console.log(`${callbackName} form dataB: ${JSON.stringify(dataB)}`);
          console.log(`${callbackName} formB amount: ${dataB.length}`);
          const dataC = data.filter((form) => {
            return `com.ohos.st.formsystemproviderc` === form.bundleName;
          });
          console.log(`${callbackName} form dataC: ${JSON.stringify(dataC)}`);
          console.log(`${callbackName} formC amount: ${dataC.length}`);

          expect(dataB.length).assertEqual(1);
          expect(dataC.length).assertEqual(1);
         
          tempDataB = dataB[0];
          tempDataC = dataC[0];
          expect(error.code).assertEqual(ERR_OK_CODE);
        });
        await sleep(2000)
        checkDataB(tempDataB)
        checkDataC(tempDataC)
        done();
        console.log(`==========${callbackName} ${describeName} end==========`);
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_0500
     * @tc.desc: Query all form configuration information (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getAllFormsInfo();
        console.log(`${promiseName} getAllFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} forms amount: ${data.length}`);

        const dataB = data.filter((form) => {
          return `com.ohos.st.formsystemproviderb` === form.bundleName;
        });
        console.log(`${promiseName} form dataB: ${JSON.stringify(dataB)}`);
        console.log(`${promiseName} formB amount: ${dataB.length}`);
        const dataC = data.filter((form) => {
          return `com.ohos.st.formsystemproviderc` === form.bundleName;
        });
        console.log(`${promiseName} form dataC: ${JSON.stringify(dataC)}`);
        console.log(`${promiseName} formC amount: ${dataC.length}`);

        expect(dataB.length).assertEqual(1);
        expect(dataC.length).assertEqual(1);
        tempDataB = dataB[0];
        tempDataC = dataC[0];
        checkDataB(tempDataB)
        checkDataC(tempDataC)
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
        done();
      }
    });
    function checkDataB(formInfo){
         expect("com.ohos.st.formsystemproviderb").assertEqual(formInfo.bundleName)
         expect("form_module_b").assertEqual(formInfo.moduleName)
         expect("com.ohos.st.formsystemproviderb.MainAbility").assertEqual(formInfo.abilityName)
         expect("FormB_Js001").assertEqual(formInfo.name)
         expect("form_description_FormB_Js001").assertEqual(formInfo.description)
         expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
         expect('card_b').assertEqual(formInfo.jsComponentName)
         expect(FormInfo.ColorMode.MODE_AUTO).assertEqual(formInfo.colorMode)
         expect(formInfo.isDefault).assertTrue()
         expect(formInfo.updateEnabled).assertTrue()
         expect(formInfo.formVisibleNotify).assertTrue()
         expect('').assertEqual(formInfo.relatedBundleName)
         expect("abilityb").assertEqual(formInfo.formConfigAbility)
         expect(3).assertEqual(formInfo.updateDuration)
         expect(2).assertEqual(formInfo.defaultDimension)
         expect('10:30').assertEqual(formInfo.scheduledUpdateTime)
         expect(1).assertEqual(formInfo.supportDimensions[0])
         expect(2).assertEqual(formInfo.supportDimensions[1])
         expect('valueB').assertEqual(formInfo.customizeData.originWidgetNameB)
      }
    function checkDataC(formInfo){
         expect("com.ohos.st.formsystemproviderc").assertEqual(formInfo.bundleName)
         expect("form_module_c").assertEqual(formInfo.moduleName)
         expect("com.ohos.st.formsystemproviderc.MainAbility").assertEqual(formInfo.abilityName)
         expect("FormC_Js001").assertEqual(formInfo.name)
         expect("form_description_FormC_Js001").assertEqual(formInfo.description)
         expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
         expect('card_c').assertEqual(formInfo.jsComponentName)
         expect(FormInfo.ColorMode.MODE_LIGHT).assertEqual(formInfo.colorMode)
         expect(formInfo.isDefault).assertTrue()
         expect(formInfo.updateEnabled).assertTrue()
         expect(formInfo.formVisibleNotify).assertTrue()
         expect('').assertEqual(formInfo.relatedBundleName)
         expect("abilityc").assertEqual(formInfo.formConfigAbility)
         expect(4).assertEqual(formInfo.updateDuration)
         expect('15:30').assertEqual(formInfo.scheduledUpdateTime)
         expect(3).assertEqual(formInfo.defaultDimension)
         expect(3).assertEqual(formInfo.supportDimensions[0])
         expect(4).assertEqual(formInfo.supportDimensions[1])
         expect('valueC').assertEqual(formInfo.customizeData.originWidgetNameC)
      }
  });
};
