/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from '@ohos.commonEventManager';
import base from '@ohos.base';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs'
import wantConstant from '@ohos.ability.wantConstant';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Want from '@ohos.app.ability.Want';
import ability from '@ohos.ability.ability';
import common from '@ohos.app.ability.common';

let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

export default function UriPermissionTest() {

  describe('UriPermissionTest', () => {

    console.info("-----------------UriPermissionTest is start----------------")
    beforeEach(async (done: Function) => {
      console.info('UriPermissionTest before each called');
      await sleep(1000);
      done()
    });

    let abilityContext:common.UIAbilityContext = globalThis.abilityContext;
    afterEach(async (done: Function) => {
      console.info('UriPermissionTest after each called');
      let wantInfo: Want = {
        bundleName: 'com.example.stageautosign',
        abilityName: 'com.example.stageautosign.MainAbility'
      }
      await abilityContext.startAbility(wantInfo).then(() => {
        console.info('afterEach startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info('afterEach error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      done();
    });


    /*
     * @tc.number  Temp_UriPermissionTest_0100
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0100", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0100 is start---------------")
      let TAG1 = "Temp_UriPermissionTest_0100";
      let filePath: string = abilityContext.filesDir + "/test_1.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG1 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG1 + "file created, fd: " + file.fd);
        }
      });
      let uri_1: string = fileUri.getUriFromPath(filePath);

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_1,
        parameters: {
          'number': 10
        }
      }
      let flag1_1 = false;
      let flag1_2 = false;

      let eventName1_1: string = 'Temp_UriPermissionTest_0100_Read_Successfully';
      let eventName1_2: string = 'Temp_UriPermissionTest_0100_Read_Failed';
      let subscribeInfo1_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName1_1, eventName1_2]
      }
      let subscriber1_1: commonEvent.CommonEventSubscriber;
      let UnSubscribeInfoCallback1_1 = (err: base.BusinessError) => {
        console.info(TAG1 + "===UnSubscribeInfoCallback1_1===")
      }

      let SubscribeCallBackContext1_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG1 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName1_1) {
          console.info(TAG1 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber1_1, UnSubscribeInfoCallback1_1)
          flag1_1 = true;
        }
        if (data.event === eventName1_2) {
          console.info(TAG1 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber1_1, UnSubscribeInfoCallback1_1)
            flag1_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo1_1).then(async (data) => {
        subscriber1_1 = data;
        console.info(TAG1 + '====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber1_1, SubscribeCallBackContext1_1);
      });

      let eventName1_3: string = 'Temp_UriPermissionTest_0100_Write_Successfully';
      let eventName1_4: string = 'Temp_UriPermissionTest_0100_Write_Failed';
      let subscribeInfo1_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName1_3, eventName1_4]
      }
      let subscriber1_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback1_2 = (err: base.BusinessError) => {
        console.info(TAG1 + "===UnSubscribeInfoCallback1_2===")
      }

      let SubscribeCallBackContext1_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG1 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName1_3) {
          console.info(TAG1 + 'write file succeed.');
          if (deviceSupport === 'false') {
            commonEvent.unsubscribe(subscriber1_2, UnSubscribeInfoCallback1_2)
            flag1_2 = true;
            return;
          }
          expect().assertFail();
        }
        if (data.event === eventName1_4) {
          console.info(TAG1 + 'write file failed.');
          commonEvent.unsubscribe(subscriber1_2, UnSubscribeInfoCallback1_2)
          flag1_2 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo1_2).then(async (data) => {
        subscriber1_2 = data;
        console.info(TAG1 + '====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber1_2, SubscribeCallBackContext1_2);
      });

      await abilityContext.startAbility(want).then(() => {
        console.info(TAG1 + 'startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG1 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag1_1 || !flag1_2) {
        console.info(TAG1 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0100 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_0200
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0200", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0200 is start---------------")
      let TAG2 = "Temp_UriPermissionTest_0200";
      let filePath: string = abilityContext.filesDir + "/test_2.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG2 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG2 + "file created, fd: " + file.fd);
        }
      });
      let uri_2: string = fileUri.getUriFromPath(filePath);

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_2
      }
      await abilityContext.startAbility(want).then(() => {
        console.info('TAG2 + startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG2 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);
      let flag2_1 = false;
      let flag2_2 = false;

      let eventName2_1: string = 'Temp_UriPermissionTest_0200_Read_Successfully';
      let eventName2_2: string = 'Temp_UriPermissionTest_0200_Read_Failed';
      let subscribeInfo2_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName2_1, eventName2_2]
      }
      let subscriber2_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback2_1 = (err: base.BusinessError) => {
        console.info(TAG2 + "===UnSubscribeInfoCallback2_1===")
      }

      let SubscribeCallBackContext2_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG2 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName2_1) {
          console.info(TAG2 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber2_1, UnSubscribeInfoCallback2_1)
          flag2_1 = true;
        }
        if (data.event === eventName2_2) {
          console.info(TAG2 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber2_1, UnSubscribeInfoCallback2_1)
            flag2_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo2_1).then(async (data) => {
        subscriber2_1 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber2_1, SubscribeCallBackContext2_1);
      });

      let eventName2_3: string = 'Temp_UriPermissionTest_0200_Write_Successfully';
      let eventName2_4: string = 'Temp_UriPermissionTest_0200_Write_Failed';
      let subscribeInfo2_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName2_3, eventName2_4]
      }
      let subscriber2_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback2_2 = (err: base.BusinessError) => {
        console.info(TAG2 + "===UnSubscribeInfoCallback2_2===")
      }

      let SubscribeCallBackContext2_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG2 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName2_3) {
          console.info(TAG2 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber2_2, UnSubscribeInfoCallback2_2)
          flag2_2 = true;
        }
        if (data.event === eventName2_4) {
          console.info(TAG2 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber2_2, UnSubscribeInfoCallback2_2)
            flag2_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo2_2).then(async (data) => {
        subscriber2_2 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber2_2, SubscribeCallBackContext2_2);
      });

      let want2: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility2",
        uri: uri_2,
        parameters: {
          'number': 20
        }
      }
      await abilityContext.startAbility(want2).then(() => {
        console.info(TAG2 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG2 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag2_1 || !flag2_2) {
        console.info(TAG2 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0200 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_0400
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0400", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0400 is start---------------")
      let TAG4 = "Temp_UriPermissionTest_0400";
      let filePath: string = abilityContext.filesDir + "/test_4.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG4 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG4 + "file created, fd: " + file.fd);
        }
      });
      let uri_4: string = fileUri.getUriFromPath(filePath);
      let flag4_1 = false;
      let flag4_2 = false;
      let flag4_3 = false;

      let eventName4_1: string = 'Temp_UriPermissionTest_0400_Read_Successfully';
      let eventName4_2: string = 'Temp_UriPermissionTest_0400_Read_Failed';
      let subscribeInfo4_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName4_1, eventName4_2]
      }
      let subscriber4_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback4_1 = (err: base.BusinessError) => {
        console.info(TAG4 + "===UnSubscribeInfoCallback4_1===")
      }

      let SubscribeCallBackContext4_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG4 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName4_1) {
          console.info(TAG4 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber4_1, UnSubscribeInfoCallback4_1)
          flag4_1 = true;
        }
        if (data.event === eventName4_2) {
          console.info(TAG4 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber4_1, UnSubscribeInfoCallback4_1)
            flag4_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo4_1).then(async (data) => {
        subscriber4_1 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber4_1, SubscribeCallBackContext4_1);
      });

      let eventName4_3: string = 'Temp_UriPermissionTest_0400_Write_Successfully';
      let eventName4_4: string = 'Temp_UriPermissionTest_0400_Write_Failed';
      let subscribeInfo4_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName4_3, eventName4_4]
      }
      let subscriber4_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback4_2 = (err: base.BusinessError) => {
        console.info(TAG4 + "===UnSubscribeInfoCallback4_2===")
      }

      let SubscribeCallBackContext4_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG4 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName4_3) {
          console.info(TAG4 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber4_2, UnSubscribeInfoCallback4_2)
          flag4_2 = true;
        }
        if (data.event === eventName4_4) {
          console.info(TAG4 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber4_2, UnSubscribeInfoCallback4_2)
            flag4_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo4_2).then(async (data) => {
        subscriber4_2 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber4_2, SubscribeCallBackContext4_2);
      });

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        "action": "action.system.uripermissiontest",
        "entities": ["entity.system.uripermissiontest"],
        uri: uri_4,
        parameters: {
          'number': 30
        }
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG4 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG4 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);

      let eventName4_5: string = 'Temp_UriPermissionTest_0400_Read_Successfully_';
      let eventName4_6: string = 'Temp_UriPermissionTest_0400_Read_Failed_';
      let subscribeInfo4_3: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName4_5, eventName4_6]
      }
      let subscriber4_3: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback4_3 = (err: base.BusinessError) => {
        console.info(TAG4 + "===UnSubscribeInfoCallback4_3===")
      }

      let SubscribeCallBackContext4_3 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG4 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName4_5) {
          console.info(TAG4 + 'read file succeed.');
          if (deviceSupport === 'false') {
            commonEvent.unsubscribe(subscriber4_3, UnSubscribeInfoCallback4_3)
            flag4_3 = true;
            return;
          }
          expect().assertFail();
        }
        if (data.event === eventName4_6) {
          console.info(TAG4 + 'read file failed.');
          commonEvent.unsubscribe(subscriber4_3, UnSubscribeInfoCallback4_3)
          flag4_3 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo4_3).then(async (data) => {
        subscriber4_3 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber4_3, SubscribeCallBackContext4_3);
      });

      let want2: Want = {
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility3",
        parameters: {
          'number': 31
        }
      }
      console.info(TAG4 + ' startAbility want2');
      await abilityContext.startAbility(want2).then(() => {
        console.info(TAG4 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG4 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag4_1 || !flag4_2 || !flag4_3) {
        console.info(TAG4 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0400 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_0500
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0500", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0500 is start---------------")
      let TAG5 = "Temp_UriPermissionTest_0500";
      let filePath: string = abilityContext.filesDir + "/test_5.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG5 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG5 + "file created, fd: " + file.fd);
        }
      });
      let uri_5: string = fileUri.getUriFromPath(filePath);
      let flag5_1 = false;
      let flag5_2 = false;

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_5
      }
      await abilityContext.startRecentAbility(want).then(() => {
        console.info(TAG5 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG5 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);

      let eventName5_1: string = 'Temp_UriPermissionTest_0500_Read_Successfully';
      let eventName5_2: string = 'Temp_UriPermissionTest_0500_Read_Failed';
      let subscribeInfo5_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName5_1, eventName5_2]
      }
      let subscriber5_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback5_1 = (err: base.BusinessError) => {
        console.info(TAG5 + "===UnSubscribeInfoCallback5_1===")
      }

      let SubscribeCallBackContext5_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG5 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName5_1) {
          console.info(TAG5 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber5_1, UnSubscribeInfoCallback5_1)
          flag5_1 = true;
        }
        if (data.event === eventName5_2) {
          console.info(TAG5 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber5_1, UnSubscribeInfoCallback5_1)
            flag5_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo5_1).then(async (data) => {
        subscriber5_1 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber5_1, SubscribeCallBackContext5_1);
      });

      let eventName5_3: string = 'Temp_UriPermissionTest_0500_Write_Successfully';
      let eventName5_4: string = 'Temp_UriPermissionTest_0500_Write_Failed';
      let subscribeInfo5_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName5_3, eventName5_4]
      }
      let subscriber5_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback5_2 = (err: base.BusinessError) => {
        console.info(TAG5 + "===UnSubscribeInfoCallback5_2===")
      }

      let SubscribeCallBackContext5_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG5 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName5_3) {
          console.info(TAG5 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber5_2, UnSubscribeInfoCallback5_2)
          flag5_2 = true;
        }
        if (data.event === eventName5_4) {
          console.info(TAG5 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber5_2, UnSubscribeInfoCallback5_2)
            flag5_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo5_2).then(async (data) => {
        subscriber5_2 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber5_2, SubscribeCallBackContext5_2);
      });

      let want2: Want = {
        bundleName: "com.acts.authorizeduriapplication",
        moduleName: 'hap4',
        abilityName: "Hap4MainAbility1",
      }
      await abilityContext.startAbility(want2).then(() => {
        console.info(TAG5 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG5 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag5_1 || !flag5_2) {
        console.info(TAG5 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0500 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_0600
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0600", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0600 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG6 = "Temp_UriPermissionTest_0600";
      let filePath: string = abilityContext.filesDir + "/test_6.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG6 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG6 + "file created, fd: " + file.fd);
        }
      });
      let uri_6: string = fileUri.getUriFromPath(filePath);
      let flag6_1 = false;
      let flag6_2 = false;
      let flag6_3 = false;

      let eventName6_1: string = 'Temp_UriPermissionTest_0600_Read_Successfully_';
      let eventName6_2: string = 'Temp_UriPermissionTest_0600_Read_Failed_';
      let subscribeInfo6_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName6_1, eventName6_2]
      }
      let subscriber6_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback6_1 = (err: base.BusinessError) => {
        console.info(TAG6 + "===UnSubscribeInfoCallback6_1===")
      }

      let SubscribeCallBackContext6_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG6 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName6_1) {
          console.info(TAG6 + 'read file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName6_2) {
          console.info(TAG6 + ' 6_1 read file failed.');
          commonEvent.unsubscribe(subscriber6_1, UnSubscribeInfoCallback6_1)
          flag6_1 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo6_1).then(async (data) => {
        subscriber6_1 = data;
        console.info('====>Create Subscriber====>');
        await commonEvent.subscribe(subscriber6_1, SubscribeCallBackContext6_1);
      });

      let want: Want = {
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_6,
        parameters: {
          'number': 11
        }
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG6 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG6 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);

      let eventName6_3: string = 'Temp_UriPermissionTest_0600_Read_Successfully';
      let eventName6_4: string = 'Temp_UriPermissionTest_0600_Read_Failed';
      let subscribeInfo6_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName6_3, eventName6_4]
      }
      let subscriber6_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback6_2 = (err: base.BusinessError) => {
        console.info(TAG6 + "===UnSubscribeInfoCallback6_2===")
      }

      let SubscribeCallBackContext6_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG6 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName6_3) {
          console.info(TAG6 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber6_2, UnSubscribeInfoCallback6_2)
          flag6_2 = true;
        }
        if (data.event === eventName6_4) {
          console.info(TAG6 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber6_2, UnSubscribeInfoCallback6_2)
            flag6_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo6_2).then(async (data) => {
        subscriber6_2 = data;
        console.info('====>Create subscriber6_2====>');
        await commonEvent.subscribe(subscriber6_2, SubscribeCallBackContext6_2);
      });

      let eventName6_5: string = 'Temp_UriPermissionTest_0600_Write_Successfully';
      let eventName6_6: string = 'Temp_UriPermissionTest_0600_Write_Failed';
      let subscribeInfo6_3: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName6_5, eventName6_6]
      }
      let subscriber6_3: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback6_3 = (err: base.BusinessError) => {
        console.info(TAG6 + "===UnSubscribeInfoCallback6_3===")
      }

      let SubscribeCallBackContext6_3 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG6 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName6_5) {
          console.info(TAG6 + 'write file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName6_6) {
          console.info(TAG6 + 'write file failed.');
          commonEvent.unsubscribe(subscriber6_3, UnSubscribeInfoCallback6_3)
          flag6_3 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo6_3).then(async (data) => {
        subscriber6_3 = data;
        console.info('====>Create subscriber6_3====>');
        await commonEvent.subscribe(subscriber6_3, SubscribeCallBackContext6_3);
      });
      await sleep(1000);

      let want2: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_6,
        parameters: {
          'number': 18
        }
      }
      console.info(TAG6 + ' startAbilityForResult want2');
      abilityContext.startAbilityForResult(want2).then((AbilityResult: ability.AbilityResult) => {
        console.info(TAG6 + ' startAbilityForResult succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG6 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag6_1 || !flag6_2 || !flag6_3) {
        console.info(TAG6 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0600 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_0700
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0700", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0700 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG7 = "Temp_UriPermissionTest_0700";
      let filePath: string = abilityContext.filesDir + "/test_7.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG7 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG7 + "file created, fd: " + file.fd);
        }
      });
      let uri_7: string = fileUri.getUriFromPath(filePath);

      let want: Want = {
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        parameters: {
          'number': 12
        }
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG7 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG7 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);
      let flag7_1 = false;
      let flag7_2 = false;

      let eventName7_1: string = 'Temp_UriPermissionTest_0700_Read_Successfully';
      let eventName7_2: string = 'Temp_UriPermissionTest_0700_Read_Failed';
      let subscribeInfo7_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName7_1, eventName7_2]
      }
      let subscriber7_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback7_1 = (err: base.BusinessError) => {
        console.info(TAG7 + "===UnSubscribeInfoCallback7_1===")
      }

      let SubscribeCallBackContext7_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG7 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName7_1) {
          console.info(TAG7 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber7_1, UnSubscribeInfoCallback7_1)
          flag7_1 = true;
        }
        if (data.event === eventName7_2) {
          console.info(TAG7 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber7_1, UnSubscribeInfoCallback7_1)
            flag7_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo7_1).then(async (data) => {
        subscriber7_1 = data;
        console.info('====>Create subscriber7_1====>');
        await commonEvent.subscribe(subscriber7_1, SubscribeCallBackContext7_1);
      });

      let eventName7_3: string = 'Temp_UriPermissionTest_0700_Write_Successfully';
      let eventName7_4: string = 'Temp_UriPermissionTest_0700_Write_Failed';
      let subscribeInfo7_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName7_3, eventName7_4]
      }
      let subscriber7_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback7_2 = (err: base.BusinessError) => {
        console.info(TAG7 + "===UnSubscribeInfoCallback7_2===")
      }

      let SubscribeCallBackContext7_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG7 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName7_3) {
          console.info(TAG7 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber7_2, UnSubscribeInfoCallback7_2)
          flag7_2 = true;
        }
        if (data.event === eventName7_4) {
          console.info(TAG7 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber7_2, UnSubscribeInfoCallback7_2)
            flag7_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo7_2).then(async (data) => {
        subscriber7_2 = data;
        console.info('====>Create subscriber7_2====>');
        await commonEvent.subscribe(subscriber7_2, SubscribeCallBackContext7_2);
      });
      await sleep(1000);

      let want2: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility2",
        uri: uri_7,
        parameters: {
          'number': 21
        }
      }
      abilityContext.startAbilityForResult(want2).then((AbilityResult: ability.AbilityResult) => {
        console.info(TAG7 + ' startAbilityForResult succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG7 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag7_1 || !flag7_2) {
        console.info(TAG7 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0700 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_0800
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_0800", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_0800 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG8 = "Temp_UriPermissionTest_0800";
      let filePath: string = abilityContext.filesDir + "/test_8.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG8 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG8 + "file created, fd: " + file.fd);
        }
      });
      let uri_8: string = fileUri.getUriFromPath(filePath);
      let flag8_1 = false;
      let flag8_2 = false;
      let flag8_3 = false;
      let flag8_4 = false;

      let eventName8_1: string = 'Temp_UriPermissionTest_0800_Read_Successfully';
      let eventName8_2: string = 'Temp_UriPermissionTest_0800_Read_Failed';
      let subscribeInfo8_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName8_1, eventName8_2]
      }
      let subscriber8_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback8_1 = (err: base.BusinessError) => {
        console.info(TAG8 + "===UnSubscribeInfoCallback8_1===")
      }

      let SubscribeCallBackContext8_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG8 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName8_1) {
          console.info(TAG8 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber8_1, UnSubscribeInfoCallback8_1)
          flag8_1 = true;
        }
        if (data.event === eventName8_2) {
          console.info(TAG8 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber8_1, UnSubscribeInfoCallback8_1)
            flag8_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo8_1).then(async (data) => {
        subscriber8_1 = data;
        console.info('====>Create subscriber8_1====>');
        await commonEvent.subscribe(subscriber8_1, SubscribeCallBackContext8_1);
      });

      let eventName8_3: string = 'Temp_UriPermissionTest_0800_Write_Successfully';
      let eventName8_4: string = 'Temp_UriPermissionTest_0800_Write_Failed';
      let subscribeInfo8_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName8_3, eventName8_4]
      }
      let subscriber8_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback8_2 = (err: base.BusinessError) => {
        console.info(TAG8 + "===UnSubscribeInfoCallback8_2===")
      }

      let SubscribeCallBackContext8_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG8 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName8_3) {
          console.info(TAG8 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber8_2, UnSubscribeInfoCallback8_2)
          flag8_2 = true;
        }
        if (data.event === eventName8_4) {
          console.info(TAG8 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber8_2, UnSubscribeInfoCallback8_2)
            flag8_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo8_2).then(async (data) => {
        subscriber8_2 = data;
        console.info('====>Create subscriber8_2====>');
        await commonEvent.subscribe(subscriber8_2, SubscribeCallBackContext8_2);
      });
      await sleep(300);

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_8,
        parameters: {
          'number': 13
        }
      }
      await abilityContext.startAbilityForResult(want).then((result: ability.AbilityResult) => {
        console.info(TAG8 + ' startAbilityForResult succeed');
        let uri : string | undefined = result.want!.uri;
        if (uri == null || uri == undefined) {
          console.info(TAG8 + " uri is invalid");
          expect().assertFail();
          return;
        }
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info(TAG8 + "file fd: " + file.fd);
          flag8_3 = true;
        }).catch((err:base.BusinessError) => {
          console.info(TAG8 + "open file failed with error message: " + err.message + ", error code: " + err.code);
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            flag8_3 = true;
          } else {
            expect().assertFail();
          }
        });

        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info(TAG8 + "file fd: " + file.fd);
          flag8_4 = true;
        }).catch((err:base.BusinessError) => {
          console.info(TAG8 + "open file failed with error message: " + err.message + ", error code: " + err.code);
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            flag8_4 = true;
          } else {
            expect().assertFail();
          }
        });
      }).catch((error: base.BusinessError) => {
        console.info(TAG8 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag8_1 || !flag8_2 || !flag8_3 || !flag8_4) {
        console.info(TAG8 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_0800 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_1000
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_1000", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_1000 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG10 = "Temp_UriPermissionTest_1000";
      let filePath: string = abilityContext.filesDir + "/test_9.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG10 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG10 + "file created, fd: " + file.fd);
        }
      });
      let uri_9: string = fileUri.getUriFromPath(filePath);

      let filePath_10: string = abilityContext.filesDir + "/test_10.txt";
      fs.open(filePath_10, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG10 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG10 + "file created, fd: " + file.fd);
        }
      });
      let uri_10: string = fileUri.getUriFromPath(filePath_10);
      let flag10_1 = false;
      let flag10_2 = false;

      let eventName10_1: string = 'Temp_UriPermissionTest_1001_Write_Successfully';
      let eventName10_2: string = 'Temp_UriPermissionTest_1001_Write_Failed';
      let subscribeInfo10_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName10_1, eventName10_2]
      }
      let subscriber10_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback10_1 = (err: base.BusinessError) => {
        console.info(TAG10 + "===UnSubscribeInfoCallback10_1===")
      }

      let SubscribeCallBackContext10_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG10 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName10_1) {
          console.info(TAG10 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber10_1, UnSubscribeInfoCallback10_1)
          flag10_1 = true;
        }
        if (data.event === eventName10_2) {
          console.info(TAG10 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber10_1, UnSubscribeInfoCallback10_1)
            flag10_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo10_1).then(async (data) => {
        subscriber10_1 = data;
        console.info('====>Create subscriber10_1====>');
        await commonEvent.subscribe(subscriber10_1, SubscribeCallBackContext10_1);
      });

      let eventName10_3: string = 'Temp_UriPermissionTest_1002_Write_Successfully';
      let eventName10_4: string = 'Temp_UriPermissionTest_1002_Write_Failed';
      let subscribeInfo10_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName10_3, eventName10_4]
      }
      let subscriber10_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback10_2 = (err: base.BusinessError) => {
        console.info(TAG10 + "===UnSubscribeInfoCallback10_2===")
      }

      let SubscribeCallBackContext10_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG10 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName10_3) {
          console.info(TAG10 + 'write file succeed.');
          commonEvent.unsubscribe(subscriber10_2, UnSubscribeInfoCallback10_2)
          flag10_2 = true;
        }
        if (data.event === eventName10_4) {
          console.info(TAG10 + 'write file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber10_2, UnSubscribeInfoCallback10_2)
            flag10_2 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo10_2).then(async (data) => {
        subscriber10_2 = data;
        console.info('====>Create subscriber10_2====>');
        await commonEvent.subscribe(subscriber10_2, SubscribeCallBackContext10_2);
      });

      let uris: string[] = [uri_9, uri_10]
      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        parameters: {
          "ability.params.stream": uris,
          'number': 14
        }
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG10 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG10 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag10_1 || !flag10_2) {
        console.info(TAG10 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_1000 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_1100
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_1100", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_1100 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG11 = "Temp_UriPermissionTest_1100";
      let flag11_1 = false;
      let flag11_2 = false;
      let eventName11_1: string = 'Temp_UriPermissionTest_1100_Read_Successfully';
      let eventName11_2: string = 'Temp_UriPermissionTest_1100_Read_Failed';
      let subscribeInfo11_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName11_1, eventName11_2]
      }
      let subscriber11_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback11_1 = (err: base.BusinessError) => {
        console.info(TAG11 + "===UnSubscribeInfoCallback11_1===")
      }

      let SubscribeCallBackContext11_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG11 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName11_1) {
          console.info(TAG11 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber11_1, UnSubscribeInfoCallback11_1)
          flag11_1 = true;
        }
        if (data.event === eventName11_2) {
          console.info(TAG11 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber11_1, UnSubscribeInfoCallback11_1)
            flag11_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo11_1).then(async (data) => {
        subscriber11_1 = data;
        console.info('====>Create subscriber11_1====>');
        await commonEvent.subscribe(subscriber11_1, SubscribeCallBackContext11_1);
      });

      let eventName11_3: string = 'Temp_UriPermissionTest_1100_Write_Successfully';
      let eventName11_4: string = 'Temp_UriPermissionTest_1100_Write_Failed';
      let subscribeInfo11_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName11_3, eventName11_4]
      }
      let subscriber11_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback11_2 = (err: base.BusinessError) => {
        console.info(TAG11 + "===UnSubscribeInfoCallback11_2===")
      }

      let SubscribeCallBackContext11_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG11 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName11_3) {
          console.info(TAG11 + 'write file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName11_4) {
          console.info(TAG11 + 'write file failed.');
          commonEvent.unsubscribe(subscriber11_2, UnSubscribeInfoCallback11_2)
          flag11_2 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo11_2).then(async (data) => {
        subscriber11_2 = data;
        console.info('====>Create subscriber11_2====>');
        await commonEvent.subscribe(subscriber11_2, SubscribeCallBackContext11_2);
      });

      let want: Want = {
        bundleName: "com.example.faapplication",
        abilityName: "com.example.faapplication.MainAbility",
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG11 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG11 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag11_1 || !flag11_2) {
        console.info(TAG11 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_1100 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_1200
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_1200", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_1200 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG12 = "Temp_UriPermissionTest_1200";
      let filePath: string = abilityContext.filesDir + "/test_11.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG12 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG12 + "file created, fd: " + file.fd);
        }
      });
      let uri_11: string = fileUri.getUriFromPath(filePath);

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "ServiceAbility",
        uri: uri_11
      }
      await abilityContext.startServiceExtensionAbility(want).then(() => {
        console.info(TAG12 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG12 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);
      let flag12_1 = false;

      let eventName12_1: string = 'Temp_UriPermissionTest_1200_Write_Successfully';
      let eventName12_2: string = 'Temp_UriPermissionTest_1200_Write_Failed';
      let subscribeInfo12_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName12_1, eventName12_2]
      }
      let subscriber12_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback12_1 = (err: base.BusinessError) => {
        console.info(TAG12 + "===UnSubscribeInfoCallback12_1===")
      }

      let SubscribeCallBackContext12_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG12 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName12_1) {
          console.info(TAG12 + 'write file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName12_2) {
          console.info(TAG12 + 'write file failed.');
          commonEvent.unsubscribe(subscriber12_1, UnSubscribeInfoCallback12_1)
          flag12_1 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo12_1).then(async (data) => {
        subscriber12_1 = data;
        console.info('====>Create subscriber12_1====>');
        await commonEvent.subscribe(subscriber12_1, SubscribeCallBackContext12_1);
      });

      let want2: Want = {
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_11,
        parameters: {
          'number': 15
        }
      }
      await abilityContext.startAbility(want2).then(() => {
        console.info(TAG12 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG12 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag12_1) {
        console.info(TAG12 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_1200 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_1400
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_1400", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_1400 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG14 = "Temp_UriPermissionTest_1400";
      let filePath: string = abilityContext.filesDir + "/test_12.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG14 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG14 + "file created, fd: " + file.fd);
        }
      });
      let uri_12: string = fileUri.getUriFromPath(filePath);
      let flag14_1 = false;
      let flag14_2 = false;

      let eventName14_1: string = 'Temp_UriPermissionTest_1400_Read_Successfully';
      let eventName14_2: string = 'Temp_UriPermissionTest_1400_Read_Failed';
      let subscribeInfo14_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName14_1, eventName14_2]
      }
      let subscriber14_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback14_1 = (err: base.BusinessError) => {
        console.info(TAG14 + "===UnSubscribeInfoCallback14_1===")
      }

      let SubscribeCallBackContext14_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG14 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName14_1) {
          console.info(TAG14 + 'read file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName14_2) {
          console.info(TAG14 + 'read file failed.');
          commonEvent.unsubscribe(subscriber14_1, UnSubscribeInfoCallback14_1)
          flag14_1 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo14_1).then(async (data) => {
        subscriber14_1 = data;
        console.info(TAG14 + '====>Create subscriber14_1====>');
        await commonEvent.subscribe(subscriber14_1, SubscribeCallBackContext14_1);
      });

      let eventName14_3: string = 'Temp_UriPermissionTest_1400_Write_Successfully';
      let eventName14_4: string = 'Temp_UriPermissionTest_1400_Write_Failed';
      let subscribeInfo14_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName14_3, eventName14_4]
      }
      let subscriber14_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback14_2 = (err: base.BusinessError) => {
        console.info(TAG14 + "===UnSubscribeInfoCallback14_2===")
      }

      let SubscribeCallBackContext14_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG14 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName14_3) {
          console.info(TAG14 + 'write file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName14_4) {
          console.info(TAG14 + 'write file failed.');
          commonEvent.unsubscribe(subscriber14_2, UnSubscribeInfoCallback14_2)
          flag14_2 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo14_2).then(async (data) => {
        subscriber14_2 = data;
        console.info(TAG14 + '====>Create subscriber14_2====>');
        await commonEvent.subscribe(subscriber14_2, SubscribeCallBackContext14_2);
      });

      let want: Want = {
        flags: 0,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_12,
        parameters: {
          'number': 17
        }
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG14 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG14 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag14_1 || !flag14_2) {
        console.info(TAG14 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_1400 is end---------------")
    });

    /*
     * @tc.number  Temp_UriPermissionTest_1500
     * @tc.name    The ability of HAP A grant uri permission to the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Temp_UriPermissionTest_1500", Level.LEVEL0, async (done: Function) => {
      console.info("---------------Temp_UriPermissionTest_1500 is start---------------")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let TAG15 = "Temp_UriPermissionTest_1500";
      let filePath: string = abilityContext.filesDir + "/test_13.txt";
      fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
        if (err) {
          console.info(TAG15 + "mkdir failed with error message: " + err.message + ", error code: " + err.code);
          expect().assertFail();
        } else {
          console.info(TAG15 + "file created, fd: " + file.fd);
        }
      });
      let uri_13: string = fileUri.getUriFromPath(filePath);
      let flag15_1 = false;
      let flag15_2 = false;
      let flag15_3 = false;

      let eventName15_1: string = 'Temp_UriPermissionTest_1500_Read_Successfully';
      let eventName15_2: string = 'Temp_UriPermissionTest_1500_Read_Failed';
      let subscribeInfo15_1: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName15_1, eventName15_2]
      }
      let subscriber15_1: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback15_1 = (err: base.BusinessError) => {
        console.info(TAG15 + "===UnSubscribeInfoCallback15_1===")
      }

      let SubscribeCallBackContext15_1 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG15 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName15_1) {
          console.info(TAG15 + 'read file succeed.');
          commonEvent.unsubscribe(subscriber15_1, UnSubscribeInfoCallback15_1)
          flag15_1 = true;
        }
        if (data.event === eventName15_2) {
          console.info(TAG15 + 'read file failed.');
          if (canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization') === false) {
            commonEvent.unsubscribe(subscriber15_1, UnSubscribeInfoCallback15_1)
            flag15_1 = true;
          } else {
            expect().assertFail();
          }
        }
      }

      commonEvent.createSubscriber(subscribeInfo15_1).then(async (data) => {
        subscriber15_1 = data;
        console.info('====>Create subscriber15_1====>');
        await commonEvent.subscribe(subscriber15_1, SubscribeCallBackContext15_1);
      });

      let eventName15_3: string = 'Temp_UriPermissionTest_1500_Write_Successfully';
      let eventName15_4: string = 'Temp_UriPermissionTest_1500_Write_Failed';
      let subscribeInfo15_2: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName15_3, eventName15_4]
      }
      let subscriber15_2: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback15_2 = (err: base.BusinessError) => {
        console.info(TAG15 + "===UnSubscribeInfoCallback15_2===")
      }

      let SubscribeCallBackContext15_2 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG15 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName15_3) {
          console.info(TAG15 + 'write file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName15_4) {
          console.info(TAG15 + 'write file failed.');
          commonEvent.unsubscribe(subscriber15_2, UnSubscribeInfoCallback15_2)
          flag15_2 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo15_2).then(async (data) => {
        subscriber15_2 = data;
        console.info('====>Create subscriber15_2====>');
        await commonEvent.subscribe(subscriber15_2, SubscribeCallBackContext15_2);
      });

      let want: Want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_13,
        parameters: {
          'number': 101
        }
      }
      await abilityContext.startAbility(want).then(() => {
        console.info(TAG15 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG15 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      await sleep(1000);

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa force-stop com.acts.authorizeduriapplication").then(data => {
        console.info(TAG15 + "force-stop data is: " + JSON.stringify(data))
      }).catch((err:base.BusinessError) => {
        console.info(TAG15 + "force-stop err is: " + JSON.stringify(err))
      })
      await sleep(3000);

      let eventName15_5: string = 'Temp_UriPermissionTest_1500_Read_Successfully_';
      let eventName15_6: string = 'Temp_UriPermissionTest_1500_Read_Failed_';
      let subscribeInfo15_3: commonEvent.CommonEventSubscribeInfo = {
        events: [eventName15_5, eventName15_6]
      }
      let subscriber15_3: commonEvent.CommonEventSubscriber;

      let UnSubscribeInfoCallback15_3 = (err: base.BusinessError) => {
        console.info(TAG15 + "===UnSubscribeInfoCallback15_3===")
      }

      let SubscribeCallBackContext15_3 = (err: base.BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG15 + ' Subscribe CallBack data:' + JSON.stringify(data));
        if (data.event === eventName15_5) {
          console.info(TAG15 + 'read file succeed.');
          expect().assertFail();
        }
        if (data.event === eventName15_6) {
          console.info(TAG15 + 'read file failed.');
          commonEvent.unsubscribe(subscriber15_3, UnSubscribeInfoCallback15_3)
          flag15_3 = true;
        }
      }

      commonEvent.createSubscriber(subscribeInfo15_3).then(async (data) => {
        subscriber15_3 = data;
        console.info('====>Create subscriber15_3====>');
        await commonEvent.subscribe(subscriber15_3, SubscribeCallBackContext15_3);
      });

      let want2: Want = {
        bundleName: "com.acts.authorizeduriapplication",
        abilityName: "Hap2MainAbility1",
        uri: uri_13,
        parameters: {
          'number': 102
        }
      }
      await abilityContext.startAbility(want2).then(() => {
        console.info(TAG15 + ' startAbility succeed');
      }).catch((error: base.BusinessError) => {
        console.info(TAG15 + 'error.code: ' + JSON.stringify(error.code) + ' error.message: ' +
        JSON.stringify(error.message));
      });
      while (!flag15_1 || !flag15_2 || !flag15_3) {
        console.info(TAG15 + 'waiting callback');
        await sleep(1000);
      }

      done()
      console.info("---------------Temp_UriPermissionTest_1500 is end---------------")
    });

  })
}
