/**
 ** Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import commonEvent from '@ohos.commonEvent';
import hilog from '@ohos.hilog';
import { it, expect, describe } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';

const TAG = 'ActsAaStartAbilityTest';
const TEST_SUITE_NAME: string = 'WantSupportModuleNameTest';
let bundleName = 'com.example.myapplication';
let mainActivity = 'MainAbility';
let mainModuleName = 'entry';
let featureModuleName = 'feature';
let launcher: Want = {
  bundleName: 'com.ohos.launcher',
  abilityName: 'MainAbility'
}
let startAbilityMainCmd = `aa start -b ${bundleName} -a ${mainActivity} -m ${mainModuleName}`;
let startAbilityFeatureCmd = `aa start -b ${bundleName} -a ${mainActivity} -m ${featureModuleName}`;
let startAbilityNoModuleNameCmd = `aa start -b ${bundleName} -a ${mainActivity}`;
let onForegroundEvent_main = '10000-onForegroundEvent_entry';
let onForegroundEvent_feature = '10000-onForegroundEvent_feature';
let installFeatureHapCmd = 'bm install -p data/ActsAbilityFeature.hap';
let forcestop = 'aa force-stop com.example.myapplication';
let subscriber: commonEventManager.CommonEventSubscriber;
let standard: Array<string> = ['onCreate->', 'onWindowStageCreate->', 'onForeground'];

function unsubscribeCallback(done: Function) {
  commonEvent.unsubscribe(subscriber, (err, data) => {
    done();
  })
}

function judge(commonEventData: commonEventManager.CommonEventData, isFinish: boolean, done: Function) {
  try {
    let lifeCircle: Array<string> = commonEventData.parameters!.lifeCircle;
    hilog.info(0x0000, 'testTag', '%{public}s', `lifeCircle = ${lifeCircle}`);
    expect(lifeCircle.toString()).assertEqual(standard.toString());
    if (isFinish) {
      unsubscribeCallback(done);
    }
  } catch (err) {
    hilog.info(0x0000, TAG, '%{public}s', `judge err : ${err}`);
  }
}

async function createSubscriberAndSubscribe(subscribeInfo: commonEventManager.CommonEventSubscribeInfo, done: Function, isFinish: boolean = false) {
  try {
    await commonEvent.createSubscriber(subscribeInfo)
      .then(commonEventSubscriber => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber `);
        subscriber = commonEventSubscriber;
        commonEvent.subscribe(commonEventSubscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `subscribe event = ${commonEventData.event} `)
          if (commonEventData.event == onForegroundEvent_main) {
            judge(commonEventData, isFinish, done);
          } else if (commonEventData.event == onForegroundEvent_feature) {
            judge(commonEventData, isFinish, done);
          }
        })
      })
  } catch (err) {
    hilog.info(0x0000, TAG, '%{public}s', `createSubscriberAndSubscribe err : ${err}`);
  }
}

async function installFeatureHap(cmd: string) {
  return new Promise<abilityDelegatorRegistry.ShellCmdResult>((resolve, reject) => {
    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.executeShellCommand(cmd, (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
      hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand : = ${cmd},err  : ${JSON.stringify(err)}, data: ${JSON.stringify(d)}`);
      if (err) {
        reject(err);
      } else {
        resolve(d);
      }
    })
  })
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

async function executeShellCmd(cmd: string) {
  return new Promise <string>((resolve, reject) => {
    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.executeShellCommand(cmd,
      (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', d.stdResult ?? '');
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', d.exitCode ?? '');
        if (err) {
          reject(err);
        } else {
          resolve(d.stdResult);
        }
      })
    hilog.info(0x0000, TAG, '%{public}s', `${cmd} onRun end`);
  })
}

export default function wantSupportModuleNameTest() {
  describe('WantSupportModuleNameTest', () => {
    /*
     * @tc.number: SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0100
     * @tc.name:  After adding the moduleName field, test whether the original ability can be pulled up properly by using want without the module name field
     * @tc.desc:  Check start ability by bundle name and ability name
     * @tc.level: 1
     * @tc.size: MediumTest
     * @tc.type: Function
    */
    it("SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0100", 1, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0100';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForegroundEvent_main]
      }
      try {
        await createSubscriberAndSubscribe(commonEventSubscribeInfo, done, true);
        await executeShellCmd(startAbilityNoModuleNameCmd)
          .then((result: string) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityMain result : ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}${TEST_CASE_NAME} executeShellCmd err : ${err}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0200
     * @tc.name:  After adding the moduleName field, test whether the want with the module name field can pull up the original ability normally
     * @tc.desc: Check start ability by bundle name , ability name and module name
     * @tc.level: 1
     * @tc.size: MediumTest
     * @tc.type: Function
    */
    it('SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0200', 3, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0200';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForegroundEvent_main]
      }
      try {
        await createSubscriberAndSubscribe(commonEventSubscribeInfo, done, true);
        await executeShellCmd(forcestop)
          .then(result => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} forcestop result : ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} forcestop err : ${err}`);
            expect().assertFail();
            done();
          })
        await sleep(2000)
          .then(async data => {
            await executeShellCmd(startAbilityMainCmd)
              .then(result => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityMain result : ${JSON.stringify(result)}`);
              })
              .catch((err: BusinessError) => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                expect().assertFail();
                done();
              })
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sleep ablility err : ${err}`);
          })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCmd err : ${err}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0500
     * @tc.name:  If there are multiple haps with the same bundleName and AbilityName in the test system, use want without module name to pull the ability to the foreground
     * @tc.desc:  Check start different hap with same bundle name and ability name by the first one going background
     * @tc.level: 3
     * @tc.size: MediumTest
     * @tc.type: Function
    */
    it("SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0500", 3, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0500';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForegroundEvent_main]
      }
      let commonEventSubscribeInfo1: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForegroundEvent_feature]
      }
      try {
        await createSubscriberAndSubscribe(commonEventSubscribeInfo, done);
        await executeShellCmd(startAbilityMainCmd)
          .then(result => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityMain result : ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityMain result err : ${err}`);
            expect().assertFail();
          })

        await sleep(2000)
          .then(async () => {
            let backToLauncherCommand = `aa start -b ${launcher.bundleName} -a ${launcher.abilityName}`;
            await executeShellCmd(backToLauncherCommand);
          })

        await createSubscriberAndSubscribe(commonEventSubscribeInfo1, done, true);

        await sleep(2000)
          .then(async () => {
            await installFeatureHap(installFeatureHapCmd)
              .then(async data => {
                await sleep(1000)
                await executeShellCmd(startAbilityFeatureCmd)
                  .then(result => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityFeature ablilityresult : ${JSON.stringify(result)}`);
                  })
                  .catch((err: BusinessError) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityFeature err : ${err}`);
                    expect().assertFail();
                    done();
                  })
              })
              .catch((err: BusinessError) => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} install hap err : ${err}`);
                expect().assertFail();
                done();
              })
          })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCmd err : ${err}`);
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0400
    * @tc.name:  If there are multiple haps with the same bundleName and AbilityName in the system, use want without module name to determine whether the ability can be pulled
    * @tc.desc:  Check start different hap with same bundle name and ability name by killing the first one
    * @tc.level: 3
    * @tc.size: MediumTest
    * @tc.type: Function
    */

    it("SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0400", 3, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0400';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForegroundEvent_main]
      }
      try {
        await createSubscriberAndSubscribe(commonEventSubscribeInfo, done);
        await executeShellCmd(startAbilityMainCmd)
          .then(result => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityMain result : ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityMain err : ${err}`);
            expect().assertFail();
            done();
          })

        await executeShellCmd(forcestop)
          .then(result => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} forcestop result : ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} forcestop err : ${err}`);
            expect().assertFail();
            done();
          })

        let commonEventSubscribeInfo1: commonEventManager.CommonEventSubscribeInfo = {
          events: [onForegroundEvent_feature]
        }
        await createSubscriberAndSubscribe(commonEventSubscribeInfo1, done, true);
        await sleep(2000)
          .then(async () => {
            await installFeatureHap(installFeatureHapCmd)
              .then(async data => {
                await sleep(1000)
                await executeShellCmd(startAbilityFeatureCmd)
                  .then(result => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityFeature result : ${JSON.stringify(result)}`);
                  })
                  .catch((err: BusinessError) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityFeature err : ${err}`);
                    expect().assertFail();
                    done();
                  })
              })
              .catch((err: BusinessError) => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} install hap err : ${err}`);
                expect().assertFail();
                done();
              })

          })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} err : ${err}`);
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0300
    * @tc.name:  If there are multiple haps with the same bundleName and AbilityName in the system, you can use want without modulename to pull up the ability
    * @tc.desc: Check start one of hap with same bundle name and ability name
    * @tc.level: 1
    * @tc.size: MediumTest
    * @tc.type: Function
    */
    it("SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0300", 1, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityBase_WantParam_WantSupportModuleName_0300';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForegroundEvent_main]
      }
      try {
        await createSubscriberAndSubscribe(commonEventSubscribeInfo, done, true);
        await installFeatureHap(installFeatureHapCmd)
          .then(async data => {
            await sleep(1000)
              .then(async data => {
                await executeShellCmd(startAbilityNoModuleNameCmd)
                  .then(result => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityNoModuleName result : ${JSON.stringify(result)}`);
                  })
                  .catch((err: BusinessError) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityNoModuleName err : ${err}`);
                    expect().assertFail();
                    done();
                  })
              })
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} install hap err : ${err}`);
            expect().assertFail();
            done();
          })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} err : ${err}`);
        expect().assertFail();
        done();
      }
    })
  })
}