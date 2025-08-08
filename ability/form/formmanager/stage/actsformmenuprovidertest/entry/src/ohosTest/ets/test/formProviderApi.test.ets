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

const COMMON_TAG = 'FormProviderApi';
const DOMAIN = 0xF811;
const PUBLISH_BUNDLE_NAME = 'com.example.menuprovider';
const ERROR_CODE = 16501000;
const ERROR_CODE2 = 16500100;
const ERROR_CODE3 = 801;
const ERROR_CODE4 = 202
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
     * @tc.number: Test_Form_Provider_0100
     * @tc.name: promise form getPublishedFormInfos system interface interception test
     * @tc.desc:  Query the cards that the application has loaded on the desktop
     * @tc.level   3
     */
    it('Test_Form_Provider_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG:string = 'Test_Form_Provider_0100';
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
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
     * @tc.number: Test_Form_Provider_0200
     * @tc.name: promise form getPublishedFormInfoById system interface interception test
     * @tc.desc:  Query the cards that the application has loaded on the desktop by formId
     * @tc.level   3
     */
    it('Test_Form_Provider_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Test_Form_Provider_0200';
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
     * @tc.number: Test_Form_Provider_0300
     * @tc.name: promise form openFormManager system interface interception test
     * @tc.desc:  Open the card management page 
     * @tc.level   3
     */
    it('Test_Form_Provider_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'Test_Form_Provider_0300';
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
        if (error.code === ERROR_CODE) {
          expect(error.code).assertEqual(ERROR_CODE);
        } else if (error.code === ERROR_CODE2) {
          expect(error.code).assertEqual(ERROR_CODE2);
        } else if (error.code === ERROR_CODE3) {
          expect(error.code).assertEqual(ERROR_CODE3);
        } else {
          hilog.info(DOMAIN, COMMON_TAG, '%{public}s',
          `${TAG} formProvider openFormManager, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      }
      hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} end`);
    })

    /**
     * @tc.number: Test_Form_Provider_0400
     * @tc.name: Test_Form_Provider_0400
     * @tc.desc:  Open the card management page belonging to the specified bundle 
     * @tc.level   3
     */
    it('Test_Form_Provider_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG = 'Test_Form_Provider_0400';
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
     * @tc.number: Test_Form_Provider_0730
     * @tc.name: Test_Form_Provider_0730
     * @tc.desc:  Query the cards that the application has loaded on the desktop
     * @tc.level   3
     */
    it('Test_Form_Provider_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let TAG: string = 'Test_Form_Provider_0730';
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
     * @tc.number: Test_Form_Provider_0731
     * @tc.name: Test_Form_Provider_0731
     * @tc.desc:  Query the cards that the application has loaded on the desktop by formId
     * @tc.level   3
     */
    it('Test_Form_Provider_0731', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Test_Form_Provider_0731';
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
  })
}
