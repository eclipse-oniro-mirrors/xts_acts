/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, afterEach, it, expect, beforeAll, Level } from '@ohos/hypium';
import appManagerNew from '@ohos.app.ability.appManager';
import commonEvent from '@ohos.commonEvent';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import contextConstant from "@ohos.app.ability.contextConstant";
import wantConstant from "@ohos.app.ability.wantConstant";
import formBindingData from '@ohos.app.form.formBindingData';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import fs from '@ohos.file.fs';
import insightIntent from '@ohos.app.ability.insightIntent';
import startOptions from '@ohos.app.ability.StartOptions';
import ability from '@ohos.ability.ability';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { AbilityLifecycleCallback } from '@kit.AbilityKit';
import { Driver } from '@ohos.UiTest';
import DemoProcess from '../process/AProcess';
import { window } from '@kit.ArkUI';

let EXTENSION_INFO_ERR = 16000001;
let INNER_ERROR = 16000050;
let PARAM_ERROR = 401;
let CROSS_USER_DENY = 201;
let array: string[] = new Array();
let TAG = '';
let createModuleContext: ESObject;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

function func1(a: string, b: string) {
  array.push(a);
  array.push(b);
}

let driver1:Driver;
export default function ApiCoverTest() {
  describe('ApiCoverTestTest', () => {
    beforeAll(async()=>{
      try{
        driver1 = await Driver.create();
      }catch{
        console.info("ApiCoverTestTest beforeAll create driver error" );
      }
    })
    afterEach(async (done: Function) => {
      try{
        await driver1.delayMs(2500);
        done();
      }catch{
        console.info("ApiCoverTestTest afterEach delayMs error" );
      }
    })
    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_001
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_001', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      };
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startServiceExtensionAbility(want)
        .then((data) => {
          console.log('Ability: startServiceExtensionAbility success:' + JSON.stringify(data));
          expect("case execute failed").assertEqual(data);
        })
        .catch((error: BusinessError) => {
          console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(error)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(error.code);
        })
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_002
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_002', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.stopServiceExtensionAbility(want)
        .then((data) => {
          console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        })
        .catch((error: BusinessError) => {
          console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(error)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(error.code);
        })
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_003
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_003', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startServiceExtensionAbilityWithAccount(want, 999)
        .then((data) => {
          console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual("data");
        })
        .catch((error: BusinessError) => {
          console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
          if(canIUse("SystemCapability.Security.DataLossPrevention")){
            console.log(`Ability: startServiceExtensionAbilityWithAccount with DLP: ${JSON.stringify(error)}`);
            expect(CROSS_USER_DENY).assertEqual(error.code);
          }else{
            expect(16000006).assertEqual(error.code);
          }
        })
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_004
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_004', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.stopServiceExtensionAbilityWithAccount(want, 999)
        .then((data) => {
          console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        })
        .catch((error: BusinessError) => {
          console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
          if(canIUse("SystemCapability.Security.DataLossPrevention")){
            console.log(`Ability: startServiceExtensionAbilityWithAccount with DLP: ${JSON.stringify(error)}`);
            expect(CROSS_USER_DENY).assertEqual(error.code);
          }else{
            expect(16000006).assertEqual(error.code);
          }
        })
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_005
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_005', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      }
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_006
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_006', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.stopServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done();
      })
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_007
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_007', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          if(canIUse("SystemCapability.Security.DataLossPrevention")){
            console.log(`Ability: startServiceExtensionAbilityWithAccount with DLP: ${JSON.stringify(err)}`);
            expect(CROSS_USER_DENY).assertEqual(err.code);
          }else{
            expect(16000006).assertEqual(err.code);
          }
        } else {
          console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_008
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_008', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.stopServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          if(canIUse("SystemCapability.Security.DataLossPrevention")){
            console.log(`Ability: startServiceExtensionAbilityWithAccount with DLP: ${JSON.stringify(err)}`);
            expect(CROSS_USER_DENY).assertEqual(err.code);
          }else{
            expect(16000006).assertEqual(err.code);
          }
        } else {
          console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_009
     * @tc.name    connectServiceExtensionAbility with invalid want.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_009', Level.LEVEL0, async (done: Function) => {
      console.log(`SUB_AA_ABILITY_Extension_API_009 start`);
      let want: Want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      let options: common.ConnectOptions = {
        onConnect: (elementName, proxy) => {
          console.log("onConnect");
        },
        onDisconnect: () => {
          console.log("onDisconnect");
        },
        onFailed: () => {
          console.log("onFailed");
          done();
        }
      }
      try {
        let id = AppStorage.get<common.UIAbilityContext>("abilityContext")!.connectServiceExtensionAbility(want, options);
        console.log(`connectServiceExtensionAbility id: ${id}`);
      } catch (err) {
        console.log(`connectServiceExtensionAbility catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_010
     * @tc.name    disconnectServiceExtensionAbility with invalid connectionId.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_010', Level.LEVEL0, async (done: Function) => {
      console.log(`SUB_AA_ABILITY_Extension_API_010 start`);
      try {
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.disconnectServiceExtensionAbility(undefined, (err, data) => {
          console.log(`disconnectServiceExtensionAbility, err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
          expect(err.code).assertEqual(INNER_ERROR);
          done();
        })
      } catch (err) {
        console.log(`disconnectServiceExtensionAbility catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_011
     * @tc.name    disconnectServiceExtensionAbility with invalid connectionId.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_011', Level.LEVEL0, async (done: Function) => {
      console.log(`SUB_AA_ABILITY_Extension_API_011 start`);
      try {
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.disconnectServiceExtensionAbility(undefined)
          .then(() => {
            console.log(`disconnectServiceExtensionAbility successfully`);
          });
      } catch (err) {
        console.log(`disconnectServiceExtensionAbility catch code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(INNER_ERROR);
        expect().assertFail();
      }
      done();
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_012
     * @tc.name    killProcessesBySelf with invalid param.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_012', Level.LEVEL0, async (done: Function) => {
      try {
        let info: appManagerNew.ProcessInformation;
        let stageContext: common.AbilityStageContext = AppStorage.get<common.AbilityStageContext>("stageContext")!;
        let abilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext")!;
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        let baseContext: common.BaseContext = stageContext;
        let context: common.Context = stageContext;
        let flag = false;
        let el5 = contextConstant.AreaMode.EL5;
        let el1 = contextConstant.AreaMode.EL1;
        let el2 = contextConstant.AreaMode.EL2;
        let eventHub: common.EventHub = context.eventHub;
        let abilityResult: common.AbilityResult;
        let connectOptions: common.ConnectOptions;
        let abilityStartCllback: common.AbilityStartCallback;
        let pacMap: common.PacMap;
        let emContext: common.EmbeddableUIAbilityContext;
        let FApacMap: ability.PacMap;
        let vpnExtensionContext: common.VpnExtensionContext;
        console.log("killAllProcesses:" + JSON.stringify(appContext.killAllProcesses));
        console.log("vpnExtensionContext:" + JSON.stringify(vpnExtensionContext!));
        console.log("abilityStartCllback:" + JSON.stringify(abilityStartCllback!));
        console.log("pacMap:" + JSON.stringify(pacMap!));
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let abilityDelegatorArgs: abilityDelegatorRegistry.AbilityDelegatorArgs;
        abilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
        let abilityMonitor: abilityDelegatorRegistry.AbilityMonitor = {
          abilityName: "FirstExtension"
        }
        abilityDelegator.addAbilityMonitor(abilityMonitor, (err, data) => {
          console.log(`printMsg, err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
          flag = true;
        })
        let shellCmdResult: abilityDelegatorRegistry.ShellCmdResult;
        await sleep(2000);
        abilityDelegator.removeAbilityMonitor(abilityMonitor, (err, data) => {
          console.log(`SUB_AA_ABILITY_Extension_API_012 printMsg, err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
          expect(flag).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_AMS_Context_0100
     * @tc.name    Get the resource and path of the context.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_0100', Level.LEVEL0, async (done: Function) => {
      expect("/data/storage/el2/base/haps/entry_test/cache")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.cacheDir);
      expect("/data/storage/el2/base/haps/entry_test/temp")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.tempDir);
      expect("/data/storage/el2/base/haps/entry_test/files")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.filesDir);
      expect("/data/storage/el2/database/entry_test")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.databaseDir);
      expect("/data/storage/el2/base/haps/entry_test/preferences")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.preferencesDir);
      expect("/data/storage/el1/bundle")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.bundleCodeDir);
      expect("/data/storage/el2/distributedfiles")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.distributedFilesDir);
      expect("/data/storage/el2/cloud")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.cloudFileDir);
      expect(1).assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.area);
      if (AppStorage.get<common.UIAbilityContext>("abilityContext")!.resourceDir != "") {
        fs.access(AppStorage.get<common.UIAbilityContext>("abilityContext")!.resourceDir, (err, res) => {
          if (err == undefined) {
            expect(true).assertTrue;
          } else {
            expect(false).assertTrue;
          }
        })
      }
      createModuleContext = null;
      try {
        let createModuleContext = AppStorage.get<common.UIAbilityContext>("abilityContext")!.createModuleContext("module1");
        expect("/data/storage/el2/base/cache").assertEqual(createModuleContext.cacheDir);
      } catch (error) {
        console.log("createModuleContext fail");
      }
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.area = 0;
      let mccvalue = AppStorage.get<common.UIAbilityContext>("abilityContext")!.config?.mcc;
      let mncValue = AppStorage.get<common.UIAbilityContext>("abilityContext")!.config?.mnc;
      let locale = AppStorage.get<common.UIAbilityContext>("abilityContext")!.config?.locale;
      console.log(`Ability: getConfiguration config.mnc: ${mccvalue}`);
      console.log(`Ability: getConfiguration config.mnc: ${mncValue}`);
      console.log(`Ability: getConfiguration config.locale: ${locale}`);
      expect(0).assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.area);
      let AbilityContext: common.UIAbilityContext;
      AbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext;
      let currentDeviceOrientation = AbilityContext?.config?.direction;
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.resourceManager.getConfiguration((err, data) => {
        if (err == undefined) {
          console.log(`Ability: getConfiguration success: ${JSON.stringify(data)}`);
          console.log(`Ability: getConfiguration success1: ${JSON.stringify(data.direction)}`);
          console.log(`Ability: getConfiguration success1: ${JSON.stringify(data.mcc)}`);
          console.log(`Ability: getConfiguration success1: ${JSON.stringify(data.mnc)}`);
          expect(0).assertEqual(data.mcc)
          expect(0).assertEqual(data.mnc)
          expect(currentDeviceOrientation).assertEqual(data.direction);
          done();
        } else {
          expect().assertFail();
          done();
        }
      })
    })

    /*
       * @tc.number  SUB_AA_AMS_Context_0200
       * @tc.name    Register the listener of Ability and cancel the listener.
       * @tc.desc    Function test
       * @tc.size:   MediumTest
       * @tc.type:   Function
       * @tc.level   3
       */
    it('SUB_AA_AMS_Context_0200', Level.LEVEL0, async (done: Function) => {
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.eventHub.on("contextEvent", func1);
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.eventHub.emit("contextEvent", "aa", "bb");
      await sleep(500);
      expect("aa").assertEqual(array[0]);
      expect("bb").assertEqual(array[1]);
      array = [];
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.eventHub.off("contextEvent", func1);
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.eventHub.emit("contextEvent", "cc", "dd");
      await sleep(500);
      expect(array.length).assertEqual(0);
      array = [];
      await sleep(2000);
      done();
    })

    /*
     * @tc.number  SUB_AA_Test_InsightIntent_0100
     * @tc.name    Test insightIntent.ExecuteMode and startOptions.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Test_InsightIntent_0100', Level.LEVEL0, async (done: Function) => {
      let startOp: startOptions = {
        withAnimation: false,
        displayId: 0,
        windowLeft: 100,
        windowTop: 100,
        windowWidth: 100,
        windowHeight: 100,
      }
      let startWant: Want = {
        deviceId: "",
        bundleName: "ohos.acts.aafwk.test.stagesupplementerr",
        abilityName: "MainAbility3",
      }
      expect(0).assertEqual(insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND);
      expect(1).assertEqual(insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND);
      console.info("SUB_AA_Test_InsightIntent_0100:" + insightIntent.ExecuteMode.UI_EXTENSION_ABILITY);
      // expect(2).assertEqual(insightIntent.ExecuteMode.UI_EXTENSION_ABILITY)
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(startWant, startOp, (err, data) => {
        if (err.code == 0) {
          console.info("SUB_AA_FMS_AbilityStage_0100===CreateSubscriberCallback===");
          expect().assertFail();
          done();
        } else {
          console.info("SUB_AA_FMS_AbilityStage_0100===failed===");
          expect(err.code).assertEqual(EXTENSION_INFO_ERR);
          done();
        }
      })
    });

    /*
     * @tc.number  SUB_AA_Test_StartOptions_0100
     * @tc.name    Test insightIntent.ExecuteMode and startOptions.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Test_StartOptions_0100', Level.LEVEL0, async (done: Function) => {
      let windowParam: window.WindowCreateParams = {};
      let startOp: startOptions = {
        withAnimation: false,
        displayId: 0,
        windowLeft: 100,
        windowTop: 100,
        windowWidth: 100,
        windowHeight: 100,
        windowFocused: true,
        windowCreateParams: windowParam
      }
      let startWant: Want = {
        deviceId: "",
        bundleName: "ohos.acts.aafwk.test.stagesupplementerr",
        abilityName: "MainAbility3",
      }
      expect(0).assertEqual(insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND);
      expect(1).assertEqual(insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND);
      console.info("SUB_AA_Test_StartOptions_0100:" + insightIntent.ExecuteMode.UI_EXTENSION_ABILITY);
      // expect(2).assertEqual(insightIntent.ExecuteMode.UI_EXTENSION_ABILITY)
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(startWant, startOp, (err, data) => {
        if (err.code == 0) {
          console.info("SUB_AA_FMS_AbilityStage_0100===CreateSubscriberCallback===");
          expect().assertFail();
          done();
        } else {
          console.info("SUB_AA_FMS_AbilityStage_0100===failed===");
          expect(err.code).assertEqual(EXTENSION_INFO_ERR);
          done();
        }
      })
    });

    /*
     * @tc.number  SUB_AA_FMS_AbilityStage_0100
     * @tc.name    Start AbilityStage and get config.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_FMS_AbilityStage_0100', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_FMS_AbilityStage_0100===AbilityStage===" + JSON.stringify(AppStorage.get<common.AbilityStageContext>("stageContext")!));
      console.info("SUB_AA_FMS_AbilityStage_0100===AbilityStage===" + JSON.stringify(AppStorage.get<common.AbilityStageContext>("stageContext")!.config));
      let directions = AppStorage.get<common.AbilityStageContext>("stageContext")!.config.direction;
      let pointer = AppStorage.get<common.AbilityStageContext>("stageContext")!.config.hasPointerDevice;
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["AbilityStage_StartAbility"]
      }
      commonEvent.createSubscriber(subscribeInfo, (err, data) => {
        console.info("SUB_AA_FMS_AbilityStage_0100===CreateSubscriberCallback===")
        subscriber = data
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.info("SUB_AA_FMS_AbilityStage_0100===SubscribeInfoCallback===" + JSON.stringify(data));
          expect(data.parameters?.config).assertEqual(-1);
          expect(data.parameters?.config).assertEqual(directions);
          expect(typeof (pointer)).assertEqual("boolean");
          commonEvent.unsubscribe(subscriber, () => {
            console.info("SUB_AA_FMS_AbilityStage_0100===UnSubscribeInfoCallback===");
            done();
          })
          await sleep(4000);
          done();
        })
      })
      let formWant: Want = {
        deviceId: "",
        bundleName: "ohos.acts.aafwk.test.stagesupplement",
        abilityName: "MainAbility3",
      }
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(formWant, (err, data) => {
        if (err.code == 0) {
          console.info("SUB_AA_FMS_AbilityStage_0100===CreateSubscriberCallback===");
        } else {
          console.info("SUB_AA_FMS_AbilityStage_0100===failed===");
          expect().assertFail();
          done();
        }
      })
    })

    /*
     * @tc.number  SUB_AA_FMS_AcquireForm_0100
     * @tc.name    Test startAbility in FormExtensionContext.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_FMS_AcquireForm_0100', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEventManager.CommonEventSubscriber;
      let formExtensionContext: common.FormExtensionContext
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Form_StartAbility"]
      }

      commonEvent.createSubscriber(subscribeInfo, (err, data) => {
        console.info("SUB_AA_FMS_AcquireForm_0100 ===CreateSubscriberCallback===");
        subscriber = data;
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.info("SUB_AA_FMS_AcquireForm_0100 ===SubscribeInfoCallback===" + JSON.stringify(data));
          expect(data.parameters?.Life).assertEqual("onForeground");
          commonEvent.unsubscribe(subscriber, () => {
            console.info("SUB_AA_FMS_AcquireForm_0100 ===UnSubscribeInfoCallback===");
          })
          await sleep(4000);
          done();
        })
      })
      let formWant: Want = {
        deviceId: "",
        bundleName: "com.example.apicoverhaptest",
        abilityName: "CreateFormAbility",
        parameters: {
          "createForm": true
        }
      }
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(formWant, (err, data) => {
        if (err.code == 0) {
          console.info("SUB_AA_FMS_AcquireForm_0100 ===acquireFormState=== " + JSON.stringify(data));
        } else {
          expect().assertFail();
          done();
        }
      })
    })

    /*
     * @tc.number  SUB_AA_AbilityAppManager_0100
     * @tc.name    The form of a promise getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_AbilityAppManager_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      TAG = 'SUB_AA_AbilityAppManager_0100';
      await appManagerNew.getRunningProcessInformation()
        .then((data) => {
          console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)}`);
          for (let i = 0; i < data.length; i++) {
            console.log(`${TAG} getRunningProcessInformation${i} : ${JSON.stringify(data[i])}`);
            expect(typeof (data[i].pid)).assertEqual("number");
            expect(data[i].pid).assertLarger(0);
            expect(typeof (data[i].uid)).assertEqual("number");
            expect(data[i].uid).assertLarger(0);
            expect(typeof (data[i].processName)).assertEqual("string");
            expect(data[i].processName.length).assertLarger(0);
            expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
            expect(data[i].bundleNames.length).assertLarger(0);
          }
          done();
        })
        .catch((err: BusinessError) => {
          console.log(`${TAG} getRunningProcessInformation err  ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
    })

    /*
     * @tc.number  SUB_AA_AbilityAppManager_0200
     * @tc.name    The form of a callback getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_AbilityAppManager_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_AbilityAppManager_0200';
      appManagerNew.getRunningProcessInformation((err, data) => {
        console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)} err: ${JSON.stringify(err)}`);
        for (let i = 0; i < data.length; i++) {
          console.log(`${TAG} getRunningProcessInformation${i} : ${JSON.stringify(data[i])}`);
          expect(typeof (data[i].pid)).assertEqual("number");
          expect(data[i].pid).assertLarger(0);
          expect(typeof (data[i].uid)).assertEqual("number");
          expect(data[i].uid).assertLarger(0);
          expect(typeof (data[i].processName)).assertEqual("string");
          expect(data[i].processName.length).assertLarger(0);
          expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
          expect(data[i].bundleNames.length).assertLarger(0);
          expect(typeof data[i].state).assertEqual("number");
          expect(data[i].state).assertLarger(-1);
          expect(data[i].state).assertLess(5);
        }
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_ApplicationContext_0100
     * @tc.name    The form of a promise getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ApplicationContext_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_ApplicationContext_0100';
      await AppStorage.get<common.ApplicationContext>("applicationContext")!.getRunningProcessInformation()
        .then((data) => {
          console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)}`);
          for (let i = 0; i < data.length; i++) {
            console.log(`${TAG} getRunningProcessInformation${i} : ${JSON.stringify(data[i])}`);
            expect(typeof (data[i].pid)).assertEqual("number");
            expect(data[i].pid).assertLarger(0);
            expect(typeof (data[i].uid)).assertEqual("number");
            expect(data[i].uid).assertLarger(0);
            expect(typeof (data[i].processName)).assertEqual("string");
            expect(data[i].processName.length).assertLarger(0);
            expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
            expect(data[i].bundleNames.length).assertLarger(0);
          }
          done();
        })
        .catch((err: BusinessError) => {
          console.log(`${TAG} getRunningProcessInformation err  ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
    })

    /*
     * @tc.number  SUB_AA_ApplicationContext_0200
     * @tc.name    The form of a callback getRunningProcessInformation
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ApplicationContext_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_ApplicationContext_0200';
      AppStorage.get<common.ApplicationContext>("applicationContext")!.getRunningProcessInformation((err, data) => {
        console.log(`${TAG} getRunningProcessInformation data  ${JSON.stringify(data.length)} err: ${JSON.stringify(err)}`);
        for (let i = 0; i < data.length; i++) {
          console.log(`${TAG} getRunningProcessInformation${i} : ${JSON.stringify(data[i])}`);
          expect(typeof (data[i].pid)).assertEqual("number");
          expect(data[i].pid).assertLarger(0);
          expect(typeof (data[i].uid)).assertEqual("number");
          expect(data[i].uid).assertLarger(0);
          expect(typeof (data[i].processName)).assertEqual("string");
          expect(data[i].processName.length).assertLarger(0);
          expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
          expect(data[i].bundleNames.length).assertLarger(0);
        }
        done();
      })
    })
    /*
     * @tc.number  SUB_AA_Form_formBindingData_0100
     * @tc.name    Create FormBindingData
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Form_formBindingData_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_Form_formBindingData_0100';
      let formData: ESObject = {};
      let proxies: Array<formBindingData.ProxyData> = [
        {
          "key": "detail",
          "subscriberId": "11"
        }
      ]
      let formBinding = formBindingData.createFormBindingData(formData);
      formBinding["proxies"] = proxies;
      expect(formBinding != undefined).assertTrue();
      done();
    })

    /*
    * @tc.number  SUB_AA_UIAbilityContext_setMissionContinueState_0100
    * @tc.name    setMissionContinueState with callback for Ability.
    * @tc.desc    Function test
    * @tc.size:   MediumTest
    * @tc.type:   Function
    * @tc.level   3
    */
    it('SUB_AA_UIAbilityContext_setMissionContinueState_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_UIAbilityContext_setMissionContinueState_0100';
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionContinueState(0, (err, data) => {
        console.log(`${TAG} setMissionContinueState data  ${JSON.stringify(err)}`);
        expect(data).assertEqual(undefined);
        done();
      })
    })

    /*
   * @tc.number  SUB_AA_UIAbilityContext_setMissionContinueState_0200
   * @tc.name    setMissionContinueState with promise for Ability.
   * @tc.desc    Function test
   * @tc.size:   MediumTest
   * @tc.type:   Function
   * @tc.level   3
   */
    it('SUB_AA_UIAbilityContext_setMissionContinueState_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_UIAbilityContext_setMissionContinueState_0200';
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionContinueState(0)
        .then((data) => {
          console.log(`${TAG} setMissionContinueState data  ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        })
        .catch((err: BusinessError) => {
          console.log(`${TAG} setMissionContinueState promise err  ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0900
     * @tc.name   : call startChildProcess to create a child process
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_AA_ChildProcessManager_startChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_0100`;
      console.log(`${tag}, it begin`);
      DemoProcess.toString();
      let mode: number;
      try {
        mode = childProcessManager.StartMode.SELF_FORK;
      } catch (err) {
        console.log(`${tag} convert mode error, manual set 0`);
        mode = 0;
      }

      try {
        let pid: number = await childProcessManager.startChildProcess('./ets/process/AProcess.ts', mode);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err}`);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_AppSpawn_0100
     * @tc.name   : Call startChildProcess to create a child process by APP_SPAWN_FORK mode
     * @tc.desc   : startChildProcess api cover
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AA_ChildProcessManager_startChildProcess_AppSpawn_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_AppSpawn_0100`;
      console.log(`${tag}, it begin`);

      let mode: number;
      try {
        mode = childProcessManager.StartMode.APP_SPAWN_FORK;
      } catch (err) {
        console.log(`${tag} convert mode error, manual set 1`);
        mode = 1;
      }

      try {
        let pid: number = await childProcessManager.startChildProcess('./ets/process/AProcess.ts', mode);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        done();
      } catch (err) {
        console.error(`${tag} startChildProcess error, err: ${err}`);
        expect(err.code == 16000061).assertTrue();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_URI_FLAG_0100
     * @tc.name   : Check if value of FLAG_AUTH_PERSISTABLE_URI_PERMISSION is as expected
     * @tc.desc   : Uri Flag api cover
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 1
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_URI_FLAG_0100', Level.LEVEL0, async (done: Function) => {
      expect(wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION).assertEqual(0x00000040);
      done();
    });
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ApplicationContext_0100
     * @tc.name   : Test AbilityLifecycleCallback by ApplicationContex.
     * @tc.desc   : Uri Flag api cover
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 1
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ApplicationContext_0100`;
      console.log(`${tag}, it begin`);
      let lifeCallback:AbilityLifecycleCallback = {
        onAbilityCreate:(ability)=>{
         console.log(`${tag} onAbilityCreate success, ability: ${JSON.stringify(ability)}`);
         try{expect().assertFail()}catch{}
        },
        onAbilityWillCreate:(ability)=>{
           console.log(`${tag} onAbilityWillCreate success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageCreate:(ability, window)=>{
           console.log(`${tag} onWindowStageCreate success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageWillCreate:(ability, window)=>{
           console.log(`${tag} onWindowStageWillCreate success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWillNewWant:(ability)=>{
           console.log(`${tag} onWillNewWant success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onNewWant:(ability)=>{
           console.log(`${tag} onNewWant success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageActive:(ability, window)=>{
           console.log(`${tag} onWindowStageActive success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageInactive:(ability, window)=>{
           console.log(`${tag} onWindowStageInactive success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageDestroy:(ability, window)=>{
           console.log(`${tag} onWindowStageDestroy success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageWillDestroy:(ability, window)=>{
           console.log(`${tag} onWindowStageWillDestroy success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityDestroy:(ability)=>{
           console.log(`${tag} onAbilityDestroy success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityWillDestroy:(ability)=>{
           console.log(`${tag} onAbilityWillDestroy success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityForeground:(ability)=>{
           console.log(`${tag} onAbilityForeground success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityWillForeground:(ability)=>{
           console.log(`${tag} onAbilityWillForeground success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityBackground:(ability)=>{
           console.log(`${tag} onAbilityBackground success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityWillBackground:(ability)=>{
           console.log(`${tag} onAbilityWillBackground success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityContinue:(ability)=>{
           console.log(`${tag} onAbilityContinue success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityWillContinue:(ability)=>{
           console.log(`${tag} onAbilityWillContinue success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageWillRestore:(ability, window)=>{
           console.log(`${tag} onWindowStageWillRestore success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onWindowStageRestore:(ability, window)=>{
           console.log(`${tag} onWindowStageRestore success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityWillSaveState:(ability)=>{
           console.log(`${tag} onAbilityWillSaveState success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilitySaveState:(ability)=>{
           console.log(`${tag} onAbilitySaveState success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        }
      }
      let application:common.ApplicationContext = AppStorage.get<common.ApplicationContext>("applicationContext") as common.ApplicationContext
      let id: number =application.on('abilityLifecycle', lifeCallback);
      AppStorage.get<common.ApplicationContext>("applicationContext")?.off("abilityLifecycle", id, (err,data)=>{
        expect(err?.code == undefined).assertTrue();
        console.log(`${tag}, it end`);
        done();
      })
    });
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100
     * @tc.name   : Test setSupportedProcessCache can not use in iphone.
     * @tc.desc   : Uri Flag api cover
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 1
     */
    it('SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100`;
      let capablity = canIUse("SystemCapability.Ability.AbilityRuntime.Core")
      if(capablity){
        try{
          AppStorage.get<common.ApplicationContext>("applicationContext")?.setSupportedProcessCache(false)
        }catch(e){
          console.log(`${tag}, it end`);
          expect(e?.code).assertEqual(801)
        }
        done();
      }else{
        try{
          let result = AppStorage.get<common.ApplicationContext>("applicationContext")?.setSupportedProcessCache(false)
          expect(result).assertEqual(undefined)
        }catch(e){
          console.log(`${tag}, it end`);
          expect().assertFail()
        }
        done();
      }

    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ProcessCache_0400
     * @tc.name   : Call setSupportedProcessCache.
     * @tc.desc   : The function call should return no permission error.
     * @tc.size   : LargeTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_ProcessCache_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ProcessCache_0400`;
      console.log(`${tag}, test begin`);
      let maxCacheNum = parseInt(systemParameterEnhance.getSync('persist.sys.abilityms.maxProcessCacheNum', '0'));
      let warmStartEnable = systemParameterEnhance.getSync('persist.resourceschedule.enable_warm_start_process', 'false');
      if (maxCacheNum > 0 || warmStartEnable === 'true') {
        console.log(`${tag}, ProcessCache support this device`);
      } else {
        try {
          AppStorage.get<common.ApplicationContext>("applicationContext")?.setSupportedProcessCache(false);
          expect().assertFail();
        } catch(e) {
          console.error(`${tag}, e.code: ${e.code}`);
          expect(e.code).assertEqual(801);
        }
      }
      console.log(`${tag}, test end`);
      done();
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ProcessCache_0700
     * @tc.name   : Call setSupportedProcessCache.
     * @tc.desc   : The function call should return invalid permission error.
     * @tc.size   : LargeTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
     it('SUB_Ability_AbilityRuntime_ProcessCache_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ProcessCache_0700`;
      console.log(`${tag}, test begin`);
      let maxCacheNum = parseInt(systemParameterEnhance.getSync('persist.sys.abilityms.maxProcessCacheNum', '0'));
      if (maxCacheNum <= 0) {
        console.log(`${tag}, ProcessCache not support this device`);
      } else {
        try {
          AppStorage.get<common.ApplicationContext>("applicationContext")?.setSupportedProcessCache(undefined);
          expect().assertFail();
        } catch(e) {
          console.error(`${tag}, e.code: ${e.code}`);
          expect(e.code).assertEqual(401);
        }
      }
      console.log(`${tag}, test end`);
      done();
    });

     /*
     * @tc.number : SUB_Ability_AbilityRuntime_ProcessCache_3000
     * @tc.name   : Call killAllProcesses.
     * @tc.desc   : successfully killAllProcesses
     * @tc.size   : LargeTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
     it('SUB_Ability_AbilityRuntime_ProcessCache_3000', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ProcessCache_3000`;
      console.log(`${tag}, test begin`);
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(
              {
                bundleName: 'ohos.acts.aafwk.test.stagesupplement',
                abilityName: 'MainAbility',
                action: 'SUB_Ability_AbilityRuntime_ProcessCache_3000'
              }).then(data => {
                console.debug('====>SUB_Ability_AbilityRuntime_ProcessCache_3000 startAbility err:' + JSON.stringify(data));
              });
      sleep(1500);
      await appManagerNew.getRunningProcessInformation().then((data : Array<appManagerNew.ProcessInformation>) => {
        console.log(`The running process information is: ${JSON.stringify(data)}`);
        data.forEach(item =>{
          if (item.bundleNames[0].includes("ohos.acts.aafwk.test.stagesupplement")) {
            console.log(`${tag}, getRunningProcessInformation include  stagesupplement app`);
            expect().assertFail();
            done();
          }else{
            console.log(`${tag}, getRunningProcessInformation no include  stagesupplement app`);
            expect(true).assertTrue();
            done();
          }
        })
      }).catch((error: BusinessError) => {
        console.error(`error: ${JSON.stringify(error)}`);
      });
      console.log(`${tag}, test end`);
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ProcessCache_3100
     * @tc.name   : Call killAllProcesses.
     * @tc.desc   : successfully killAllProcesses
     * @tc.size   : LargeTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
     it('SUB_Ability_AbilityRuntime_ProcessCache_3100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ProcessCache_3100`;
      console.log(`${tag}, test begin`);
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(
              {
                bundleName: 'ohos.acts.aafwk.test.stagesupplement',
                abilityName: 'MainAbility',
                action: 'SUB_Ability_AbilityRuntime_ProcessCache_3100'
              }).then(data => {
                console.debug('====>SUB_Ability_AbilityRuntime_ProcessCache_3100 startAbility err:' + JSON.stringify(data));
              });
      sleep(1500);
      await appManagerNew.getRunningProcessInformation().then((data : Array<appManagerNew.ProcessInformation>) => {
        console.log(`The running process information is: ${JSON.stringify(data)}`);
        data.forEach(item =>{
          if (item.bundleNames[0].includes("ohos.acts.aafwk.test.stagesupplement")) {
            console.log(`${tag}, getRunningProcessInformation include  stagesupplement app`);
            expect().assertFail();
            done();
          }else{
            console.log(`${tag}, getRunningProcessInformation no include  stagesupplement app`);
            expect(true).assertTrue();
            done();
          }
        })
      }).catch((error: BusinessError) => {
        console.error(`error: ${JSON.stringify(error)}`);
      });
      console.log(`${tag}, test end`);
    });

    /*
     * @tc.number  SUB_AA_Test_SetStartUpPage_0100
     * @tc.name    Test setStartUpPage param,startWindowIcon and startWindowBackgroundColor.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Test_SetStartUpPage_0100', Level.LEVEL0, async (done: Function) => {
      let startOp: startOptions = {
        startWindowIcon: undefined,
        startWindowBackgroundColor: undefined,
      }
      let startWant: Want = {
        deviceId: "",
        bundleName: "ohos.acts.aafwk.test.stagesupplementerr",
        abilityName: "MainAbility3",
      }
      try {
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(startWant, startOp);
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`Start ability failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(PARAM_ERROR);
        done();
      }
    });
  })
}
