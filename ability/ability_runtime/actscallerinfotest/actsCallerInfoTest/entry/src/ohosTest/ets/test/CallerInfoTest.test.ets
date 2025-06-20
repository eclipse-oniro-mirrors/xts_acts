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
import { common, OpenLinkOptions } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let context = getContext(this) as common.UIAbilityContext;
let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'ACTS_TEST_START',
    'ACTS_TEST_DESTROY',
    'ACTS_TEST_BACK',
    'ACTS_TEST_ON_NEW_WANT',
    'ACTS_TEST_ON_CREATE_WANT',
    'ACTS_TEST_ON_CREATE_WANT_ASSIST'
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

export default function callerInfoTest() {
  describe('callerInfoTest', () => {

    beforeAll(() => {
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(2500);
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_CallerInfo_0100
     * @tc.name   : SUB_Ability_AbilityRuntime_CallerInfo_0100
     * @tc.desc   : Verify that the UIAbility can obtain caller information when explicitly starting the Ability via startAbility.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_CallerInfo_0100', Level.LEVEL0, async (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_CallerInfo_0100"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.acts.actsCallerInfoTest',
                      abilityName: 'callerInfo01'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end`);
                  })
                } catch (err) {
                  // 处理入参错误异常
                  let code = (err as BusinessError).code;
                  let message = (err as BusinessError).message;
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `startAbility failed, error.code: ${code}, error.message: ${message}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_ON_CREATE_WANT') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onNewWant, data.parameters.result: ${data.parameters?.result}`);
                let result:string = checkWantParameters(data.parameters?.result)
                hilog.info(0x0000, 'testTag',
                  `%{public}s', ACTS_TEST_ON_CREATE_WANT, result is : ${result}`);
                expect(result).assertEqual('{"component.startup.newRules":true,"debugApp":false,"moduleName":"entry_test","ohos.aafwk.param.callerAbilityName":"TestAbility","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_CREATE_WANT check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_ON_CREATE_WANT_ASSIST') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onNewWant, data.parameters.result: ${data.parameters?.result}`);
                let result:string = checkWantParameters(data.parameters?.result)
                hilog.info(0x0000, 'testTag',
                  `%{public}s', ACTS_TEST_ON_CREATE_WANT_ASSIST, result is : ${result}`);
                expect(result).assertEqual('{"component.startup.newRules":true,"moduleName":"entry","ohos.aafwk.param.callerAbilityName":"callerInfo01","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_CREATE_WANT_ASSIST check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_ON_NEW_WANT') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onNewWant, data.parameters.result: ${data.parameters?.result}`);
                let result:string = checkWantParameters(data.parameters?.result)
                expect(result).assertEqual('{"debugApp":false,"moduleName":"entry_test","ohos.aafwk.param.callerAbilityName":"callerInfo02","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_NEW_WANT check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_CallerInfo_0200
     * @tc.name   : SUB_Ability_AbilityRuntime_CallerInfo_0200
     * @tc.desc   : Verify that the UIAbility can obtain caller information when implicitly starting the Ability via startAbility.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_CallerInfo_0200', Level.LEVEL0, async (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_CallerInfo_0200"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              try {
                context.startAbility(
                  {
                    bundleName: "com.acts.actsCallerInfoTest",
                    moduleName: "entry_test",
                    action:"callerInfo03"
                  }).then(() => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end`);
                })
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `startAbility failed, error.code: ${code}, error.message: ${message}`);
              }
            }
            if (data.event == 'ACTS_TEST_ON_CREATE_WANT') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onNewWant, data.parameters.result: ${data.parameters?.result}`);
                let result:string = checkWantParameters(data.parameters?.result)
                expect(result).assertEqual('{"component.startup.newRules":true,"debugApp":false,"moduleName":"entry_test","ohos.aafwk.param.callerAbilityName":"TestAbility","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_CREATE_WANT check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_CallerInfo_0400
     * @tc.name   : SUB_Ability_AbilityRuntime_CallerInfo_0400
     * @tc.desc   : Verify that the UIAbility can obtain caller information when explicitly starting the Ability via startAbilityForResult.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_CallerInfo_0400', Level.LEVEL0, async (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_CallerInfo_0400"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              let want: Want = {
                bundleName: "com.acts.actsCallerInfoTest",
                moduleName: "entry_test",
                abilityName: 'callerInfo06'
              };
              try {
                context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
                  if (err.code) {
                    // 处理业务逻辑错误
                    hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                    return;
                  }
                  // 执行正常业务
                  hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                });
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
              }
            }
            if (data.event == 'ACTS_TEST_ON_CREATE_WANT') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onCreate, want is: ${data.parameters?.result}`);
                let result:string = checkWantParameters(data.parameters?.result)
                expect(result).assertEqual('{"component.startup.newRules":true,"debugApp":false,"moduleName":"entry_test","ohos.aafwk.param.callerAbilityName":"TestAbility","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_CREATE_WANT check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_CallerInfo_0500
     * @tc.name   : SUB_Ability_AbilityRuntime_CallerInfo_0500
     * @tc.desc   : Verify that the UIAbility can obtain caller information when implicitly starting the Ability via startAbilityForResult.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_CallerInfo_0500', Level.LEVEL0, async (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_CallerInfo_0500"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              let want: Want = {
                bundleName: "com.acts.actsCallerInfoTest",
                moduleName: "entry_test",
                action: 'callerInfo07'
              };
              try {
                context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
                  if (err.code) {
                    // 处理业务逻辑错误
                    hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                    return;
                  }
                  // 执行正常业务
                  hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                });
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
              }
            }
            if (data.event == 'ACTS_TEST_ON_CREATE_WANT') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onCreate, want is: ${data.parameters?.result}`);
                let result:string = checkWantParameters(data.parameters?.result)
                expect(result).assertEqual('{"component.startup.newRules":true,"debugApp":false,"moduleName":"entry_test","ohos.aafwk.param.callerAbilityName":"TestAbility","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_CREATE_WANT check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_CallerInfo_0700
     * @tc.name   : SUB_Ability_AbilityRuntime_CallerInfo_0700
     * @tc.desc   : Verify that the UIAbility can obtain caller information when starting the Ability via startAbilityByCall.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_CallerInfo_0700', Level.LEVEL0, async (done: Function) => {
      let tag: string = "SUB_Ability_AbilityRuntime_CallerInfo_0700"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag} end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              try {
                context.startAbility(
                  {
                    bundleName: "com.acts.actsCallerInfoTest",
                    moduleName: "entry_test",
                    abilityName: 'callerInfo10'
                  }).then(() => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end`);
                })
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `startAbility failed, error.code: ${code}, error.message: ${message}`);
              }
            }
            if (data.event == 'ACTS_TEST_ON_CREATE_WANT') {
              try {
                hilog.info(0x0000, 'testTag',
                  `%{public}s', onCreate, want is: ${data.parameters?.result}`);
                let onCreateWant: string = data.parameters?.result
                let result:string = checkWantParameters(data.parameters?.result)
                expect(result).assertEqual('{"component.startup.newRules":true,"debugApp":false,"moduleName":"entry_test","ohos.aafwk.param.callerAbilityName":"TestAbility","ohos.aafwk.param.callerAppId":"com.acts.actsCallerInfoTest_BCtwbrrZTeauTbNG/l1Ke4eowNrJ4I6h8q1xuy6k/XA3i/OlSG8a8Z3HbAVqe2Ic8rHq3139L51ZTFTZKDqc6fw=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"com.acts.actsCallerInfoTest"}')
              } catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `ACTS_TEST_ON_CREATE_WANT check failed, error.code: ${code}, error.message: ${message}`);
                expect().assertFail()
                done();
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
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

function checkWantParameters(data: string): string {
  const targetField = "ohos.aafwk.param.callerBundleName";
  const targetFieldIndex = data.indexOf(targetField);
  if (targetFieldIndex === -1) {
    return ''
  } else {
    const colonIndex = data.indexOf(':', targetFieldIndex);
    const valueStartIndex = data.indexOf('"', colonIndex);

    if (colonIndex === -1 || valueStartIndex === -1) {
      return ''
    } else {
      const valueEndIndex = data.indexOf('"', valueStartIndex + 1);

      if (valueEndIndex === -1) {
        return ''
      } else {
        const extractedStr:string = data.substring(0, valueEndIndex + 1) + '}';
        return extractedStr;
      }
    }
  }
}
