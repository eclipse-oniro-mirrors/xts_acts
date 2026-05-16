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

import hilog from '@ohos.hilog';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility';
import rpc from '@ohos.rpc';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { ElementName } from 'bundleManager.ElementName';

const BUNDLE_NAME: string = 'com.acts.context.appserviceextension.static';
const BUNDLE_NAME_RELY: string = 'com.acts.context.aappserviceextensionrely.static';
const TEST_CASE_KEY: string = 'caseTag';
const SUCCESS_CODE: int = 200;

let testCaseName: string = '';
const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

class StubTest extends rpc.RemoteObject {
  public constructor(des: string) {
    super(des);
  }

  public onConnect(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
  }
}


function publishEvent(eventName: string, code: int) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': code
    } as Record<string, RecordData>
  } as commonEventManager.CommonEventPublishData;
  commonEventManager.publish(eventName, commonEventData, (err) => {
    if (!err || err?.code === 0) {
      hilog.info(DOMAIN, TAG, `${testCaseName} publish success`);
    } else {
      hilog.info(DOMAIN, TAG, `${testCaseName} publish failed`);
    }
  });
}


export default class AppServiceExtAbility extends AppServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility onCreate`);
  }
  onRequest(want: Want, startId: int) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility onRequest`);

    if (want?.parameters?.[TEST_CASE_KEY]) {
      testCaseName = want?.parameters?.[TEST_CASE_KEY] as string;
      hilog.info(DOMAIN, TAG, `AppServiceExtAbility testCaseName: ${testCaseName}`);
    } else {
      hilog.info(DOMAIN, TAG, `AppServiceExtAbility onRequest without testCaseName`);
    }

    if (testCaseName === 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0700') {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'BUNDLE_NAMEerr',
        abilityName: 'ServiceExtensionAbility',
      };
      const options: common.ConnectOptions = {
        onConnect: (elementName: ElementName | null, remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onConnect`);
          publishEvent(testCaseName, SUCCESS_CODE);
        },
        onDisconnect: (elementName: ElementName | null) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onDisconnect`);
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onFailed: ${code}`);
          publishEvent(testCaseName, code);
        }
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility called`);
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3200')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility',
      };
      const options: common.ConnectOptions = {
        onConnect: (elementName: ElementName | null, remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onConnect`);
          publishEvent(testCaseName, SUCCESS_CODE);
        },
        onDisconnect: (elementName: ElementName | null) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onDisconnect`);
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onFailed: ${code}`);
          publishEvent(testCaseName, code);
        }
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility called`);
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3300')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'ServiceExtAbility',
      };
      const options: common.ConnectOptions = {
        onConnect: (elementName: ElementName | null, remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onConnect`);
          publishEvent(testCaseName, SUCCESS_CODE);
        },
        onDisconnect: (elementName: ElementName | null) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onDisconnect`);
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onFailed: ${code}`);
          publishEvent(testCaseName, code);
        }
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility called`);
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3400')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: 'ServiceExtensionAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      const options: common.ConnectOptions = {
        onConnect: (elementName: ElementName | null, remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onConnect`);
          publishEvent(testCaseName, SUCCESS_CODE);
        },
        onDisconnect: (elementName: ElementName | null) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onDisconnect`);
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${testCaseName} onFailed: ${code}`);
          publishEvent(testCaseName, code);
        }
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility called`);
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} connectServiceExtensionAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0800')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      try {
        this.context.disconnectServiceExtensionAbility(-1).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} disconnectServiceExtensionAbility success`);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} disconnectServiceExtensionAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} disconnectServiceExtensionAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2000')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'BUNDLE_NAMEerr',
        abilityName: 'AppServiceExtAbility2',
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2400')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'MyUIAbility2',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2500')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility3',
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2100')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        bundleName: BUNDLE_NAME,
        action: 'zzabc'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;  
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2200')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'EntryAbility2'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    } else if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2600')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'MyUIAbility2',
        flags: -1
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    }
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(DOMAIN, TAG, `AppServiceExtensionAbility onConnect`);
    return new StubTest('test');
  }

  onDisconnect(want: Want) {
    hilog.info(DOMAIN, TAG, `AppServiceExtensionAbility onDisconnect`);
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, `AppServiceExtensionAbility onDestroy`);
  }
};