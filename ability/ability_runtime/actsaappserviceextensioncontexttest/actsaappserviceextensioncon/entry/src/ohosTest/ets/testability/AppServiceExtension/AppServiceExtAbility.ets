/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Want, common } from '@kit.AbilityKit';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility'
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError,commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'testTag';

class StubTest extends rpc.RemoteObject{
  constructor(des: string) {
    hilog.info(0x0000, TAG, 'AppService StubTest');
    super(des);
  }
  onConnect(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    hilog.info(0x0000, TAG, 'AppService StubTest onConnect');
  }
}

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

function publishEvent(eventName: string, code: number) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': code
    }
  }
  commonEventManager.publish(eventName, commonEventData, (result) => {
    hilog.info(0x0000, TAG, `${eventName} publish result:${JSON.stringify(result)}`);
  });
}

export default class AppService extends AppServiceExtensionAbility {
  onCreate(want: Want): void {
    hilog.info(0x0000, TAG, `AppService onCreate, want: ${JSON.stringify(want)}`);
  }

  async onRequest(want: Want, startId: number) {
    hilog.info(0x0000, TAG, `AppService onRequest, want: ${JSON.stringify(want)}, startId: ${startId}`);
    let eventName: string;
    if (want.parameters?.case === '0600') {
      eventName = 'connectServiceExtensionAbility_0600';
      hilog.info(0x0000, TAG, `${eventName} Begin`);
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, TAG, `${eventName} onConnect, elementName: ${JSON.stringify(elementName)}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, `${eventName} onDisconnect, elementName: ${JSON.stringify(elementName)}`);
          publishEvent(eventName, 200);
        },
        onFailed(code) {
          hilog.info(0x0000, TAG, `${eventName} onFailed, code: ${code}`);
          publishEvent(eventName, code);
        }
      };
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'ServiceExtensionAbility'
      };
      try {
        let connection: number = this.context.connectServiceExtensionAbility(wantInfo, options);
        hilog.info(0x0000, TAG, `${eventName} connectServiceExtensionAbility success, connectionId: ${connection}`);
        await sleep(2000);
        this.context.disconnectServiceExtensionAbility(connection).then(() => {
          hilog.info(0x0000, TAG, `${eventName} disconnectServiceExtensionAbility success`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, TAG, `${eventName} disconnectServiceExtensionAbility error: ${JSON.stringify(error)}`);
          publishEvent(eventName, error?.code);
        });
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} connect or disconnectServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        publishEvent(eventName, error?.code);
      }
    } else if(want.parameters?.case === '0700') {
      eventName = 'connectServiceExtensionAbility_0700';
      hilog.info(0x0000, TAG, `${eventName} Begin`);
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, TAG, `${eventName} onConnect, elementName: ${JSON.stringify(elementName)}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, `${eventName} onDisconnect, elementName: ${JSON.stringify(elementName)}`);
        },
        onFailed(code) {
          hilog.info(0x0000, TAG, `${eventName} onFailed, code: ${code}`);
          publishEvent(eventName, code);
        }
      };
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'com.acts.context.aappserviceextensionError',
        abilityName: 'ServiceExtensionAbility'
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} connectServiceExtensionAbility error: ${JSON.stringify(error)}`);
        publishEvent(eventName, error?.code);
      }
    } else if(want.parameters?.case === '0800') {
      eventName = 'connectServiceExtensionAbility_0800';
      hilog.info(0x0000, TAG, `${eventName} Begin`);
      try {
        this.context.disconnectServiceExtensionAbility(-1).then(()=> {
          hilog.info(0x0000, TAG, `${eventName} disconnectServiceExtensionAbility succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, `${eventName} disconnectServiceExtensionAbility error: ${JSON.stringify(err)}`);
          publishEvent(eventName, err.code);
        });
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} disconnectServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        publishEvent(eventName, error?.code);
      }
    } else if(want.parameters?.case === '3200') {
      eventName = 'connectServiceExtensionAbility_3200';
      hilog.info(0x0000, TAG, `${eventName} Begin`);
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, TAG, `${eventName} onConnect, elementName: ${JSON.stringify(elementName)}`);
          publishEvent(eventName, 200);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, `${eventName} onDisconnect, elementName: ${JSON.stringify(elementName)}`);
        },
        onFailed(code) {
          hilog.info(0x0000, TAG, `${eventName} onFailed, code: ${code}`);
          publishEvent(eventName, code);
        }
      };
     let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'MyUIAbility'
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} connectServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        publishEvent(eventName, error?.code);
      }
    } else if(want.parameters?.case === '3300') {
      eventName = 'connectServiceExtensionAbility_3300';
      hilog.info(0x0000, TAG, `${eventName} Begin`);
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, TAG, `${eventName} onConnect, elementName: ${JSON.stringify(elementName)}`);
          publishEvent(eventName, 200);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, `${eventName} onDisconnect, elementName: ${JSON.stringify(elementName)}`);
        },
        onFailed(code) {
          hilog.info(0x0000, TAG, `${eventName} onFailed, code: ${code}`);
          publishEvent(eventName, code);
        }
      };
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'ServiceExtensionAbility'
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} connectServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        publishEvent(eventName, error?.code);
      }
    } else if(want.parameters?.case === '3400') {
      eventName = 'connectServiceExtensionAbility_3400';
      hilog.info(0x0000, TAG, `${eventName} Begin`);
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, TAG, `${eventName} onConnect, elementName: ${JSON.stringify(elementName)}`);
          publishEvent(eventName, 200);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, `${eventName} onDisconnect, elementName: ${JSON.stringify(elementName)}`);
        },
        onFailed(code) {
          hilog.info(0x0000, TAG, `${eventName} onFailed, code: ${code}`);
          publishEvent(eventName, code);
        }
      };
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'ServiceExtensionAbility',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} connectServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        publishEvent(eventName, error?.code);
      }
    }
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(0x0000, TAG, `AppService onConnect, want: ${want.abilityName}`);
    return new StubTest('test');
  }

  onDisconnect(want: Want): void {
    hilog.info(0x0000, TAG, `AppService onDisconnect, want: ${want.abilityName}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'AppService onDestroy');
  }
};