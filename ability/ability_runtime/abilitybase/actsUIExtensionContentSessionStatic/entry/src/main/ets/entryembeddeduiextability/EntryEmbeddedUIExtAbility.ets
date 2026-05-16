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
import bundle from '@ohos.bundle.bundleManager';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'ActsUIExtensionContentSessionTest';
const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static';
const TEST_CASE_NAME_LC: string = 'SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static';
const TEST_CASE_NAME_EC: string = 'Sub_UIExtensionContentSession_errorCode_static';
const TEST_CASE_NAME_SWPM: string = 'Sub_UIExtensionContentSession_SetWindowPrivacyMode_static';
const TEST_CASE_NAME_AEA: string = 'Acts_ActionExtensionAbility_static';
const BUNDLE_NAME: string = 'com.example.uiextensioncontentsession.static';
const MODULE_NAME: string = 'entry';
const EXT_ABILITY_NAME: string = 'EntryEmbeddedUIExtAbility';
const ABILITY_NAME: string = 'EntryAbility';
const TEST_CASE_KEY: string = 'caseTag';
const PARAM_0: int = 0;
const PARAM_1: int = 1;
const PARAM_NEGATIVE_1: int = -1;
let testCaseName: string = '';
let uiExtContext: common.UIExtensionContext;


class AbilityStartCallbackExt implements common.AbilityStartCallback {
  public onError(code: int, name: string, message: string): void {
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType_callback onError:` + 'code:' + code);
    let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
      parameters: {
        'result': code,
      } as Record<string, RecordData>
    } as commonEventManager.CommonEventPublishData;
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
    commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
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

    if (testCaseName === (TEST_CASE_NAME + '_0700')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let wantParams: Record<string, RecordData> = {
        'sceneType': PARAM_1
      } as Record<string, RecordData>;
      let abilityStartCallback = new AbilityStartCallbackExt() as common.AbilityStartCallback;
      try {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} call startAbilityByType`);
        session.startAbilityByType('', wantParams, abilityStartCallback, (err: BusinessError | null) => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType cb, code: ${err?.code}`);
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType failed,
          code: ${(err as BusinessError).code}`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_0800')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let wantParams: Record<string, RecordData> = {
        'sceneType': PARAM_1
      } as Record<string, RecordData>;
      let abilityStartCallback = new AbilityStartCallbackExt() as common.AbilityStartCallback;
      try {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} call startAbilityByType`);
        session.startAbilityByType('', wantParams, abilityStartCallback).then(() => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType promise success`);
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType failed, code: ${error.code}`);
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} startAbilityByType failed,
          code: ${(err as BusinessError).code}`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_LC + '_0600')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      try {
        session.loadContentByName('', storage);
      } catch (err) {
        code = (err as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} loadContentByName failed,
          code: ${code}`);
      }
      let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': code,
        } as Record<string, RecordData>
      } as commonEventManager.CommonEventPublishData;
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
      commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
        uiExtContext.terminateSelf()
      });

      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_LC + '_0800')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      try {
        session.loadContentByName('entryembeddeduiextability/pages/EntryEmbeddedUIExtAbilityPage');
      } catch (err) {
        code = (err as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} loadContentByName failed,
          code: ${code}`);
      }
      let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': code,
        } as Record<string, RecordData>
      } as commonEventManager.CommonEventPublishData;
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
      commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
        uiExtContext.terminateSelf()
      });

      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_EC + '_1300')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      let left: int = PARAM_0;
      let top: int = PARAM_0;
      let width: int = PARAM_0;
      let height: int = PARAM_0;
      try {
        let windowProxy = session.getUIExtensionWindowProxy();
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} getUIExtensionWindowProxy success`);
        if (windowProxy && windowProxy.properties) {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} getUIExtensionWindowProxy windowProxy success`);
          let rect = windowProxy.properties.uiExtensionHostWindowProxyRect;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} Window rect: left=${rect.left}, top=${rect.top}, width=${rect.width}, height=${rect.height}`);
          code = PARAM_0;
          left = rect.left;
          top = rect.top;
          width = rect.width;
          height = rect.height;
        } else {
          code = PARAM_NEGATIVE_1;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} getUIExtensionWindowProxy windowProxy null`);
        }     
      } catch (err) {
        code = (err as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} getUIExtensionWindowProxy failed,
          code: ${code}`);
      }
      let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': code,
          'left': left,
          'top': top,
          'width': width,
          'height': height
        } as Record<string, RecordData>
      } as commonEventManager.CommonEventPublishData;
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
      commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
        uiExtContext.terminateSelf()
      });

      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_SWPM + '_0100')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      try {
        session.setWindowPrivacyMode(true).then(() => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode promise success`);
          let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
          commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        }).catch((err: Error) => {
          code = (err as BusinessError).code
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode, code: ${code}`);
          let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
          commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        code = (err as BusinessError).code
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode failed,
          code: ${code}`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_SWPM + '_0200')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      try {
        session.setWindowPrivacyMode(true, (err: BusinessError | null) => {
          if (err) {
            code = err.code;
          }
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME_SWPM}
           setWindowPrivacyMode cb code: ${code}`);
          let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
          commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        code = (err as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode failed,
          code: ${code}`);
        let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
        commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_SWPM + '_0300')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      try {
        session.setWindowPrivacyMode(false, (err: BusinessError | null) => {
          if (err) {
            code = err.code;
          }
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME_SWPM}
           setWindowPrivacyMode cb code: ${code}`);
          let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
          commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        code = (err as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode failed,
          code: ${code}`);
        let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
        commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_SWPM + '_0400')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_0;
      try {
        session.setWindowPrivacyMode(false).then(() => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode promise success`);
          let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
          commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        }).catch((err: Error) => {
          code = (err as BusinessError).code
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode, code: ${code}`);
          let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish : ${commonEventDataOptions}`);
          commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        code = (err as BusinessError).code
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} setWindowPrivacyMode failed,
          code: ${code}`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME_AEA + '_2100')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      let code: int = PARAM_NEGATIVE_1;
      try {
        if ((uiExtContext.extensionAbilityInfo.bundleName === BUNDLE_NAME) &&
          (typeof (uiExtContext.extensionAbilityInfo.descriptionId) === 'long') &&
          (typeof (uiExtContext.extensionAbilityInfo.enabled) === 'boolean') &&
          (typeof (uiExtContext.extensionAbilityInfo.exported) === 'boolean') &&
          (uiExtContext.extensionAbilityInfo.extensionAbilityType === bundle.ExtensionAbilityType.EMBEDDED_UI) &&
          (typeof (uiExtContext.extensionAbilityInfo.iconId) === 'long') &&
          (typeof (uiExtContext.extensionAbilityInfo.labelId) === 'long') &&
          (uiExtContext.extensionAbilityInfo.moduleName === MODULE_NAME) &&
          (uiExtContext.extensionAbilityInfo.name === EXT_ABILITY_NAME)) {
          code = PARAM_1;
        }
        let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': code
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish: ${JSON.stringify(commonEventDataOptions)}`);
        commonEventManager.publish(testCaseName + '_event', commonEventDataOptions, (result) => {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} publish, ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });        
      } catch (err) {
        code = (err as BusinessError).code
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} extensionAbilityInfo failed,
          code: ${code}`);
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
