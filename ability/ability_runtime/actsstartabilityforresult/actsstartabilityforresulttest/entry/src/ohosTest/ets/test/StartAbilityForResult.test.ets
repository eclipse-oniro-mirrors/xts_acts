/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';

let context = getContext(this) as common.UIAbilityContext;
let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'ACTS_TEST_START',
    'ACTS_TEST_DESTROY',
    'ACTS_TEST_BACK',
    'ability01_onCreate',
    'ability01_onDestroy',
    'ability01_onWindowStageCreate',
    'ability01_onWindowStageDestroy',
    'ability01_onForeground',
    'ability01_onBackground',
    'ability02_onForeground',
    'ability03_onCreate',
    'ability03_onWindowStageCreate',
    'ability03_onForeground',
    'ability03_onBackground',
    'entryAbility4_onCreate',
    'entryAbility4_onWindowStageCreate',
    'entryAbility4_onForeground_01',
    'entryAbility4_onForeground_02',
    'entryAbility4_onBackground_01',
    'entryAbility4_onBackground_02',
    'entryAbility4_onNewWant'
  ]
};

let subscriber: commonEventManager.CommonEventSubscriber;

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function startAbilityForResultTwoTest() {
  describe('startAbilityForResultTwoTest', () => {

    beforeAll(() => {
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(500);
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500
     * @tc.desc   Implicit initiation ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500', Level.LEVEL0, (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.mytest1',
        action:'abc'
      };
      let resultCode:number = 0;
      let ability01OnCreate: string = 'ability01OnCreate_fail';
      let ability01OnDestroy: string = 'ability01OnDestroy_fail';
      let ability01OnWindowStageCreate: string = 'ability01OnWindowStageCreate_fail';
      let ability01OnWindowStageDestroy: string = 'ability01OnWindowStageDestroy_fail';
      let ability01OnForeground: string = 'ability01OnForeground_fail';
      let ability01OnBackground: string = 'ability01OnBackground_fail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              expect(ability01OnCreate).assertEqual('ability01OnCreate_success')
              expect(ability01OnDestroy).assertEqual('ability01OnDestroy_success')
              expect(ability01OnWindowStageCreate).assertEqual('ability01OnWindowStageCreate_success')
              expect(ability01OnWindowStageDestroy).assertEqual('ability01OnWindowStageDestroy_success')
              expect(ability01OnForeground).assertEqual('ability01OnForeground_success')
              expect(ability01OnBackground).assertEqual('ability01OnBackground_success')
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ability01_onCreate') {
              ability01OnCreate = 'ability01OnCreate_success'
            };
            if (data.event == 'ability01_onDestroy') {
              ability01OnDestroy = 'ability01OnDestroy_success'
            };
            if (data.event == 'ability01_onWindowStageCreate') {
              ability01OnWindowStageCreate = 'ability01OnWindowStageCreate_success'
            };
            if (data.event == 'ability01_onWindowStageDestroy') {
              ability01OnWindowStageDestroy = 'ability01OnWindowStageDestroy_success'
            };
            if (data.event == 'ability01_onForeground') {
              ability01OnForeground = 'ability01OnForeground_success'
            };
            if (data.event == 'ability01_onBackground') {
              ability01OnBackground = 'ability01OnBackground_success'
            };
            if (data.event == 'ACTS_TEST_START') {
              try {
                context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
                  if (err.code) {
                    // 处理业务逻辑错误
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                    return;
                  }
                  // 执行正常业务
                  hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                  if(result.want){
                    want = result.want;
                  }
                  if(result.resultCode){
                    resultCode = result.resultCode
                  }
                  hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult success result is: ${result}`);
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `startAbilityForResult success result is: ${JSON.stringify(result)}`);
                });
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              let abilityResult:common.AbilityResult = {
                want,
                resultCode
              }
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext1.terminateSelfWithResult(abilityResult, (err: BusinessError) => {
                    if (err.code) {
                      // 处理业务逻辑错误
                      hilog.info(0x0000, 'testTag', '%{public}s',
                        `terminateSelfWithResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                      return;
                    }
                    // 执行正常业务
                    hilog.info(0x0000, 'testTag', '%{public}s', 'terminateSelfWithResult success!');
                    setTimeout(() => {
                      commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                    }, 500);
                  });
                } catch (err) {
                  // 处理入参错误异常
                  let code = (err as BusinessError).code;
                  let message = (err as BusinessError).message;
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `terminateSelfWithResult failed, error.code: ${code}, error.message: ${message}`);
                }
              }, 1000);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000
     * @tc.desc   For different applications, using startAbilityForResult to launch the ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000', Level.LEVEL0, (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      let ability02OnForeground: string = 'ability02OnForeground_fail';
      let ability03OnCreate: string = 'ability03OnCreate_fail';
      let ability03OnWindowStageCreate: string = 'ability03OnWindowStageCreate_fail';
      let ability03OnForeground: string = 'ability03OnForeground_fail';
      let ability03OnBackground: string = 'ability03OnBackground_fail';
      let entryAbility4OnCreate: string = 'entryAbility4OnCreate_fail';
      let entryAbility4OnWindowStageCreate: string = 'entryAbility4OnWindowStageCreate_fail';
      let entryAbility4OnForeground01: string = 'entryAbility4OnForeground01_fail';
      let entryAbility4OnBackground01: string = 'entryAbility4OnBackground01_fail';
      let entryAbility4OnBackground02: string = 'entryAbility4OnBackground02_fail';
      let want: Want = {
        bundleName: 'com.example.mytest1',
        abilityName: 'startAbilityForResult02'
      };
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              expect(ability03OnCreate).assertEqual('ability03OnCreate_success');
              expect(ability03OnWindowStageCreate).assertEqual('ability03OnWindowStageCreate_success');
              expect(ability03OnForeground).assertEqual('ability03OnForeground_success');
              expect(ability03OnBackground).assertEqual('ability03OnBackground_success');
              expect(entryAbility4OnCreate).assertEqual('entryAbility4OnCreate_success');
              expect(entryAbility4OnWindowStageCreate).assertEqual('entryAbility4OnWindowStageCreate_success');
              expect(entryAbility4OnForeground01).assertEqual('entryAbility4OnForeground01_success');
              expect(entryAbility4OnBackground01).assertEqual('entryAbility4O_onBackground_success');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ability03_onCreate') {
              ability03OnCreate = 'ability03OnCreate_success';
            }
            if (data.event == 'ability03_onWindowStageCreate') {
              ability03OnWindowStageCreate = 'ability03OnWindowStageCreate_success';
            }
            if (data.event == 'ability03_onForeground') {
              ability03OnForeground = 'ability03OnForeground_success';
            }
            if (data.event == 'ability03_onBackground') {
              ability03OnBackground = 'ability03OnBackground_success';
            }
            if (data.event == 'entryAbility4_onCreate') {
              entryAbility4OnCreate = 'entryAbility4OnCreate_success';
            }
            if (data.event == 'entryAbility4_onWindowStageCreate') {
              entryAbility4OnWindowStageCreate = 'entryAbility4OnWindowStageCreate_success';
            }
            if (data.event == 'entryAbility4_onForeground_01') {
              entryAbility4OnForeground01 = 'entryAbility4OnForeground01_success';
            }
            if (data.event == 'entryAbility4_onBackground_01') {
              entryAbility4OnBackground01 = 'entryAbility4O_onBackground_success';
            }
            if (data.event == 'ACTS_TEST_START') {
                try {
                  context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
                    if (err.code) {
                      // 处理业务逻辑错误
                      hilog.info(0x0000, 'testTag', '%{public}s',
                        `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                      return;
                    }
                    // 执行正常业务
                    hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                  });
                } catch (err) {
                  // 处理入参错误异常
                  let code = (err as BusinessError).code;
                  let message = (err as BusinessError).message;
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
                }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.uiAbilityContext2.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 5000);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });
  })
}

function publishCB(err: BusinessError) {
  if (err) {
    hilog.error(0x0000, 'testTag', `Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in publishing common event.');
  }
}