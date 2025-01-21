// @ts-nocheck
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

import { describe, afterEach, it, expect } from '@ohos/hypium';
import formHost from '@ohos.application.formHost';
import abilityConstant from '@ohos.app.ability.AbilityConstant';
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
import wantConstant from '@ohos.app.ability.wantConstant';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');
let EXTENSION_INFO_ERR = 16000001;
let INNER_ERROR = 16000050;
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

export default function ApiCoverTest() {
  describe('ApiCoverTestTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, 2500);
    })
    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_001
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_001', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_002', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_003', 0, async (done: Function) => {
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
          expect(CROSS_USER_DENY).assertEqual(error.code);
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
    it('SUB_AA_ABILITY_Extension_API_004', 0, async (done: Function) => {
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
          expect(CROSS_USER_DENY).assertEqual(error.code);
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
    it('SUB_AA_ABILITY_Extension_API_005', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_006', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_007', 0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(CROSS_USER_DENY).assertEqual(err.code);
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
    it('SUB_AA_ABILITY_Extension_API_008', 0, async (done: Function) => {
      await sleep(2000);
      let want: Want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.stopServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(CROSS_USER_DENY).assertEqual(err.code);
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
    it('SUB_AA_ABILITY_Extension_API_009', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_010', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_011', 0, async (done: Function) => {
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
    it('SUB_AA_ABILITY_Extension_API_012', 0, async (done: Function) => {
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
        console.log("vpnExtensionContext:" + JSON.stringify(vpnExtensionContext));
        console.log("abilityStartCllback:" + JSON.stringify(abilityStartCllback));
        console.log("pacMap:" + JSON.stringify(pacMap));
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
    it('SUB_AA_AMS_Context_0100', 0, async (done: Function) => {
      expect("/data/storage/el2/base/haps/phone/cache")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.cacheDir);
      expect("/data/storage/el2/base/haps/phone/temp")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.tempDir);
      expect("/data/storage/el2/base/haps/phone/files")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.filesDir);
      expect("/data/storage/el2/database/phone")
        .assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.databaseDir);
      expect("/data/storage/el2/base/haps/phone/preferences")
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
      console.log(`Ability: getConfiguration config.mnc: ${mccvalue}`);
      console.log(`Ability: getConfiguration config.mnc: ${mncValue}`);
      expect(0).assertEqual(AppStorage.get<common.UIAbilityContext>("abilityContext")!.area);
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.resourceManager.getConfiguration((err, data) => {
        if (err == undefined) {
          console.log(`Ability: getConfiguration success: ${JSON.stringify(data)}`);
          console.log(`Ability: getConfiguration success1: ${JSON.stringify(data.direction)}`);
          console.log(`Ability: getConfiguration success1: ${JSON.stringify(data.mcc)}`);
          console.log(`Ability: getConfiguration success1: ${JSON.stringify(data.mnc)}`);
          expect(0).assertEqual(data.mcc)
          expect(0).assertEqual(data.mnc)
          if (deviceType === '2in1') {
            expect(1).assertEqual(data.direction);
          } else {
            expect(0).assertEqual(data.direction);
          }
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
    it('SUB_AA_AMS_Context_0200', 0, async (done: Function) => {
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
     * @tc.number  SUB_AA_Test_AbilityConstant_0100
     * @tc.name    Test abilityConstant.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Test_AbilityConstant_0100', 0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.LaunchReason.START_ABILITY);
      expect(9).assertEqual(abilityConstant.LaunchReason.INSIGHT_INTENT);
      expect(1).assertEqual(abilityConstant.LastExitReason.ABILITY_NOT_RESPONDING);
      expect(2).assertEqual(abilityConstant.LastExitReason.NORMAL);
      expect(3).assertEqual(abilityConstant.LastExitReason.CPP_CRASH);
      expect(4).assertEqual(abilityConstant.LastExitReason.JS_ERROR);
      expect(5).assertEqual(abilityConstant.LastExitReason.APP_FREEZE);
      expect(6).assertEqual(abilityConstant.LastExitReason.PERFORMANCE_CONTROL);
      expect(7).assertEqual(abilityConstant.LastExitReason.RESOURCE_CONTROL);
      expect(8).assertEqual(abilityConstant.LastExitReason.UPGRADE);
      expect(0).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_MODERATE);
      expect(1).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_LOW);
      expect(2).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL);
      expect(5).assertEqual(abilityConstant.LaunchReason.SHARE);
      expect(0).assertEqual(abilityConstant.ContinueState.ACTIVE);
      expect(1).assertEqual(abilityConstant.ContinueState.INACTIVE);
      expect('ohos.extra.param.key.contentTitle').assertEqual(wantConstant.Params.CONTENT_TITLE_KEY);
      expect('ohos.extra.param.key.shareAbstract').assertEqual(wantConstant.Params.SHARE_ABSTRACT_KEY);
      expect('ohos.extra.param.key.shareUrl').assertEqual(wantConstant.Params.SHARE_URL_KEY);
      expect('ohos.ability.params.abilityRecoveryRestart').assertEqual(wantConstant.Params.ABILITY_RECOVERY_RESTART);
      expect('ohos.extra.param.key.showMode').assertEqual(wantConstant.Params.SHOW_MODE_KEY);
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
    it('SUB_AA_Test_InsightIntent_0100', 0, async (done: Function) => {
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
    it('SUB_AA_Test_StartOptions_0100', 0, async (done: Function) => {
      let startOp: startOptions = {
        withAnimation: false,
        displayId: 0,
        windowLeft: 100,
        windowTop: 100,
        windowWidth: 100,
        windowHeight: 100,
        windowFocused: true,
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
    it('SUB_AA_FMS_AbilityStage_0100', 0, async (done: Function) => {
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
          expect(data.parameters["config"]).assertEqual(-1);
          expect(data.parameters["config"]).assertEqual(directions);
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
    it('SUB_AA_FMS_AcquireForm_0100', 0, async (done: Function) => {
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
          expect(data.parameters["Life"]).assertEqual("onForeground");
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
     * @tc.number  SUB_AA_FormDisplaySpecifications_0100
     * @tc.name    Create a form and delete.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_FormDisplaySpecifications_0100', 0, async (done: Function) => {
      let formWant: Want = {
        deviceId: "",
        bundleName: "com.example.apicoverhaptest",
        abilityName: "FormHostAbility",
      }
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(formWant, (err, data) => {
        if (err.code == 0) {
          console.info("SUB_AA_FormDisplaySpecifications_0100===abilityContext startAbility success===");
        } else {
          expect().assertFail();
          done();
        }
      })
      await sleep(2000);
      console.info("SUB_AA_FormDisplaySpecifications_0100===AppStorage.get<number>('formId21')! success===" + AppStorage.get<number>("formId21")!);
      expect(AppStorage.get<number>("formId21")! != undefined).assertTrue();
      formHost.deleteForm(AppStorage.get<number>("formId21")!.toString())
        .then((data) => {
          console.info("SUB_AA_FormDisplaySpecifications_0100===deleteForm success===");
          done();
        })
        .catch((err: BusinessError) => {
          console.info("SUB_AA_FormDisplaySpecifications_0100===deleteForm failed===");
          expect().assertFail();
          done();
        })
    })

    /*
     * @tc.number  SUB_AA_FormDisplaySpecifications_0200
     * @tc.name    get the form info.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_FormDisplaySpecifications_0200', 0, async (done: Function) => {
      await formHost.getFormsInfo("com.example.apicoverhaptest", "phone")
        .then((data) => {
          console.info("SUB_AA_FormDisplaySpecifications_0200===deleteForm success===" + JSON.stringify(data));
          expect(5).assertEqual(data[0].defaultDimension);
          done();
        })
        .catch((err: BusinessError) => {
          console.info("SUB_AA_FormDisplaySpecifications_0200===deleteForm failed===" + JSON.stringify(err));
          expect().assertFail();
          done();
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
    it('SUB_AA_AbilityAppManager_0100', 0, async (done: Function) => {
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
    it('SUB_AA_AbilityAppManager_0200', 0, async (done: Function) => {
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
    it('SUB_AA_ApplicationContext_0100', 0, async (done: Function) => {
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
    it('SUB_AA_ApplicationContext_0200', 0, async (done: Function) => {
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
    it('SUB_AA_Form_formBindingData_0100', 0, async (done: Function) => {
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
    it('SUB_AA_UIAbilityContext_setMissionContinueState_0100', 0, async (done: Function) => {
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
    it('SUB_AA_UIAbilityContext_setMissionContinueState_0200', 0, async (done: Function) => {
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
    it('SUB_AA_ChildProcessManager_startChildProcess_0100', 0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_0100`;
      console.log(`${tag}, it begin`);

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
    it('SUB_AA_ChildProcessManager_startChildProcess_AppSpawn_0100', 0, async (done: Function) => {
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
    it('SUB_Ability_AbilityRuntime_ABILITY_URI_FLAG_0100', 0, async (done: Function) => {
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
    it('SUB_Ability_AbilityRuntime_ApplicationContext_0100', 0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ApplicationContext_0100`;
      console.log(`${tag}, it begin`);
      let lifeCallback:abilityLifecycleCallback = {
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
        onAbilityDestroy:(ability, window)=>{
           console.log(`${tag} onAbilityDestroy success, ability: ${JSON.stringify(ability)}`);
           try{expect().assertFail()}catch{}
        },
        onAbilityWillDestroy:(ability, window)=>{
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
      let id = AppStorage.get<common.ApplicationContext>("applicationContext").on('abilityLifecycle', lifeCallback);
      AppStorage.get<common.ApplicationContext>("applicationContext").off("abilityLifecycle", id, (err,data)=>{
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
    it('SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100', 0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_setSupportedProcessCache_0100`;
      let capablity = canIUse("SystemCapability.Ability.AbilityRuntime.Core")
      if(capablity){
        try{
          AppStorage.get<common.ApplicationContext>("applicationContext").setSupportedProcessCache(false)
        }catch(e){
          console.log(`${tag}, it end`);
          expect(e?.code).assertEqual(801)
        }
        done();
      }else{
        try{
          let result = AppStorage.get<common.ApplicationContext>("applicationContext").setSupportedProcessCache(false)
          expect(result).assertEqual(undefined)
        }catch(e){
          console.log(`${tag}, it end`);
          expect().assertFail()
        }
        done();
      }
      
    });
  })
}
