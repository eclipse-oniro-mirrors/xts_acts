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

import hilog from '@ohos.hilog';
import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import formProvider from '@ohos.app.form.formProvider'
import Want from '@ohos.app.ability.Want';
import formInfo from '@ohos.app.form.formInfo';
import formBindingData from '@ohos.app.form.formBindingData';

const COMMON_TAG = 'FormProviderApi';
const DOMAIN = 0xF811;
const PUBLISH_BUNDLE_NAME = 'com.example.menuprovider';
const ERROR_CODE = 16501000;
const ERROR_CODE1 = 401;
const ERROR_CODE2 = 16500100;
const ERROR_CODE3 = 801;
const ERROR_CODE4 = 202;
const ERROR_CODE5 = 16500050;
const ERROR_CODE6 = 16501003;
const ERROR_CODE7 = 16501007;
const ERROR_CODE8 = 16501001;
const ERROR_CODE9 = 16500060;
const ERROR_CODE10 = 16501015;

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function formProviderTest() {
  describe('formProviderTest', () => {
    beforeAll(async () => {
      await sleep(1000);
    })

    beforeEach(async () => {
      await abilityDelegator.executeShellCommand("hilog -r");
      await sleep(500);
      await abilityDelegator.startAbility({
        bundleName: PUBLISH_BUNDLE_NAME,
        abilityName: 'TestFormAbility'
      })
      await sleep(1000);
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 'test start');
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0100
     * @tc.desc   Query the cards that the application has loaded on the desktop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG:string = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0100';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      if (formInfo.FormParam.EDIT_FORM_KEY) {
        expect("ohos.extra.param.key.edit_form_id").assertEqual(formInfo.FormParam.EDIT_FORM_KEY);
      }
      formProvider.getPublishedFormInfos().then((data: formInfo.FormInfo[]) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedFormInfos success, data: ${JSON.stringify(data)}`);
        expect(data.length).assertEqual(1);
        done();
      }).catch((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedFormInfos error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0200
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0200
     * @tc.desc   Query the cards that the application has loaded on the desktop by formId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0200';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let formId: string = '0';
      await formProvider.getPublishedFormInfos().then((data: formInfo.FormInfo[]) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedFormInfos success, data: ${JSON.stringify(data)}`);
        if (data) {
          formId = JSON.parse(JSON.stringify(data[0])).formId;
        }
      }).catch ((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedFormInfos error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      });
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formId: ${formId}`);
      formProvider.getPublishedFormInfoById(formId).then((data: formInfo.FormInfo) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedFormInfoById success, data: ${JSON.stringify(data)}`);
        done();
      }).catch ((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedFormInfoById error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0300
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0300
     * @tc.desc   Open the card management page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0300';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let want: Want = {
        bundleName: PUBLISH_BUNDLE_NAME,
        abilityName: "TestAbility",
        parameters: {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry_test"
        }
      };
      try {
        formProvider.openFormManager(want);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formProvider openFormManager success`);
        done();
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        hilog.error(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider openFormManager, catch error, 
          code: ${businessError.code}, message: ${businessError.message})`);
        if (businessError.code === ERROR_CODE) {
          expect(businessError.code).assertEqual(ERROR_CODE);
        } else if (businessError.code === ERROR_CODE2) {
          expect(businessError.code).assertEqual(ERROR_CODE2);
        } else if (businessError.code === ERROR_CODE3) {
          expect(businessError.code).assertEqual(ERROR_CODE3);
        } else if (businessError.code === ERROR_CODE5) {
          expect(businessError.code).assertEqual(ERROR_CODE5);
        } else {
          expect().assertFail();
        }
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0400
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0400
     * @tc.desc   Open the card management page belonging to the specified bundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0400';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let want: Want = {
        bundleName: PUBLISH_BUNDLE_NAME,
        abilityName: "TestAbility",
        parameters: {
          "ohos.extra.param.key.form_dimension": 2,
          "ohos.extra.param.key.form_name": "widget",
          "ohos.extra.param.key.module_name": "entry_test"
        }
      };
      try {
        formProvider.openFormManagerCrossBundle(want)
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formProvider openFormManagerCrossBundle success`);
        done();
      } catch (error) {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE4);
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0700
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0700
     * @tc.desc   Query the cards that the application has loaded on the desktop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG: string = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0700';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      formProvider.getPublishedRunningFormInfos().then((data: formInfo.RunningFormInfo[]) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedRunningFormInfos success, data: ${JSON.stringify(data)}`);
        done();
      }).catch((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedRunningFormInfos error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0800
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0800
     * @tc.desc   Query the cards that the application has loaded on the desktop by formId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_0800';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let formId: string = '0';
      await formProvider.getPublishedRunningFormInfos().then((data: formInfo.RunningFormInfo[]) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedRunningFormInfos success, data: ${JSON.stringify(data)}`);
        if (data) {
          formId = JSON.parse(JSON.stringify(data[0])).formId;
        }
      }).catch ((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedRunningFormInfos error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      });
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formId: ${formId}`);
      formProvider.getPublishedRunningFormInfoById(formId).then((data: formInfo.RunningFormInfo) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedRunningFormInfoById success, data: ${JSON.stringify(data)}`);

        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formProvider getPublishedRunningFormInfoById success,
        formId:${data.formId}, bundleName: ${data.bundleName}, moduleName:${data.moduleName}, abilityName:${data.abilityName},
        formName:${data.formName}, dimension:${data.dimension}, formLocation:${data.formLocation}`);
        done();
      }).catch ((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedRunningFormInfoById error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_OPEN_FORM_EDIT_ABILITY_0900
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_OPEN_FORM_EDIT_ABILITY_0900
     * @tc.desc   Open the card EditAbility page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_OPEN_FORM_EDIT_ABILITY_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_OPEN_FORM_EDIT_ABILITY_0900';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let formId: string = '0';
      await formProvider.getPublishedRunningFormInfos().then((data: formInfo.RunningFormInfo[]) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedRunningFormInfos success, data: ${JSON.stringify(data)}`);
        if (data) {
          formId = JSON.parse(JSON.stringify(data[0])).formId;
        }
      }).catch ((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if(error.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedRunningFormInfos error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      });
      try {
        formProvider.openFormEditAbility('ability://EntryFormEditAbility', formId);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formProvider openFormEditAbility success`);
        done();
      } catch (error) {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if(error.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE6) {
          expect(error.code).assertEqual(ERROR_CODE6);
        } else if (error.code === ERROR_CODE7) {
          expect(error.code).assertEqual(ERROR_CODE7);
        } else if (error.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error.code === ERROR_CODE8) {
          expect(error.code).assertEqual(ERROR_CODE8);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
            `${TAG} formProvider openFormEditAbility, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0900
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0900
     * @tc.desc   Close the card EditAbility page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0900';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      try {
        formProvider.closeFormEditAbility();
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formProvider closeFormEditAbility success`);
        done();
      } catch (error) {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else if (error.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error.code === ERROR_CODE10) {
          expect(error.code).assertEqual(ERROR_CODE10);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
            `${TAG} formProvider closeFormEditAbility, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0901
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0901
     * @tc.desc   Close the card EditAbility page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_CLOSE_FORM_EDIT_ABILITY_0901';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      try {
        formProvider.closeFormEditAbility(false);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} formProvider closeFormEditAbility success`);
        done();
      } catch (error) {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else if (error.code === ERROR_CODE5) {
          expect(error.code).assertEqual(ERROR_CODE5);
        } else if (error.code === ERROR_CODE10) {
          expect(error.code).assertEqual(ERROR_CODE10);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
            `${TAG} formProvider closeFormEditAbility, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1000
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1000
     * @tc.desc   Open the card EditAbility page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1000';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let formId: string = '0';
      await formProvider.getPublishedRunningFormInfos().then((data: formInfo.RunningFormInfo[]) => {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', 
        `${TAG} formProvider getPublishedRunningFormInfos success, data: ${JSON.stringify(data)}`);
        if (data) {
          formId = JSON.parse(JSON.stringify(data[0])).formId;
        }
      }).catch ((error: BusinessError) => {
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if(error.code === ERROR_CODE1) {
          expect(error.code).assertEqual(ERROR_CODE1);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider getPublishedRunningFormInfos error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      });
      try {
        let param: Record<string, string> = {
          'temperature': '22c',
          'time': '22:00'
        }
        let obj: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);
        formProvider.updateForm(formId, obj, (error: BusinessError) => {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
            `${TAG} formProvider updateForm, formProvider updateForm sucess error ${JSON.stringify(error)}`);
          if (error === null) {
            expect(error).assertNull();
          } else if (error.code === ERROR_CODE) {
            expect(error.code).assertEqual(ERROR_CODE);
          } else if (error.code === ERROR_CODE2) {
            expect(error.code).assertEqual(ERROR_CODE2);
          } else if (error.code === ERROR_CODE6) {
            expect(error.code).assertEqual(ERROR_CODE6);
          } else if (error.code === ERROR_CODE9) {
            expect(error.code).assertEqual(ERROR_CODE9);
          } else if (error.code === ERROR_CODE5) {
            expect(error.code).assertEqual(ERROR_CODE5);
          } else if (error.code === ERROR_CODE8) {
            expect(error.code).assertEqual(ERROR_CODE8);
          } else if (error.code === ERROR_CODE1) {
            expect(error.code).assertEqual(ERROR_CODE1);
          } else {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
              `${TAG} formProvider updateForm, error: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
            `${TAG} formProvider updateForm, formProvider updateForm success`);
          done();
        });
      } catch (error) {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} error`);
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1100
     * @tc.number SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1100
     * @tc.desc   Open the card EditAbility page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_ABILITY_FORM_FWK_TEST_FORM_PROVIDER_1100';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
      let formId: string = '12400633174999288';
      let param: Record<string, string> = {
        'temperature': '22c',
        'time': '22:00'
      }
      let obj: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);
      try {
        formProvider.updateForm(formId, obj).then(() => {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `formProvider updateForm success`);
          done();
        }).catch((error: BusinessError) => {
          if (error.code === ERROR_CODE) {
            expect(error.code).assertEqual(ERROR_CODE);
          } else if (error.code === ERROR_CODE2) {
            expect(error.code).assertEqual(ERROR_CODE2);
          } else if (error.code === ERROR_CODE6) {
            expect(error.code).assertEqual(ERROR_CODE6);
          } else if (error.code === ERROR_CODE9) {
            expect(error.code).assertEqual(ERROR_CODE9);
          } else if (error.code === ERROR_CODE5) {
            expect(error.code).assertEqual(ERROR_CODE5);
          } else if (error.code === ERROR_CODE8) {
            expect(error.code).assertEqual(ERROR_CODE8);
          } else if (error.code === ERROR_CODE1) {
            expect(error.code).assertEqual(ERROR_CODE1);
          } else {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
              `${TAG} formProvider updateForm, error: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          done();
        });
      } catch (error) {
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} error`);
        done();
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    });
  })
}
