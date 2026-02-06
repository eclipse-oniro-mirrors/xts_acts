/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import commonEvent from '@ohos.commonEventManager';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const TAG = 'AbilityRuntime';
const TEST_SUITE_NAME: string = 'AbilityContext';
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let testAbilityContext: common.UIAbilityContext;
let deviceType:string;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}
export default function actsterminateselfwithresulttest() {
  describe('ActsTerminateSelfWithResultTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let actsEntryOnDestroy = 'Acts_EntryOnDestroy';
    let actsEntryCreate = 'Acts_EntryCreate';
    let foregroundEvent = 'Foreground_Event';
    let actsEntryOnDestroyBegin = 'Acts_EntryOnDestroyBegin';
    let actsEntryOnDestroyEnd = 'Acts_EntryOnDestroyEnd';
    let onEntryCreateNums = 0;
    let onEntryOnDestroyNums = 0;

    let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
      events: [actsEntryOnDestroy, actsEntryCreate, foregroundEvent, actsEntryOnDestroyBegin,
        actsEntryOnDestroyEnd],
    };
    let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
    let onEntryOnDestroyFlag = false;
    let onEntryCreateFlag = false;
    let onEntryOnDestroyBeginFlag = false;
    let onEntryOnDestroyEndFlag = false;
    let onFirstEntryCreateFlag = false;
    let onFirstEntryOnDestroyFlag = false;
    let onSecondEntryCreateFlag = false;
    let onSecondEntryOnDestroyFlag = false;
    let startTime = 0;
    let endTime = 0;

    let subscribeCallBack =
      async (err: BusinessError, data: commonEvent.CommonEventData, done: Function, tag: string): Promise<void> => {
        console.log(`${tag} subscribeCallBack err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
        switch (data.event) {
          case actsEntryCreate: {
            let obj = data.parameters;
            if (Object.keys(obj!).length) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack Acts_EntryCreate data =${JSON.stringify(dataObj)}`);
              let index = dataObj['num'] as number;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack onForegroundContent  index ==${JSON.stringify(index)}`);
              if (index == 1) {
                onFirstEntryCreateFlag = true;
              } else {
                onSecondEntryCreateFlag = true;
              }
            } else {
              onEntryCreateFlag = true;
              onEntryCreateNums++;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack onEntryCreateFlag: ${onEntryCreateFlag}`);
            }
            break;
          }
          case actsEntryOnDestroy: {
            let obj = data.parameters;
            if (Object.keys(obj!).length) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack Acts_EntryOnDestroy data =${JSON.stringify(dataObj)}`);
              let index = dataObj['num'] as number;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack Acts_EntryOnDestroy index =${JSON.stringify(index)}`);
              if (index == 1) {
                onFirstEntryOnDestroyFlag = true;
              } else {
                onSecondEntryOnDestroyFlag = true;
              }
            } else {
              onEntryOnDestroyFlag = true;
              onEntryOnDestroyNums++;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack onEntryOnDestroyFlag: ${onEntryOnDestroyFlag}`);
            }
            break;
          }
          case foregroundEvent: {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack onFOREGROUND_EVENT:====`);
            break;
          }
          case actsEntryOnDestroyBegin: {
            onEntryOnDestroyBeginFlag = true;
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack onEntryOnDestroyBeginFlag: ${onEntryOnDestroyBeginFlag}`);
            let obj = data.parameters;
            if (Object.keys(obj!).length) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack Acts_EntryOnDestroy data =${JSON.stringify(dataObj)}`);
              startTime = dataObj['time'] as number;
            }
            break;
          }
          case actsEntryOnDestroyEnd: {
            onEntryOnDestroyEndFlag = true;
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack onEntryOnDestroyBeginFlag: ${onEntryOnDestroyEndFlag}`);
            let obj = data.parameters;
            if (Object.keys(obj!).length) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack Acts_EntryOnDestroy data =${JSON.stringify(dataObj)}`);
              endTime = dataObj['time'] as number;
            }
            break;
          }
          default:
            console.log(`${tag} subscribeCallBack event error: ${data.event}`);
            break;
        }
      }

    beforeAll(() => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      deviceType = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
      hilog.info(0x0000, 'testTag', '%{public}s',
          `current device is ` + deviceType);
    })

    afterEach(async () => {
      await sleep(2000);
    })

    beforeEach(async () => {
      onEntryOnDestroyFlag = false;
      onEntryCreateFlag = false;
      onEntryCreateNums = 0;
      onEntryOnDestroyNums = 0;
      onEntryOnDestroyBeginFlag = false;
      onEntryOnDestroyEndFlag = false;
      onFirstEntryCreateFlag = false;
      onFirstEntryOnDestroyFlag = false;
      onSecondEntryCreateFlag = false;
      onSecondEntryOnDestroyFlag = false;
      startTime = 0;
      endTime = 0;
      let cmda = 'aa force-stop com.acts.terminateselfwithresulthelper';
      await abilityDelegator.executeShellCommand(cmda).catch((error: BusinessError) => {
        console.log("====> executeShellCommand error : " + JSON.stringify(error));
      });
      let cmda1 = 'aa force-stop com.acts.terminalselfdelayhelper';
      await abilityDelegator.executeShellCommand(cmda1).catch((error: BusinessError) => {
        console.log("====> executeShellCommand error : " + JSON.stringify(error));
      });
      await sleep(1000);
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0900
     * @tc.name test  AbilityStage life cycle
     * @tc.desc test a cpp crash occurs for a single Module and Ability, but it will not trigger the OnDestroy callback for AbilityStage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0900';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.terminateselfwithresulthelper',
        abilityName: 'EntryAbility'
      };
      try {
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(3000);
          await commonEvent.unsubscribe(subscriber)
          expect(onEntryCreateFlag).assertEqual(true);
          expect(onEntryOnDestroyFlag).assertEqual(false);
          done();
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult catch failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
      ;
    });


    /**
     * @tc.number SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0600
     * @tc.name test  AbilityStage life cycle
     * @tc.desc test a js crash occurs for a single Module and Ability, but it will not trigger the OnDestroy callback for AbilityStage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });

      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.terminateselfwithresulthelper',
        abilityName: 'EntryAbility1'
      };

      try {
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);

          await sleep(3000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onEntryCreateFlag===  ${onEntryCreateFlag}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onEntryOnDestroyFlag===  ${onEntryOnDestroyFlag}`);
          await commonEvent.unsubscribe(subscriber);
          // expect(onEntryCreateFlag).assertEqual(true);
          // expect(onEntryOnDestroyFlag).assertEqual(true);
          done();
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility catch failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }

    });


    /**
     * @tc.number SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0700
     * @tc.name test  AbilityStage life cycle
     * @tc.desc test terminate self more than three times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);

      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let startAbilityAction = (): void => {
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.terminateselfwithresulthelper',
          abilityName: 'EntryAbility2'
        };

        try {
          testAbilityContext.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              // 处理业务逻辑错误
              console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility failed, code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            }
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          });
        } catch (err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility catch failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          return;
        };
      }

      let index = 4;
      for (let i = 0; i < index; i++) {
        if (i != 0) {
          onEntryCreateFlag = false;
          onEntryOnDestroyFlag = false;
          await sleep(1000)
        }
        startAbilityAction();
        await sleep(2000);
      }
      hilog.info(0x0000, TAG, '%{public}s',
        `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility onEntryCreateNums is === ${onEntryCreateNums}`);
      hilog.info(0x0000, TAG, '%{public}s',
        `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility onEntryOnDestroyNums is === ${onEntryOnDestroyNums}`);
      expect(onEntryCreateNums).assertEqual(4);
      expect(onEntryOnDestroyNums).assertEqual(4);
      done();


    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0500
     * @tc.name test  AbilityStage life cycle
     * @tc.desc test different module life cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0500', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      if(deviceType === 'false'){
        done();
      }else{
        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, TEST_CASE_NAME);
        });
        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.terminateselfwithresulthelper',
          abilityName: 'EntryAbility3'
        };
        try {
          testAbilityContext.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              // 处理业务逻辑错误
              console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility failed, code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            }
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          });
        } catch (err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult catch failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
        await sleep(6000);
        await commonEvent.unsubscribe(subscriber);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onFirstEntryCreateFlag is === ${onFirstEntryCreateFlag}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onFirstEntryOnDestroyFlag is === ${onFirstEntryOnDestroyFlag}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onSecondEntryCreateFlag is === ${onSecondEntryCreateFlag}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onSecondEntryOnDestroyFlag is === ${onSecondEntryOnDestroyFlag}`);
        expect(onEntryCreateFlag).assertTrue();
        expect(onEntryOnDestroyFlag).assertTrue();
        expect(onSecondEntryCreateFlag).assertTrue();
        expect(onSecondEntryOnDestroyFlag).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_AsynchronousCallback_0100
     * @tc.name test  AbilityStage life cycle
     * @tc.desc test  promise call back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_AsynchronousCallback_0100', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_AsynchronousCallback_0100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.terminalselfdelayhelper',
        abilityName: 'EntryAbility'
      };
      try {
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult succeed`);
          await sleep(3500);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onEntryOnDestroyBeginFlag is === ${onEntryOnDestroyBeginFlag}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onEntryOnDestroyEndFlag is === ${onEntryOnDestroyEndFlag}`);
          let distanceTime = endTime - startTime
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} times=startTime=${startTime}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} times=endTime=${endTime}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} times=distanceTime=${distanceTime}`);
          await commonEvent.unsubscribe(subscriber);
          expect(onEntryOnDestroyBeginFlag).assertTrue();
          expect(onEntryOnDestroyEndFlag).assertTrue();
          expect(distanceTime).assertLarger(1000);
          done();
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult catch failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        return;
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_AsynchronousCallback_0300
     * @tc.name test  AbilityStage life cycle
     * @tc.desc test no promise call back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_AsynchronousCallback_0300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_AsynchronousCallback_0300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.terminalselfdelayhelper',
        abilityName: 'EntryAbility1'
      };
      try {
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult succeed`);
          await sleep(3000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onEntryOnDestroyBeginFlag is === ${onEntryOnDestroyBeginFlag}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult onEntryOnDestroyEndFlag is === ${onEntryOnDestroyEndFlag}`);
          let distanceTime = endTime - startTime
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} times=startTime=${startTime}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} times=endTime=${endTime}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} times=distanceTime=${distanceTime}`);
          await commonEvent.unsubscribe(subscriber);
          expect(onEntryOnDestroyBeginFlag).assertTrue();
          expect(onEntryOnDestroyEndFlag).assertTrue();
          expect(distanceTime).assertLess(50);
          done();
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult catch failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }

    })

  })
}