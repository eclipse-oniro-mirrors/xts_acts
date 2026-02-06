/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import formInfo  from '@ohos.application.formInfo';
import formError from '@ohos.application.formError';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Want from '@ohos.app.ability.Want';
import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import FormEditExtensionAbility from '@ohos.app.form.FormEditExtensionAbility';

const INTERVAL_TIME = 2500;

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

let module1Want: Want = {
  deviceId: "",
  bundleName: "com.ohos.st.formsystemhost",
  abilityName: "com.ohos.st.formsystemhost.MainAbility",
  parameters: {
      "formId": "0",
      "name": "Form_Js001",
      "bundle": "com.acts.form.formsystemtestservicea.hmservice",
      "ability": "",
      "moduleName": "entry",
      "temporary": false,
      "isCreate": true
  }
}

let module2FormStateInfo: formInfo.FormStateInfo = {
  formState: formInfo.FormState.DEFAULT,
  want: module1Want
}

let module1FormInfo: formInfo.FormInfo = {
  bundleName: "com.example.getformsinfotest",
  moduleName: "entry",
  abilityName: "EntryFormAbility",
  name: "widget",
  description: "This is a service widget.",
  type:2,
  jsComponentName: "",
  colorMode: -1,
  isDefault: false,
  updateEnabled: true,
  formVisibleNotify: false,
  relatedBundleName:"com.example.getformsinfotest",
  scheduledUpdateTime: "10:30",
  formConfigAbility: "",
  updateDuration: 0,
  defaultDimension:2,
  supportDimensions:[1,2,3,4],
  customizeData: {}
}

let module1ProxyData: formBindingData.ProxyData = {
  key: "123456789",
  subscriberId: "123456789"
}

let module2ProxyData: formBindingData.ProxyData = {
  key: "abcdefg",
  subscriberId: "abcdefg"
}

let proxyDatas: formBindingData.ProxyData[] = Array();
proxyDatas.push(module1ProxyData);
proxyDatas.push(module2ProxyData);


let module1Data: formBindingData.FormBindingData = {
  data: "com.example.getformsinfotest",
  proxies: proxyDatas
}

