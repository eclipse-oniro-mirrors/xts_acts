/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import Want from '@ohos.app.ability.Want';
import common from "@ohos.app.ability.common";
import StartOptions from '@ohos.app.ability.StartOptions';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityManager from '@ohos.app.ability.abilityManager';

let tag: string = 'testTag';
const domain = 0x0000;
let testAbilityContext: common.UIAbilityContext | undefined;

export default function abilitystaticTest() {
  describe("abilitystaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'start');
    beforeEach(() => {
      console.info('beforeEach start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.startSelfUIAbilityInCurrentProcess.static")
      await Utils.msSleep(5000);
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('AbilityContext') as common.UIAbilityContext;
      console.info('beforeEach end');
    })
    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0100
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0100
     * @tc.desc test StartSelfUIAbilityInCurrentProcess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0100';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
        let want: Want = {
          bundleName: 'com.example.startSelfUIAbilityInCurrentProcess.static',
          moduleName: 'entry',
          abilityName: 'OneAbility'
        }
        let flag: string = "1";
        let startOptions: StartOptions = {};
        let beginCurrentPid: number = 0;
        let afterCurrentPid: number = 1;
        try {
          let abilityInfos: Array<abilityManager.AbilityRunningInfo> = await abilityManager.getAbilityRunningInfos();
          hilog.info(0x0000, 'testTag',
            `${TEST_CASE_NAME} getAbilityRunningInfos success, abilityInfos: ${JSON.stringify(abilityInfos)}`);
          for (let i = 0; i < abilityInfos.length; i++) {
            if (abilityInfos[i].processName === 'com.example.startSelfUIAbilityInCurrentProcess.static') {
              beginCurrentPid = abilityInfos[i].pid;
              hilog.info(0x0000, 'testTag',
                `${TEST_CASE_NAME} getAbilityRunningInfos success, data: ${JSON.stringify(abilityInfos[i])}`);
            }
            break;
          }
          testAbilityContext?.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
            .then(() => {
              await Utils.msSleep(2000);
              hilog.info(0x0000, 'testTag', 'startFlag:' + AppStorage.get('startFlag'));
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed`);
              let abilityInfos: Array<abilityManager.AbilityRunningInfo> =
                await abilityManager.getAbilityRunningInfos();
              for (let i = 0; i < abilityInfos.length; i++) {
                if (abilityInfos[i].processName === 'com.example.startSelfUIAbilityInCurrentProcess.static') {
                  afterCurrentPid = abilityInfos[i].pid;
                }
                break;
              }
              expect(beginCurrentPid).assertEqual(afterCurrentPid);
              hilog.info(0x0000, 'testTag',
                `${TEST_CASE_NAME} getAbilityRunningInfos success, pid: ${beginCurrentPid}`);
              hilog.info(0x0000, 'testTag',
                `${TEST_CASE_NAME} getAbilityRunningInfos success, currentPid: ${afterCurrentPid}`);
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
              done();
              await Utils.msSleep(2000);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              let msg =
                `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
              hilog.error(0x0000, 'testTag', msg);
              if (err.code === 801) {
                expect(801).assertEqual(err.code);
                await Utils.msSleep(500);
                done();
              } else {
                expect().assertFail();
                await Utils.msSleep(500);
                done();
              }
            });
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          expect().assertFail();
          await Utils.msSleep(500);
          done();
        }
      })

    /**
     * @tc.number  SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0200
     * @tc.name    SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0200
     * @tc.desc    test StartSelfUIAbilityInCurrentProcess with want which exist other bundleName
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0200';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
        let want: Want = {
          bundleName: '666',
          moduleName: 'entry',
          abilityName: 'OneAbility'
        }
        let flag: string = "6";
        let startOptions: StartOptions = {};
        try {
          testAbilityContext?.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
            .then(() => {
              hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              let msg =
                `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
              hilog.error(0x0000, 'testTag', msg);
              if (err.code === 801) {
                expect(801).assertEqual(err.code);
                done();
              } else {
                expect(err.code).assertEqual(16000130)
                hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
                done();
              }
            });
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number  SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0300
     * @tc.name    SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0300
     * @tc.desc    test StartSelfUIAbilityInCurrentProcess  with want which empty bundleName
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0300';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
        let want: Want = {
          bundleName: '',
          moduleName: 'entry',
          abilityName: 'OneAbility'
        }
        let flag: string = "7";
        let startOptions: StartOptions = {};
        try {
          testAbilityContext?.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
            .then(() => {
              hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              let msg =
                `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
              hilog.error(0x0000, 'testTag', msg);
              if (err.code === 801) {
                expect(801).assertEqual(err.code);
                done();
              } else {
                expect(err.code).assertEqual(16000123)
                hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
                done();
              }
            });
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number  SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0400
     * @tc.name    SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0400
     * @tc.desc    test StartSelfUIAbilityInCurrentProcess  with want which exit error moduleName
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0400';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
        let want: Want = {
          bundleName: 'com.example.startSelfUIAbilityInCurrentProcess.static',
          moduleName: '666',
          abilityName: 'OneAbility'
        }
        let flag: string = "9";
        let startOptions: StartOptions = {};
        try {

          testAbilityContext?.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
            .then(() => {
              hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              let msg =
                `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
              hilog.error(0x0000, 'testTag', msg);
              if (err.code === 801) {
                expect(801).assertEqual(err.code);
                done();
              } else {
                expect(err.code).assertEqual(16000001)
                hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
                done();
              }
            });
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number  SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0500
     * @tc.name    SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0500
     * @tc.desc    test StartSelfUIAbilityInCurrentProcess  with want which exit error abilityName
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0500';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
        let want: Want = {
          bundleName: 'com.example.startSelfUIAbilityInCurrentProcess.static',
          moduleName: 'entry',
          abilityName: '666',
        }
        let flag: string = "11";
        let startOptions: StartOptions = {};
        try {
          testAbilityContext?.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
            .then(() => {
              hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              let msg =
                `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
              hilog.error(0x0000, 'testTag', msg);
              if (err.code === 801) {
                expect(801).assertEqual(err.code);
                done();
              } else {
                expect(err.code).assertEqual(16000001)
                hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
                done();
              }
            });
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.number  SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0600
     * @tc.name    SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0600
     * @tc.desc    test StartSelfUIAbilityInCurrentProcess  errcode 16000131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0600';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} start`);
        let want: Want = {
          bundleName: 'com.example.startSelfUIAbilityInCurrentProcess.static',
          moduleName: 'entry',
          abilityName: 'TwoAbility'
        }
        let flag: string = "16";
        let startOptions: StartOptions = {};
        try {
          await testAbilityContext!.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
            .then(() => {
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}0StartSelfUIAbilityInCurrentProcess succeed`);
              await Utils.msSleep(500);
              await testAbilityContext!.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
                .then(() => {
                  hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}1StartSelfUIAbilityInCurrentProcess succeed`);
                  expect().assertFail();
                  done();
                })
                .catch((e: Error) => {
                  let err = e as BusinessError;
                  let msg =
                    `${TEST_CASE_NAME} 1startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
                  hilog.error(0x0000, 'testTag', msg);
                  if (err.code === 801) {
                    expect(801).assertEqual(err.code);
                    done();
                  } else {
                    expect(err.code).assertEqual(16000131)
                    done();
                  }
                })
                .catch((e: Error) => {
                  let err = e as BusinessError;
                  let msg =
                    `${TEST_CASE_NAME} 1startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
                  hilog.error(0x0000, 'testTag', msg);
                  expect().assertFail();
                  done();
                })
            })
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          if (err.code === 801) {
            expect(801).assertEqual(err.code);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
      })

    /**
     * @tc.number  SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0700
     * @tc.name    SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0700
     * @tc.desc    test StartSelfUIAbilityInCurrentProcess without startOptions
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_Test_static_0700';
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
        let want: Want = {
          bundleName: 'com.example.startSelfUIAbilityInCurrentProcess.static',
          moduleName: 'entry',
          abilityName: 'ThirdAbility'
        }
        let flag: string = "15";
        let beginCurrentPid: number = 0;
        let afterCurrentPid: number = 1;
        try {
          let abilityInfos: Array<abilityManager.AbilityRunningInfo> = await abilityManager.getAbilityRunningInfos();
          for (let i = 0; i < abilityInfos.length; i++) {
            if (abilityInfos[i].processName === 'com.example.startSelfUIAbilityInCurrentProcess.static') {
              beginCurrentPid = abilityInfos[i].pid;
              hilog.info(0x0000, 'testTag',
                `${TEST_CASE_NAME} getAbilityRunningInfos success, data: ${JSON.stringify(abilityInfos[i])}`);
            }
            break;
          }
          await testAbilityContext!.startSelfUIAbilityInCurrentProcess(want, flag)
            .then(async () => {
              await Utils.msSleep(2000);
              hilog.info(0x0000, 'testTag', 'startFlag:' + AppStorage.get('startFlag'));
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed`);
              let abilityInfos: Array<abilityManager.AbilityRunningInfo> =
                await abilityManager.getAbilityRunningInfos();
              for (let i = 0; i < abilityInfos.length; i++) {
                if (abilityInfos[i].processName === 'com.example.startSelfUIAbilityInCurrentProcess.static') {
                  afterCurrentPid = abilityInfos[i].pid;
                }
                break;
              }
              expect(beginCurrentPid).assertEqual(afterCurrentPid);
              hilog.info(0x0000, 'testTag',
                `${TEST_CASE_NAME} getAbilityRunningInfos success, pid: ${beginCurrentPid}`);
              hilog.info(0x0000, 'testTag',
                `${TEST_CASE_NAME} getAbilityRunningInfos success, currentPid: ${afterCurrentPid}`);
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
              done();
              await Utils.msSleep(2000);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              let msg =
                `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
              hilog.error(0x0000, 'testTag', msg);
              if (err.code === 801) {
                expect(801).assertEqual(err.code);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        } catch (err) {
          err = err as BusinessError;
          let msg =
            `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
          hilog.error(0x0000, 'testTag', msg);
          expect().assertFail();
          done();
        }
      })
  })
}