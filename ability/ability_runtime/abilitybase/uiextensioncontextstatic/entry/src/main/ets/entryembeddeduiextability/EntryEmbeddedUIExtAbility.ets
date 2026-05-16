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
import OpenLinkOptions from '@ohos.app.ability.OpenLinkOptions';
import wantConstant from '@ohos.app.ability.wantConstant';
import AtomicServiceOptions from '@ohos.app.ability.AtomicServiceOptions'

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'ActsUIExtensionContextMethodStaticTest';
const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtensionContext';
const BUNDLE_NAME: string = 'com.example.uiextensioncontexttest.static';
const TEST_CASE_KEY: string = 'caseTag';
let testCaseName: string = '';
let uiExtContext: common.UIExtensionContext;
let parameters: Record<String, RecordData> = {'demo_key': 'demo_value', 'demo_num': 111}
let paramOptions: OpenLinkOptions = {
  parameters: parameters
};

class CustomDataCallBack implements common.UIServiceExtensionConnectCallback {
  onData(data: Record<string, RecordData>) {
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} onData:` + 'data:' + data);
  }

  onDisconnect(): void {
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} onDisconnect`);
  }
}

class CustomUIServiceProxy implements common.UIServiceProxy {
  sendData(data: Record<string, RecordData>): void {
    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} sendData:` + 'data:' + data);
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

    if (testCaseName === (TEST_CASE_NAME + '_4200')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext openLink with empty string.
        this.context.openLink("").then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `openLink empty string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_4300')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext openLink with invalid string.
        this.context.openLink('demo://www.example.com').then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `openLink with invalid string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_4400')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext openLink with OpenLinkOptions.
        this.context.openLink('demo://www.example.com', paramOptions).then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `openLink with OpenLinkOptions catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_4500')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext openLink with OpenLinkOptions with callback.
        this.context.openLink('demo://www.example.com', paramOptions, (err: BusinessError | null, result: common.AbilityResult | undefined) => {
          if (err?.code) {
            hilog.info(DOMAIN, TAG, `openLink failed, code is ${err?.code}, message is ${err?.message}`);
            let commonEventData: commonEventManager.CommonEventPublishData = {
              parameters: {
                'result': err?.code,
              } as Record<string, RecordData>
            } as commonEventManager.CommonEventPublishData;
            commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
              hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
              uiExtContext.terminateSelf()
            });
          } else {
            hilog.info(DOMAIN, TAG, 'openLink succeed');
          }
        }).then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} open link err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `openLink with OpenLinkOptions with callback catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_4600')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext openAtomicService with empty string
        this.context.openAtomicService("").then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} openAtomicService successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} openAtomicService err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `openAtomicService empty string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_4700')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext openAtomicService with options
        let options: AtomicServiceOptions = {
          flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          parameters: {
            "demo.result": 123456
          } as Record<string, RecordData>,
        };
        this.context.openAtomicService("", options).then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} openAtomicService successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} openAtomicService err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `openAtomicService empty string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_1400')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext startUIServiceExtensionAbility 16000001 801
        let options: AtomicServiceOptions = {
          flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          parameters: {
            "demo.result": 123456
          } as Record<string, RecordData>,
        };
        this.context.startUIServiceExtensionAbility({
          bundleName: BUNDLE_NAME,
          abilityName: "abilityerror"
        }).then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} startUIServiceExtensionAbility successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} startUIServiceExtensionAbility err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `startUIServiceExtensionAbility empty string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_1500')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext connectUIServiceExtensionAbility 16000001 801
        const dataCallback = new CustomDataCallBack();
        this.context.connectUIServiceExtensionAbility({
          bundleName: BUNDLE_NAME,
          abilityName: "abilityerror"
        }, dataCallback).then((proxy: common.UIServiceProxy) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} connectUIServiceExtensionAbility successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} connectUIServiceExtensionAbility err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `connectUIServiceExtensionAbility empty string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };

    if (testCaseName === (TEST_CASE_NAME + '_1600')) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} UIExtensionContentSession test case start`);
      try {
        // Test UIExtensionContext disconnectUIServiceExtensionAbility 401 801
        const uiServiceProxy = new CustomUIServiceProxy();
        this.context.disconnectUIServiceExtensionAbility(uiServiceProxy).then(() => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} disconnectUIServiceExtensionAbility successful`);
        }).catch((err: Error): void => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} disconnectUIServiceExtensionAbility err: ` + err.code + err.message);
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            } as Record<string, RecordData>
          } as commonEventManager.CommonEventPublishData;
          commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
            hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
            uiExtContext.terminateSelf()
          });
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, `disconnectUIServiceExtensionAbility empty string catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          } as Record<string, RecordData>
        } as commonEventManager.CommonEventPublishData;
        commonEventManager.publish(testCaseName + '_event', commonEventData, (result) => {
          hilog.info(DOMAIN, TAG, `${JSON.stringify(testCaseName)} result: ${JSON.stringify(result)}`);
          uiExtContext.terminateSelf()
        });
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${testCaseName} EmbeddedUIExtensionAbility test case end`);
    };
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
    });
    hilog.info(DOMAIN, TAG, `EntryEmbeddedUIExtAbility onSessionDestroy`);
  }
}
