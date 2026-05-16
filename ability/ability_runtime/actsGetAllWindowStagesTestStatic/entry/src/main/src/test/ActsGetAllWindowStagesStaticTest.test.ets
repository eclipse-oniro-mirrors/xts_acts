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
import { beforeAll, describe, expect, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import { BusinessError, RecordData } from '@ohos.base'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import window from '@ohos.window';
import { application, contextConstant, StartOptions } from '@kit.AbilityKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let context: common.UIAbilityContext | undefined;

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ActsGetAllWindowStagesStaticTest() {
  describe("ActsGetAllWindowStagesStaticTest", (): void => {
    beforeAll(async () => {
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b com.example.getAllWindowStages.static`);
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700
     * @tc.desc       apppcation.getApplicationContextInstance
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error):void => {
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let appContext = application.getApplicationContextInstance().getApplicationContext();
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await appContext?.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('EntryAbility') || matchedInfos.includes('EntryAbility1')).assertEqual(true);
              try {
                let EntryAbility1_UIAbilityContext: common.UIAbilityContext =
                  AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
                await EntryAbility1_UIAbilityContext!.terminateSelf();
                hilog.info(0x0000, 'testTag', `EntryAbility1_UIAbilityContext terminateSelf successed`);
              } catch (innerErr) {
                let err = innerErr as BusinessError;
                hilog.error(0x0000, 'testTag',
                  `EntryAbility1_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
              }
              done();
            }).catch((err: Error): void => {
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800
     * @tc.desc       createAreaModeContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let appContext = context?.createAreaModeContext(contextConstant.AreaMode.EL2).getApplicationContext();
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          appContext?.getAllWindowStages()
            .then((data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages successfully. Data: ` +
                (data[i].getMainWindowSync()
                  .getUIContext()
                  .getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('EntryAbility') || matchedInfos.includes('EntryAbility1')).assertEqual(true);
              try {
                let EntryAbility1_UIAbilityContext: common.UIAbilityContext =
                  AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
                EntryAbility1_UIAbilityContext!.terminateSelf().awaitSync()
                hilog.info(0x0000, 'testTag', `EntryAbility1_UIAbilityContext terminateSelf successed`);
              } catch (e) {
                let err = e as BusinessError;
                hilog.error(0x0000, 'testTag',
                  `EntryAbility1_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
              }
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900
     * @tc.desc       createdisplayContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });

        await Utils.msSleep(1000);
        let appContext = context?.createDisplayContext(0).getApplicationContext();

        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          appContext?.getAllWindowStages()
            .then((data: Array<window.WindowStage>) => {

              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages successfully. Data: ` +
                (data[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('EntryAbility') || matchedInfos.includes('EntryAbility1')).assertEqual(true);
              try {
                let EntryAbility1_UIAbilityContext: common.UIAbilityContext =
                  AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
                EntryAbility1_UIAbilityContext!.terminateSelf().awaitSync()
                hilog.info(0x0000, 'testTag', `EntryAbility1_UIAbilityContext terminateSelf successed`);
              } catch (e) {
                let err = e as BusinessError;
                hilog.error(0x0000, 'testTag',
                  `EntryAbility1_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
              }
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100
     * @tc.desc       onCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100";
        let NAME = "getAllWindowStages";
        let onCreate_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('onCreate_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onCreate_WindowStage] getAllWindowStages size ${onCreate_WindowStage.length}`);
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onCreate_WindowStage] Data: ` + JSON.stringify(onCreate_WindowStage));
          for (let i = 0; i < onCreate_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag',
              `${TESTCASE} ${NAME} [onCreate_WindowStage] getAllWindowStages successfully. Data: ` +
              (onCreate_WindowStage[i].getMainWindowSync()
                .getUIContext()
                .getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onCreate_WindowStage.length).assertEqual(0);
          done();
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700
     * @tc.desc       onWindowStageWillDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
         context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let EntryAbility1_UIAbilityContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
        await EntryAbility1_UIAbilityContext.terminateSelf()
        await Utils.msSleep(1000);
        let onWindowStageWillDestroy_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('onWindowStageWillDestroy_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onWindowStageWillDestroy_WindowStage] getAllWindowStages size ${onWindowStageWillDestroy_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageWillDestroy_WindowStage] Data: ` +
          JSON.stringify(onWindowStageWillDestroy_WindowStage));
          expect(onWindowStageWillDestroy_WindowStage.length).assertEqual(1);
          let matchedInfos: string[] = [];
              for (let stage of onWindowStageWillDestroy_WindowStage) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('EntryAbility')).assertEqual(true);
          done();
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300
     * @tc.desc       onWindowStageCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
         context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let onWindowStageCreate_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('onWindowStageCreate_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onWindowStageCreate_WindowStage] getAllWindowStages size ${onWindowStageCreate_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageCreate_WindowStage] Data: ` +
          JSON.stringify(onWindowStageCreate_WindowStage));
          for (let i = 0; i < onWindowStageCreate_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag',
              `${TESTCASE} ${NAME} [onWindowStageCreate_WindowStage] getAllWindowStages successfully. Data: ` +
              (onWindowStageCreate_WindowStage[i].getMainWindowSync()
                .getUIContext()
                .getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onWindowStageCreate_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onWindowStageCreate_WindowStage) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos.push(abilityName);
          }
          expect(matchedInfos.includes('EntryAbility') || matchedInfos.includes('EntryAbility1')).assertEqual(true);
          try {
            let EntryAbility1_UIAbilityContext: common.UIAbilityContext =
              AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
            await EntryAbility1_UIAbilityContext.terminateSelf();
            hilog.info(0x0000, 'testTag', `EntryAbility1_UIAbilityContext terminateSelf successed`);
          } catch (e) {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag',
              `EntryAbility1_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
          }
          done();
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200
     * @tc.desc       onDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let EntryAbility1_UIAbilityContext: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
        await EntryAbility1_UIAbilityContext.terminateSelf()
        await Utils.msSleep(1000);
        let onDestroy_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('onDestroy_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onDestroy_WindowStage] getAllWindowStages size ${onDestroy_WindowStage.length}`);
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onDestroy_WindowStage] Data: ` + JSON.stringify(onDestroy_WindowStage));
          for (let i = 0; i < onDestroy_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag',
              `${TESTCASE} ${NAME} [onDestroy_WindowStage] getAllWindowStages successfully. Data: ` +
              (onDestroy_WindowStage[i].getMainWindowSync()
                .getUIContext()
                .getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onDestroy_WindowStage.length).assertEqual(1);
          expect((onDestroy_WindowStage[0].getMainWindowSync()
            .getUIContext()
            .getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('EntryAbility');
          done();

        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400
     * @tc.desc       onWindowStageDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let EntryAbility1_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("EntryAbility1_UIAbilityContext") as common.UIAbilityContext;
        await EntryAbility1_UIAbilityContext.terminateSelf()
        await Utils.msSleep(1000);
        try {
          let onWindowStageDestroy_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onWindowStageDestroy_WindowStage') as Array<window.WindowStage>
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageDestroy_WindowStage] getAllWindowStages size ${onWindowStageDestroy_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageDestroy_WindowStage] Data: ` + JSON.stringify(onWindowStageDestroy_WindowStage));
          for (let i = 0; i < onWindowStageDestroy_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageDestroy_WindowStage] getAllWindowStages successfully. Data: ` + (onWindowStageDestroy_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onWindowStageDestroy_WindowStage.length).assertEqual(1);
          expect((onWindowStageDestroy_WindowStage[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('EntryAbility');
          done();
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700
     * @tc.desc       AbilityStage getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700";
        let NAME = "getAllWindowStages";
        let AbilityStage_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('AbilityStage_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [AbilityStage] getAllWindowStages size ${AbilityStage_WindowStage.length}`);
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [[AbilityStage]] Data: ` + JSON.stringify(AbilityStage_WindowStage));
          for (let i = 0; i < AbilityStage_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag',`${TESTCASE} ${NAME} [[AbilityStage]] getAllWindowStages successfully. Data: ` +(AbilityStage_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(AbilityStage_WindowStage.length).assertEqual(0);
          done();
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })
      
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800
     * @tc.desc       Acquire WindowStages by launching multiple Abilities in other launch modes.
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800";
        let NAME = "getAllWindowStages";
        let appContext = context?.getApplicationContext();
        let wantSpecified1: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility3',
          parameters: {
            'instanceKey': 'KEY_FIRST'
          }as Record<String, RecordData>
        };
        context?.startAbility(wantSpecified1).then(() => {
          hilog.info(0x0000, 'testTag', 'First: specified mode TestAbility3 (KEY_FIRST) started');
        }).catch((e: Error) => {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility3 (KEY_FIRST): ${err.message}`);
        });
        await Utils.msSleep(1000);
        let wantMultiton1: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility4'
        };
        context?.startAbility(wantMultiton1).then(() => {
          hilog.info(0x0000, 'testTag', 'First: multiton mode TestAbility1 started');
        }).catch((e: Error) => {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility1: ${err.message}`);
        });
        await Utils.msSleep(1500);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} first getAllWindowStages`);
          appContext?.getAllWindowStages()
            .then((firstStages: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${firstStages.length}`);
              expect(firstStages.length).assertEqual(3);
              let matchedInfos1: string[] = [];
              for (let stage of firstStages) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos1.push(abilityName);
              }
              console.log(JSON.stringify(matchedInfos1),'11111111111111')
              expect(matchedInfos1.includes('EntryAbility') || matchedInfos1.includes('EntryAbility4') || matchedInfos1.includes('EntryAbility3')).assertEqual(true);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `First getAllWindowStages failed: ${err.message}`);
          expect().assertFail();
        }
        await Utils.msSleep(1500);
        let wantSpecified2: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility3',
          parameters: {
            'instanceKey': 'KEY_SECOND'
          } as Record<String, RecordData>
        };
        context?.startAbility(wantSpecified2).then(() => {
          hilog.info(0x0000, 'testTag', 'Second: specified mode TestAbility3 (KEY_SECOND) started');
        }).catch((e: Error) => {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility3 (KEY_SECOND): ${err.message}`);
        });
      await Utils.msSleep(1000);
       let wantMultiton2: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility4'
        };
        context?.startAbility(wantMultiton2).then(() => {
          hilog.info(0x0000, 'testTag', 'Second: multiton mode TestAbility1 (second instance) started');
        }).catch((e: Error) => {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility1 (second): ${err.message}`);
        });
        await Utils.msSleep(1500);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} second getAllWindowStages`);
          appContext?.getAllWindowStages()
            .then((secondStages: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${secondStages.length}`);
              expect(secondStages.length).assertEqual(5);
              let matchedInfos2: string[] = [];
              for (let stage of secondStages) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos2.push(abilityName);
              }
              console.log(JSON.stringify(matchedInfos2),'2222222222')
              expect(matchedInfos2.includes('EntryAbility') || matchedInfos2.includes('EntryAbility4') || matchedInfos2.includes('EntryAbility3')).assertEqual(true);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `Second getAllWindowStages failed: ${err.message}`);
          expect().assertFail();
        }
        try {
          let EntryAbility4_UIAbilityContext: common.UIAbilityContext =
            AppStorage.get<common.UIAbilityContext>("EntryAbility4_UIAbilityContext") as common.UIAbilityContext;
          await EntryAbility4_UIAbilityContext.terminateSelf();
          hilog.info(0x0000, 'testTag', `EntryAbility4_UIAbilityContext terminateSelf successed`);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag',
            `EntryAbility4_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
        }
        try {
          let EntryAbility3_UIAbilityContext: common.UIAbilityContext =
            AppStorage.get<common.UIAbilityContext>("EntryAbility3_UIAbilityContext") as common.UIAbilityContext;
          await EntryAbility3_UIAbilityContext.terminateSelf()
          hilog.info(0x0000, 'testTag', `EntryAbility3_UIAbilityContext terminateSelf successed`);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag',
            `EntryAbility3_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
        }
        done();
      })
  })
}