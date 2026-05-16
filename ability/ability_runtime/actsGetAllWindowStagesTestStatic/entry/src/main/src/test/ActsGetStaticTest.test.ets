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
import ApplicationContext from 'application.ApplicationContext';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let context: common.UIAbilityContext | undefined;

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ActsGetStaticTest() {
  describe("ActsGetStaticTest", (): void => {
    beforeAll(async () => {
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b com.example.getAllWindowStages.static`);
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600
     * @tc.number SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600";
      let NAME = "getAllWindowStages";
      let applicationContext: common.ApplicationContext = context!.getApplicationContext();
      try {
        applicationContext?.getAllWindowStages()
          .then((data: Array<window.WindowStage>) => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
            expect(data.length).assertEqual(1);
            expect((data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('EntryAbility');
            done();
          })
          .catch((err: Error): void => {
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
    });

     /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500
     * @tc.desc       onForeground getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500";
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
        let onForeground_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('onForeground_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onForeground_WindowStage] getAllWindowStages size ${onForeground_WindowStage.length}`);
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onForeground_WindowStage] Data: ` + JSON.stringify(onForeground_WindowStage));
          for (let i = 0; i < onForeground_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag',
              `${TESTCASE} ${NAME} [onForeground_WindowStage] getAllWindowStages successfully. Data: ` +
              (onForeground_WindowStage[i].getMainWindowSync()
                .getUIContext()
                .getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onForeground_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onForeground_WindowStage) {
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
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600
     * @tc.desc       onBackground getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600";
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
        let onBackground_WindowStage =
          AppStorage.get<Array<window.WindowStage>>('onBackground_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onBackground_WindowStage] getAllWindowStages size ${onBackground_WindowStage.length}`);
          hilog.info(0x0000, 'testTag',
            `${TESTCASE} ${NAME} [onBackground_WindowStage] Data: ` + JSON.stringify(onBackground_WindowStage));
          for (let i = 0; i < onBackground_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag',
              `${TESTCASE} ${NAME} [onBackground_WindowStage] getAllWindowStages successfully. Data: ` +
              (onBackground_WindowStage[i].getMainWindowSync()
                .getUIContext()
                .getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onBackground_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onBackground_WindowStage) {
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
            hilog.info(0x0000, 'testTag',
              `EntryAbility1_UIAbilityContext failed, code: ${err.code}, message: ${err.message}`);
          }
          done();
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000
     * @tc.desc       Obtain the WindowStage after launching multiple instances of the application
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
          parameters: {
            'ohos.extra.param.key.createAppInstance': true
          } as Record<String, RecordData>
        };
        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let appContext = context?.getApplicationContext();
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          appContext?.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag',
                  `${TESTCASE} ${NAME} getAllWindowStages successfully. Data: ` + (data[i].getMainWindowSync()
                    .getUIContext()
                    .getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length).assertEqual(1);
              expect((data[0].getMainWindowSync()
                .getUIContext()
                .getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('EntryAbility');
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
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000
     * @tc.desc       createModuleContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000";
        let NAME = "getAllWindowStages";
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };

        context?.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', `${TESTCASE} startAbility success.`);
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let appContext = (await application.createModuleContext(context!, 'entry')).getApplicationContext();
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          appContext?.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag',
                  `${TESTCASE} ${NAME} getAllWindowStages successfully. Data: ` + (data[i].getMainWindowSync()
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
              expect(matchedInfos.includes('EntryAbility1') || matchedInfos.includes('EntryAbility')).assertEqual(true);
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
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700
     * @tc.desc       Pressure Test
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700";
        let NAME = "getAllWindowStages";
        let appContext = context?.getApplicationContext();
        let i = 0;
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
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          for (i = 0; i < 1000; i++) {
            appContext?.getAllWindowStages()
              .then((data: Array<window.WindowStage>) => {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success ` + i);
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
                expect(data.length).assertEqual(2);
                let matchedInfos: string[] = [];
                for (let stage of data) {
                  let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                  let abilityName = mainWindow.abilityInfo.name;
                  matchedInfos.push(abilityName);
                }
                expect(matchedInfos.includes('EntryAbility1') || matchedInfos.includes('EntryAbility')).assertEqual(true);
              })
              .catch((e: Error) => {
                let err = e as BusinessError;
                hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
              });
          }
          expect(i).assertEqual(1000);
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
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100
     * @tc.desc       Create a new process to launch the UIAbility by configuring the options of startAbility
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100";
        let NAME = "getAllWindowStages";
        let appContext = context?.getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1'
        };
        let options: StartOptions = {
          processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility: contextConstant.StartupVisibility.STARTUP_HIDE
        };
        context?.startAbility(wantInfo,options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            if(err?.code==801) {
              done()
            }else{
              hilog.info(0x0000,'testTag',`startAbilitycccc, code is ${err?.code}, message is ${err?.message}`);
              done()
            }
          } else {
            hilog.info(0x0000,'testTag', `startAbility success`);
          }
        });
        await Utils.msSleep(1500);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          appContext?.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [[AbilityStage]] getAllWindowStages successfully. Data: ` + (data[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length).assertEqual(1);
              expect((data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('EntryAbility');
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
  })
}