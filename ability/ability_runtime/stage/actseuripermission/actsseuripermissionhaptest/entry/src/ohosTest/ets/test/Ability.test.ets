/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import Want from '@ohos.app.ability.Want';
import wantConstant from '@ohos.app.ability.wantConstant';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import fileUri from '@ohos.file.fileuri';
import commonEvent from '@ohos.commonEventManager';
import base from '@ohos.base';
import resourceManager from '@ohos.resourceManager';

function log(info: string) {
  console.info("[ShareAppTest]:: " + info);
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function createBundleNameFile(context: common.UIAbilityContext) {
  let filePath: string = context.filesDir + "/test_0.txt";
  let uri: string = fileUri.getUriFromPath(filePath);
  if (!fs.accessSync(uri)) {
    try {
      let file = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
    } catch (err) {
      log("create bundleName failed, error = " + JSON.stringify(err));
      return "";
    }
  }
  return uri;
}

let EVENT_READ_SUCCESS: string = 'Event_Read_Successfully';
let EVENT_READ_FAILED: string = 'Event_Read_FAILED';
let subscriber: commonEvent.CommonEventSubscriber;

export default function abilityTest() {

  describe('UriPermissionTest', () => {
    let abilityContext: common.UIAbilityContext;

    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
    * @tc.number  UriPermissionTest_0100
    * @tc.name    Grant uri permission to ServiceExtension
    * @tc.desc    Grant uri permission to ServiceExtension by call startServiceExtension can success
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('UriPermissionTest_0100', 0, async (done: Function) => {
      log("========================= UriPermissionTest_0100 Begin ===================");
      log("step1. createBundleNameFile...");
      abilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext")!;
      let uri: string = createBundleNameFile(abilityContext);
      if (uri === "") {
        expect().assertFail();
      }
      let testcase = "0100";
      let successEvent = EVENT_READ_SUCCESS + testcase;
      let failedEvent = EVENT_READ_FAILED + testcase;

      log("step2. startServiceExtensionAbility.");
      let want: Want = {
        deviceId: "",
        bundleName: "com.acts.serviceextensionapp",
        abilityName: "ServiceExtAbility",
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        uri: uri,
        parameters: {
          publish_event: true,
          testcase: testcase
        }
      };
      await abilityContext.startServiceExtensionAbility(want)
        .then(() => {
          log('Succeeded in starting ServiceExtensionAbility.');
        })
        .catch((err: base.BusinessError) => {
          log(`Failed to start ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });

      log("step3. waiting result...");
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [successEvent, failedEvent]
      }

      let UnSubscribeInfoCallback = (err:base.BusinessError, data:void) => {
        log("===UnSubscribeInfoCallback_100===")
      }

      let flag = false;
      let SubscribeCallBackContext = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        log('Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === successEvent) {
          commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
          flag = true;
        }
        if (data.event === failedEvent) {
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
            flag = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          log(`Create Subscriber: data = ${data}`)
          subscriber = data;
          commonEvent.subscribe(subscriber, SubscribeCallBackContext);
        });
      while (!flag) {
        await sleep(500);
      }

      log("step4. stopServiceExtensionAbility...");
      await abilityContext.stopServiceExtensionAbility(want)
        .then(() => {
          log('Succeeded in stop serviceExtensionAbility.');
        })
        .catch((err: base.BusinessError) => {
          log(`Failed to stop ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
        });
      done();
      log("========================= UriPermissionTest_0100 End ===================");
    })

    /*
    * @tc.number  UriPermissionTest_0200
    * @tc.name    Grant uri permission to activated ServiceExtension
    * @tc.desc    Grant uri permission to activated ServiceExtension by call startServiceExtension can success
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('UriPermissionTest_0200', 0, async (done: Function) => {
      log("========================= UriPermissionTest_0200 Begin ===================");
      log("step1. createBundleNameFile...");
      abilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext")!;
      let uri: string = createBundleNameFile(abilityContext);
      if (uri === "") {
        expect().assertFail();
      }
      let testcase = "0200";
      let successEvent = EVENT_READ_SUCCESS + testcase;
      let failedEvent = EVENT_READ_FAILED + testcase;

      log("step2. startServiceExtensionAbility without uri...");
      let want_0: Want = {
        deviceId: "",
        bundleName: "com.acts.serviceextensionapp",
        abilityName: "ServiceExtAbility",
        parameters: {
          publish_event: false
        }
      };
      await abilityContext.startServiceExtensionAbility(want_0)
        .then(() => {
          log('Succeeded in starting ServiceExtensionAbility.');
        })
        .catch((err: base.BusinessError) => {
          log(`Failed to start ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });

      log("step3. startServiceExtensionAbility with uri...");
      let want: Want = {
        deviceId: "",
        bundleName: "com.acts.serviceextensionapp",
        abilityName: "ServiceExtAbility",
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        uri: uri,
        parameters: {
          publish_event: true,
          testcase: testcase
        }
      };
      await abilityContext.startServiceExtensionAbility(want)
        .then(() => {
          log('Succeeded in starting ServiceExtensionAbility.');
        })
        .catch((err: base.BusinessError) => {
          log(`Failed to start ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        })

      log("step4. waiting result.");
      let flag = false;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [successEvent, failedEvent]
      }

      let UnSubscribeInfoCallback = (err:base.BusinessError, data:void) => {
        log("===UnSubscribeInfoCallback_200===");
      }

      let SubscribeCallBackContext = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        log('Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === successEvent) {
          commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
          flag = true;
        }
        if (data.event === failedEvent) {
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
            flag = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          log(`Create Subscriber: data = ${JSON.stringify(data)}`)
          subscriber = data;
          commonEvent.subscribe(subscriber, SubscribeCallBackContext);
        });

      while (!flag) {
        await sleep(500);
      }

      log("step5. stopServiceExtensionAbility...");
      await abilityContext.stopServiceExtensionAbility(want_0)
        .then(() => {
          log('Succeeded in stop serviceExtensionAbility.');
        }).catch((err: base.BusinessError) => {
          log(`Failed to stop ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
        })
      done();
      log("========================= UriPermissionTest_0200 End ===================");
    })

    /*
    * @tc.number  UriPermissionTest_0300
    * @tc.name    Check revoke uri permission from ServiceExtension
    * @tc.desc    Revoke uri permission from ServiceExtension by call stopServiceExtension
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('UriPermissionTest_0300', 0, async (done: Function) => {
      log("========================= UriPermissionTest_0300 Begin ===================");
      log("step1. Create bundleName file.");
      abilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext")!;
      try {
        let deviceCapability = abilityContext.resourceManager.getDeviceCapabilitySync();
        log('deviceType is ' + deviceCapability.deviceType);
        if (deviceCapability.deviceType !== resourceManager.DeviceType.DEVICE_TYPE_PHONE) {
          log('skip deviceType is not phone');
          done();
        }
      } catch (error) {
        log("getDeviceCapabilitySync failed, error: " + JSON.stringify(error));
        expect().assertFail();
      }

      let uri: string = createBundleNameFile(abilityContext);
      if (uri === "") {
        expect().assertFail();
      }
      let testcase = "0300";
      let successEvent = EVENT_READ_SUCCESS + testcase;
      let failedEvent = EVENT_READ_FAILED + testcase;

      log("step2. startServiceExtensionAbility...");
      let want1: Want = {
        deviceId: "",
        bundleName: "com.acts.serviceextensionapp",
        abilityName: "ServiceExtAbility",
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        uri: uri,
        parameters: {
          publish_event: false,
          testcase: testcase
        }
      };
      await abilityContext.startServiceExtensionAbility(want1)
        .then(() => {
          log('Succeeded in starting ServiceExtensionAbility.');
        })
        .catch((err: base.BusinessError) => {
          log(`Failed to start ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });

      log("step3. stopServiceExtensionAbility...");
      await sleep(500)
      let wantStop: Want = {
        deviceId: "",
        bundleName: "com.acts.serviceextensionapp",
        abilityName: "ServiceExtAbility"
      };
      await abilityContext.stopServiceExtensionAbility(wantStop)
        .then(() => {
          log('Succeeded in stop serviceExtensionAbility.');
        })
        .catch((err: base.BusinessError) => {
          log(`Failed to stop ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
        });
      await sleep(500);

      log("step4. startAbility...");
      let want2: Want = {
        bundleName: "com.acts.serviceextensionapp",
        abilityName: "EntryAbility",
        uri: uri,
        parameters: {
          publish_event: true,
          testcase: testcase
        }
      }
      await abilityContext.startAbility(want2)
        .then(() => {
          log("StartAbility success!")
        }).catch((err: base.BusinessError) => {
          log(`startAbility failed, code is ${err.code}, message is ${err.message}`);
        });

      log("step5. waiting result...");
      let flag = false;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [successEvent, failedEvent]
      };

      let UnSubscribeInfoCallback = (err:base.BusinessError, data:void) => {
        log("===UnSubscribeInfoCallback_300===");
      }

      let SubscribeCallBackContext = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        log('Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === failedEvent) {
          commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
          flag = true;
        }
        if (data.event === successEvent) {
          expect().assertFail();
        }
      }

      commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          log(`Create Subscriber: data = ${JSON.stringify(data)}`)
          subscriber = data;
          commonEvent.subscribe(subscriber, SubscribeCallBackContext);
        });
      while (!flag) {
        await sleep(500);
      }

      log("step6. stopServiceExtensionAbility...");
      await abilityContext.stopServiceExtensionAbility(want1)
        .then(() => {
          log('Succeeded in stop serviceExtensionAbility.');
        }).catch((err: base.BusinessError) => {
          log(`Failed to stop ServiceExtensionAbility. Code is ${err.code}, message is ${err.message}`);
        });
      done();
      log("========================= UriPermissionTest_0300 End ===================");
    })
  })
}