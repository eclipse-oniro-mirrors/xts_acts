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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  abilityManager, common, StartOptions, Want,
} from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
    })
  
    
    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0100
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0100
     * @tc.desc test startSelfUIAbilityInCurrentProcess success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0100", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0100';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'ThirdAbility'
      }
      let flag: string = "1";
      let startOptions: StartOptions = {};
      let beginCurrentPid: number = 0;
      let afterCurrentPid: number = 1;
      try {
        let abilityInfos: Array<abilityManager.AbilityRunningInfo> = await abilityManager.getAbilityRunningInfos();
        for (let i = 0; i < abilityInfos.length; i++) {
          if (abilityInfos[i].processName === 'com.example.startselfulabilitytest') {
            beginCurrentPid = abilityInfos[i].pid;
            hilog.info(0x0000, 'testTag',
              `${TEST_CASE_NAME} getAbilityRunningInfos success, data: ${JSON.stringify(abilityInfos[i])}`);
          }
          break;
        }
        context.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
          .then(async () => {
            sleep(500);
            hilog.info(0x0000, 'testTag', 'startFlag:' + AppStorage.get('startFlag'));
            hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed`);
            let abilityInfos: Array<abilityManager.AbilityRunningInfo> = await abilityManager.getAbilityRunningInfos();
            for (let i = 0; i < abilityInfos.length; i++) {
              if (abilityInfos[i].processName === 'com.example.startselfulabilitytest') {
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
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            if (err.code == 801) {
              expect(801).assertEqual(err.code);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0200
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0200
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with null want
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0200", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0200';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "2";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(null, flag, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            expect(801).assertEqual(err.code);
            done();
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect(err.code).assertEqual(401);
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
        done();
      }
    })


    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0300
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0300
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with undefined want
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0300", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0300';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "3";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(undefined, flag, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            expect(801).assertEqual(err.code);
            done();
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect(err.code).assertEqual(401);
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0400
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0400
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with error 16010023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0400", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0005';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: '',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "7";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            if (err.code == 801) {
              expect(801).assertEqual(err.code);
              done();
            } else {
              expect(err.code).assertEqual(16000123)
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
              done();
            }
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0500
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0500
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with errorcode 16000100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0500", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_StartSelfUIAbilityInCurrentProcess_0006';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: '666',
        abilityName: 'OneAbility'
      }
      let flag: string = "9";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            if (err.code == 801) {
              expect(801).assertEqual(err.code);
              done();
            } else {
              expect(err.code).assertEqual(16000001)
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
              done();
            }
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0600
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0600
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with want which exist other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0600", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0600';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: '666',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "6";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            if (err.code == 801) {
              expect(801).assertEqual(err.code);
              done();
            } else {
              expect(err.code).assertEqual(16000130)
              hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
              done();
            }
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0700
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0700
     * @tc.desc test StartSelfUIAbilityInCurrentProcess  errcode 16010031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0700", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0700';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'TwoAbility'
      }
      let flag: string = "16";
      let startOptions: StartOptions = {};
      try {
        await context.startSelfUIAbilityInCurrentProcess(want, flag, startOptions);
        await sleep(500);
        context.startSelfUIAbilityInCurrentProcess(want, flag, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} 1StartSelfUIAbilityInCurrentProcess succeed`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} 1startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            if (err.code == 801) {
              expect(801).assertEqual(err.code);
              done();
            } else {
              expect(err.code).assertEqual(16000131);
              done();
            }
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        if (err.code == 801) {
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
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0800
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0800
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with null Flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0800", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0800';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "13";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(want, null, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            expect(801).assertEqual(err.code);
            done();
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect(err.code).assertEqual(401)
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_0900
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_0900
     * @tc.desc test StartSelfUIAbilityInCurrentProcess with undefined Flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_0900", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_0900';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "13";
      let startOptions: StartOptions = {};
      try {
        context.startSelfUIAbilityInCurrentProcess(want, undefined, startOptions)
          .then(() => {
            hilog.info(0x0000, 'testTag', '${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            expect(801).assertEqual(err.code);
            done();
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect(err.code).assertEqual(401)
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} end`);
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_StartSelfUIAbilityInCurrentProcess_1000
     * @tc.name SUB_Ability_StartSelfUIAbilityInCurrentProcess_1000
     * @tc.desc test StartSelfUIAbilityInCurrentProcess without startOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_StartSelfUIAbilityInCurrentProcess_1000", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'StartSelfUIAbilityInCurrentProcess_1000';
      hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME}  start`);
      let want: Want = {
        bundleName: 'com.example.startselfulabilitytest',
        moduleName: 'entry_test',
        abilityName: 'OneAbility'
      }
      let flag: string = "15";
      let beginCurrentPid: number = 0;
      let afterCurrentPid: number = 1;
      try {
        let abilityInfos: Array<abilityManager.AbilityRunningInfo> = await abilityManager.getAbilityRunningInfos();
        for (let i = 0; i < abilityInfos.length; i++) {
          if (abilityInfos[i].processName === 'com.example.startselfulabilitytest') {
            beginCurrentPid = abilityInfos[i].pid;
            hilog.info(0x0000, 'testTag',
              `${TEST_CASE_NAME} getAbilityRunningInfos success, data: ${JSON.stringify(abilityInfos[i])}`);
          }
          break;
        }
        context.startSelfUIAbilityInCurrentProcess(want, flag)
          .then(async () => {
            sleep(500);
            hilog.info(0x0000, 'testTag', 'startFlag:' + AppStorage.get('startFlag'));
            hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess succeed`);
            let abilityInfos: Array<abilityManager.AbilityRunningInfo> = await abilityManager.getAbilityRunningInfos();
            for (let i = 0; i < abilityInfos.length; i++) {
              if (abilityInfos[i].processName === 'com.example.startselfulabilitytest') {
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
          })
          .catch((err: BusinessError) => {
            let msg =
              `${TEST_CASE_NAME} startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
            hilog.error(0x0000, 'testTag', msg);
            if (err.code == 801) {
              expect(801).assertEqual(err.code);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        let msg =
          `${TEST_CASE_NAME} try startSelfUIAbilityInCurrentProcess failed, code: ${err.code}, message: ${err.message}`;
        hilog.error(0x0000, 'testTag', msg);
        expect().assertFail();
        done();
      }
    })
  })
}