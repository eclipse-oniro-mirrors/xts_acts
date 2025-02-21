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

export const getFormsInfoTest = (describeName, filterParameter) => {
  const ERR_OK_CODE = 0;
  const ERR_OK = `success`;
  const ERR_GET_BUNDLE_FAILED_CODE = 5;
  const ERR_GET_BUNDLE_FAILED = `failed to obtain the bundle information`;
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;
  function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
  }

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_Callback_0900`;
    const promiseName = `FMS_getFormsInfo_Promise_0900`;
    const bundleName = ``;
    const callbackName1 = `FMS_getFormsInfo_Callback_1000 `;
    const promiseName1 = `FMS_getFormsInfo_Promise_1000`;
    const bundleName1 = `wrong.bundle.name`;
    const callbackName2 = `FMS_getFormsInfo_Callback_1100`;
    const promiseName2 = `FMS_getFormsInfo_Promise_1100`;
    const bundleName2 = `com.ohos.st.formsystemproviderb`;
    const callbackName3 = `FMS_getFormsInfo_Callback_1400`;
    const promiseName3 = `FMS_getFormsInfo_Promise_1400`;
    const bundleName3 = ``;
    const moduleName = `form_module_c`;
    const callbackName4 = `FMS_getFormsInfo_Callback_1500`;
    const promiseName4 = `FMS_getFormsInfo_Promise_1500`;
    const bundleName4 = `wrong.bundle.name`;
    const moduleName1 = `form_module_c`;
    const callbackName5 = `FMS_getFormsInfo_Callback_1600`;
    const promiseName5 = `FMS_getFormsInfo_promise_1600`;
    const bundleName5 = `com.ohos.st.formsystemproviderc`;
    const moduleName2 = ``;
    const callbackName6 = `FMS_getFormsInfo_Callback_1700`;
    const promiseName6 = `FMS_getFormsInfo_promise_1700`;
    const bundleName6 = `com.ohos.st.formsystemproviderc`;
    const moduleName3 = `wrong.module.name`;
    const callbackName7 = `FMS_getFormsInfo_Callback_1800`;
    const promiseName7 = `FMS_getFormsInfo_Promise_1800`;
    const bundleName7 = `com.ohos.st.formsystemproviderc`;
    const moduleName4 = `form_module_c`;
    var tempDataB = undefined;
    var tempDataC = undefined;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0900
     * @tc.desc: Query specific form configuration information by empty bundle name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_0900
     * @tc.desc: Query specific form configuration information by empty bundle name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1000
     * @tc.desc: Query specific form configuration information by wrong bundle name (by AsyncCallback)
     */
    it(`${callbackName1}`, filterParameter, async (done) => {
      console.log(`==========${callbackName1} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName1, (error, data) => {
          console.log(`${callbackName1} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
          expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          done();
          console.log(`==========${callbackName1} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName1} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName1} should not reach here`);
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1000
     * @tc.desc: Query specific form configuration information by wrong bundle name (by Promise)
     */
    it(`${promiseName1}`, filterParameter, async (done) => {
      console.log(`==========${promiseName1} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName1);
        console.log(`${promiseName1} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName1} should not reach here`);
        expect().assertFail();
        done()
      } catch (error) {
        console.log(`${promiseName1} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
        expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
        done();
        console.log(`==========${promiseName1} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1100
     * @tc.desc: Query specific form configuration information by correct bundle name (by AsyncCallback)
     */
    it(`${callbackName2}`, filterParameter, async (done) => {
      console.log(`==========${callbackName2} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName2, (error, data) => {
          console.log(`${callbackName2} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName2} forms amount: ${data.length}`);

          const dataB = data.filter((form) => {
            return `com.ohos.st.formsystemproviderb` === form.bundleName;
          });
          console.log(`${callbackName2} form dataB: ${JSON.stringify(dataB)}`);
          console.log(`${callbackName2} formB amount: ${dataB.length}`);

          expect(data.length).assertEqual(1);
          expect(dataB.length).assertEqual(1);
          tempDataB = dataB[0]
          expect(error.code).assertEqual(ERR_OK_CODE);
          console.log(`==========${callbackName2} ${describeName} end==========`);
        });
        await sleep(2000)
        checkDataB(tempDataB)
        done()
      } catch (error) {
        console.log(`${callbackName2} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName2} should not reach here`);
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1100
     * @tc.desc: Query specific form configuration information by correct bundle name (by Promise)
     */
    it(`${promiseName2}`, filterParameter, async (done) => {
      console.log(`==========${promiseName2} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName2);
        console.log(`${promiseName2} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName2} forms amount: ${data.length}`);

        const dataB = data.filter((form) => {
          return `com.ohos.st.formsystemproviderb` === form.bundleName;
        });
        console.log(`${promiseName2} form dataB: ${JSON.stringify(dataB)}`);
        console.log(`${promiseName2} formB amount: ${dataB.length}`);

        expect(data.length).assertEqual(1);
        expect(dataB.length).assertEqual(1);
        tempDataB = dataB[0]
        checkDataB(tempDataB)
        done();
        console.log(`==========${promiseName2} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName2} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName2} should not reach here`);
        expect().assertFail();
        done()
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

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1400
     * @tc.desc: Query specific form configuration information by empty bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName3}`, filterParameter, async (done) => {
      console.log(`==========${callbackName3} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName3, moduleName, (error, data) => {
          console.log(`${callbackName3} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName3} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName3} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName3} should not reach here`);
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1400
     * @tc.desc: Query specific form configuration information by empty bundle name and correct module name (by Promise)
     */
    it(`${promiseName3}`, filterParameter, async (done) => {
      console.log(`==========${promiseName3} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName3, moduleName);
        console.log(`${promiseName3} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName3} should not reach here`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${promiseName3} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
        done();
        console.log(`==========${promiseName3} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1500
     * @tc.desc: Query specific form configuration information by wrong bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName4}`, filterParameter, async (done) => {
      console.log(`==========${callbackName4} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName4, moduleName1, (error, data) => {
          console.log(`${callbackName4} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
          expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          done();
          console.log(`==========${callbackName4} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName4} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName4} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1500
     * @tc.desc: Query specific form configuration information by wrong bundle name and correct module name (by Promise)
     */
    it(`${promiseName4}`, filterParameter, async (done) => {
      console.log(`==========${promiseName4} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName4, moduleName1);
        console.log(`${promiseName4} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName4} should not reach here`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${promiseName4} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
        expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
        done();
        console.log(`==========${promiseName4} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1600
     * @tc.desc: Query specific form configuration information by correct bundle name and empty module name (by AsyncCallback)
     */
    it(`${callbackName5}`, filterParameter, async (done) => {
      console.log(`==========${callbackName5} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName5, moduleName2, (error, data) => {
          console.log(`${callbackName5} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName5} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName5} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName5} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1600
     * @tc.desc: Query specific form configuration information by correct bundle name and empty module name (by Promise)
     */
    it(`${promiseName5}`, filterParameter, async (done) => {
      console.log(`==========${promiseName5} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName5, moduleName2);
        console.log(`${promiseName5} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName5} should not reach here`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${promiseName5} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
        done();
        console.log(`==========${promiseName5} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1700
     * @tc.desc: Query specific form configuration information by correct bundle name and wrong module name (by AsyncCallback)
     */
    it(`${callbackName6}`, filterParameter, async (done) => {
      console.log(`==========${callbackName6} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName6, moduleName3, (error, data) => {
          console.log(`${callbackName6} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(JSON.stringify(data)).assertEqual(`[]`);
          expect(error.code).assertEqual(ERR_OK_CODE);
          done();
          console.log(`==========${callbackName6} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName6} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName6} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1700
     * @tc.desc: Query specific form configuration information by correct bundle name and wrong module name (by Promise)
     */
    it(`${promiseName6}`, filterParameter, async (done) => {
      console.log(`==========${promiseName6} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName6, moduleName3);
        console.log(`${promiseName6} getFormsInfo data: ${JSON.stringify(data)}`);
        expect(JSON.stringify(data)).assertEqual(`[]`);
        done();
        console.log(`==========${promiseName6} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName6} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName6} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1800
     * @tc.desc: Query specific form configuration information by correct bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName7}`, filterParameter, async (done) => {
      console.log(`==========${callbackName7} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName7, moduleName4, (error, data) => {
          console.log(`${callbackName7} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName7} forms amount: ${data.length}`);

          const dataC = data.filter((form) => {
            return `com.ohos.st.formsystemproviderc` === form.bundleName;
          });
          console.log(`${callbackName7} form dataC: ${JSON.stringify(dataC)}`);
          console.log(`${callbackName7} formC amount: ${dataC.length}`);
          tempDataC = dataC[0];
          expect(data.length).assertEqual(1);
          expect(dataC.length).assertEqual(1);
          expect(error.code).assertEqual(ERR_OK_CODE);
          console.log(`==========${callbackName7} ${describeName} end==========`);
        });
        await sleep(2000)
        checkDataC(tempDataC)
        tempDataC = undefined;
        done();
      } catch (error) {
        console.log(`${callbackName7} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName7} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1800
     * @tc.desc: Query specific form configuration information by correct bundle name and correct module name (by Promise)
     */
    it(`${promiseName7}`, filterParameter, async (done) => {
      console.log(`==========${promiseName7} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName7, moduleName4);
        console.log(`${promiseName7} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName7} forms amount: ${data.length}`);

        const dataC = data.filter((form) => {
          return `com.ohos.st.formsystemproviderc` === form.bundleName;
        });
        console.log(`${promiseName7} form dataC: ${JSON.stringify(dataC)}`);
        console.log(`${promiseName7} formC amount: ${dataC.length}`);

        expect(data.length).assertEqual(1);
        expect(dataC.length).assertEqual(1);
        tempDataC = dataC[0];
        console.log(`==========${promiseName7} ${describeName} end==========`);
        checkDataC(tempDataC)
        done()
      } catch (error) {
        console.log(`${promiseName7} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName7} should not reach here`);
        expect().assertFail();
        done();
      }
    });
    
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
         expect(3).assertEqual(formInfo.defaultDimension)
         expect(3).assertEqual(formInfo.supportDimensions[0])
         expect(4).assertEqual(formInfo.supportDimensions[1])
         expect('valueC').assertEqual(formInfo.customizeData.originWidgetNameC)
      }
  });
};
