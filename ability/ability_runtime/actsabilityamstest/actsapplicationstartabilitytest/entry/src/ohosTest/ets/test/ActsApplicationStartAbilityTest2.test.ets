/*
  * Copyright (C) 2024-2025 HiHope Open Source Organization.
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *    http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
*/

import { describe, it, expect, beforeAll, beforeEach, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { common } from '@kit.AbilityKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let deviceType:string;
export default function actsApplicationStartAbilityTest2() {

  describe('actsApplicationStartAbilityTest2', () => {
    let context: common.UIAbilityContext;
    beforeAll(async (done: Function) => {
      deviceType = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
      hilog.info(0x0000, 'testTag', '%{public}s',
          `current device is ` + deviceType);
      setTimeout(() => {
        context = getContext() as common.UIAbilityContext;
        hilog.info(0x0000, 'testTag', '%{public}s',
          `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
        done();
      }, 2000);
    });

    beforeEach(async () => {
      let startAbilityNoModuleNameCmd1 = 'aa force-stop com.example.actsapplicationstartabilityauxiliary';
      let startAbilityNoModuleNameCmd2 = 'aa force-stop com.example.actsapplicationstartabilityauxiliary2';
      await abilityDelegator.executeShellCommand(startAbilityNoModuleNameCmd1);
      await abilityDelegator.executeShellCommand(startAbilityNoModuleNameCmd2);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2300
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2300', Level.LEVEL0, async (done: Function) => {
      let onForegroundFlagNumber = 0;
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2300';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onDestroyHap_1`,
          `${TEST_CASE_NAME}_onForegroundHap_3`,
          `${TEST_CASE_NAME}_onBackgroundHap_1`, `${TEST_CASE_NAME}_onBackgroundHap_2`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, async (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            switch (commonEventData.event) {
              case `${TEST_CASE_NAME}_onForegroundHap_1`:

                onForegroundFlagNumber = onForegroundFlagNumber + 1
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                hilog.info(0x0000, 'testTag', '%{public}s', `onForegroundFlagNumber: ${onForegroundFlagNumber}`);
                try {
                  if (onForegroundFlagNumber == 1) {
                    expect(onCreateFlag).assertTrue();
                    expect(onWindowStageCreateFlag).assertTrue();
                    expect(onForegroundFlag).assertTrue();
                  } else if (onForegroundFlagNumber == 2) {
                    expect(onCreateFlag).assertTrue();
                    expect(onWindowStageCreateFlag).assertTrue();
                    expect(onForegroundFlag).assertTrue();
                    await sleep(1000);
                    commonEventManager.unsubscribe(subscriber, (err, data) => {
                      done();
                    });
                  }
                  break;
                } catch (error) {
                  expect().assertFail();
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
                  done();
                }
              case `${TEST_CASE_NAME}_onDestroyHap_1`:
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
                expect(onDestroyFlag).assertTrue();
                if (onForegroundFlagNumber == 1) {
                  let want: Want = {
                    deviceId: '', // deviceId为空表示本设备
                    bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
                    abilityName: 'MultipleEntryAbility',
                    action: TEST_CASE_NAME,
                    parameters: {
                      instanceKey: TEST_CASE_NAME
                    }
                  };
                  await context.startAbility(want).then(async (data) => {
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
                  }).catch((error: BusinessError) => {
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility2. Code is ${error.code}, message is ${error.message}`);
                    expect().assertFail();
                    done();
                  });
                }
                break;
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
          abilityName: 'MultipleEntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100
     * @tc.desc   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100', Level.LEVEL1, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'SingleEntryAbility4',
          uri: 'actsapplicationstartabilitytest://com.example.actsapplicationstartabilitytest',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100';
      if(deviceType == 'false'){
        done();
      }
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onForegroundHap_2`,
          `${TEST_CASE_NAME}_onDestroyHap_1`,
          `${TEST_CASE_NAME}_onBackgroundHap_1`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              } else if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              } else if (commonEventData.event === `${TEST_CASE_NAME}_onDestroyHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onDestroyFlag: ${JSON.stringify(commonEventData)}`);
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                expect(onDestroyFlag).assertTrue();
                sleep(1000);
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility10',
          moduleName: 'entry_test', // moduleName非必选
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0200';
      if(deviceType == 'false'){
        done();
      }
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onForegroundHap_2`,
          `${TEST_CASE_NAME}_onBackgroundHap_1`, `${TEST_CASE_NAME}_onDestroyHap_1`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onDestroyHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `onDestroyHap_1: ${JSON.stringify(commonEventData)}`);
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                expect(onDestroyFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility3',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility111 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility111. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0300';
      if(deviceType == 'false'){
        done();
      }
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onForegroundHap_2`,
          `${TEST_CASE_NAME}_onBackgroundHap_1`, `${TEST_CASE_NAME}_onDestroyHap_2`,
          `${TEST_CASE_NAME}_onForegroundHap_3`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, async (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onDestroyHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `onDestroyHap_1: ${JSON.stringify(commonEventData)}`);
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
                expect(onDestroyFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_3`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onForegroundFlag).assertTrue();
                await sleep(2000)
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility6',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility111 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1100', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1100';
      if(deviceType == 'false'){
        done();
      }
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onForegroundHap_2`,
          `${TEST_CASE_NAME}_onForegroundHap_3`, `${TEST_CASE_NAME}_onBackgroundHap_1`,
          `${TEST_CASE_NAME}_onBackgroundHap_2`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_3`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
                sleep(1000)
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility7',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await sleep(2000)
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onForegroundHap_2`,
          `${TEST_CASE_NAME}_onForegroundHap_3`, `${TEST_CASE_NAME}_onBackgroundHap_1`,
          `${TEST_CASE_NAME}_onBackgroundHap_2`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_3`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_1`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              }
              if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_2`) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
                sleep(1000);
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility9',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200', Level.LEVEL0, async (done: Function) => {
      let onForegroundFlagNumber = 0;
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onDestroyHap_1`,
          `${TEST_CASE_NAME}_onForegroundHap_3`,
          `${TEST_CASE_NAME}_onBackgroundHap_1`, `${TEST_CASE_NAME}_onBackgroundHap_2`],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, async (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            switch (commonEventData.event) {
              case `${TEST_CASE_NAME}_onForegroundHap_1`:
                onForegroundFlagNumber = onForegroundFlagNumber + 1
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                hilog.info(0x0000, 'testTag', '%{public}s', `onForegroundFlagNumber: ${onForegroundFlagNumber}`);
                if (onForegroundFlagNumber == 1) {
                  expect(onCreateFlag).assertTrue();
                  expect(onWindowStageCreateFlag).assertTrue();
                  expect(onForegroundFlag).assertTrue();
                } else if (onForegroundFlagNumber == 2) {
                  expect(onCreateFlag).assertTrue();
                  expect(onWindowStageCreateFlag).assertTrue();
                  expect(onForegroundFlag).assertTrue();
                  sleep(1000)
                  commonEventManager.unsubscribe(subscriber, (err, data) => {
                    done();
                  });
                }
                break;
              case `${TEST_CASE_NAME}_onDestroyHap_1`:
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onDestroyHap_1: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
                expect(onDestroyFlag).assertTrue();
                if (onForegroundFlagNumber == 1) {
                  let want: Want = {
                    deviceId: '', // deviceId为空表示本设备
                    bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
                    abilityName: 'SingleEntryAbility4',
                    action: TEST_CASE_NAME,
                    parameters: {
                      instanceKey: TEST_CASE_NAME
                    }
                  };
                  await context.startAbility(want).then((data) => {
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
                  }).catch((error: BusinessError) => {
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility2. Code is ${error.code}, message is ${error.message}`);
                    expect().assertFail();
                    done();
                  });
                }
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
          abilityName: 'SingleEntryAbility4',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        await context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800
     * @tc.desc   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800", Level.LEVEL1, async (done: Function) => {
      let bundleName = 'com.example.actsapplicationstartabilityauxiliary'
      let abilityName = 'EntryAbility1'
      let startAbilityNoModuleNameCmd = `aa start -a ${abilityName} -b ${bundleName} `;
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: ['onForegroundHap_3800'],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then((subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            if (commonEventData.event === 'onForegroundHap_3800') {
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
              let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
              let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
              expect(onCreateFlag).assertTrue();
              expect(onWindowStageCreateFlag).assertTrue();
              expect(onForegroundFlag).assertTrue();
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        abilityDelegator.executeShellCommand(startAbilityNoModuleNameCmd, (error: BusinessError, data) => {
          if (error) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `${TEST_CASE_NAME}   start ablility err: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} start ablility suucessce :`);
          }
        });
      })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1300
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1300', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1300';
      let subscriberInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${TEST_CASE_NAME}_onForegroundHap_1`, `${TEST_CASE_NAME}_onForegroundHap_2`,
          `${TEST_CASE_NAME}_onForegroundHap_3`, `${TEST_CASE_NAME}_onBackgroundHap_1`,
          `${TEST_CASE_NAME}_onBackgroundHap_2`, `${TEST_CASE_NAME}_onBackgroundHap_3`],
      };
      await commonEventManager.createSubscriber(subscriberInfo).then((subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} onBackground fail:${JSON.stringify(err)}`);
          } else {
            if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_1`) {
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
              let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
              let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
              expect(onCreateFlag).assertTrue();
              expect(onWindowStageCreateFlag).assertTrue();
              expect(onForegroundFlag).assertTrue();
            } else if (commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_2` ||
              commonEventData.event === `${TEST_CASE_NAME}_onForegroundHap_3`) {
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
              let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
              let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
              expect(onCreateFlag).assertTrue();
              expect(onWindowStageCreateFlag).assertTrue();
              expect(onForegroundFlag).assertTrue();
            } else if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_1`) {
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
              expect(onBackgroundFlag).assertTrue();
            } else if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_2`) {
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
              expect(onBackgroundFlag).assertTrue();
            } else if (commonEventData.event === `${TEST_CASE_NAME}_onBackgroundHap_3`) {
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
              expect(onBackgroundFlag).assertTrue();
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'MultipleEntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      })
    });
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400';
      if(deviceType == 'false'){
        done();
      }
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME, 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400_1'],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then((subscriber) => {
        let onForegroundFlagNumber = 0;
        commonEventManager.subscribe(subscriber, async (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            onForegroundFlagNumber = onForegroundFlagNumber + 1
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
            let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
            let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
            let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
            if (commonEventData.event === TEST_CASE_NAME) {
              expect(onCreateFlag).assertTrue();
              expect(onWindowStageCreateFlag).assertTrue();
              expect(onForegroundFlag).assertTrue();

              let want: Want = {
                deviceId: '', // deviceId为空表示本设备
                bundleName: 'com.example.actsapplicationstartabilityauxiliary',
                abilityName: 'SingleEntryAbility6',
                moduleName: 'entry', // moduleName非必选
                action: TEST_CASE_NAME,
                entities: [TEST_CASE_NAME],
                parameters: {
                  instanceKey: TEST_CASE_NAME
                }
              };
              await sleep(2000);
              context.startAbility(want).then(() => {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
              }).catch((error: BusinessError) => {
                expect().assertFail();
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
                done();
              })
            }
            if (commonEventData.event === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400_1') {
              expect(onCreateFlag).assertFalse();
              expect(onWindowStageCreateFlag).assertFalse();
              expect(onForegroundFlag).assertTrue();
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'SingleEntryAbility6',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          entities: [TEST_CASE_NAME],
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        try {
          context.startAbility(want);
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        } catch (error) {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        }
      })
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}



