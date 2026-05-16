/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

let DOMAIN: int = 0x0000;
let TAG: string = 'testTag';
const TEST_RESULT_KEY = 'result';
const TEST_SUITE_NAME: string = 'ActsAppServiceExtensionContextNoPermissionStaticTest';
const BUNDLE_NAME: string = 'com.acts.context.appserviceextensionnopermission.static';
const WAIT_TIME2000: int = 2000;
const ERROR_CODE_801: int = 801;

async function stopAppServiceExtAbility(want: Want, context: common.UIAbilityContext|null, testCaseName: string) {
  if (!context) {
    hilog.info(DOMAIN, TAG, `${testCaseName} context is null`);
    return;
   }
  try {
    await context.stopAppServiceExtensionAbility(want)
      .then(() => {
        hilog.info(DOMAIN, TAG, `${testCaseName} stopAppServiceExtensionAbility success`);
      })
      .catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${testCaseName} stopAppServiceExtensionAbility failed, code is ${err.code}`);
      });
  } catch (error) {
    let err = error as BusinessError;
    hilog.info(DOMAIN, TAG, `${testCaseName} stopAppServiceExtensionAbility failed, code is ${err.code}`);
  }
}

export default function ActsAppServiceExtensionContextNoPermissionStaticTest() {
  describe('ActsAppServiceExtensionContextNoPermissionStaticTest', (): void => {
    let context: common.UIAbilityContext|null = null;
    beforeAll(async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll start`);
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await Utils.msSleep(WAIT_TIME2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(WAIT_TIME2000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll end`);
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1900
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1900
     * @tc.desc   AppServiceExtensionContext startAbility 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1900';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(201);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}, ` +
              `message is ${err?.message}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })
  })
}