export default function FormApiCoverTest() {
  describe('FormApiCoverTestTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, INTERVAL_TIME);
    })

    /*
     * @tc.number  StartSecondPage_Cover_0100
     * @tc.name    StartSecondPage_Cover_0100
     * @tc.desc    Function startSecondPage covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it(`StartSecondPage_Cover_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'StartSecondPage_Cover_0100';
      console.info(`${name} start`);
      try {
        let abilityTest:FormEditExtensionAbility = new FormEditExtensionAbility();
        abilityTest.context.startSecondPage(module1Want);
        expect().assertFail();
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
        done();
      }
      console.info(`${name} end`);
    });

    /*
     * @tc.number  SetFormNextRefreshTime_Cover_0100
     * @tc.name    SetFormNextRefreshTime_Cover_0100
     * @tc.desc    Function setFormNextRefreshTime covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it(`SetFormNextRefreshTime_Cover_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'SetFormNextRefreshTime_Cover_0100';
      console.info(`${name} start`);
      try {
        const data = await formProvider.setFormNextRefreshTime("", 123);
        console.log(`${name} setFormNextRefreshTime, data: ${JSON.stringify(data)}`);
        console.log(`${name} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info(`${name} end`);
    });

    /*
     * @tc.number  SetFormNextRefreshTime_Cover_0200
     * @tc.name    SetFormNextRefreshTime_Cover_0200
     * @tc.desc    Function setFormNextRefreshTime covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it(`SetFormNextRefreshTime_Cover_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'SetFormNextRefreshTime_Cover_0100';
      console.info(`${name} start`);
      try {
        formProvider.setFormNextRefreshTime("", 123, (error, data) => {
          console.log(`${name} setFormNextRefreshTime, error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info(`${name} end`);
    });

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormErr_0100
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormErr_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_Form_provider_TestFormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM);
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED);
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID);
      expect(1).assertEqual(formError.FormError.ERR_COMMON);
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED);
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED);
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY);
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION);
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE);
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED);
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED);
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED);
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY);
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT);
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM);
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS);
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS);
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID);
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF);
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY);
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL);
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED);
      done();
    });

    /**
     * @tc.number    : SUB_AA_Form_Cover_FormInfo_0100
     * @tc.name      : SUB_AA_Form_Cover_FormInfo_0100
     * @tc.desc      : formInfo.FormStateInfo Coverage test.
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_AA_Form_Cover_FormInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_Form_Cover_FormInfo_0100';
      console.info(`${name} start`);
      let stateInfo: formInfo.FormStateInfo = module2FormStateInfo;
      expect(0).assertEqual(stateInfo.formState);
      expect("com.ohos.st.formsystemhost.MainAbility").assertEqual(stateInfo.want.abilityName);
      
      expect().not().assertFail();
      done();
      console.info(`${name} end`);
    });

    /**
     * @tc.number    : SUB_AA_Form_Cover_FormInfo_0200
     * @tc.name      : SUB_AA_Form_Cover_FormInfo_0200
     * @tc.desc      : formInfo.FormInfo Coverage test.
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_AA_Form_Cover_FormInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_AA_Form_Cover_FormInfo_0200';
      console.info(`${name} start`);
      let info: formInfo.FormInfo = module1FormInfo;
      checkFormInfo(info);
      expect().not().assertFail();
      done();
      console.info(`${name} end`);
    });

    /**
     * @tc.number    : SUB_AA_Form_Cover_FormInfo_0300
     * @tc.name      : SUB_AA_Form_Cover_FormInfo_0300
     * @tc.desc      : cover EnumValue IDENTITY_KEY.
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_AA_Form_Cover_FormInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info("SUB_AA_Form_Cover_FormInfo_0300 start");
      expect("ohos.extra.param.key.form_identity").assertEqual(formInfo.FormParam.IDENTITY_KEY);
      done();
      console.info("SUB_AA_Form_Cover_FormInfo_0300 end");
    });

    /**
     * @tc.number    : SUB_AA_Form_Cover_FormBindingData_0100
     * @tc.name      : SUB_AA_Form_Cover_FormBindingData_0100
     * @tc.desc      : FormBindingData Coverage test.
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_AA_Form_Cover_FormBindingData_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info("SUB_AA_Form_Cover_FormBindingData_0100 start");
      let bindingData: formBindingData.FormBindingData = module1Data;
      expect("com.example.getformsinfotest").assertEqual(bindingData.data);
      if (bindingData.proxies?.length === 2) {
        expect("123456789").assertEqual(bindingData.proxies[0].key);
        expect("123456789").assertEqual(bindingData.proxies[0].subscriberId);
      }
      expect().not().assertFail();
      done();
      console.info("SUB_AA_Form_Cover_FormBindingData_0100 end");
    });

    let checkFormInfo = (result: formInfo.FormInfo) => {
      console.info("checkFormInfo start");
      expect("com.example.getformsinfotest").assertEqual(result.bundleName);
      expect("entry").assertEqual(result.moduleName);
      expect("EntryFormAbility").assertEqual(result.abilityName);
      expect("widget").assertEqual(result.name);
      expect("This is a service widget.").assertEqual(result.description);
      expect("com.example.getformsinfotest").assertEqual(result.relatedBundleName);
      expect(2).assertEqual(result.type);
      expect("").assertEqual(result.jsComponentName);
      expect(-1).assertEqual(result.colorMode);
      expect(false).assertEqual(result.isDefault);
      expect(true).assertEqual(result.updateEnabled);
      expect(false).assertEqual(result.formVisibleNotify);
      expect("10:30").assertEqual(result.scheduledUpdateTime);
      expect("").assertEqual(result.formConfigAbility);
      expect(0).assertEqual(result.updateDuration);
      expect(2).assertEqual(result.defaultDimension);
      expect(JSON.stringify([1,2,3,4])).assertEqual(JSON.stringify(result.supportDimensions));
      expect(JSON.stringify({})).assertEqual(JSON.stringify(result.customizeData));
      console.info("checkFormInfo end");
    };
  })
}