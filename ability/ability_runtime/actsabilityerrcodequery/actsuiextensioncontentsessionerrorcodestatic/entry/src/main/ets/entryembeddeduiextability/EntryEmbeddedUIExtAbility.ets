/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import commonEventManager from '@ohos.commonEventManager';
import { LocalStorage } from '@ohos.arkui.stateManagement';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'ActsUIExtensionContentSessionTest';
const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static';
const BUNDLE_NAME: string = 'com.example.uiextensioncontentsession.static';
const ABILITY_NAME: string = 'EntryAbility';
const TEST_CASE_KEY: string = 'caseTag';
const PARAM_1: int = 1;
let testCaseName: string = '';
let uiExtContext: common.UIExtensionContext;

class AbilityStartCallbackExt implements common.AbilityStartCallback {
  public onError(code: int, name: string, message: string): void {
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType_callback onError:` + 'code:' + code);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        'result': code,
      } as Record<string, RecordData>
    };
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish event`);
    commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
      uiExtContext.terminateSelf()
    });
  }

  public onResult?: (abilityResult: common.AbilityResult) => void = (parameter: common.AbilityResult) => {
    hilog.info(DOMAIN, TAG,
      `startAbilityByType_callback onResult, resultCode:` + parameter.resultCode + `bundleName:` +
        parameter.want?.bundleName);
  }
}

export default class EntryEmbeddedUIExtAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onCreate`);
  }

  onForeground() {
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onForeground`);
  }

  onBackground() {
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onBackground`);
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onDestroy`);
    return undefined;
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    uiExtContext = this.context;
    const storage: LocalStorage = new LocalStorage();
    session.loadContent('entryembeddeduiextability/pages/EntryEmbeddedUIExtAbilityPage', storage);
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onSessionCreate done`);

    if (want?.parameters?.[TEST_CASE_KEY]) {
      testCaseName = want?.parameters?.[TEST_CASE_KEY] as string;
    }
    hilog.info(DOMAIN, TAG, `testCaseName: ${testCaseName}`);
    
    if (testCaseName === (TEST_CASE_NAME + '_0400')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        session.setWindowPrivacyMode(true).then(() => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode promise success`);
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode, code: ${error.code}`);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': error.code,
            } as Record<string, RecordData>
          };
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish event`);
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            this.context.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode failed,
          code: ${(err as BusinessError).code}`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_0500')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        session.setWindowPrivacyMode(true, (err: BusinessError | null) => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} setWindowPrivacyMode cb code: ${err?.code}`);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          };
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish event`);
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            this.context.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode failed,
          code: ${(err as BusinessError).code}`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
    });
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onSessionDestroy`);
  }
}
