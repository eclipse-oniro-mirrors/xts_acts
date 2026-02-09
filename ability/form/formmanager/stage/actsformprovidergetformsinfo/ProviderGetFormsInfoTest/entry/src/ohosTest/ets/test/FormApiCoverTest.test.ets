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

import { describe, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import formInfo  from '@ohos.application.formInfo';
import formError from '@ohos.application.formError';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Want from '@ohos.app.ability.Want';
import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import FormEditExtensionAbility from '@ohos.app.form.FormEditExtensionAbility';
import hilog from '@ohos.hilog';

const tag: string = 'testTag';
const domain: number = 0xF811;

const INTERVAL_TIME = 2500;

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

const ERROR_CODE1 = 401;
const ERROR_CODE2 = 16500050;
const ERROR_CODE3 = 16500060;
const ERROR_CODE4 = 16500100;
const ERROR_CODE5 = 16501000;
const ERROR_CODE6 = 16501001;
const ERROR_CODE7 = 16501002;
const ERROR_CODE8 = 16501003;
const ERROR_CODE9 = 202;
const ERROR_CODE10 = 16501014;
const ERROR_CODE11 = 16000121;
const ERROR_CODE12 = 16000130;

export default function formApiCoverTest() {
  describe('FormApiCoverTestTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, INTERVAL_TIME);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_START_SECOND_PAGE_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_START_SECOND_PAGE_COVER_0100
     * @tc.desc   Function startSecondPage covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_ABILITY_FORM_FWK_START_SECOND_PAGE_COVER_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_START_SECOND_PAGE_COVER_0100';
      console.info(`${name} start`);
      try {
        let abilityTest:FormEditExtensionAbility = new FormEditExtensionAbility();
        abilityTest.context.startSecondPage(module1Want);
        expect().assertFail();
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
         if (error.code === ERROR_CODE9) {
          expect(error.code).assertEqual(ERROR_CODE9);
        } else if(error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if(error.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if(error.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        }
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_START_UI_ABILITY_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_START_UI_ABILITY_COVER_0100
     * @tc.desc   Function startUIAbility covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_START_UI_ABILITY_COVER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_START_UI_ABILITY_COVER_0100';
      console.info(`${name} start`);
      try {
        let abilityTest:FormEditExtensionAbility = new FormEditExtensionAbility();
        abilityTest.context.startUIAbility(module1Want);
        expect().assertFail();
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
        if (error.code === ERROR_CODE9) {
          expect(error.code).assertEqual(ERROR_CODE9);
        } else if(error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if(error.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if(error.code === ERROR_CODE10) {
          expect(error.code).assertEqual(ERROR_CODE10);
        } else if(error.code === ERROR_CODE11) {
          expect(error.code).assertEqual(ERROR_CODE11);
        } else if(error.code === ERROR_CODE12) {
          expect(error.code).assertEqual(ERROR_CODE12);
        }
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0100
     * @tc.desc   Function setFormNextRefreshTime covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0100';
      console.info(`${name} start`);
      try {
        const data = await formProvider.setFormNextRefreshTime("", 123);
        console.log(`${name} setFormNextRefreshTime, data: ${JSON.stringify(data)}`);
        console.log(`${name} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
        if (error.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if(error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if(error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else if(error.code === ERROR_CODE4) {
          expect(error.code).assertEqual(ERROR_CODE4);
        } else if(error.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if(error.code === ERROR_CODE6) {
          expect(error.code).assertEqual(ERROR_CODE6);
        } else if(error.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else if(error.code === ERROR_CODE8) {
          expect(error.code).assertEqual(ERROR_CODE8);
        }
        done();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0200
     * @tc.number SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0200
     * @tc.desc   Function setFormNextRefreshTime covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0200`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_FORM_NEXT_REFRESH_TIME_COVER_0200';
      console.info(`${name} start`);
      try {
        formProvider.setFormNextRefreshTime("", 123, (error, data) => {
          console.log(`${name} setFormNextRefreshTime, error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
          if (error.code === ERROR_CODE1) {
            expect(error.code).assertEqual(ERROR_CODE1);
          } else if(error.code === ERROR_CODE2) {
            expect(error.code).assertEqual(ERROR_CODE2);
          } else if(error.code === ERROR_CODE3) {
            expect(error.code).assertEqual(ERROR_CODE3);
          } else if(error.code === ERROR_CODE4) {
            expect(error.code).assertEqual(ERROR_CODE4);
          } else if(error.code === ERROR_CODE5) {
            expect(error.code).assertEqual(ERROR_CODE5);
          } else if(error.code === ERROR_CODE6) {
            expect(error.code).assertEqual(ERROR_CODE6);
          } else if(error.code === ERROR_CODE7) {
            expect(error.code).assertEqual(ERROR_CODE7);
          } else if(error.code === ERROR_CODE8) {
            expect(error.code).assertEqual(ERROR_CODE8);
          }
          done();
        });
      } catch (error) {
        console.log(`${name} exception caught: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_PROVIDER_TEST_FORM_ERR_0100
     * @tc.number SUB_ABILITY_FORM_FWK_PROVIDER_TEST_FORM_ERR_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_PROVIDER_TEST_FORM_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_ABILITY_FORM_FWK_PROVIDER_TEST_FORM_ERR_0100");
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
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_INFO_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_INFO_0100
     * @tc.desc   formInfo.FormStateInfo Coverage test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_INFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_FORM_INFO_0100';
      console.info(`${name} start`);
      let stateInfo: formInfo.FormStateInfo = module2FormStateInfo;
      expect(0).assertEqual(stateInfo.formState);
      expect("com.ohos.st.formsystemhost.MainAbility").assertEqual(stateInfo.want.abilityName);
      
      expect().not().assertFail();
      done();
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_INFO_0200
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_INFO_0200
     * @tc.desc   formInfo.FormInfo Coverage test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_INFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_FORM_INFO_0200';
      console.info(`${name} start`);
      let info: formInfo.FormInfo = module1FormInfo;
      checkFormInfo(info);
      expect().not().assertFail();
      done();
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_INFO_0300
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_INFO_0300
     * @tc.desc   cover EnumValue IDENTITY_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_INFO_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info("SUB_ABILITY_FORM_FWK_FORM_INFO_0300 start");
      expect("ohos.extra.param.key.form_identity").assertEqual(formInfo.FormParam.IDENTITY_KEY);
      done();
      console.info("SUB_ABILITY_FORM_FWK_FORM_INFO_0300 end");
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORM_BINDING_DATA_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORM_BINDING_DATA_0100
     * @tc.desc   FormBindingData Coverage test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_FORM_BINDING_DATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info("SUB_ABILITY_FORM_FWK_FORM_BINDING_DATA_0100 start");
      let bindingData: formBindingData.FormBindingData = module1Data;
      expect("com.example.getformsinfotest").assertEqual(bindingData.data);
      if (bindingData.proxies?.length === 2) {
        expect("123456789").assertEqual(bindingData.proxies[0].key);
        expect("123456789").assertEqual(bindingData.proxies[0].subscriberId);
      }
      expect().not().assertFail();
      done();
      console.info("SUB_ABILITY_FORM_FWK_FORM_BINDING_DATA_0100 end");
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

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_CREATE_FROM_BINDING_DATA_0100
     * @tc.number SUB_ABILITY_FORM_FWK_CREATE_FROM_BINDING_DATA_0100
     * @tc.desc   createFormBindingData test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_CREATE_FROM_BINDING_DATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const itName = 'SUB_ABILITY_FORM_FWK_CREATE_FROM_BINDING_DATA_0100';
      hilog.info(domain, tag, `${itName} start`);
      try {
        hilog.info(domain, tag, `${itName} createFormBindingData`);
        let bindingData = formBindingData.createFormBindingData(undefined);
        hilog.info(domain, tag, `${itName} createFormBindingData success. bindingData: ${!!bindingData}`);
        expect(!!bindingData).assertTrue();
        done();
      } catch(error) {
        hilog.info(domain, tag, `${itName} createFormBindingData fail. error code: ${error?.code}`);
        expect(error.code).assertEqual(ERROR_CODE1);
        done();
      }
      hilog.info(domain, tag, `${itName} end`);
    });
  })
}